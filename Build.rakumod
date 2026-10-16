class Build {
    method build($dist-path) {
        # do build stuff to your module
        # which is located at $dist-path
        dd %?RESOURCES;
        my IO::Path $CWD = $*CWD;
        my Str:D $path = "/usr/lib/perl6/site/bin";
        chdir($path.IO);
        my Proc $r = run 'ln', '-s', "fix.raku",              "fix"               unless "fix".IO              ~~ :e;
        $r = run         'ln', '-s', "fix.raku-j",            "fix-j"             unless "fix-j".IO            ~~ :e;
        $r = run         'ln', '-s', "fix.raku-js",           "fix-js"            unless "fix-js".IO           ~~ :e;
        $r = run         'ln', '-s', "fix.raku-m",            "fix-m"             unless "fix-m".IO            ~~ :e;
        chdir("/usr/local/bin/".IO);
        $r = run         'ln', '-s', "$path/fix.raku",        "fix.raku"          unless "fix.raku".IO         ~~ :e;
        $r = run         'ln', '-s', "$path/fix.raku-j",      "fix.raku-j"        unless "fix.raku-j".IO       ~~ :e;
        $r = run         'ln', '-s', "$path/fix.raku-js",     "fix.raku-js"       unless "fix.raku-js".IO      ~~ :e;
        $r = run         'ln', '-s', "$path/fix.raku-m",      "fix.raku-m"        unless "fix.raku-m".IO       ~~ :e;
        $r = run         'ln', '-s', "$path/fix",             "fix"               unless "fix".IO              ~~ :e;
        $r = run         'ln', '-s', "$path/fix-j",           "fix-j"             unless "fix-j".IO            ~~ :e;
        $r = run         'ln', '-s', "$path/fix-js",          "fix-js"            unless "fix-js".IO           ~~ :e;
        $r = run         'ln', '-s', "$path/fix-m",           "fix-m"             unless "fix-m".IO            ~~ :e;
        chdir($CWD);
    }
}
