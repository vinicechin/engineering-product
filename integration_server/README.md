# Product for Software Engineering Environments course
Using Maven 3, JUnit 5, and Tomcat


## 1. How to setup the integration server?

### 1.1 Start the virtual environment for the server :
From the integration_server folder, generate the virtual environment for production
```
$ vagrant up
```

### 1.2 Access GitLab for the first time :
Access http://192.168.33.9/gitlab and choose the password for the root user (admin)
Note: Password must be at least 8 characters long

### 1.3 Other user access :
Create a new user by accessing http://192.168.33.9/gitlab and clicking in "Register now" (bottom right). Fill the formulary and click register.

## 2. How to upload the product to GitLab :

### 2.1 Login and create new project :
Login as the newly created user <username> into GitLab (not root user). Then create a blank new project with the desired <project-name>.

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
* <project-name> is all in lower-case