#!/bin/bash

echo "🔐 Simulating failed SSH login..."
echo "sshd[2345]: Failed password for root from 192.168.1.101 port 22 ssh2" >> /var/log/auth.log
sleep 1

echo "👑 Simulating privilege escalation (sudoer modification)..."
echo "user john added to /etc/sudoers" >> /var/log/auth.log
sleep 1

echo "🦠 Simulating malware detection (file with suspicious name)..."
touch /tmp/malicious_mimikatz_dump.exe
sleep 1

echo "✅ Attack simulation completed."
