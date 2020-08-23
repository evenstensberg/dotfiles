#!/usr/bin/env bash


sudo lsof -i :3000 | awk '{print $2}' | grep -v "PID" | xargs -I{} kill {} -9