App::Fix::term
==============

Table of Contents
-----------------

  * [NAME](#name)

  * [AUTHOR](#author)

  * [VERSION](#version)

  * [TITLE](#title)

  * [SUBTITLE](#subtitle)

  * [COPYRIGHT](#copyright)

  * [Introduction](#introduction)

    * [Motivation](#motivation)

  * [Fix](#fix)

NAME
====

App::fix 

AUTHOR
======

Francis Grizzly Smit (grizzly@smit.id.au)

VERSION
=======

v0.1.1

TITLE
=====

App::fix

SUBTITLE
========

A Raku program to fix borked (broken) terminals.

COPYRIGHT
=========

GPL V3.0+ [LICENSE](https://github.com/grizzlysmit/Usage-Utils/blob/main/LICENSE)

[Top of Document](#table-of-contents)

Introduction
============

This is a Raku program to fix broken (i.e. borked) terminals. 

Motivation
----------

Sometimes I exit a program nastily and I end up with a borked (broken) terminal fore example I **`^C`** out of raku command line repl and I can no longer see what I am typing. solution run fix i.e. fix.raku and everything just clears up.

So put fix in your **`PATH`** and type **fix** and the borked terminal should come good.

### Fix

```bash
fix --help
Usage:
  fix
```

```raku
use Terminal::ANSI::OO :t;
use Term::termios;

multi sub MAIN( --> Int:D) {
    my $flags := Term::termios.new(:fd($*IN.native-descriptor)).getattr;
    $flags.set_lflags('ICANON');
    $flags.set_lflags('ECHO');
    $flags.setattr(:NOW);
    print t.show-cursor ~ t.restore-screen ~ t.clear-screen;
    exit 0;
}
```

