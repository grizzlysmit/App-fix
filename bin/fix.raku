#!/usr/bin/env raku

use v6;
use Terminal::ANSI::OO :t;
use Term::termios;

=begin pod

=head1 App::Fix::term

=begin head2

Table of  Contents

=end head2

=item1 L<NAME|#name>
=item1 L<AUTHOR|#author>
=item1 L<VERSION|#version>
=item1 L<TITLE|#title>
=item1 L<SUBTITLE|#subtitle>
=item1 L<COPYRIGHT|#copyright>
=item1 L<Introduction|#introduction>
=item2 L<Motivation|#motivation>
=item1 L<Fix|#fix>


=NAME App::fix 
=AUTHOR Francis Grizzly Smit (grizzly@smit.id.au)
=VERSION v0.1.1
=TITLE App::fix
=SUBTITLE A Raku program to fix borked (broken) terminals.

=COPYRIGHT
GPL V3.0+ L<LICENSE|https://github.com/grizzlysmit/Usage-Utils/blob/main/LICENSE>

L<Top of Document|#table-of-contents>

=head1 Introduction

This is a Raku program to fix broken (i.e. borked) terminals. 

=head2 Motivation

Sometimes I exit a program nastily and I end up with a borked (broken) terminal 
like is I B<C<^C>> out of raku command line repl and I can no longer see what I am
typing. solution run fix i.e. fix.raku and everything just clears up.

So put fix in your B<C<PATH>> and type B<fix> and the borked terminal should come good.

=head3 Fix

=begin code :lang<bash>

fix --help
Usage:
  fix

=end code

=begin code :lang<raku>

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

=end code


=end pod

multi sub MAIN( --> Int:D) {
    my $flags := Term::termios.new(:fd($*IN.native-descriptor)).getattr;
    $flags.set_lflags('ICANON');
    $flags.set_lflags('ECHO');
    $flags.setattr(:NOW);
    print t.show-cursor ~ t.restore-screen ~ t.clear-screen;
    exit 0;
}
