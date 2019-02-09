set ns [new Simulator]

# Configurations
set pathNum 40 
set lineRateDown 10Gb
set lineRateUp 1Gb
set packetSize 1460; #Bytes
set RTT 0.0001; #100us
set shortfno 40
set longfno 3  
set earlylongfno 1 

set sizeRNG [new RNG]
$sizeRNG seed 1
for {set i 0} {$i < $shortfno} {incr i} {
	set size [new RandomVariable/Uniform]
	$size use-rng $sizeRNG
	$size set min_ 20
	$size set max_ 35
	set SendData($i) [expr 1460*[$size value]]
}

set timeRNG [new RNG]
$timeRNG seed 1
for {set i 0} {$i < $shortfno} {incr i} {
	set ttime [new RandomVariable/Uniform]
	$ttime use-rng $timeRNG
	$ttime set min_ 0.11
	$ttime set max_ 0.110004
	set SendTime($i) [expr [$ttime value]]
}

#default parameters
Node set multiPath_ 1
Classifier/MultiPath set perflow_ 1
Classifier/MultiPath set checkpathid_ 1
Agent/TCP set packetSize_ $packetSize
Agent/TCP set window_ 2000
Agent set shortFlowNum_ 40
Agent set codeUnit_ 2 
Agent/TCP set redunPkt_ 1 
Agent/TCP set lfThresholdPkt_ 67; #100KB 
Agent/TCPSink PerSFPktNum_ 35
Agent/TCP set timestamps_ true

# Output file
set f [open ps.tr w]
$ns trace-all $f

proc finish {} {
        global ns f
        $ns flush-trace
        close $f
        puts "Simulation terminated successfully."
        exit 0
}

puts "Creating Nodes..."
for {set i 0} {$i < [expr $pathNum+2] } {incr i} {
	set n($i) [$ns node]
}
for {set i 1000} {$i < [expr $shortfno+1000] } {incr i} {
	set n($i) [$ns node]
}
for {set i 2000} {$i < [expr $longfno+2000]} {incr i} {
	set n($i) [$ns node]
}
#receiver node
set n(3000) [$ns node]

puts "Creating Links..."
for {set i 1000} {$i < [expr $shortfno+1000]} {incr i} {
	$ns simplex-link $n($i) $n(0) $lineRateDown [expr $RTT/8] MYDropTail
	$ns simplex-link  $n(0) $n($i) $lineRateUp [expr $RTT/8] MYDropTail
	$ns queue-limit $n($i) $n(0) 2000
}

for {set i 2000} {$i < [expr $longfno+2000]} {incr i} {
	$ns duplex-link $n($i) $n(0) $lineRateUp [expr $RTT/8] DropTail
	$ns queue-limit $n($i) $n(0) 2000
}

for {set i 1} {$i < [expr $pathNum+1] } {incr i} {
	$ns duplex-link $n(0) $n($i) $lineRateUp [expr $RTT/8] DropTail  
	$ns queue-limit $n(0) $n($i) 256
}

for {set i 1} {$i < [expr $pathNum+1] } {incr i} {
	set sinkno [expr $pathNum+1]
	$ns simplex-link $n($i) $n($sinkno) $lineRateUp [expr $RTT/8] DropTail
	$ns simplex-link $n($sinkno) $n($i) $lineRateUp [expr $RTT/8] DropTail
	$ns queue-limit $n($i) $n($sinkno) 256 
}

	set sinkno [expr $pathNum+1]
	$ns duplex-link $n($sinkno) $n(3000) $lineRateUp [expr $RTT/8] DropTail
	$ns queue-limit $n($sinkno) $n(3000) 256 
	$ns queue-limit $n(3000) $n($sinkno) 256 

puts "Creating Agents..."
for {set i 0} {$i < $shortfno } {incr i} {
	set tcp($i) [new Agent/TCP]
	set shortnode [expr $i +1000]
	$ns attach-agent $n($shortnode) $tcp($i)
	$tcp($i) set fid_ $i 
} 
for {set i $shortfno} {$i < [expr $shortfno + $longfno] } {incr i} {
	set tcp($i) [new Agent/TCP]
	set longnode [expr $i - $shortfno + 2000]
	$ns attach-agent $n($longnode) $tcp($i)
	$tcp($i) set fid_  $i
}

$ns rtproto DV
Agent/rtProto/DV set advertInterval 16

for {set i 0} {$i < $shortfno } {incr i} {
	set sink($i) [new Agent/TCPSink]
	$ns attach-agent $n(3000) $sink($i)
	$ns connect $tcp($i) $sink($i)
} 
for {set i $shortfno} {$i <  [expr $shortfno + $longfno] } {incr i} {
	set sink($i) [new Agent/TCPSink]
	$ns attach-agent $n(3000) $sink($i)
	$ns connect $tcp($i) $sink($i)
}

#test: send data 
#background long flows
for {set i $shortfno} {$i < [expr $shortfno + $earlylongfno ] } {incr i} {
        set ftp($i) [$tcp($i) attach-app FTP]
        $ns at 0.105 "$ftp($i) send [expr 1460*10000]"
}

if {$earlylongfno < $longfno} {
	for {set i [expr $shortfno + $earlylongfno]} {$i < [expr $shortfno +$longfno] } {incr i} {
        	set ftp($i) [$tcp($i) attach-app FTP]
	        $ns at 0.1101 "$ftp($i) send [expr 1460*10000]"
	}
}

#short flows
for {set i 0} {$i < $shortfno} {incr i} {
	set ftp($i) [$tcp($i) attach-app FTP]
	$ns at $SendTime($i) "$ftp($i) send $SendData($i)"
}

puts "Simulation started."
$ns at 2.0 "finish"
$ns run

