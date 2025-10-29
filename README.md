##  CyberSec monitoring stack – ELK + Beats

A hands-on, Docker-based Security Operations Center (SOC) lab environment built for learning and showcasing threat detection, log analysis, and alert engineering.

This project simulates a real-world logging pipeline using Elastic Stack, Auditbeat, Filebeat, and a Fake Logger, providing visibility into endpoint behavior and attacker activity.


### Purpose
This project was built to:





# cybersec-docker
# cybersec-docker

Cybersec-Docker — a ready-to-run, Docker Compose based sandbox for security testing, detection development, and incident response practice.

This repository provides a self-contained ELK pipeline (Elasticsearch + Kibana) with preconfigured Beats (Auditbeat and Filebeat) and helper scripts to simulate attacker activity and collect host and file telemetry. It's intended for learners, detection engineers, and incident responders who want a disposable environment to build and test detection rules and playbooks.

## Highlights

- Local ELK stack (Elasticsearch + Kibana) orchestrated via `docker-compose.yml`.
- Preconfigured `auditbeat` and `filebeat` configurations to capture host audit events and logs.
- `simulate-attacks.sh` to generate reproducible, attack-like activity for testing detections.
- Logs collected under the `logs/` directory for offline analysis.

## Quick start

1. Start the stack

```bash
git clone https://github.com/dhamsey3/cybersec-docker.git
cd cybersec-docker
docker compose up -d
```

2. Run simulated activity (optional)

```bash
./simulate-attacks.sh
```

3. Open Kibana in your browser:

```
http://localhost:5601
```

Adjust ports and configuration in `docker-compose.yml`, `auditbeat/`, and `filebeat/` as needed.

## How it works (high level)

Auditbeat and Filebeat run as containers in the Compose stack and forward events to Elasticsearch. Kibana connects to Elasticsearch and provides dashboards and search/explore capabilities. The `simulate-attacks.sh` script generates sample events (new users, suspicious commands, file changes) which are picked up by the Beats and indexed for analysis.

Simple flow:

```
Simulated activity -> Auditbeat/Filebeat -> Elasticsearch -> Kibana (visualize & alert)
```

## Files and configuration

- `docker-compose.yml` — service definitions for Elasticsearch, Kibana, Beats, and helpers.
- `auditbeat/` — Auditbeat configuration files.
- `filebeat/` — Filebeat configuration files.
- `elastic/`, `kibana/` — example service configs used by the Compose stack.
- `simulate-attacks.sh` — small script to generate attack-like activity for detection testing.
- `logs/` — collected logs and artifacts for offline analysis.

## Suggested detection ideas

- Alert on creation of new users
- Alert on execution of suspicious tooling (e.g., `nc`, `nmap`, scripts in `/tmp`)
- Notify on changes to critical files (e.g., `/etc/passwd`, `/etc/shadow`)
- Detect unexpected processes spawning from network-facing services

## Features

- ELK stack ready for local testing
- Auditbeat and Filebeat pre-configured for host telemetry
- Simple simulated attack generation
- Offline logs stored under `logs/` for analysis and sharing

## Try it

Start the stack and run a simulation, then open Kibana:

```bash
docker compose up -d
./simulate-attacks.sh
# open http://localhost:5601
```

---

Maintainer: dhamsey3


![Discover](images/kibana-1.png)

![Dashboard](images/kibana-2.png)

![Alert](images/kibana-3.png)



