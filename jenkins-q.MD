# Jenkins 100 Scenario-Based Interview Questions and Answers (Basic to Advanced)

---

# 1. Jenkins Installation Failure

## Question

Jenkins is installed on a Linux server but is not accessible from the browser. How would you troubleshoot?

## Answer

* Check Jenkins service status.
* Verify port 8080 is listening.
* Check firewall/security group.
* Validate Java installation.
* Review Jenkins logs.

```bash
sudo systemctl status jenkins
sudo netstat -tulnp | grep 8080
sudo journalctl -u jenkins
```

---

# 2. Jenkins Build Failure

## Question

A Jenkins build that worked yesterday suddenly fails today. What would you do?

## Answer

* Review console logs.
* Check recent commits.
* Verify dependencies.
* Compare with last successful build.
* Validate environment variables.

---

# 3. Jenkins Agent Offline

## Question

A Jenkins agent suddenly goes offline. How would you resolve it?

## Answer

* Verify agent server availability.
* Restart Jenkins agent.
* Check SSH connectivity.
* Validate Java installation.
* Review network/firewall issues.

---

# 4. Pipeline Failure During Testing

## Question

Your pipeline fails during the test stage. How do you troubleshoot?

## Answer

* Check test logs.
* Execute tests manually.
* Validate dependencies.
* Verify environment setup.
* Use retry block for flaky tests.

```groovy
retry(3) {
  sh 'mvn test'
}
```

---

# 5. Git Authentication Failure

## Question

Jenkins cannot clone a Git repository due to authentication issues.

## Answer

* Verify credentials.
* Check SSH keys.
* Validate access tokens.
* Test Git manually.

```bash
git clone git@github.com:repo/project.git
```

---

# 6. Disk Space Full

## Question

Jenkins jobs are failing because disk space is full.

## Answer

* Remove old builds.
* Clean workspace.
* Configure build retention policy.
* Archive artifacts externally.

```bash
df -h
```

---

# 7. Slow Jenkins Performance

## Question

Jenkins UI and builds are very slow. How do you improve performance?

## Answer

* Increase JVM memory.
* Remove unused plugins.
* Use distributed builds.
* Enable parallel stages.
* Clean old logs.

---

# 8. Plugin Conflict Issue

## Question

After plugin installation Jenkins crashes frequently.

## Answer

* Disable problematic plugin.
* Verify compatibility.
* Upgrade Jenkins/plugins.
* Check logs.

---

# 9. Production Deployment Failure

## Question

Deployment failed halfway in production. What would you do?

## Answer

* Stop deployment.
* Rollback to stable version.
* Analyze logs.
* Validate server health.
* Notify stakeholders.

---

# 10. Missing Jenkinsfile

## Question

Pipeline job fails because Jenkinsfile is missing.

## Answer

* Verify branch.
* Check SCM path.
* Ensure Jenkinsfile exists in repository.
* Validate multibranch configuration.

---

# 11. Parallel Pipeline Execution

## Question

How do you reduce build execution time?

## Answer

Use parallel stages.

```groovy
parallel {
  stage('Unit Test') {
    steps {
      sh 'mvn test'
    }
  }
  stage('Security Scan') {
    steps {
      sh 'trivy image app'
    }
  }
}
```

---

# 12. Jenkins Security Hardening

## Question

How would you secure Jenkins in an enterprise environment?

## Answer

* Enable RBAC.
* Disable anonymous access.
* Use HTTPS.
* Integrate LDAP/AD.
* Use credential store.

---

# 13. Secret Exposure in Logs

## Question

Passwords are visible in Jenkins logs. How do you fix it?

## Answer

Use Jenkins credentials binding.

```groovy
withCredentials([string(credentialsId: 'token', variable: 'TOKEN')]) {
  sh 'curl -H "Authorization: Bearer $TOKEN" app.com'
}
```

---

# 14. Jenkins Backup Strategy

## Question

How do you backup Jenkins?

## Answer

Backup:

* Jobs
* Plugins
* Credentials
* Pipelines

```bash
tar -cvf jenkins_backup.tar /var/lib/jenkins
```

---

# 15. Multibranch Pipeline

## Question

Why use Multibranch Pipelines?

## Answer

* Auto-detect branches.
* Build pull requests automatically.
* Simplifies CI/CD.

---

# 16. Blue-Green Deployment

## Question

How would you implement Blue-Green deployment in Jenkins?

## Answer

* Deploy to Green environment.
* Validate health.
* Switch traffic.
* Rollback if needed.

---

# 17. Kubernetes Deployment

## Question

How do you deploy applications to Kubernetes from Jenkins?

## Answer

```groovy
stage('Deploy') {
  steps {
    sh 'kubectl apply -f deployment.yaml'
  }
}
```

---

# 18. Docker Integration

## Question

How do you integrate Docker with Jenkins?

## Answer

```groovy
stage('Build Docker Image') {
  steps {
    sh 'docker build -t app:v1 .'
  }
}
```

---

# 19. Shared Library Usage

## Question

How do you standardize pipeline code across teams?

## Answer

Use Jenkins Shared Libraries.

```groovy
@Library('shared-lib') _
deployApp()
```

---

# 20. Rollback Scenario

## Question

Production deployment introduced bugs. How do you rollback?

## Answer

* Redeploy last stable build.
* Restore DB if required.
* Validate application.

---

# 21. Jenkins Master Crash

## Question

Jenkins master crashed unexpectedly. What would you do?

## Answer

* Restore backup.
* Restart Jenkins.
* Reconnect agents.
* Validate jobs.

---

# 22. Jenkins Upgrade Scenario

## Question

How do you safely upgrade Jenkins?

## Answer

* Take backup.
* Validate plugin compatibility.
* Upgrade in lower environment first.
* Perform production upgrade.

---

# 23. Build Trigger Scenario

## Question

How do you trigger Jenkins builds automatically?

## Answer

* Webhooks
* Poll SCM
* Scheduled jobs
* Upstream triggers

---

# 24. Artifact Management

## Question

How do you manage build artifacts?

## Answer

Use:

* Nexus
* Artifactory
* S3

```groovy
archiveArtifacts artifacts: 'target/*.jar'
```

---

# 25. SonarQube Integration

## Question

How do you integrate SonarQube with Jenkins?

## Answer

```groovy
stage('Code Scan') {
  steps {
    sh 'sonar-scanner'
  }
}
```

---

# 26. Email Notifications

## Question

How do you send failure notifications?

## Answer

```groovy
post {
  failure {
    mail to: 'team@example.com',
    subject: 'Build Failed',
    body: 'Check Jenkins job.'
  }
}
```

---

# 27. Real-Time Production Outage

## Question

Application deployed successfully but inaccessible. What will you check?

## Answer

* Application logs.
* Ports.
* Load balancer.
* Kubernetes pods.
* Firewall.

---

# 28. Jenkins HA Architecture

## Question

How do you design Jenkins for High Availability?

## Answer

* Distributed agents.
* Shared storage.
* Load balancer.
* Backup strategy.
* Kubernetes deployment.

---

# 29. CI/CD Workflow

## Question

Explain a complete CI/CD pipeline.

## Answer

* Code commit.
* Jenkins trigger.
* Build.
* Unit test.
* Code scan.
* Docker build.
* Push image.
* Deploy.

---

# 30. Pipeline Syntax Error

## Question

Pipeline fails due to syntax error.

## Answer

* Validate Jenkinsfile syntax.
* Use Pipeline Syntax Generator.
* Run linter.

---

# 31. Jenkins Workspace Cleanup

## Question

How do you automatically clean Jenkins workspace?

## Answer

```groovy
post {
  always {
    cleanWs()
  }
}
```

---

# 32. Failed SCM Polling

## Question

SCM polling is not triggering builds.

## Answer

* Validate Git webhook.
* Check polling schedule.
* Verify repository permissions.

---

# 33. Jenkins Queue Issue

## Question

Builds are stuck in queue.

## Answer

* Check executors.
* Verify agents availability.
* Increase executor count.

---

# 34. Maven Build Failure

## Question

Maven build fails in Jenkins but works locally.

## Answer

* Compare Java/Maven versions.
* Verify dependencies.
* Check environment variables.

---

# 35. Jenkins Node Labeling

## Question

How do you run jobs on specific agents?

## Answer

Use labels.

```groovy
agent {
  label 'docker-agent'
}
```

---

# 36. Environment Variable Issue

## Question

Pipeline cannot read environment variables.

## Answer

```groovy
environment {
  APP_ENV = 'prod'
}
```

---

# 37. Build Timeout Scenario

## Question

How do you prevent long-running builds?

## Answer

```groovy
timeout(time: 30, unit: 'MINUTES') {
  sh './build.sh'
}
```

---

# 38. Jenkins Cron Scheduling

## Question

How do you schedule nightly builds?

## Answer

```groovy
triggers {
  cron('H 2 * * *')
}
```

---

# 39. Manual Approval Stage

## Question

How do you implement manual approval before production deployment?

## Answer

```groovy
input 'Approve Production Deployment?'
```

---

# 40. Jenkins Restart During Build

## Question

Jenkins restarted during build execution. What happens?

## Answer

* Build may fail or resume.
* Durable pipelines can continue after restart.

---

# 41. Blue Ocean Usage

## Question

Why use Jenkins Blue Ocean?

## Answer

* Better UI.
* Visual pipeline stages.
* Easier troubleshooting.

---

# 42. Build Parameterization

## Question

How do you create parameterized builds?

## Answer

```groovy
parameters {
  string(name: 'ENV', defaultValue: 'dev')
}
```

---

# 43. Jenkins Credentials Rotation

## Question

How do you rotate credentials securely?

## Answer

* Update secrets in Jenkins credentials store.
* Avoid hardcoding.
* Use vault integration.

---

# 44. Pipeline Shared Variables

## Question

How do you share variables across stages?

## Answer

```groovy
env.VERSION = '1.0'
```

---

# 45. Jenkins and Terraform

## Question

How do you integrate Terraform with Jenkins?

## Answer

```groovy
sh 'terraform init'
sh 'terraform apply -auto-approve'
```

---

# 46. Terraform State Lock Issue

## Question

Terraform state is locked during Jenkins deployment.

## Answer

* Verify no parallel jobs.
* Release stale lock.
* Use remote backend.

---

# 47. Jenkins and Ansible

## Question

How do you execute Ansible playbooks from Jenkins?

## Answer

```groovy
sh 'ansible-playbook deploy.yml'
```

---

# 48. Docker Registry Authentication

## Question

Docker image push fails due to authentication.

## Answer

```groovy
sh 'docker login -u user -p password'
```

---

# 49. Build Artifact Missing

## Question

Pipeline cannot find generated artifacts.

## Answer

* Verify build output path.
* Archive artifacts correctly.
* Validate workspace cleanup.

---

# 50. Jenkins Memory Leak

## Question

Jenkins memory usage continuously increases.

## Answer

* Analyze heap dump.
* Remove problematic plugins.
* Increase JVM heap.
* Restart Jenkins.

---

# 51. Dynamic Agents

## Question

How do you dynamically provision Jenkins agents?

## Answer

Use Kubernetes/Docker cloud agents.

---

# 52. Build Retention Policy

## Question

How do you automatically delete old builds?

## Answer

```groovy
options {
  buildDiscarder(logRotator(numToKeepStr: '10'))
}
```

---

# 53. Jenkins Reverse Proxy

## Question

How do you configure Jenkins behind Nginx?

## Answer

* Configure reverse proxy.
* Enable HTTPS.
* Configure Jenkins URL.

---

# 54. Jenkins Agent Permission Denied

## Question

Agent cannot execute scripts due to permission denied.

## Answer

```bash
chmod +x build.sh
```

---

# 55. Jenkins Audit Logging

## Question

How do you track user activities in Jenkins?

## Answer

* Enable audit trail plugin.
* Centralize logs.
* Monitor admin activities.

---

# 56. Jenkins Disaster Recovery

## Question

How do you implement disaster recovery?

## Answer

* Scheduled backups.
* Offsite storage.
* Infrastructure as Code.
* DR testing.

---

# 57. Jenkins SSL Configuration

## Question

How do you secure Jenkins using HTTPS?

## Answer

* Configure SSL certificates.
* Use reverse proxy.
* Redirect HTTP to HTTPS.

---

# 58. Jenkins CPU Spike

## Question

Jenkins CPU utilization suddenly spikes.

## Answer

* Identify heavy jobs.
* Check infinite loops.
* Analyze plugins.
* Scale agents.

---

# 59. Kubernetes Pod CrashLoop

## Question

Application pods are crashing after deployment.

## Answer

```bash
kubectl logs pod-name
kubectl describe pod pod-name
```

---

# 60. Jenkins API Usage

## Question

How do you trigger Jenkins jobs using API?

## Answer

```bash
curl -X POST http://jenkins/job/test/build
```

---

# 61. Concurrent Build Issue

## Question

Multiple builds conflict with each other.

## Answer

Disable concurrent builds.

```groovy
options {
  disableConcurrentBuilds()
}
```

---

# 62. Jenkins Workspace Corruption

## Question

Workspace corruption causes build failure.

## Answer

* Clean workspace.
* Re-clone repository.
* Rebuild job.

---

# 63. Pipeline Resume Feature

## Question

How does Jenkins resume pipelines after restart?

## Answer

Durable pipelines store execution state and resume automatically.

---

# 64. Jenkins and AWS Integration

## Question

How do you deploy applications to AWS from Jenkins?

## Answer

* Configure AWS credentials.
* Use AWS CLI.
* Deploy using Terraform/CloudFormation.

---

# 65. Jenkins S3 Artifact Upload

## Question

How do you upload artifacts to S3?

## Answer

```groovy
sh 'aws s3 cp target/app.jar s3://bucket/'
```

---

# 66. Jenkins ECS Deployment

## Question

How do you deploy Docker containers to ECS?

## Answer

* Build image.
* Push to ECR.
* Update ECS service.

---

# 67. Canary Deployment

## Question

How do you implement Canary deployments?

## Answer

* Deploy to subset of users.
* Monitor metrics.
* Gradually increase traffic.

---

# 68. Jenkins Plugin Upgrade Failure

## Question

Plugin upgrade breaks Jenkins jobs.

## Answer

* Rollback plugin.
* Restore backup.
* Validate dependencies.

---

# 69. Jenkins Agent Scaling

## Question

How do you scale Jenkins agents automatically?

## Answer

Use Kubernetes autoscaling or cloud plugins.

---

# 70. Jenkins and GitLab Integration

## Question

How do you integrate GitLab with Jenkins?

## Answer

* Configure webhooks.
* Add GitLab plugin.
* Configure credentials.

---

# 71. Jenkins and Bitbucket Integration

## Question

How do you integrate Bitbucket repositories?

## Answer

* Configure SCM.
* Add credentials.
* Enable webhooks.

---

# 72. Jenkins Docker-in-Docker

## Question

How do you run Docker commands inside Jenkins containers?

## Answer

Mount Docker socket.

```bash
-v /var/run/docker.sock:/var/run/docker.sock
```

---

# 73. Jenkins Build Flakiness

## Question

Intermittent failures happen randomly. How do you handle it?

## Answer

* Add retries.
* Stabilize tests.
* Isolate environments.
* Analyze flaky dependencies.

---

# 74. Jenkins Shared Workspace Issue

## Question

Shared workspace causes file conflicts.

## Answer

* Use isolated workspaces.
* Avoid concurrent builds.
* Use containers.

---

# 75. Jenkins and Prometheus Monitoring

## Question

How do you monitor Jenkins?

## Answer

Use Prometheus and Grafana.

* Install Prometheus plugin.
* Configure metrics endpoint.
* Create Grafana dashboards.

---

# 76. Jenkins Database Integration

## Question

How do you execute database scripts from Jenkins?

## Answer

```groovy
sh 'mysql -u user -p db < schema.sql'
```

---

# 77. Jenkins Branch Strategy

## Question

How do you manage multiple branches in CI/CD?

## Answer

* Use multibranch pipelines.
* Separate deployment environments.
* Protect main branch.

---

# 78. Jenkins Secrets Management

## Question

How do you integrate Vault with Jenkins?

## Answer

* Install Vault plugin.
* Fetch secrets dynamically.
* Avoid static passwords.

---

# 79. Jenkins Pipeline as Code

## Question

Why use Pipeline as Code?

## Answer

* Version control.
* Reusable pipelines.
* Easier collaboration.
* Automated CI/CD.

---

# 80. Jenkins RBAC Scenario

## Question

How do you restrict developer access?

## Answer

* Configure RBAC.
* Separate admin/user roles.
* Limit production deployment access.

---

# 81. Jenkins Build Number Reset

## Question

How do you reset build numbers?

## Answer

Modify nextBuildNumber file in Jenkins job directory.

---

# 82. Jenkins Log Rotation

## Question

How do you prevent logs from consuming storage?

## Answer

Configure log rotation policies.

---

# 83. Jenkins SSH Deployment

## Question

How do you deploy applications using SSH?

## Answer

```groovy
sshagent(['ssh-key']) {
  sh 'scp app.jar server:/opt/'
}
```

---

# 84. Jenkins Build Promotion

## Question

How do you promote builds between environments?

## Answer

* Dev → QA → UAT → Prod.
* Use approvals and artifact versioning.

---

# 85. Jenkins Monorepo Scenario

## Question

How do you manage CI/CD for monorepos?

## Answer

* Use path-based triggers.
* Modular pipelines.
* Parallel builds.

---

# 86. Jenkins Containerized Builds

## Question

Why run builds inside containers?

## Answer

* Consistent environments.
* Isolation.
* Scalability.

---

# 87. Jenkins Shell Script Failure

## Question

Shell script works manually but fails in Jenkins.

## Answer

* Check PATH variables.
* Verify permissions.
* Compare user contexts.

---

# 88. Jenkins Blue-Green Rollback

## Question

Green deployment fails health checks.

## Answer

* Route traffic back to Blue.
* Investigate issues.
* Redeploy fixed version.

---

# 89. Jenkins Security Vulnerability Scan

## Question

How do you integrate vulnerability scanning?

## Answer

Use tools like:

* Trivy
* Snyk
* OWASP Dependency Check

---

# 90. Jenkins Notification Integration

## Question

How do you integrate Slack notifications?

## Answer

```groovy
slackSend message: 'Build Failed'
```

---

# 91. Jenkins Backup Validation

## Question

How do you validate Jenkins backups?

## Answer

* Restore in test environment.
* Verify jobs/plugins.
* Test pipelines.

---

# 92. Jenkins Infrastructure as Code

## Question

How do you automate Jenkins setup?

## Answer

Use:

* Terraform
* Ansible
* Helm Charts
* Jenkins Configuration as Code

---

# 93. Jenkins Pipeline Versioning

## Question

How do you version Jenkins pipelines?

## Answer

Store Jenkinsfiles in Git repositories.

---

# 94. Jenkins Large Enterprise Scaling

## Question

How do you manage Jenkins for thousands of builds?

## Answer

* Distributed agents.
* Kubernetes scaling.
* Shared libraries.
* Monitoring.

---

# 95. Jenkins Disaster During Deployment

## Question

Production deployment fails and Jenkins crashes simultaneously.

## Answer

* Restore Jenkins.
* Rollback deployment.
* Use DR environment.
* Validate application.

---

# 96. Jenkins Agent Disk Full

## Question

Agent builds fail due to low disk space.

## Answer

* Clean Docker images.
* Remove old workspaces.
* Increase disk volume.

---

# 97. Jenkins and Helm Deployment

## Question

How do you deploy Helm charts using Jenkins?

## Answer

```groovy
sh 'helm upgrade --install app ./chart'
```

---

# 98. Jenkins Git Merge Conflict

## Question

Automatic merge causes conflicts in pipeline.

## Answer

* Stop pipeline.
* Resolve conflicts manually.
* Re-trigger build.

---

# 99. Jenkins Compliance Requirement

## Question

How do you meet compliance requirements in Jenkins?

## Answer

* Audit logging.
* RBAC.
* Secure credential management.
* Backup retention.

---

# 100. Enterprise CI/CD Best Practices

## Question

What are Jenkins enterprise best practices?

## Answer

* Pipeline as Code.
* HA architecture.
* Shared libraries.
* RBAC security.
* Automated backups.
* Monitoring and alerting.
* Infrastructure as Code.
* Kubernetes-based scaling.
* Secure credential handling.
* Automated testing and deployments.

---

# Conclusion

These 100 scenario-based Jenkins interview questions cover:

* Jenkins Administration
* CI/CD Pipelines
* Docker Integration
* Kubernetes Deployments
* Security
* Troubleshooting
* Monitoring
* High Availability
* Cloud Integration
* Enterprise DevOps Practices

These questions are useful for:

* DevOps Engineers
* Build & Release Engineers
* Site Reliability Engineers (SRE)
* CI/CD Engineers
* Cloud Engineers
* Platform Engineers

---

# Jenkins Interview Questions and Answers (Basic to Advanced)

---

# Basic Jenkins Interview Questions

## 1. What is Jenkins?

### Answer

Jenkins is an open-source automation server used for Continuous Integration (CI) and Continuous Delivery (CD). It helps automate software building, testing, and deployment processes.

---

## 2. What is Continuous Integration?

### Answer

Continuous Integration (CI) is the process of automatically building and testing code whenever developers commit changes to the repository.

---

## 3. What is Continuous Delivery?

### Answer

Continuous Delivery (CD) ensures code changes are automatically prepared for deployment to production.

---

## 4. What are the advantages of Jenkins?

### Answer

* Open-source
* Easy plugin integration
* Supports CI/CD pipelines
* Platform independent
* Distributed builds supported
* Large community support

---

## 5. What are Jenkins Pipelines?

### Answer

Pipelines are a suite of plugins that support implementing and integrating continuous delivery pipelines in Jenkins.

---

## 6. What is a Jenkins Job?

### Answer

A Jenkins job is a task or automated process configured in Jenkins.

Examples:

* Build job
* Test job
* Deployment job

---

## 7. What is a Jenkins Node?

### Answer

A node is a machine where Jenkins executes builds.

Types:

* Master Node
* Agent Node

---

## 8. What is the difference between Jenkins Master and Agent?

### Answer

| Master            | Agent                |
| ----------------- | -------------------- |
| Controls Jenkins  | Executes jobs        |
| Schedules builds  | Performs build tasks |
| Manages pipelines | Reduces workload     |

---

## 9. What is Freestyle Project?

### Answer

Freestyle Project is the simplest Jenkins job type used for basic build and deployment tasks.

---

## 10. What is Jenkinsfile?

### Answer

Jenkinsfile is a text file that defines the Jenkins pipeline as code.

Example:

```groovy
pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
  }
}
```

---

# Intermediate Jenkins Interview Questions

## 11. What are the types of Pipelines in Jenkins?

### Answer

1. Declarative Pipeline
2. Scripted Pipeline

---

## 12. What is Declarative Pipeline?

### Answer

Declarative Pipeline provides a simple and structured syntax.

Example:

```groovy
pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        echo 'Running Tests'
      }
    }
  }
}
```

---

## 13. What is Scripted Pipeline?

### Answer

Scripted Pipeline uses Groovy scripting and provides more flexibility.

---

## 14. What is Blue Ocean in Jenkins?

### Answer

Blue Ocean is a modern UI for Jenkins that provides visual pipeline management.

---

## 15. What are Jenkins Plugins?

### Answer

Plugins extend Jenkins functionality.

Examples:

* Git Plugin
* Docker Plugin
* Kubernetes Plugin
* Maven Plugin

---

## 16. How do you secure Jenkins?

### Answer

* Enable authentication
* Use Role-Based Access Control
* Enable HTTPS
* Disable anonymous access
* Use credentials management

---

## 17. What are Jenkins Credentials?

### Answer

Credentials securely store:

* Passwords
* SSH keys
* API tokens
* Secret text

---

## 18. What is SCM in Jenkins?

### Answer

SCM stands for Source Code Management.

Examples:

* Git
* SVN
* Bitbucket
* GitLab

---

## 19. What is Poll SCM?

### Answer

Poll SCM checks the repository periodically for code changes.

Example:

```bash
H/5 * * * *
```

---

## 20. What is a Webhook?

### Answer

Webhook automatically triggers Jenkins builds when code changes occur.

---

## 21. How do you backup Jenkins?

### Answer

Backup Jenkins Home Directory:

```bash
/var/lib/jenkins
```

---

## 22. What is Distributed Build?

### Answer

Distributed build allows Jenkins to run jobs across multiple agents.

---

## 23. What is Jenkins Workspace?

### Answer

Workspace is the directory where Jenkins stores build files and source code.

---

## 24. What is Build Trigger?

### Answer

Build trigger automatically starts a Jenkins job.

Types:

* SCM polling
* Webhook
* Scheduled build
* Upstream build

---

## 25. What is Artifact in Jenkins?

### Answer

Artifacts are generated files from builds.

Examples:

* JAR
* WAR
* ZIP
* Docker Images

---

## 26. How do you archive artifacts?

### Answer

```groovy
archiveArtifacts artifacts: 'target/*.jar'
```

---

## 27. What is Jenkins Shared Library?

### Answer

Shared Libraries allow reusable pipeline code across projects.

---

## 28. What is Jenkins Multibranch Pipeline?

### Answer

Multibranch Pipeline automatically creates pipelines for all branches.

---

## 29. What is Build Executor?

### Answer

Executor is a slot used by Jenkins to run builds.

---

## 30. What is Fingerprinting in Jenkins?

### Answer

Fingerprinting tracks artifacts across different builds and pipelines.

---

# Advanced Jenkins Interview Questions

## 31. How does Jenkins integrate with Docker?

### Answer

Jenkins can build, run, and deploy Docker containers.

Example:

```groovy
sh 'docker build -t app:v1 .'
```

---

## 32. How does Jenkins integrate with Kubernetes?

### Answer

Jenkins deploys applications using Kubernetes manifests or Helm charts.

Example:

```groovy
sh 'kubectl apply -f deployment.yaml'
```

---

## 33. What is Jenkins Configuration as Code (JCasC)?

### Answer

JCasC manages Jenkins configuration using YAML files.

---

## 34. What is Jenkins Pipeline as Code?

### Answer

Pipeline as Code stores pipeline definitions inside source control.

---

## 35. What are the stages in Jenkins Pipeline?

### Answer

Common stages:

* Checkout
* Build
* Test
* Scan
* Deploy

---

## 36. How do you handle secrets in Jenkins?

### Answer

Use Jenkins Credentials Store or HashiCorp Vault.

Example:

```groovy
withCredentials([string(credentialsId: 'token', variable: 'TOKEN')]) {
  sh 'echo $TOKEN'
}
```

---

## 37. What is Jenkins Agent Label?

### Answer

Labels help run jobs on specific agents.

Example:

```groovy
agent {
  label 'docker-agent'
}
```

---

## 38. What is Parallel Execution in Jenkins?

### Answer

Parallel execution runs multiple stages simultaneously.

Example:

```groovy
parallel {
  stage('Test1') {
    steps {
      sh 'mvn test'
    }
  }
}
```

---

## 39. How do you troubleshoot failed builds?

### Answer

* Check console logs
* Verify dependencies
* Validate environment variables
* Review recent commits

---

## 40. How do you optimize Jenkins performance?

### Answer

* Use distributed builds
* Remove unused plugins
* Increase JVM memory
* Clean old workspaces

---

## 41. What is Jenkins High Availability?

### Answer

High Availability ensures Jenkins remains operational during failures.

---

## 42. What are Jenkins environment variables?

### Answer

Environment variables store dynamic values during pipeline execution.

Example:

```groovy
environment {
  ENV = 'prod'
}
```

---

## 43. What is Jenkins Role-Based Access Control?

### Answer

RBAC restricts user access based on roles and permissions.

---

## 44. How do you integrate SonarQube with Jenkins?

### Answer

```groovy
sh 'sonar-scanner'
```

---

## 45. How do you integrate Jenkins with AWS?

### Answer

Jenkins integrates with:

* EC2
* ECS
* EKS
* S3
* CodeDeploy

---

## 46. How do you integrate Terraform with Jenkins?

### Answer

```groovy
sh 'terraform init'
sh 'terraform apply -auto-approve'
```

---

## 47. How do you integrate Ansible with Jenkins?

### Answer

```groovy
sh 'ansible-playbook deploy.yml'
```

---

## 48. What is Canary Deployment?

### Answer

Canary deployment releases application changes to a small group of users before full deployment.

---

## 49. What is Blue-Green Deployment?

### Answer

Blue-Green deployment uses two environments to minimize downtime.

---

## 50. How do you monitor Jenkins?

### Answer

Monitoring tools:

* Prometheus
* Grafana
* ELK Stack

---

## 51. What is Jenkins Build Queue?

### Answer

Build Queue stores jobs waiting for execution.

---

## 52. What are Post Actions in Jenkins?

### Answer

Post actions execute after pipeline completion.

Example:

```groovy
post {
  success {
    echo 'Build Success'
  }
}
```

---

## 53. How do you send notifications from Jenkins?

### Answer

Jenkins supports:

* Email notifications
* Slack notifications
* Microsoft Teams notifications

---

## 54. What is Jenkinsfile Runner?

### Answer

Jenkinsfile Runner runs Jenkins pipelines without a full Jenkins server.

---

## 55. What is Durable Task Plugin?

### Answer

It allows Jenkins pipelines to survive Jenkins restarts.

---

## 56. How do you clean Jenkins workspace?

### Answer

```groovy
cleanWs()
```

---

## 57. What is Jenkins Restart from Stage?

### Answer

Restart from Stage allows rerunning failed stages instead of the entire pipeline.

---

## 58. What are Input Steps in Jenkins?

### Answer

Input step pauses the pipeline for manual approval.

Example:

```groovy
input 'Approve Deployment?'
```

---

## 59. How do you scale Jenkins?

### Answer

* Distributed agents
* Kubernetes agents
* Cloud auto-scaling

---

## 60. What are Jenkins best practices?

### Answer

* Use Pipeline as Code
* Use RBAC
* Backup Jenkins regularly
* Avoid too many plugins
* Use distributed builds
* Monitor Jenkins continuously

---

# Scenario-Based Jenkins Interview Questions

## 61. Jenkins build suddenly failed after working fine yesterday. What will you do?

### Answer

* Check console logs
* Compare recent commits
* Verify dependencies
* Check disk space
* Validate credentials

---

## 62. Jenkins agent is offline. How do you fix it?

### Answer

* Restart agent
* Verify SSH connectivity
* Check Java installation
* Validate firewall rules

---

## 63. Jenkins server disk is full. What will you do?

### Answer

* Delete old builds
* Clean workspaces
* Configure retention policy
* Remove unused Docker images

---

## 64. Production deployment failed midway. What is your action plan?

### Answer

* Stop deployment
* Rollback previous stable version
* Analyze logs
* Validate application health

---

## 65. Jenkins is slow. How do you improve performance?

### Answer

* Increase JVM heap
* Remove unused plugins
* Add agents
* Enable parallel builds

---

## 66. How do you implement CI/CD using Jenkins?

### Answer

Flow:

1. Code Commit
2. Build Trigger
3. Build
4. Test
5. Security Scan
6. Artifact Storage
7. Deployment

---

## 67. Jenkins pipeline fails during testing. How do you troubleshoot?

### Answer

* Review test reports
* Verify dependencies
* Execute tests manually
* Check environment configuration

---

## 68. Jenkins cannot clone Git repository. What will you check?

### Answer

* Git credentials
* SSH keys
* Access token validity
* Repository permissions

---

## 69. Jenkins crashes after plugin installation. What would you do?

### Answer

* Disable plugin
* Restore backup
* Verify compatibility
* Review logs

---

## 70. How do you rollback deployments using Jenkins?

### Answer

* Redeploy previous stable artifact
* Restore configuration
* Validate environment

---

# Conclusion

These Jenkins interview questions cover:

* Jenkins Basics
* CI/CD Concepts
* Jenkins Pipelines
* Docker Integration
* Kubernetes Integration
* Terraform & Ansible
* Jenkins Security
* Monitoring & Troubleshooting
* Scenario-Based Questions
* Enterprise Jenkins Best Practices

---


