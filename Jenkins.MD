## What is CI/CD?

**CI/CD** stands for:

- **CI** → Continuous Integration  
- **CD** → Continuous Delivery / Continuous Deployment  

It is a DevOps practice used to automate the process of building, testing, and deploying applications.

---

## Continuous Integration (CI)

### Definition:
Continuous Integration is the process of automatically integrating code changes from multiple developers into a shared repository.

### Key Points:
- Developers push code frequently
- Code is automatically built and tested
- Errors are detected early

### CI Workflow:
1. Developer writes code
2. Pushes code to GitHub
3. Build is triggered automatically
4. Tests are executed
5. Feedback is provided

---

## Continuous Delivery (CD)

### Definition:
Continuous Delivery ensures that code is always in a deployable state.

### Key Points:
- Code is automatically tested
- Deployment is manual (one-click deploy)
- Reduces risk in releases

---

## Continuous Deployment (CD)

### Definition:
Continuous Deployment automatically deploys every change to production without manual intervention.

### Key Points:
- Fully automated pipeline
- Faster releases
- Requires strong testing
--------------------------------------------------------------------------------------------------
| Feature           | CI                   | Continuous Delivery      | Continuous Deployment    |
|-------------------|----------------------|--------------------------|--------------------------|
| Code Integration  | Yes                  | Yes                      | Yes                      |
| Testing           | Automated            | Automated                | Automated                |
| Deployment        | No                   | Manual                   | Automatic                |
| Goal              | Detect errors early  | Ready for release        | Release automatically    |
--------------------------------------------------------------------------------------------------

# JENKINS
========

## Introduction

- Jenkins is an **open-source software** and **free of cost**
- Developed using **Java**
- It is called a **CI/CD Server**

---

## CI/CD Meaning

- **CI** → Continuous Integration  
- **CD** → Continuous Delivery  

### CI/CD is an approach to **automate the project build and deployment process**

---

## Uses of Jenkins

- Jenkins helps to automate:
  - Build process
  - Testing
  - Deployment

- Using Jenkins, we can deploy any type of project:
  - Java
  - Python
  - .NET
  - React
  - Angular

---

## What is Build & Deployment?
==============================

### Build & Deployment Steps:

1. Take latest code from GitHub repository  
2. Build source code using Maven  
3. Perform code review using SonarQube  
4. Upload project artifact into Nexus  
5. Deploy code into server  

---

## Problem Without Jenkins

- In a single day, developers commit code multiple times to GitHub
- For every change, build and deployment must be performed

### Issues with Manual Process:
- Time-consuming  
- Error-prone  
- Not efficient  

---

## Solution: Jenkins

### To overcome the above problems, we automate the process using Jenkins  

- Jenkins automatically:
  - Pulls latest code
  - Builds the project
  - Runs tests
  - Deploys application

---

## Real-Time Workflow

1. Developer commits code to GitHub  
2. Jenkins detects the change  
3. Jenkins pulls latest code  
4. Build is triggered (Maven/Gradle)  
5. Code quality check (SonarQube)  
6. Artifact stored in Nexus  
7. Application deployed to server  

---

## Summary

- Jenkins = CI/CD automation tool  
- Eliminates manual work  
- Saves time and reduces errors  
- Supports multiple technologies  

---
