package Getopt::Long::Any;

# DATE
# VERSION

use strict;
use warnings;

require Getopt::Long;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
                    GetOptions
               );

*Configure = \&Getopt::Long::Configure;

sub GetOptions {
    if (eval { require Getopt::Long::More; 1 }) {
        goto \&Getopt::Long::More::GetOptions;
    } elsif (eval { require Getopt::Long::Complete; 1 }) {
        goto \&Getopt::Long::Complete::GetOptions;
    } else {
        goto \&Getopt::Long::GetOptions;
    }
}

1;
#ABSTRACT: Use Getopt::Long::More, or Getopt::Long::Complete, or fallback to Getopt::Long

=head1 SYNOPSIS

 use Getopt::Long::Any;

 # will first try to use Getopt::Long::More, if unsuccessful then will try
 # Getopt::Long::Complete, finally will fall back to Getopt::Long
 GetOptions(
     'opt1=s' => sub { ... },
     'opt2=i' => \$opt2,
 );


=head1 DESCRIPTION

B<This is an experiment module.>
