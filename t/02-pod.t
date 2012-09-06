#!/usr/bin/env perl

# Test that the syntax of our POD documentation is valid
use strictures 1;

# Turn on $OUTPUT_AUTOFLUSH
local $| = 1;

use Test::More;
eval "use Test::Pod 1.45";
plan skip_all => "Test::Pod 1.45 required for testing POD" if $@;
all_pod_files_ok();

done_testing();

1;

__END__

