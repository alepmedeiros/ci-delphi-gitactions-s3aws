#!/bin/sh -l

echo "Hello teste 2$1"
time=$(date)
echo "::set-output name=time::$time"
