                              
---
# 100 Scenario-Based Prometheus & Grafana Interview Questions and Answers

# 1. Prometheus Server Suddenly Stops Collecting Metrics

## Scenario
Prometheus UI is accessible, but no new metrics are being collected.

## Answer
Possible causes:
- Target application is down
- Exporter stopped
- Network issue
- Wrong scrape configuration
- Firewall blocking traffic

### Troubleshooting Steps
```bash
systemctl status prometheus
```

Check targets:
```text
http://<prometheus-ip>:9090/targets
```

Validate config:
```bash
promtool check config prometheus.yml
```

---

# 2. Node Exporter is DOWN

## Scenario
Linux server metrics are missing in Grafana.

## Answer
Possible causes:
- node_exporter service stopped
- Port 9100 blocked
- Wrong target IP

### Verify Service
```bash
systemctl status node_exporter
```

### Verify Port
```bash
netstat -tulnp | grep 9100
```

### Fix Firewall
```bash
sudo ufw allow 9100
```

---

# 3. Grafana Dashboard Not Loading

## Scenario
Grafana UI opens slowly or dashboards fail to load.

## Answer
Possible causes:
- Heavy PromQL queries
- Database latency
- Insufficient Grafana resources

### Solution
- Optimize queries
- Increase Grafana memory
- Use recording rules

---

# 4. Prometheus Consuming High Memory

## Scenario
Prometheus server memory usage crosses 90%.

## Answer
Possible causes:
- High cardinality metrics
- Large retention period
- Too many scrape targets

### Solutions
- Reduce retention:
```bash
--storage.tsdb.retention.time=15d
```

- Drop unnecessary labels
- Use federation

---

# 5. Alertmanager Not Sending Emails

## Scenario
Alerts trigger in Prometheus but emails are not received.

## Answer
Check:
- SMTP configuration
- Firewall
- Email credentials

### Validate Config
```bash
amtool check-config alertmanager.yml
```

---

# 6. Kubernetes Pods Not Visible in Grafana

## Scenario
Grafana dashboard shows no Kubernetes pod metrics.

## Answer
Possible causes:
- kube-state-metrics missing
- Prometheus RBAC issue
- Wrong datasource

### Verify
```bash
kubectl get pods -n monitoring
```

---

# 7. PromQL Query is Too Slow

## Scenario
Dashboard takes several seconds to load.

## Answer
Heavy range queries may cause delays.

### Bad Query
```promql
rate(http_requests_total[30d])
```

### Better Query
```promql
rate(http_requests_total[5m])
```

Use recording rules for optimization.

---

# 8. Prometheus Disk Space Full

## Scenario
Prometheus crashes because disk is full.

## Answer
TSDB storage consumed all space.

### Fix
Reduce retention:
```bash
--storage.tsdb.retention.size=20GB
```

Delete old blocks carefully.

---

# 9. Exporter Running But Metrics Missing

## Scenario
Exporter endpoint works but Prometheus shows DOWN.

## Answer
Check scrape configuration.

### Example
```yaml
scrape_configs:
  - job_name: node
    static_configs:
      - targets:
        - 192.168.1.10:9100
```

---

# 10. Grafana Shows “No Data”

## Scenario
Dashboard panels display “No Data”.

## Answer
Possible causes:
- Wrong datasource
- Incorrect PromQL query
- Time range mismatch

### Verify
```promql
up
```

---

# 11. CPU Usage Alert Keeps Flapping

## Scenario
CPU alert continuously triggers and resolves.

## Answer
Use `for` condition.

### Example
```yaml
for: 5m
```

---

# 12. Blackbox Exporter Website Probe Fails

## Scenario
Website monitoring alert triggered.

## Answer
Check:
- DNS
- SSL certificate
- Firewall
- Endpoint availability

### Test
```bash
curl https://example.com
```

---

# 13. Grafana Login Fails After Upgrade

## Scenario
Users cannot login after Grafana update.

## Answer
Possible causes:
- Database migration issue
- LDAP issue
- Corrupted config

### Check Logs
```bash
journalctl -u grafana-server
```

---

# 14. Prometheus Target Intermittently DOWN

## Scenario
Target alternates between UP and DOWN.

## Answer
Possible causes:
- Network instability
- Slow exporter response
- Timeout issue

### Increase Timeout
```yaml
scrape_timeout: 15s
```

---

# 15. Kubernetes Node Metrics Missing

## Scenario
Node CPU and memory metrics unavailable.

## Answer
Check:
- node-exporter daemonset
- kubelet metrics
- RBAC permissions

---

# 16. Alertmanager Duplicate Alerts

## Scenario
Same alert received multiple times.

## Answer
Possible causes:
- Multiple Alertmanager instances
- Incorrect grouping

### Configure Grouping
```yaml
group_by: ['alertname']
```

---

# 17. Docker Container Metrics Missing

## Scenario
Grafana cannot display container metrics.

## Answer
Ensure cAdvisor is running.

### Verify
```bash
docker ps | grep cadvisor
```

---

# 18. Prometheus Restart Loop

## Scenario
Prometheus keeps restarting.

## Answer
Possible causes:
- Invalid YAML
- Insufficient memory
- Corrupted TSDB

### Validate
```bash
promtool check config prometheus.yml
```

---

# 19. Grafana Alert Not Triggering

## Scenario
Panel shows high CPU but no alert generated.

## Answer
Check:
- Alert rule evaluation
- Query logic
- Notification channel

---

# 20. SSL Certificate Expired Monitoring

## Scenario
Need alert before SSL certificate expiry.

## Answer
Use Blackbox Exporter.

### Query
```promql
probe_ssl_earliest_cert_expiry
```

---

# 21. Prometheus Cannot Scrape HTTPS Endpoint

## Answer
Add TLS configuration:
```yaml
tls_config:
  insecure_skip_verify: true
```

---

# 22. High Cardinality Metrics Issue

## Scenario
Prometheus performance degrades.

## Answer
Avoid dynamic labels like:
```text
user_id
session_id
request_id
```

---

# 23. Grafana Dashboard Variables Not Working

## Answer
Check variable query syntax and datasource connection.

---

# 24. Prometheus Query Returns Empty Result

## Answer
Verify:
- Metric name
- Time range
- Labels

---

# 25. Monitoring Multiple Kubernetes Clusters

## Answer
Use:
- Federation
- Thanos
- Cortex

---

# 26. Prometheus Time Drift Issue

## Answer
Sync NTP on all servers.

```bash
timedatectl status
```

---

# 27. Alert Fatigue Problem

## Answer
Reduce noisy alerts using:
- Threshold tuning
- Alert grouping
- Silence rules

---

# 28. Grafana High CPU Usage

## Answer
Possible causes:
- Too many dashboards
- Expensive queries
- High refresh interval

---

# 29. Missing Metrics After Pod Restart

## Answer
Prometheus uses pull model.
Ensure pod labels remain consistent.

---

# 30. Prometheus Data Loss After Restart

## Answer
Use persistent volume.

### Kubernetes Example
```yaml
persistentVolumeClaim:
```

---

# 31. Grafana Datasource Connection Refused

## Answer
Check:
```bash
curl http://prometheus:9090
```

---

# 32. Monitoring AWS EC2 Instances

## Answer
Install Node Exporter on EC2.

---

# 33. Monitoring RDS Database

## Answer
Use mysqld_exporter or postgres_exporter.

---

# 34. Kubernetes API Server Metrics Missing

## Answer
Check kube-prometheus-stack RBAC.

---

# 35. Alertmanager Slack Notifications Failing

## Answer
Verify webhook URL.

---

# 36. Prometheus WAL Corruption

## Answer
Delete corrupted WAL carefully.

---

# 37. Grafana Anonymous Access Security Risk

## Answer
Disable anonymous access.

```ini
[auth.anonymous]
enabled = false
```

---

# 38. Monitoring Microservices Architecture

## Answer
Use:
- Service discovery
- Labels
- Distributed tracing

---

# 39. Prometheus Cannot Handle Large Scale

## Answer
Use:
- Thanos
- Cortex
- VictoriaMetrics

---

# 40. Pod CrashLoopBackOff Alert

## Answer
Query:
```promql
kube_pod_container_status_restarts_total
```

---

# 41. Kubernetes Namespace Monitoring

## Answer
Use namespace labels in PromQL.

---

# 42. Grafana Dashboard Export/Import Problem

## Answer
Check JSON compatibility.

---

# 43. Prometheus Federation Use Case

## Answer
Centralized monitoring across environments.

---

# 44. Memory Leak Detection Using Grafana

## Answer
Monitor increasing memory trends.

---

# 45. Monitoring JVM Applications

## Answer
Use JMX Exporter.

---

# 46. Monitoring NGINX Metrics

## Answer
Use nginx-prometheus-exporter.

---

# 47. Monitoring Apache Metrics

## Answer
Use apache_exporter.

---

# 48. Prometheus Scrape Timeout Error

## Answer
Increase timeout value.

---

# 49. Monitoring Redis

## Answer
Use redis_exporter.

---

# 50. Monitoring MySQL

## Answer
Use mysqld_exporter.

---

# 51. Monitoring PostgreSQL

## Answer
Use postgres_exporter.

---

# 52. Monitoring Kafka

## Answer
Use kafka_exporter.

---

# 53. Monitoring RabbitMQ

## Answer
Use rabbitmq_exporter.

---

# 54. Kubernetes Cluster Autoscaling Metrics

## Answer
Use kube-state-metrics.

---

# 55. Grafana LDAP Authentication Failing

## Answer
Verify LDAP server configuration.

---

# 56. Monitoring Windows Servers

## Answer
Use windows_exporter.

---

# 57. High Network Latency Alert

## Answer
Use Blackbox Exporter ICMP probe.

---

# 58. Monitoring Disk IOPS

## Answer
Use node_exporter disk metrics.

---

# 59. Monitoring File System Usage

## Answer
Query:
```promql
node_filesystem_avail_bytes
```

---

# 60. Monitoring API Response Time

## Answer
Use histogram metrics.

---

# 61. Kubernetes Pod Memory Leak

## Answer
Monitor:
```promql
container_memory_usage_bytes
```

---

# 62. Monitoring SSL Expiry

## Answer
Blackbox exporter SSL probe.

---

# 63. Prometheus Upgrade Failure

## Answer
Backup TSDB before upgrade.

---

# 64. Grafana Plugin Compatibility Issue

## Answer
Verify Grafana version compatibility.

---

# 65. Service Discovery Not Working

## Answer
Check Kubernetes API permissions.

---

# 66. Monitoring CI/CD Pipeline

## Answer
Integrate Jenkins exporter.

---

# 67. Alert Notification Delay

## Answer
Reduce evaluation interval.

---

# 68. High Scrape Duration

## Answer
Reduce exporter metrics count.

---

# 69. Prometheus OOMKilled

## Answer
Increase memory limit.

---

# 70. Monitoring HAProxy

## Answer
Use haproxy_exporter.

---

# 71. Monitoring Linux Load Average

## Answer
Use node_load1 metric.

---

# 72. Grafana Dashboard Corrupted

## Answer
Restore dashboard JSON backup.

---

# 73. Multi-Tenant Monitoring

## Answer
Use Cortex or Thanos.

---

# 74. Prometheus Configuration Reload Failed

## Answer
Check YAML indentation.

---

# 75. Kubernetes ServiceMonitor Not Working

## Answer
Verify labels match selector.

---

# 76. Monitoring Elasticsearch

## Answer
Use elasticsearch_exporter.

---

# 77. Monitoring MongoDB

## Answer
Use mongodb_exporter.

---

# 78. Alertmanager Silence Not Working

## Answer
Verify matcher labels.

---

# 79. Prometheus Target Labels Missing

## Answer
Check relabel_configs.

---

# 80. Monitoring Custom Application Metrics

## Answer
Use Prometheus client libraries.

---

# 81. Grafana Alert Notification Spam

## Answer
Use alert grouping.

---

# 82. Prometheus Slow Startup

## Answer
Large TSDB recovery time.

---

# 83. Monitoring Hybrid Cloud

## Answer
Use federation architecture.

---

# 84. Grafana API Authentication Issue

## Answer
Verify API token permissions.

---

# 85. Monitoring Disk Latency

## Answer
Use node_disk_* metrics.

---

# 86. Kubernetes Persistent Volume Monitoring

## Answer
Monitor PVC usage metrics.

---

# 87. Monitoring Azure VMs

## Answer
Install exporters on Azure instances.

---

# 88. Monitoring GCP Compute Engine

## Answer
Use Node Exporter.

---

# 89. Prometheus Rules Not Loading

## Answer
Validate rules:
```bash
promtool check rules rules.yml
```

---

# 90. Grafana Timezone Issue

## Answer
Configure dashboard timezone settings.

---

# 91. Kubernetes API Rate Limit Issue

## Answer
Reduce scrape frequency.

---

# 92. Monitoring HA Kubernetes Control Plane

## Answer
Monitor all master nodes individually.

---

# 93. Prometheus Retention Policy Planning

## Answer
Balance storage vs retention needs.

---

# 94. Monitoring Server Temperature

## Answer
Use hardware exporter sensors.

---

# 95. Missing Container Labels

## Answer
Verify cAdvisor metadata.

---

# 96. Monitoring Application Error Rate

## Answer
Track HTTP 5xx metrics.

---

# 97. Prometheus Cannot Resolve DNS

## Answer
Check DNS configuration.

---

# 98. Monitoring SSL Handshake Failures

## Answer
Use Blackbox exporter probe metrics.

---

# 99. Grafana Dashboard Permissions Problem

## Answer
Assign proper team roles.

---

# 100. Full Monitoring Stack Design Scenario

## Scenario
Design monitoring for:
- Kubernetes
- Linux servers
- Applications
- Databases
- Cloud infrastructure

## Answer
Recommended Stack:
```text
Node Exporter → Prometheus → Alertmanager → Grafana
cAdvisor      → Prometheus → Grafana
kube-state    → Prometheus → Grafana
Blackbox      → Prometheus → Alerts
```
---
#1: Prometheus server down
Check logs: journalctl -u prometheus

Validate config file with promtool check config.

#2: Missing metrics
Verify exporter is running.

Check target status in Prometheus UI.

#3: High memory usage in Prometheus
Reduce metric cardinality.

Use recording rules.

Enable remote write.

#4: Alert not triggering
Validate alert rule syntax.

Check Alertmanager routing.

#5: Grafana dashboard not loading
Check Grafana service status.

Verify DB connection.

#6: Slow Prom#L queries
Use recording rules.

Avoid regex-heavy queries.

#7: Node exporter not reachable
Check firewall rules.

Validate endpoint /metrics.

#8: Multi-cluster monitoring
Use federation or Thanos.

#9: SSL/TLS setup issues
Verify certificates.

Check Prometheus/Grafana config.

#10: Disk space issues in TSDB
Enable retention policies.

Use remote storage.
