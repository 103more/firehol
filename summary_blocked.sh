#! /bin/bash

echo "[Today]"
grep 'DROP(.*)' /var/log/syslog | cut -d']' -f2 | cut -d' ' -f2 | cut -d':' -f1 | sort | uniq -c
echo "[Yesterday]"
grep 'DROP(.*)' /var/log/syslog.1 | cut -d']' -f2 | cut -d' ' -f2 | cut -d':' -f1 | sort | uniq -c
