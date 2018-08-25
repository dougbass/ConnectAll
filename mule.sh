#!/bin/bash
# chkconfig: 2345 20 80
# description: Start and stop mule the ConnectAll sync engine

source /root/.bash_profile

home=$MULE_HOME
startup="$home/bin/mule start"
shutdown="$home/bin/mule stop"

echo "Using MULE_HOME:       $MULE_HOME"
echo "Using CONNECTALL_HOME:       $CONNECTALL_HOME"

start(){
   echo -n "Starting Mule service:"
   cd $home
   $startup
   echo "done"
}

stop(){
   echo -n "Shutting down mule: "
   cd $home
   $shutdown
   echo "done."
}

status(){
    numproc=`ps -ef | grep mule | grep -v "grep mule" | wc -l`
    if [ $numproc -gt 0 ]; then
       echo "Mule is running..."
    else
       echo "Mule is stopped..."
    fi
}

restart(){
   stop
   start
}

# See how we were called.
case "$1" in
start)
   start
   ;;
stop)
   stop
   ;;
status)
   status
   ;;
restart)
   restart
   ;;
*)
   echo $"Usage: $0 {start|stop|status|restart}"
   exit 1
esac