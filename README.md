# Product for Software Engineering Environments course
Using Maven 3, Spring 5 MVC, JUnit 5, Logback and Jetty web server


## 1. How to run this project?

### 1.1 Test it with Jetty web server.
```
$ mvn jetty:run -Djetty.port=9999
```
Access http://localhost:9999


### 1.2 Create a WAR file for deployment :
```
$ mvn package or mvn war:war
```
A WAR is generated at 'target' folder

### 1.3 Start a virtual environment :
Generate the virtual environment
```
$ vagrant up

```

Enter the virtual environment
```
$ vagrant ssh

```

### 1.4 Open in a virtual environment :
Inside the virtual environment go to vagrant_scripts folder
```
$ cd /vagrant_scripts/

```

Deploy the application with tomcat
```
$ sudo ./deploy-snapshot.sh

```

### 1.5 Visualize the application :
Access http://192.168.33.14:8080/engeneering-product/

