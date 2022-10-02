# Build a load-balanced web server environment

## Build Ec2 instances

Step1: Prepare a multiple ec2 instances with static Ip (to deploy nginx modules) by using terraform ec2 modules.

```
terraform apply -target=module.webserver1 -target=aws_eip.webserver1 -target=aws_eip_association.webserver1
terraform apply -target=module.webserver2 -target=aws_eip.webserver2 -target=aws_eip_association.webserver2
```
Step2: Connect to the instances and Install the Nginx modules by using these command.
```
sudo apt update
sudo apt install nginx
```
Step3: Change the nginx message to a meaningful message in webserver1 and webserver2 instances to see the requests load balancing.


<sub>
  
  <html>
    <head>
        <title>Welcome to Webserver 1</title>
    </head>
    <body>
        <h1>Success!  The Webserver 1 is working!</h1>
    </body>
</html>

</sub>



## Build Application Loadbalancer

Step4: Prepare a application load balancer for the serving the requests to these ec2 instances backends by using terraform.

```
terraform apply -target=module.alb
```

Step5: Please get the loadbalancer URL and refresh the page in browser and notice that it will request to both webservers.
