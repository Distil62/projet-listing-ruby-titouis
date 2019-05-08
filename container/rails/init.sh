#!/bin/bash

cd /project
bundle install && rails server -b 127.0.0.1 -p 3000 -e production
