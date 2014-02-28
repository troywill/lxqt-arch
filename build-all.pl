#!/usr/bin/env perl
use warnings;
use strict;
use File::Copy qw(copy move);

my @packages = qw( libqtxdg liblxqt liblxqt-mount lxqt-globalkeys lxqt-notificationd libsysstat

                   lxqt-panel pcmanfm-qt lxqt-session lxqt-runner lxqt-qtplugin lxqt-appswitcher
                   lxqt-policykit lxqt-openssh-askpass lxqt-power lxqt-powermanagement lximage-qt
                   lxqt-config

                   lxqt-common
                );

copy "log/build.txt", "log/build.txt.old";

open(my $logfile, ">", "log/build.txt") 
      or die "cannot open > log/build.txt: $!";

foreach my $package (@packages) {
    chdir ($package) or die "Unable to chdir: $!";
    chomp(my $pwd = `pwd`);
    print "[in $pwd]\n";
    copy "PKGBUILD", "PKGBUILD.bak" or die "Unable to copy: $!";
    my $command = "makepkg --syncdeps";
    print "=> $command\n"; system($command);
    move "PKGBUILD.bak", "PKGBUILD" or die "Unable to move: $!";
    chomp(my $package_built = `find *.xz`);
    copy $package_built, "../packages/";
    print $logfile "$package_built\n";
    chdir ("..") or die "Unable to chdir ..: $!";
}

__END__

pcmanfm-qt
