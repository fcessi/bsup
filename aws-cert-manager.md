-   Login to [AWS Management Console](https://console.aws.amazon.com/) and Go to AWS Certificate Manager from AWS Services. Click “Get started” under Provision certificates

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 1](https://antmedia.io/wp-content/uploads/2019/06/AWS_CM_Screen-Shot-2019-.06-24-at-19.26.57-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 1")

-   Choose “Request a public certificate” and Click “Request a certificate”

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 2](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.27.03-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 2")

-   Write your domain name into the box. We use “aws-streaming-cloud.antmedia.io” and Click “Next” button.

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 3](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.27.20-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 3")

-   Select “DNS validation” for our case. Because it sounds simpler for us and click “Review” button.

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 4](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.27.27-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 4")

-   Click the “Confirm and request” button

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 5](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.27.33-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 5")

### DNS Validation

-   In the coming window, it shows CNAME for DNS validation and its state is “Pending Validation”. To get the CNAME record, Click the arrow on left side of your domain name and it shows the CNAME record as shown in the image below. Save the CNAME record and click “Continue”. It’s time to add CNAME in your DNS configuration. The company where you register your Domain name provides you a configuration panel so that you can go that panel and add CNAME record for that. You can ask for support to the company where you register your domain name. Let’s proceed,

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 6](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-27-at-12.58.38-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 6")

-   In the next page, it again shows that it’s in “Pending Validation” state. After you add CNAME records to your DNS configuration. Come back to same page and click “Refresh” button on the right top of the page. It may take some time(5-10 mins) to be issued. After that, its state will return to “Issued” as shown below.

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 7](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.43.50-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 7")

### Use SSL in your Load Balancer

Right now, you can use your certificate in your AWS Load Balancer. It will show up automatically when you’re creating load balancer as shown in the image. Although, creating Load Balancer is a subject of another post, let me give some basic information. Go to “EC2 Service” from AWS Services. Click the “Load Balancing > Load Balancers” and Click “Create Load Balancer” as in the image

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 8](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-28-at-10.24.39-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 8")

-   Click the “Create” button under “Application Load Balancer”

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 9](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-24-at-19.10.46-1024x620.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 9")

-   Choose a name for your load balancer and click “Add Listener” in the Listeners section and add HTTPS Listener as shown in the image. Lastly, choose availability zones and Click “Next: Configure Security Settings”

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 10](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-26-at-17.31.58.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 10")

-   In the coming window, choose the first option as in the image and you can see your domain name in the drop-down menu. That’s all about Load Balancer because we’ll give much more information about creating and using Load Balancer in another blog post.

![Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 11](https://antmedia.io/wp-content/uploads/2019/06/Screen-Shot-2019-06-27-at-13.14.29.png "Step by Step Guide: How to get SSL Certificate on AWS Certificate Manager for your Domain Name? 11")

Btw, if you already have experience with Load Balancer and you want to proceed for your project, let me make a remind, don’t forget to add CNAME for your load balancer. For instance, every load balancer has a DNS name like “xxxx.eu-central-1.elb.amazonaws.com” so that you need to add CNAME for your subdomain that points to your load balancer address.
