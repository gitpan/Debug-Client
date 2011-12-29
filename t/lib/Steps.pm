package t::lib::Steps;

use base qw(Test::Class);
use Test::More;
use Test::Deep;

use t::lib::Debugger;
use Data::Printer { caller_info => 1, colored => 1, };
# setup methods are run before every test method.
sub load_debugger : Test(setup) {
	my $self = shift;
	start_script('t/eg/02-sub.pl');
	$self->{debugger} = start_debugger();
	$self->{debugger}->get;
}

sub stepin : Test(no_plan) {
	my $self = shift;
	my $out;
	$out = $self->{debugger}->get_options();
	p $out;
	
	$out = $self->{debugger}->step_in;
	p $out;
	like( $out, qr{sub.pl:6},  'step to line 6' );
	
	my @out = $self->{debugger}->step_in;
	p @out;
	cmp_deeply( \@out, [ 'main::', 't/eg/02-sub.pl', 7, 'my $y = 22;' ], 'step to line 7' );

}

sub stepout : Test(no_plan) {
	my $self = shift;
	my $out;
	# $out = $self->{debugger}->get_options();
	# ok( $out =~ m/CommandSet.=.'(\d+)'/s, 'get options' );
	# diag("ComamandSet = '$1'");

# # 	$self->{debugger}->set_breakpoint( 't/eg/14-y_zero.pl', '14' );

# # 	$out = $self->{debugger}->set_option('frame=2');
	# like( $out, qr/frame.=.'2'/s, 'set options' );

# # 	my @out;
	# eval { $self->{debugger}->run };
	# if ($@) {
		# diag($@);
	# } else {

# # 		diag(@out);
		# local $TODO = "Array ref request";

# # 		# cmp_deeply(
		# # \@out, [ 'main::', 't/eg/14-y_zero.pl', '14', 'print "$_ : $line \n";', ],
		# # 'Array ref request'
		# # );

# # 	}

# # 	$out = $self->{debugger}->set_option('frame=0');
	# like( $out, qr/frame.=.'0'/s, 'reset options' );
}

sub stepover : Test(no_plan) {
	my $self = shift;
	my $out;
	# $out = $self->{debugger}->get_options();
	# ok( $out =~ m/CommandSet.=.'(\d+)'/s, 'get options' );
	# diag("ComamandSet = '$1'");

# # 	$self->{debugger}->set_breakpoint( 't/eg/14-y_zero.pl', '14' );

# # 	$out = $self->{debugger}->set_option('frame=2');
	# like( $out, qr/frame.=.'2'/s, 'set options' );

# # 	my @out;
	# eval { $self->{debugger}->run };
	# if ($@) {
		# diag($@);
	# } else {

# # 		diag(@out);
		# local $TODO = "Array ref request";

# # 		# cmp_deeply(
		# # \@out, [ 'main::', 't/eg/14-y_zero.pl', '14', 'print "$_ : $line \n";', ],
		# # 'Array ref request'
		# # );

# # 	}

# # 	$out = $self->{debugger}->set_option('frame=0');
	# like( $out, qr/frame.=.'0'/s, 'reset options' );
}

# teardown methods are run after every test method.
sub teardown : Test(teardown) {
	my $self = shift;
	$self->{debugger}->quit;
	done_testing();
}

1;

__END__
