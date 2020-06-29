stackName=$1

aws cloudformation create-stack --stack-name "${stackName}" --template-body file://fargate.yml  \
--parameters ParameterKey=AzonePub1,ParameterValue=us-east-1a ParameterKey=AzonePub2,\
ParameterValue=us-east-1b  --capabilities CAPABILITY_NAMED_IAM

sleep 300

echo 'Now, Running Shell Script For Logs.' 

chmod 777 buildfargate.sh

sh buildfargate.sh "${stackName}" > output.json

echo 'Kindly check output.json file for complete stack details'
