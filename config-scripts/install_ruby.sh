#!/bin/bash

apt update; apt install -y ruby-full ruby-bundler build-essential git wget

echo $(ruby -v)
echo $(bundler -v)
