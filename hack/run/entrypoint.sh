#!/usr/bin/env bash

if [ "$1" = "bash" -o "$1" = "sh" -o "$1" = "ash" ]; then
    exec /bin/bash
else
    exec /opt/go/auxpi "$@"
fi