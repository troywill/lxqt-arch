#!/usr/bin/env perl
use warnings;
use strict;

my @packages = qw( libqtxdg liblxqt liblxqt-mount lxqt-globalkeys lxqt-notificationd libsysstat
                   lxqt-panel pcmanfm-qt lxqt-session lxqt-runner lxqt-qtplugin
                   lxqt-common
                );

foreach my $package (@packages) {
    chdir ($package) or die "Unable to chdir: $!";
    chomp(my $pwd = `pwd`);
    print "[in $pwd]\n";
    my $command = "rm -rf ${package}* pkg src";
    print "=> $command\n"; system($command);
    chdir ("..") or die "Unable to chdir ..: $!";
}

__END__
pcmanfm-qt
