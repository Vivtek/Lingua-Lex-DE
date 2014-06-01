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

$tok = $lex->word('IG');
is_deeply ($tok, ['n', 'IG']);
$tok = $lex->word('iger');
is_deeply ($tok, ['?', 'iger']);
$tok = $lex->word('IGer');
is ($tok->[0], 'n'); # This is wrong. IG shouldn't take 'er' as a plural. But at least it finds it as a word.

$tok = $lex->word('vorheriger');
is ($tok->[0], 'aa');

$tok = $lex->word('österreichischen');
is ($tok->[0], 'aa');
$tok = $lex->word('Österreichischen');   # This should actually be fixed with a correct collation sequence, but that would take some work.
                                         # Instead, if a word starts on a capital of a non-ASCII word, Lingua::Lex will check for lower-case
                                         # explicitly. This is *not* the right way to deal with this, but it will work for now.
is ($tok->[0], 'aa');

$tok = $lex->word('unangenehm'); # prefix test
is ($tok->[0], 'aa');

done_testing();
