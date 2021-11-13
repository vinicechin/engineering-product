# Continuous Deployment Pipeline


## Asset composition

- product folder with the application to be deployed, containing:
	- gitlab-ci.yml file to run the pipeline
	- initial_commit.sh to do the first commit
	- product folder with the webpage components
	- acceptance_tests folder with accpetance tests
- integration_server folder, containing:
	- vagrant VM specification (i.e. Vagrant file)
	- Ansible playbooks to provision the VM
	- GitLab as VCS and CI running into the VM
	- Docker service running into the VM
- staging_env folder, containing:
	- vagrant VM specification (i.e. Vagrant file)
	- scripts folder with files to run shell commands inside the VM
	- gitlab-runner running into the VM
- production_env folder, containing:
	- vagrant VM specification (i.e. Vagrant file)
	- scripts folder with files to run shell commands inside the VM
	- gitlab-runner running into the VM


## Prerequisites

### Hardware

1. Laptop with at least 8 Gb memory (recommended 16 Gb, ideally 32 Gb)


### Software

1. Tested on MacOS Mojave (v 10.14.6, any other may have problems)
2. VirtualBox (v 6.1.26, any other may have problems)
3. Vagrant (v 2.2.18, any other may have problems)
4. Ansible (v 2.11.5, any other may have problems)


## Guidelines

1- Get to the integration server directory

	cd ~/<root_folder>/integration_server


2- Execute the Vagrant command below to create a VM which acts as integration server, set gitlab 
configurations, set integration runner and set users for gitlab.

	vagrant up


### **** Test Case ****

	Initial conditions: You are logged off from gitlab

	Test Steps:

	1. Go to http://192.168.33.9/gitlab
	2. Log in using as user name "root" and password "test1234".


	Post conditions:
	- You have successfully logged in as administrator


### **** Test Case ****

	Initial conditions: You are logged off from gitlab

	Test Steps:

	1. Go to http://192.168.33.9/gitlab
	2. Log in using as user name "test" and password "test1234".


	Post conditions:
	- You have successfully logged in as test user


### **** Test Case ****

	Initial conditions: You are logged in as root

	Test Steps:

	1. Go to http://192.168.33.9/gitlab
	2. Clik on "Admin Area" (The wrench symbol in the top menu)
	3. In the left menu, under "Overview", click in "Runners"


	Post conditions:
	- In the list of runners you can find the runner tagged "integration"


3- As test user, create a project called "EngineeringProduct" in gitlab for the product.

	a. Go to http://192.168.33.9/gitlab
	b. Open the "projects" dropdown on the top menu of gitlab
	c. Click "Create blank project"
	d. In the field "Project name" put the name for the project as "EngineeringProduct"
	e. Scroll down and click "Create project"


4- Get to the staging environment directory.

	cd ~/<root_folder>/staging_env


5- Execute the Vagrant command below to create a VM which acts as staging environment and set 
staging-vm-enigeering-shell runner.

	vagrant up


### **** Test Case ****

	Initial conditions: none

	Test Steps:

	1. Go to http://192.168.33.14:8080/manager/html
	2. If necessary, log in using as user name "admin" and password "admin".


	Post conditions:
	- You can see Tomcat Web Application Manager

	Notes:
	If http://192.168.33.14:8080 is not reachable, try executing the commands below:

		cd ~/<root_folder>/staging_env
		vagrant ssh
		sudo /opt/tomcat/bin/shutdown.sh
		sudo /opt/tomcat/bin/startup.sh

	This will restart tomcat, then try again the test case steps.


### **** Test Case ****

	Initial conditions: You are logged in as root

	Test Steps:

	1. Go to http://192.168.33.9/gitlab
	2. Clik on "Admin Area" (The wrench symbol in the top menu)
	3. In the left menu, under "Overview", click in "Runners"


	Post conditions:
	- In the list of runners you can find the runner tagged "staging-vm-enigeering-shell"


6- Get to the production environment directory.

	cd ~/<root_folder>/production_env


7- Execute the Vagrant command below to create a VM which acts as production environment and set 
production-vm-enigeering-shell runner.

	vagrant up

### **** Test Case ****

	Initial conditions: none

	Test Steps:

	1. Go to http://192.168.33.15:8080/manager/html
	2. If necessary, log in using as user name "admin" and password "admin".


	Post conditions:
	- You can see Tomcat Web Application Manager

	Notes:
	If http://192.168.33.15:8080 is not reachable, try executing the commands below:

		cd ~/<root_folder>/production_env
		vagrant ssh
		sudo /opt/tomcat/bin/shutdown.sh
		sudo /opt/tomcat/bin/startup.sh

	This will restart tomcat, then try again the test case steps.


### **** Test Case ****

	Initial conditions: You are logged in as root

	Test Steps:

	1. Go to http://192.168.33.9/gitlab
	2. Clik on "Admin Area" (The wrench symbol in the top menu)
	3. In the left menu, under "Overview", click in "Runners"


	Post conditions:
	- In the list of runners you can find the runner tagged "production-vm-enigeering-shell"


8- Get to the production environment directory.

	cd ~/<root_folder>/product


9- Commit and push the product to the gitlab repository of the project created in step 3.
	
	sh initial_commit.sh


### **** Test Case ****

	Initial conditions: Code was pushed to project repository

	Test Steps:

	1. Go to http://192.168.33.9/gitlab/test/engineeringproduct


	Post conditions:
	- In details under project overview you can see the pushed code


### **** Test Case ****

	Initial conditions: Code was pushed to project repository

	Test Steps:

	1. Go to http://192.168.33.9/gitlab/test/engineeringproduct
	2. On the left menu, click "CI/CD"


	Post conditions:
	- You can see the pipeline running and after some time finishing with success

	Notes:
	If pipeline fails in test stage, try executing the commands below:

		cd ~/<root_folder>/staging_env
		vagrant ssh
		sudo /opt/tomcat/bin/shutdown.sh
		sudo /opt/tomcat/bin/startup.sh

	This will restart tomcat, then in "CI/CD" rerun the pipeline.


### **** Test Case ****

	Initial conditions: All stages of pipeline succeded

	Test Steps:

	1. Go to http://192.168.33.14:8080/product/


	Post conditions:
	- You can see the webpage application deployed in staging

	Notes:
	If http://192.168.33.14:8080 is not reachable, try executing the commands below:

		cd ~/<root_folder>/staging_env
		vagrant ssh
		sudo /opt/tomcat/bin/shutdown.sh
		sudo /opt/tomcat/bin/startup.sh

	This will restart tomcat, then try again the test case steps.


### **** Test Case ****

	Initial conditions: All stages of pipeline succeded

	Test Steps:

	1. Go to http://192.168.33.15:8080/product/


	Post conditions:
	- You can see the webpage application deployed in production

	Notes:
	If http://192.168.33.15:8080 is not reachable, try executing the commands below:

		cd ~/<root_folder>/production_env
		vagrant ssh
		sudo /opt/tomcat/bin/shutdown.sh
		sudo /opt/tomcat/bin/startup.sh

	This will restart tomcat, then try again the test case steps.
