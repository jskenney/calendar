#!/bin/bash

find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
find . -type f -name "*.sh" -exec chmod 755 {} \;
find . -type f -name "*.cgi" -exec chmod 755 {} \;

find exam -type f -exec chmod 600 {} \;
find exam -type f -name "*.txt" -exec chmod 644 {} \;

find . -type f -name ".htaccess" -exec chmod 644 {} \;

chmod 700 .git
