#!/usr/bin/env perl
use warnings;
use strict;

my @packages = qw( libqtxdg liblxqt);

foreach my $package (@packages) {
    chdir ($package) or die "Unable to chdir: $!";
    chomp(my $pwd = `pwd`);
    print "[in $pwd]\n";
    my $command = "makepkg --syncdeps";
    print "=> $command\n"; system($command);
    chdir ("..") or die "Unable to chdir ..: $!";
}

__END__
cd libqtxdg
rm -rf libqtxdg*
rm -rf pkg
rm -rf src

cd
