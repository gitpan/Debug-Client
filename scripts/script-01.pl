#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Data::Printer {
	caller_info => 1,
	colored     => 0,
};

my $buffer = "Already in /usr/src/Padre/Padre-Plugin-Debug/scripts/sewi.pl.
  DB<28>";
  
p $buffer;

given ($buffer) {
		when ( $_ =~ /^Subroutine [\w:]+ not found[.]/sxm ) {
			say 'Subroutine [\w:]+ not found[.]';
			# return 0;
		}
		when ( $_ =~ /^Line \d+ not breakable[.]/sxm ) {
			say 'Line \d+ not breakable[.]';
			# return 0;
		}
		when ( $_ =~ /^\d+ levels deep in subroutine calls!/sxm ) {
			say '\d+ levels deep in subroutine calls!';
			# return 0;
		}
		when ( $_ =~ /^Already in/m ) {
			say 'Already in';
			# return 1;
		}		
		when ( $_ =~ /\S/sxm ) {
			say 'Non-whitespace charter found';
			# return 0;
		}				
		default {
			say 'nought';
			# return 1;
		}
	}

1;
