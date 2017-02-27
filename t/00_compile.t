use strict;
use Test::More 0.98;
use t::Util;

use_ok $_ for qw(
    Mojo::Server::AzureFunctions
);

# diag explain({%ENV});

done_testing;

