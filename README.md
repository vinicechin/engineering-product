# Product for Software Engineering Environments course
Using Maven 3, Spring 5 MVC, JUnit 5, Logback and Jetty web server


## 1. How to run this project?

### 1.1 Create a WAR file for deployment :

From the main folder, generate the war file at 'target' folder
```
$ cd product/
$ mvn clean install
```

### 1.2 Start a virtual environment :
From the main folder, generate the virtual environment for production
```
$ cd production_env
$ vagrant up
```

Enter the virtual environment
```
$ vagrant ssh

```

### 1.3 Open in a virtual environment :
Inside the virtual environment go to vagrant_scripts folder
```
$ cd /vagrant_scripts/

```

Deploy the application with tomcat
```
$ sudo ./deploy-snapshot.sh

```

### 1.4 Visualize the application :
Access http://192.168.33.14:8080/engineering/

