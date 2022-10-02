# Build a load-balanced web server environment

Step1: Prepare 2 ec2 instances with static Ip by using terraform ec2 modules and install nginx webserver as backend.

Step2: Change the nginx message to a meaningful message like webserver1 and webserver2 to see the requests load balancing.

Step3: Restart the nginx server and enable the nginx app on the next boot load.

Step4: Prepare a application load balancer for the serving the requests to these ec2 instances backends by using terraform.

Step5: Please get the loadbalancer URL and refresh the page in browser and notice that it will request to both webservers.
