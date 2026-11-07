# Calendar (course shell)

A PHP based calendar system for course management: the course website and calendar are
built from directories of class material (`class/`, `lab/`, `exam/`, ...), and files are
released to students on a schedule.

This repository is the **course shell**: a sample course (`calendar.php`, `home.html`,
`class/`, `lab/`, ...) with the calendar software in `calendar-core/` (a submodule) and the
`calendar -> calendar-core/` link. The software is now **Cal5**
([jskenney/calendar2](https://github.com/jskenney/calendar2)), the successor of Calendar v4
([calendar-core](https://github.com/jskenney/calendar-core)). Cal5 reads this sample's v4
`calendar.php` unchanged.

Cal5 needs PHP 8.3 or later.

## A new course

The easiest way is Cal5's installer, which asks a few questions and writes a ready course
(with a `calendar.ini.php` configuration, a random secret and a hashed password):

```
mkdir SI110
cd SI110
wget https://raw.githubusercontent.com/jskenney/calendar2/main/installer.sh
bash installer.sh
```

## Starting from this shell

```
git clone --recursive https://github.com/jskenney/calendar.git SI110
cd SI110
rm -rf .git .gitmodules
```

Then edit `calendar.php`: set `$ADMIN` to your own password and `$SECRET` to a long random
value (the calendar shows no content while `$SECRET` has the sample value):

```
php -r 'echo bin2hex(random_bytes(32));'
php calendar/bin/cal5 check
```

Put the directory under a PHP capable web server and open it in a browser.

## Moving an existing v4 course to Cal5

A v4 course switches by replacing its `calendar-core/` (keep the old one to roll back):

```
cd SI110
mv calendar-core calendar-core-v4
git clone https://github.com/jskenney/calendar2.git calendar-core
```

Before switching, check the course with a Cal5 clone anywhere; `compare` serves the course
with v4 and with Cal5 side by side and lists any difference (the course is not changed):

```
git clone https://github.com/jskenney/calendar2.git /tmp/cal5
cd SI110
php /tmp/cal5/bin/cal5 compare
```

The full guide, including submodule courses and rolling back:
[docs/migration.md](https://github.com/jskenney/calendar2/blob/main/docs/migration.md).

## Updating

```
cd calendar-core
git checkout main      # once, after cloning this shell (the submodule starts on a fixed commit)
git pull
```

(For a course that keeps the submodule: `git submodule update --remote calendar-core`.)
Reload PHP afterwards (`sudo systemctl reload php8.3-fpm`), so the new code is used right away.
