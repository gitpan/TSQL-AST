use MooseX::Declare;

class TSQL::AST {

use 5.010;
use warnings;
use strict;

use feature "switch";

use TSQL::AST::SQLScript;
use TSQL::AST::SQLStatement;
use TSQL::AST::SQLStatementBlock;
use TSQL::AST::SQLBatch;

#use TSQL::AST::SQLBegin;
#use TSQL::AST::SQLEnd;

#use TSQL::AST::SQLBeginTry;
#use TSQL::AST::SQLEndTry;

#use TSQL::AST::SQLBeginCatch;
#use TSQL::AST::SQLEndCatch;

use TSQL::AST::SQLIfStatement;
#use TSQL::AST::SQLElse;
use TSQL::AST::SQLWhileStatement;

use TSQL::AST::SQLLabel;
use TSQL::AST::SQLFragment;
use TSQL::AST::SQLScript;

use Data::Dumper;

=head1 NAME

TSQL::AST - 'Abstract Syntax Tree' for TSQL.

=head1 VERSION

Version 0.01_007 

=cut

our $VERSION = '0.01_007';

has 'script' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLScript',
  );


method parse ( Int $index, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    $self->script(TSQL::AST::SQLScript->new() ) ;
    $self->script()->parse($index,$input,$output);
    return ;
}

method makeToken ( Str  $input) {
    my $o ;
    given ($input) {
        when ( m{\A \s* (?:\b begin \b) \s* \z }xi    )
                { $o = TSQL::AST::Token::Begin->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b) \s* \z }xi      )
                { $o = TSQL::AST::Token::End->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b begin \b \s* \b try \b ) \s* \z }xi    )
                { $o = TSQL::AST::Token::BeginTry->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b \s* \b try \b ) \s*  \z }xi      )
                { $o = TSQL::AST::Token::EndTry->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b begin \b  \s* \b catch \b) \s*  \z }xi    )
                { $o = TSQL::AST::Token::BeginCatch->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b  \s* \b catch \b) \s*  \z }xi      )
                { $o = TSQL::AST::Token::EndCatch->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b else \b ) \s* \z }xi      )
                { $o = TSQL::AST::Token::Else->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b if \b)}xi  )
                { $o = TSQL::AST::Token::If->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b go \b)}xi  )
                { $o = TSQL::AST::Token::GO->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b while \b)}xi  )
                { $o = TSQL::AST::Token::While->new( tokenString => $input ) ; }
    }
    return $o;  
}
  
}


1;

__DATA__


=head1 SYNOPSIS

=head1 DESCRIPTION


=head1 DEPENDENCIES

TSQL::AST depends on the following modules:

=over 4

=item * L<Data::Dumper>

=item * L<List::MoreUtils>

=item * L<List::Util>

=item * L<MooseX::Declare>

=item * L<autodie>

=item * L<indirect>

=item * L<version>

=back


=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-tsql-ast at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=TSQL::AST>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 METHODS

=head2 C<new>

=over 4

=item * C<< TSQL::AST->new() >>

=back

It creates and returns a new TSQL::AST object. 

=head2 C<parse>

=over 4

=item * C<< $ast->parse( array of sqlfragments ) >>

=back

This is the method which parses the split up SQL code.


=head2 C<makeToken>

=over 4

=item * C<< $ast->makeToken(sqlfragment) >>

=back

This is the method which decides what kind of object is represented by the current 'statement'.

=head2 C<parseBatch>

=over 4

=item * C<< $ast->parseBatch( array of sqlfragments ) >>

=back

This is a method which parses the split up SQL code.

=head2 C<parseBlock>

=over 4

=item * C<< $ast->parseBlock( array of sqlfragments ) >>

=back

This is a method which parses the split up SQL code.

=head2 C<parseIf>

=over 4

=item * C<< $ast->parseIf( array of sqlfragments ) >>

=back

This is a method which parses the split up SQL code.

=head2 C<parseScript>

=over 4

=item * C<< $ast->parseScript( array of sqlfragments ) >>

=back

This is the method which parses the split up SQL code from the original script.

    my $sql_splitter = TSQL::SplitStatement->new();
    
    my @statements = $sql_splitter->splitSQL( 'SELECT 1;SELECT 2; );

    my $sql_parser = TSQL::AST->new();
    
    my $ast = $sql_parser->parseScript( \@statements );
    



=head2 C<parseTryCatch>

=over 4

=item * C<< $ast->parseTryCatch( array of sqlfragments ) >>

=back

This is a method which parses the split up SQL code.

=head2 C<parseWhile>

=over 4

=item * C<< $ast->parseWhile( array of sqlfragments ) >>

=back

This is a method which parses the split up SQL code.

=head1 LIMITATIONS

No limitations are currently known, as far as the intended usage is concerned.  
You *are* bound to uncover a large number of problems.

Please report any problematic cases.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc TSQL::AST


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=TSQL::AST>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/TSQL::AST>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/TSQL::AST>

=item * Search CPAN

L<http://search.cpan.org/dist/TSQL::AST/>

=back


=head1 ACKNOWLEDGEMENTS

=over 4

None yet.

=back


=head1 SEE ALSO

=over 4

=item * L<TSQL::SplitStatement>

=back



=head1 LICENSE AND COPYRIGHT

Copyright 2012 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of TSQL::AST


