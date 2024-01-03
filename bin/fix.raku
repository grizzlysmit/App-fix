#!/usr/bin/env raku

use v6;
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
