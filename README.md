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

### 1.3 Run in a virtual environment :
```
$ vagrant up

```
This will generate the virtual environment
```
$ vagrant ssh

```
Run this to enter the virtual environment