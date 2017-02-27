# NAME

Mojo::Server::AzureFunctions - The Mojo server adaptor for the Microsoft Azure Functions

# SYNOPSIS

    use Mojo::Server::AzureFunctions;
    my $server = Mojo::Server::AzureFunctions->new(app => $mojo_app);
    $server->run(\%ENV);

# DESCRIPTION

This is an adaptor class that enables the Mojo application on the Microsoft Azure Functions.

\*\* THIS MODULE IS EXPERIMENTAL. \*\*

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
