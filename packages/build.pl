#!/usr/bin/env perl
use warnings;
use strict;
use File::Copy qw(copy move);


copy "build-log.txt", "build-log.old.txt";

copy "PKGBUILD", "PKGBUILD.bak" or die "Unable to copy: $!";

my $command = "makepkg --syncdeps";
print "=> $command\n"; system($command);
copy "PKGBUILD.bak", "PKGBUILD" or die "Unable to move: $!";

chomp(my $package_built = `find *.xz`);
