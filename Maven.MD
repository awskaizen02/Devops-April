# What is Java?

- Java is a computer programming language  
- Developed by Sun Microsystems in 1991  
- Using Java we can build several types of projects:
  1. Stand-alone applications  
  2. Web applications  

### Stand-alone Application
- Accessible only on one computer  
- Examples:
  - Calculator  
  - Notepad++  
  - Sublime Text  
  - VS Code  

### Web Application
- Accessible by multiple users at a time  
- Examples:
  - Gmail  
  - YouTube  
  - Facebook  
  - Naukri  
  - LinkedIn  

---

# Java Project Execution Flow

1. Developers write source code (`.java` files)  
2. Compile source code → generates bytecode (`.class` files)  
3. Package `.class` files as JAR/WAR  
   - Stand-alone → JAR  
   - Web app → WAR  
4. If JAR → execute directly  
5. If WAR → deploy to server (e.g., Tomcat)  

> **Note:** Java execution involves **Build + Deployment**

---

# Java Projects Build Process

1. Download required dependencies  
   - Example: Spring, Hibernate, JUnit  
2. Add libraries to build path  
3. Compile source code (`.java → .class`)  
4. Execute unit test cases  
5. Package as JAR/WAR  

- Earlier this was done manually  
- Build tools automate this process  

> **Maven is a build tool for Java applications**

---

# What is Maven?

- Free and open-source software  
- Developed by Apache  
- Written in Java  
- Used as a build tool  
- Automates project build process  

# Apache Maven
-  Apache Maven is a build automation tool mainly used for Java projects.
-  Maven helps you build, manage, and run your project easily without doing everything manually.

Before Maven: ANT projects
-  Developers manually downloaded libraries (JAR files)
-  Compiled code manually
-  Ran tests manually
-  Created project builds manually

 -- This was time-consuming and error-prone.

# With Maven:
-  Everything is automated
-  Saves time and reduces mistakes

----
## Maven follows steps called lifecycle phases:
-  compile → compile code
-  test → run tests
-  package → create JAR/WAR
-  install → store in local repo
-  deploy → send to server

## POM File (Project Object Model)
# Main file: pom.xml
  -  Contains:
  -  Project info
  -  Dependencies
  -  Plugins
---
# What Maven Can Do

1. Create project structure  
2. Download dependencies  
3. Add libraries to build path  
4. Compile source code  
5. Run unit tests  
6. Package as JAR/WAR  

---

===========================
Maven Repositories
===========================

## What is a Repository?
A Repository is a place where Maven dependencies (libraries, JAR files) are stored.

---

## Types of Maven Repositories

Maven provides **3 types of repositories**:

### 1) Local Repository
- This repository is created in your **local machine**.
- Default location: `~/.m2` folder
- Example:
  - Windows: `C:\Users\<username>\.m2`
  - Linux/Mac: `/home/<username>/.m2`

- Purpose:
  - Stores downloaded dependencies locally.
  - Improves build speed (no need to download again).

---

### 2) Central Repository
- Maintained by the **:contentReference[oaicite:0]{index=0}**
- Default repository used by Maven.
- Contains thousands of public libraries.

- Example:
  - Spring, Hibernate, Log4j, etc.

---

### 3) Remote Repository
- Maintained by **organizations/companies**.
- Used to store **internal/shared libraries**.

- Common tools used:
  - Nexus
  - JFrog Artifactory

- Purpose:
  - Share dependencies within a company.
  - Control versions and security.

---

## Important Notes

- When Maven needs a dependency:
  1. First, it checks the **Local Repository (.m2)**
  2. If not found, it downloads from:
     - Central Repository OR
     - Remote Repository

- **First time only**:
  - Dependencies are downloaded from Central/Remote.

- After that:
  - Maven uses the **Local Repository**, making builds faster.

---

# Maven Setup in Linux

```bash
# Install Maven
sudo yum install maven

# Verify version
mvn -version
