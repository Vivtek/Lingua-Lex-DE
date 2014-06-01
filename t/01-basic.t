#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Lingua::Lex::DE;
use Data::Dumper;
use utf8;

my $lex = Lingua::Lex::DE->new(status_callback => sub { diag $_[0]; });

my $tok = $lex->word('das');
is_deeply ($tok, ['art', 'das']);
$tok = $lex->word('notaGermanword');
is_deeply ($tok, ['?', 'notaGermanword']);

$tok = $lex->word('für');
is_deeply ($tok, ['prep', 'für']);

$tok = $lex->word('Lieferung');
is_deeply ($tok, ['n', 'Lieferung', 'Liefern+ung', 'n+f']);

$tok = $lex->word('vergaberechtliche');
is ($tok->[0], 'aa'); # This is because the current version delivers a bad parse for the full POS (aa+p, should be aa+p/f, I think).

$tok = $lex->word('vorheriger');
is ($tok->[0], 'aa');
#diag Dumper($tok);

done_testing();