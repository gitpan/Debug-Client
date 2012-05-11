#!/usr/bin/env perl

use 5.014;
use strict;
use warnings;
use English;

$OUTPUT_AUTOFLUSH = 1;
use feature 'unicode_strings';

my @MODULES = (
	'Perl::Critic 1.117',
	'Test::Perl::Critic 1.02',
);

# Don't run tests during end-user installs
use Test::More;
plan( skip_all => 'Author tests not required for installation' )
	unless ( $ENV{RELEASE_TESTING} );

# Load the testing modules
foreach my $MODULE ( @MODULES ) {
	eval "use $MODULE";
	if ( $@ ) {
		$ENV{RELEASE_TESTING}
		? die( "Failed to load required release-testing module $MODULE" )
		: plan( skip_all => "$MODULE not available for testing" );
	}
}

Test::Perl::Critic->import(
	-severity => 4,
	-verbose  => 4,
	-exclude  => [ 'RequireRcsKeywords', ],
);

# my @DIRECTORIES = qw(
	# lib/Padre/Plugin/Cookbook/Recipe01
	# lib/Padre/Plugin/Cookbook/Recipe02
	# lib/Padre/Plugin/Cookbook/Recipe03
# );

# p @DIRECTORIES;

all_critic_ok( );
# all_critic_ok(@DIRECTORIES);

# my $file = 'lib/Padre/Plugin/Cookbook/Cookbook.pm';
# p $file;
#
# carp qq{"$file" does not exist} if not -f $file;

# critic_ok( $file );

# [     -severity => 1,
# -verbose  => 4,
# -exclude  => [ 'RequireRcsKeywords', ],]);

done_testing();

1;

__END__