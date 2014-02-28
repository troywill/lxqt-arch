#!/usr/bin/env perl
use warnings;
use strict;

my @packages = qw( libqtxdg liblxqt liblxqt-mount lxqt-globalkeys lxqt-notificationd libsysstat
                   lxqt-panel lxqt-session
                   lxqt-common
                );

open(my $logfile, ">", "log/build.txt") 
      or die "cannot open > log/build.txt: $!";

foreach my $package (@packages) {
    chdir ($package) or die "Unable to chdir: $!";
    chomp(my $pwd = `pwd`);
    print "[in $pwd]\n";
    my $command = "makepkg --syncdeps";
    print "=> $command\n"; system($command);

    chomp(my $package_built = `find *.xz`);
    print $logfile "$package_built\n";
    
    chdir ("..") or die "Unable to chdir ..: $!";
}

__END__

