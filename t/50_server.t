use Mojo::Base -strict;
 
use Test::More;
use Mojo::JSON 'decode_json';
use Mojo::Server::AzureFunctions;
use Mojolicious::Lite;
use t::Util;

# Silence
app->log->level('fatal');

post '/api/httpFunc' => sub {
    my $c = shift;
    my $req_json = decode_json($c->req->body);
    my $name = $req_json->{name};
    $c->render(json => {message => "$name, Welcome to Mojo and Azure Functions world!"});
};

my $server = Mojo::Server::AzureFunctions->new(app => app);
$server->run(\%ENV);

open my $fh, '<', $ENV{res};
my $json = do {local $/; <$fh>};
close $fh;
my $data = decode_json($json);

is_deeply($data, {
    'body' => {
        'message' => "ytnobody, Welcome to Mojo and Azure Functions world!"
    },
    'headers' => {
        'Content-Type' => [
            'application/json;charset=UTF-8'
        ]
    },
    'status' => 200
});

done_testing;