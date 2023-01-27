#!/bin/bash

apt update; apt install -y ruby-full ruby-bundler build-essential

echo $(ruby -v)
echo $(bundler -v)
