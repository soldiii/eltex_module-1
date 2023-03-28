#!/bin/bash

systemd_pid=$(pgrep systemd)

ps aux --ppid $systemd_pid | grep -v "ps aux --ppid $systemd_pid"
