#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Lingua::Lex::DE;

my $lex = Lingua::Lex::DE->new();

my $tok = $lex->('das');
is_deeply ($tok, ['art', 'das']);

done_testing();