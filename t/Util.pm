package t::Util;
use strict;
use warnings;
use Mojo::JSON qw(encode_json decode_json);
use File::Temp qw(tempdir);

our $WORKDIR;

BEGIN {
    $WORKDIR = tempdir(CLEANUP => 1);

    ## build ENV
    my $envfile = 't/env.json';
    my $fh;
    open $fh, '<', $envfile or die "Could not open a file $envfile";
    my $data = do {local $/; <$fh>};
    close $fh;
    my $env = decode_json($data);
    for my $key (keys %$env) {
        $ENV{$key} = $env->{$key};
    }

    ## build req file
    my $req = "$WORKDIR/req";
    open $fh, '>', $req or die "Could not open a file $req";
    print $fh encode_json({message => "hello, world!", name => "ytnobody"});
    close $fh;
    $ENV{req} = $req;

    ## build res file
    my $res = "$WORKDIR/res";
    open $fh, '>', $res or die "Could not open a file $res";
    close $fh;
    $ENV{res} = $res;
};

1;
