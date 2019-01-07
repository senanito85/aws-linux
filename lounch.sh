
AWS

#--------------------------

aws ec2 run-instances --image-id ami-04ca9f4887b85e954 \
                             --security-group-ids sg-075fe2fdf44101a9c \
                             --count 1 \
                             --instance-type t2.nano \
                             --key-name public \
                             --query "Instances[0].InstanceId"

#--------------------------

aws ec2 describe-instances --instance-ids i-0787e4282810ef9cf \
							 --query "Reservations[0].Instances[0].PublicIpAddress"


#--------------------------

ssh -i devenv-key.pem user@<ip-user>




