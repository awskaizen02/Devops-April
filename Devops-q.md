# DevOps Web Server Interview Questions and Answers (2026)

---

# Basic Web Server Concepts

---

## Q1: What is a Web Server?

### Answer

A web server is software or hardware that:
- Receives HTTP/HTTPS requests
- Processes client requests
- Serves web pages or APIs

### Popular Web Servers
- Nginx
- Apache HTTP Server
- IIS
- Tomcat
- Caddy

---

## Q2: Difference between Apache and Nginx?

### Answer

| Apache | Nginx |
|---|---|
| Process-based architecture | Event-driven architecture |
| Better for dynamic content | Better for static content |
| Higher memory usage | Lower memory usage |
| Uses `.htaccess` | No `.htaccess` |

### Apache
- Flexible configuration
- Large module ecosystem

### Nginx
- High performance
- Reverse proxy support
- Load balancing support

---

## Q3: What is Reverse Proxy?

### Answer

A reverse proxy sits between:
- Client
- Backend servers

### Functions
- Load balancing
- SSL termination
- Caching
- Security filtering

### Example
```text
Client → Nginx → Application Server
```

---

## Q4: What is Load Balancing?

### Answer

Load balancing distributes traffic across multiple servers.

### Benefits
- High availability
- Scalability
- Fault tolerance

### Types
- Round Robin
- Least Connections
- IP Hash

---

## Q5: What is SSL/TLS?

### Answer

SSL/TLS encrypts communication between:
- Browser
- Server

### Benefits
- Secure communication
- Data protection
- Authentication

### HTTPS uses TLS
Port:
```text
443
```

---

# Intermediate Web Server Questions

---

## Q6: How do you configure Nginx as Reverse Proxy?

### Answer

### Example Configuration
```nginx
server {
    listen 80;

    location / {
        proxy_pass http://localhost:8080;
    }
}
```

### Purpose
- Forward traffic
- Hide backend servers
- Improve scalability

---

## Q7: What is Virtual Hosting?

### Answer

Virtual hosting allows multiple websites on one server.

### Types
- Name-based
- IP-based

### Example
```nginx
server_name example.com;
```

---

## Q8: How do you secure a Web Server?

### Answer

### Best Practices
- Disable unused ports
- Enable HTTPS
- Use firewall
- Patch regularly
- Configure WAF

### Security Tools
- Fail2Ban
- ModSecurity
- SELinux

---

## Q9: What is a Web Application Firewall (WAF)?

### Answer

WAF protects applications from:
- SQL Injection
- XSS attacks
- CSRF attacks

### Examples
- AWS WAF
- ModSecurity
- Cloudflare WAF

---

## Q10: Difference between HTTP and HTTPS?

### Answer

| HTTP | HTTPS |
|---|---|
| Unencrypted | Encrypted |
| Port 80 | Port 443 |
| Less secure | More secure |

---

# Advanced Web Server Questions

---

## Q11: What is SSL Termination?

### Answer

SSL termination decrypts HTTPS traffic at:
- Load balancer
- Reverse proxy

### Benefit
Backend servers handle plain HTTP internally.

### Example
```text
Client HTTPS → Nginx → HTTP Backend
```

---

## Q12: What is Connection Timeout?

### Answer

Timeout defines how long server waits for:
- Client request
- Backend response

### Nginx Example
```nginx
proxy_read_timeout 60s;
```

---

## Q13: What is Sticky Session?

### Answer

Sticky session ensures:
- Same client
- Same backend server

### Useful For
- Session-based applications

---

## Q14: What is Rate Limiting?

### Answer

Rate limiting restricts:
- Number of requests
- Per client/IP

### Purpose
- Prevent DDoS
- API protection

### Example
```nginx
limit_req zone=api burst=10 nodelay;
```

---

## Q15: What is CDN?

### Answer

CDN (Content Delivery Network):
- Caches content globally
- Reduces latency

### Examples
- Cloudflare
- Akamai
- AWS CloudFront

---

# DevOps Scenario-Based Questions

---

# Scenario 1: Website Down in Production

## Question
Users report website is inaccessible. How do you troubleshoot?

### Answer

### Step 1: Check Web Server Status
```bash
systemctl status nginx
```

### Step 2: Check Port Listening
```bash
netstat -tulnp
```

### Step 3: Verify Logs
```bash
tail -f /var/log/nginx/error.log
```

### Step 4: Check Firewall
```bash
firewall-cmd --list-all
```

### Step 5: Check Backend Application

---

# Scenario 2: High CPU Usage on Nginx Server

## Question
Nginx server CPU usage suddenly reaches 100%.

### Answer

### Troubleshooting
```bash
top
htop
```

### Check Access Logs
```bash
tail -f /var/log/nginx/access.log
```

### Possible Causes
- DDoS attack
- Traffic spike
- Infinite redirects
- Large file requests

### Solutions
- Enable rate limiting
- Use CDN
- Add caching

---

# Scenario 3: SSL Certificate Expired

## Question
Users receive browser warning:
```text
SSL Certificate Expired
```

### Answer

### Verify Certificate
```bash
openssl s_client -connect domain.com:443
```

### Renew Certificate
```bash
certbot renew
```

### Restart Nginx
```bash
systemctl restart nginx
```

### Prevention
Automate renewal using cron jobs.

---

# Scenario 4: Reverse Proxy Returning 502 Bad Gateway

## Question
Nginx shows:
```text
502 Bad Gateway
```

### Answer

### Root Cause
Backend server unavailable.

### Troubleshooting
- Verify backend service
- Check application logs
- Verify proxy_pass target

### Check Backend
```bash
curl http://localhost:8080
```

### Restart Backend
```bash
systemctl restart app
```

---

# Scenario 5: Website Slow Performance

## Question
Website loads slowly during peak hours.

### Answer

### Check Metrics
- CPU
- Memory
- Disk I/O
- Network usage

### Optimization
- Enable caching
- Add load balancer
- Optimize database
- Use CDN

### Nginx Caching Example
```nginx
proxy_cache_path /tmp/cache levels=1:2 keys_zone=my_cache:10m;
```

---

# Scenario 6: Too Many Open Files Error

## Question
Web server logs show:
```text
Too many open files
```

### Answer

### Root Cause
File descriptor limit exceeded.

### Verify Limits
```bash
ulimit -n
```

### Increase Limits
```bash
/etc/security/limits.conf
```

### Example
```text
* soft nofile 65535
* hard nofile 65535
```

---

# Scenario 7: Web Server Disk Full

## Question
Production web server disk is 100% full.

### Answer

### Identify Large Files
```bash
du -sh /*
```

### Common Causes
- Log files
- Backups
- Cache files

### Cleanup Logs
```bash
journalctl --vacuum-time=7d
```

### Configure Log Rotation
```bash
logrotate
```

---

# Scenario 8: DDoS Attack on Web Server

## Question
Web server receives millions of requests causing outage.

### Answer

### Immediate Actions
- Enable rate limiting
- Block suspicious IPs
- Enable CDN/WAF

### Example
```nginx
limit_req_zone $binary_remote_addr zone=api:10m rate=5r/s;
```

### Long-Term Solutions
- Cloudflare
- AWS Shield
- Load balancing

---

# Scenario 9: Apache Service Not Starting

## Question
Apache service fails to start after configuration changes.

### Answer

### Validate Configuration
```bash
apachectl configtest
```

### Check Logs
```bash
journalctl -xe
```

### Common Causes
- Syntax error
- Port conflict
- Invalid modules

---

# Scenario 10: Multiple Applications on One Server

## Question
You need to host multiple applications on one server.

### Answer

### Solution
Use Virtual Hosts.

### Apache Example
```apache
<VirtualHost *:80>
    ServerName app1.example.com
</VirtualHost>
```

### Nginx Example
```nginx
server_name app1.example.com;
```

---

# Kubernetes & Web Server Questions

---

## Q16: How do you expose Nginx in Kubernetes?

### Answer

### Create Deployment
```bash
kubectl create deployment nginx --image=nginx
```

### Expose Service
```bash
kubectl expose deployment nginx --port=80 --type=LoadBalancer
```

---

## Q17: What is Ingress Controller?

### Answer

Ingress Controller manages:
- External traffic
- Routing
- SSL termination

### Popular Controllers
- Nginx Ingress
- Traefik
- HAProxy

---

# DevOps Best Practices for Web Servers (2026)

---

## Security
- Enable HTTPS
- Use WAF
- Disable unused ports
- Use RBAC

---

## Performance
- Enable caching
- Use CDN
- Compression (gzip/brotli)

---

## Monitoring
Tools:
- Prometheus
- Grafana
- ELK Stack

---

## Automation
- Infrastructure as Code
- CI/CD deployment
- Automated SSL renewal

---

# Important Commands

## Nginx
```bash
nginx -t
systemctl restart nginx
systemctl status nginx
```

---

## Apache
```bash
apachectl configtest
systemctl restart httpd
```

---

## Network
```bash
netstat -tulnp
ss -tulnp
curl localhost
```

---



## 🟢 Basic Scenarios

### [Webserver Setup](ca://s?q=DevOps_webserver_setup_scenario)
**Scenario:** You are asked to set up a simple Apache/Nginx webserver using Docker.  
**Answer:**  
- Write a `Dockerfile` with `FROM nginx:latest`.  
- Copy `index.html` into `/usr/share/nginx/html`.  
- Run container: `docker run -d -p 8080:80 nginx-webserver`.  
**Key Point:** Demonstrates containerized webserver basics.

---

### [Port Binding](ca://s?q=DevOps_webserver_port_binding_scenario)
**Scenario:** The webserver runs but is inaccessible externally.  
**Answer:**  
- Verify port mapping (`docker ps`).  
- Ensure firewall rules allow traffic.  
- Correct run command: `docker run -d -p 80:80 nginx`.  

---

## 🟡 Intermediate Scenarios

### [Configuration Management](ca://s?q=DevOps_webserver_configuration_management_scenario)
**Scenario:** You need to deploy a webserver with custom configs across multiple environments.  
**Answer:**  
- Use Ansible playbooks to manage configs.  
- Store environment-specific variables in `group_vars`.  
- Apply idempotent tasks for consistent deployment.  

---

### [CI/CD Integration](ca://s?q=DevOps_webserver_CI_CD_scenario)
**Scenario:** Automate webserver deployment via Jenkins pipeline.  
**Answer:**  
- Pipeline stages: Build → Test → Dockerize → Push → Deploy.  
- Use Jenkinsfile with Docker plugin.  
- Deploy to staging before production.  

---

### [Scaling Webserver](ca://s?q=DevOps_webserver_scaling_scenario)
**Scenario:** Traffic spikes require scaling webserver instances.  
**Answer:**  
- Use Docker Compose: `docker-compose up --scale web=3`.  
- Or deploy via Kubernetes with ReplicaSets.  
- Load balance using Nginx or Kubernetes Service.  

---

## 🔴 Advanced Scenarios

### [Zero-Downtime Deployment](ca://s?q=DevOps_webserver_zero_downtime_scenario)
**Scenario:** Deploy new webserver version without downtime.  
**Answer:**  
- Use Blue-Green deployment strategy.  
- Route traffic via load balancer.  
- Switch traffic after health checks pass.  

---

### [Security Hardening](ca://s?q=DevOps_webserver_security_scenario)
**Scenario:** Secure a production webserver container.  
**Answer:**  
- Run as non-root user.  
- Scan images with Trivy.  
- Apply TLS certificates.  
- Store secrets in Vault/Kubernetes Secrets.  

---

### [Monitoring & Logging](ca://s?q=DevOps_webserver_monitoring_scenario)
**Scenario:** Webserver performance degrades under load.  
**Answer:**  
- Use Prometheus + Grafana for metrics.  
- Collect logs with ELK/EFK stack.  
- Configure alerts for CPU/memory thresholds.  

---

### [Disaster Recovery](ca://s?q=DevOps_webserver_disaster_recovery_scenario)
**Scenario:** Webserver crashes due to corrupted configs.  
**Answer:**  
- Rollback to previous stable image.  
- Restore configs from GitOps repository.  
- Automate recovery with Infrastructure as Code.  

---

