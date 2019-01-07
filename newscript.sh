
#un multiple command on a remote host over SSH:

$ ssh USER@HOST 'COMMAND1; COMMAND2; COMMAND3'
#– or –

$ ssh USER@HOST 'COMMAND1 | COMMAND2 | COMMAND3'
#– or –

$ ssh USER@HOST << EOF
COMMAND1
COMMAND2
COMMAND3
EOF

#----------------------------------------------

#Get the uptime and the disk usage:

$ ssh root@192.168.1.1 'uptime; df -h'

#Get the memory usage and the load average:

$ ssh root@192.168.1.1 'free -m | cat /proc/loadavg'

#Show the kernel version, number of CPUs and the total RAM:

$ ssh root@192.168.1.1 << EOF
uname -a
lscpu  | grep "^CPU(s)"
grep -i memtotal /proc/meminfo
EOF

#----------------------------------------------

#SSH: Run Bash Script on Remote Server

ssh root@192.168.1.1 'bash -s' < script.sh



ssh root@192.168.1.1 'bash -s' < "script.sh --argument"

ssh root@192.168.1.1 'bash -s' -- < script.sh --argument


#-----------------------------------------------

#its ability to let you run a command on a remote server by passing the -t flag.

ssh -t adam@webserver1.test.com 'cat /etc/hosts'

#This will ssh to webserver1.test.com, then run cat /etc/hosts in your shell and return the output.

#-----------------------------------------------

ssh-keygen


#copy the public key to the target server. To do this, use ssh-copy-id:

ssh-copy-id adam@webserver1.test.com


#-----------------------------------------------

#!/bin/bash
if [ -f server.txt ]; then
        for server in $(cat server.txt); do
                ssh -t adam@$server  '
                echo $(uname -r)                '
        done
else
        echo 'No server.txt file'
fi

#----------------------------------------------























