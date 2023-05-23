## Create a VPC
- First we search for VPC in the search bar, and select "Create VPC"
- We set the IPv4 CIDR as "10.0.0.0/16"
## Internet Gateway
- We select, and give an appropriate name.
## Connect VPC and IG
- After we created the internet gateway, we should be able to select "Attach to VPC" at the top.
- We can then select our VPC.
## Subnet
- We select "Create subnet"
- Select our VPC
- In availabilty zones, we usually select 1a
- In IPv4 we select "10.0.2.0/24"
- We would add a second subnet for mongodb here.
## Route table
- We now select "Create route table"
- Select our VPC
## Connect subnet to route table
- In route table, theres an option called "Subnet associations"
- We edit, and select the subnet we created.
- Note: Only select public subnet to the public route table.
- We can then go to the routes tab, and select "edit routes".
- We then add a route.
- In here, we have destination = 0.0.0.0/0 and the target is Internet gateway. 
## Launch and instance
- We then launch an instance in the normal EC2 place.
- However, in "Network settings", we can select the VPC we just made.
- Note: We can't use existing security groups here.
- We enable the public IP address
- We create a new security group
- We add the type = HTTP, and a custom = port 3000. 
- The source type is anywhere for both.
- Then all we need to do is add our user data. 