COUNTER=1000
INTERVAL=1

sar -u $INTERVAL $COUNTER >> cpu.log &
pids[0]=$!
sar -r $INTERVAL $COUNTER >> mem.log &
pids[1]=$!
sar -p -d  $INTERVAL $COUNTER | grep sda >> disk.log &
pids[2]=$!
sar -n DEV $INTERVAL $COUNTER | grep eth0 >> net.log &
pids[3]=$!

for((k=0; k<=3; k++))
do
    wait ${pids[$k]}
done
    
    
    
    
