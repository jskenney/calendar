# Calendar version 4
Cal4 is a PHP Based Calendar System for Course Management that allows an instructor to post course material in a simple and automated fashion.

# Installation Instructions
This repository (calendar) is only the shell with the configuration file and examples that are useful as an initial install, the real calendar system exists in the calendar-core repository.  To install, run the following from the command line (assuming that your course is named XX123):

```
git clone https://github.com/jskenney/calendar.git
mv calendar XX123
cd XX123
rm -rf .git .gitmodules calendar-core
git clone --recursive https://github.com/jskenney/calendar-core.git
```

At this point, and assuming you cloned into a directory within a PHP capable webserver, you should be able to go to the XX123 directory on your webserver.  To update the software in the future just perform a pull from within the calendar-core directory.

# Updating files
Within the calendar-core directory, run the following command to update the calendar core
```
git pull --recurse-submodules
```
