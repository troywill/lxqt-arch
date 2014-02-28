#!/usr/bin/env perl
use warnings;
use strict;
use File::Copy qw(copy move);


copy "build-log.txt", "build-log.old.txt";

open(my $logfile, ">", "build-log.txt") 
      or die "cannot open > build-log.txt: $!";

copy "PKGBUILD", "PKGBUILD.bak" or die "Unable to copy: $!";

my $command = "makepkg --syncdeps";
print "=> $command\n"; system($command);
move "PKGBUILD.bak", "PKGBUILD" or die "Unable to move: $!";

chomp(my $package_built = `find *.xz`);
print $logfile "$package_built\n";
