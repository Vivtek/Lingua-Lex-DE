package Lingua::Lex::DE;

use 5.006;
use strict;
use warnings FATAL => 'all';
use File::ShareDir;
use base 'Lingua::Lex';

=head1 NAME

Lingua::Lex::DE - Subclasses Lingua::Lex with specific German lexicography

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This essentially is L<Lingua::Lex> with the addition of a default database that consists of the German language and
morphology. This allows the morphological rules for German to be tested independently of L<Lingua::Lex>.

Some specific functionality may end up implemented here. For example, German apophony (the "umlautification" of
roots when they're declined or conjugated in various ways, like rot -> rötlich) is probably German-specific enough
that there might not be much motivation to build a generalized rule system that could handle it and that would
then be standard equipment for Lingua::Lex. So at least initially, that kind of morphological transformation
might make sense here in Lingua::Lex::DE, and certainly there should be a well-supported mechanism to permit that
for others who want to develop purpose-specific or language-specific lexica.

For now, though, Lingua::Lex::DE doesn't actually do I<anything> except be Lingua::Lex with a more specific name,
a default lexical source directory, and a distribution that permits separate testing of its lexical rules.

Since everything (including the data location) defaults out to reasonable values, you can probably use it just like this:

   use Lingua::Lex::DE;

   my $lex = Lingua::Lex::DE->new();
   my $tok = $lex->word('unangenehm');
   # $tok is now ['aa', 'unangenehm', 'un+angenehm']

The first time you call the module, it will build the database for live lookup. On my machine, this takes about ten minutes -
the basic lexicon contains over 83,400 root words, so it's just plain a massive amount of data.

(As a result, testing is disabled for CPANtesters. That's a lot to ask of anonymous testing platforms. So if there are
some platform incompatibilities, please tell me.)

=head1 DEFAULT OVERRIDES

=head2 default_filename

We'll use "de.sqlt" as the default filename, and if there is a shared module directory to which we have write
access, we'll use that as the path.

=cut

sub default_filename {
    my $lexdir = eval { File::ShareDir::module_dir('Lingua::Lex::DE'); };
    return 'de.sqlt' if @!;
    return $lexdir . '/de.sqlt';
}

=head2 default_lexicon

The default lexicon for the German language is installed into the shared module directory during installation.
That path is returned here.

=cut

sub default_lexicon {
    my $lexdir = eval { File::ShareDir::module_dir('Lingua::Lex::DE'); };
    return if @!;
    return $lexdir;
}

=head2 default_stoppos

This returns the list of parts of speech that are considered stopwords in this lexicon. At present those are
'art', 'conj', and 'prep'.

=cut

sub default_stoppos { ('art', 'conj', 'prep'); }


=head1 AUTHOR

Michael Roberts, C<< <michael at vivtek.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-lingua-lex-de at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Lingua-Lex-DE>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Lingua::Lex::DE


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-Lex-DE>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Lingua-Lex-DE>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Lingua-Lex-DE>

=item * Search CPAN

L<http://search.cpan.org/dist/Lingua-Lex-DE/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Michael Roberts.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Lingua::Lex::DE
