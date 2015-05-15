
rm -rf *.log

touch cpu.log
touch mem.log
touch disk.log
touch net.log

for interval in 512 256 128 64 32 16 8 
do
    echo test with interval of $interval
    echo "test with interval of $interval" >> cpu.log
    echo "test with interval of $interval" >> mem.log
    echo "test with interval of $interval" >> disk.log
    echo "test with interval of $interval" >> net.log

    cp /etc/ceilometer/pipeline.yaml.$interval /etc/ceilometer/pipeline.yaml
    service ceilometer-agent-compute restart

    ./sar.sh
done
    
    
    
