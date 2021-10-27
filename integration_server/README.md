
# Product for Software Engineering Environments course
Using Maven 3, JUnit 5, and Tomcat


## 1. How to setup the integration server?

### 1.1 Start the virtual environment for the server :
From the integration_server folder, generate the virtual environment for production
```
$ vagrant up
```

### 1.2 Access GitLab for the first time :
Access http://192.168.33.9/gitlab and choose the password for the admin user (root)

Note: Password must be at least 8 characters long

### 1.3 Other user access :
Create a new user &lt;username&gt; by accessing http://192.168.33.9/gitlab and clicking in "Register now" (bottom right). 

Fill the formulary and click register.

Note: The new user needs to be approved by the admin user. So login as admin, go to Admin Area &gt; Overview &gt; Users &gt; Pending approval tab, click the administration dropdown of &lt;username&gt; (on the righht of the user info) and select approve.

## 2. How to upload the product to GitLab :

### 2.1 Login and create new project :
Login as the newly created user &lt;username&gt; into GitLab (not root user). Then create a blank new project with the desired &lt;project-name&gt;.

### 2.2 Connect product to gitlab repository
Go to the product folder and set up origin and first commit.
```
$ cd ../product/
$ git init
$ git remote add origin http://192.168.33.9/gitlab/<username>/<project-name>
$ git add .
$ git commit -m "<commit-message>"
$ git push
```
**Notes:**
* If ssh is not set, at push execution, gitlab username and password will be requested as well
* &lt;project-name&gt; is all in lower-case
