#!/usr/bin/env perl
use warnings;
use strict;

my @packages = qw( libqtxdg liblxqt liblxqt-mount lxqt-globalkeys lxqt-notificationd libsysstat

                   lxqt-panel pcmanfm-qt lxqt-session lxqt-runner lxqt-qtplugin lxqt-appswitcher
                   lxqt-policykit lxqt-openssh-askpass lxqt-power lxqt-powermanagement lximage-qt
                   lxqt-config lxinput-qt lxqt-config-randr obconf-qt compton-conf lxqt-about
                   lxqt-lightdm-greeter

                   lxqt-common
                );

foreach my $package (@packages) {
    chdir ($package) or die "Unable to chdir to $package: $!";
    chomp(my $pwd = `pwd`);
    print "[in $pwd]\n";
    my $command = "rm -rf ${package}/ ${package}*.xz pkg src";
    print "=> $command\n"; system($command);
    chdir ("..") or die "Unable to chdir ..: $!";
}

__END__
pcmanfm-qt
