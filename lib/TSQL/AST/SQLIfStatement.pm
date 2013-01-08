use MooseX::Declare;

class TSQL::AST::SQLIfStatement extends TSQL::AST::SQLStatement {

use TSQL::AST::Factory;
use TSQL::AST::SQLConditionalExpression;
use TSQL::AST::SQLStatement;
use TSQL::AST::SQLStatementBlock;
use TSQL::AST::SQLTryCatchBlock;

use TSQL::Common::Regexp;

=head1 NAME

TSQL::AST::SQLIfStatement - Represents a TSQL If Statement.

=head1 VERSION

Version 0.01 

=cut


use feature "switch";

use Data::Dumper;

has 'condition' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLConditionalExpression',
  );


has 'ifBranch' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLStatement',
  );


has 'elseBranch' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLStatement',
  );


override parse ( ScalarRef[Int] $index, ArrayRef[Str] $input) {

    my $if     = 1 ;
    my $else   = 0;
    
    my $qr_iftoken               //= TSQL::Common::Regexp->qr_iftoken();
    my $qr_elsetoken             //= TSQL::Common::Regexp->qr_elsetoken();
    my $qr_whiletoken            //= TSQL::Common::Regexp->qr_whiletoken();
    
    while ( $$index <= $#{$input} ) {
    
        if ($if==0 && $else==0) { 
#            $$index++;
            last ; 
        } 
        
        my $ln = $$input[$$index];
        my $t = TSQL::AST::Factory->makeToken($ln);

#warn Dumper 'PARSEIF', $ln, $$index;
#warn Dumper 'PARSEIF', $t;

        given ($t) {
            when ( defined $_ && $_->isa('TSQL::AST::Token::Begin') ) {
                $$index++;
                my $block = TSQL::AST::SQLStatementBlock->new( statements => [] ) ;
                $block->parse($index,$input);
                if ( $if ) {
                    $self->ifBranch($block);
                    $if     = 0 ;
#                    $$index++;
                    if ($$index <= $#{$input}) {
                        my $ln = $$input[$$index];
                        my $t = TSQL::AST::Factory->makeToken($ln);
                        if ( defined $t && $t->isa('TSQL::AST::Token::Else')) {
                            $$index++;
                            $else = 1 ;
                        }
                        else {
                            last ;
                        }
                    }   
                }
                else {
                    $self->elseBranch($block);
                    $else   = 0 ;      
                }
            }
            when ( defined $_ && $_->isa('TSQL::AST::Token::BeginTry') ) {
                $$index++;
                my $block = TSQL::AST::SQLTryCatchBlock->new( tryBlock => [],catchBlock => [] ) ;
                $block->parse($index,$input);
                if ( $if ) {
                    $self->ifBranch($block);
                    $if     = 0 ;

#                    $$index++;
                    if ($$index <= $#{$input}) {
                        my $ln = $$input[$$index];
                        my $t = TSQL::AST::Factory->makeToken($ln);
                        if ( defined $t && $t->isa('TSQL::AST::Token::Else')) {
                            $$index++;
                            $else = 1 ;
                        }
                        else {
                            last ;
                        }
                    }   
                }
                else {
                    $self->elseBranch($block);
                    $else   = 0 ;      
                }
            }
            when ( defined $_ && $_->isa('TSQL::AST::Token::If') ) {
                my $condition = $ln;
                $condition =~ s{$qr_iftoken}{}xmis; # s{\A \s* (?:\b if \b)}{}xmis ;$condition =~ s{\A \s* (?:\b while \b)}{}xmis ;
                my $co = TSQL::AST::SQLConditionalExpression->new( tokenString => $condition ) ; 
                my $block = TSQL::AST::SQLIfStatement->new( condition => $co ) ;            
                $$index++;
                $block->parse($index,$input);
                if ( $if ) {
                    $self->ifBranch($block);
                    $if     = 0 ;

                    $$index++;
                    if ($$index <= $#{$input}) {
                        my $ln = $$input[$$index];
                        my $t = TSQL::AST::Factory->makeToken($ln);
                        if ( defined $t && $t->isa('TSQL::AST::Token::Else')) {
                            $else = 1 ;
                        }
                        else {
                            last ;
                        }
                    }   
                }
                else {
                    $self->elseBranch($block);
                    $else   = 0 ;      
                }
            }                
            when ( defined $_ && $_->isa('TSQL::AST::Token::While') ) {
                my $condition = $ln;
                $condition =~ s{$qr_whiletoken}{}xmis; # s{\A \s* (?:\b if \b)}{}xmis ;$condition =~ s{\A \s* (?:\b while \b)}{}xmis ;
                my $co = TSQL::AST::SQLConditionalExpression->new( tokenString => $condition ) ; 
                my $block = TSQL::AST::SQLWhileStatement->new( condition => $co ) ;            
                $$index++;
                $block->parse($index,$input);
                if ( $if ) {
                    $self->ifBranch($block);
                    $if     = 0 ;

                    $$index++;
                    if ($$index <= $#{$input}) {
                        my $ln = $$input[$$index];
                        my $t = TSQL::AST::Factory->makeToken($ln);
                        if ( defined $t && $t->isa('TSQL::AST::Token::Else')) {
                            $else = 1 ;
                        }
                        else {
                            last ;
                        }
                    }   
                }
                else {
                    $self->elseBranch($block);
                    $else   = 0 ;      
                }
            }

            default { 
                my $statement = TSQL::AST::Factory->makeStatement($ln);
#warn Dumper "DEFAULT",$ln;                                  
#warn Dumper $statement;                  
                if ( $if ) {
                    $self->ifBranch($statement);
                    $if     = 0 ;

                    $$index++;
                    if ($$index <= $#{$input}) {
                        my $ln = $$input[$$index];
                        my $t = TSQL::AST::Factory->makeToken($ln);
                        if ( defined $t && $t->isa('TSQL::AST::Token::Else')) {
                            $else = 1 ;
                        }
                        else {
                            last ;
                        }
                    }   
                }
                else {
                    $self->elseBranch($statement);
                    $else   = 0 ;      
                }
                $$index++;
            } 
        }
    }
#warn Dumper "IF end", $$index;    
    return $self ;}

}


1;




=head1 SYNOPSIS

Represents the parsed version/AST of a TSQL If Statement.

=head1 DESCRIPTION

See TSQL::AST.

=head1 DEPENDENCIES

See TSQL::AST.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

See TSQL::AST.

=head1 METHODS

=head2 C<new>

=over 4

=item * C<< TSQL::AST::SQLIfStatement->new() >>

=back

It creates and returns a new TSQL::AST::SQLIfStatement object. 

=head2 C<parse>

=over 4

=item * C<< $if->parse( integer index into array, array of sqlfragments ) >>

This is the method which parses the split up SQL code.
    
=back    


=head2 C<condition>

=over 4

=item * C<< $if->condition() >>

TSQL::AST::SQLConditionalExpression representing the condtion clause of the While statement.
    
=back    


=head2 C<ifBranch>

=over 4

=item * C<< $if->ifBranch() >>

TSQL::AST::SQLStatement representing the body of the If statement if-branch.
    
=back    

=head2 C<elseBranch>

=over 4

=item * C<< $if->elseBranch() >>

TSQL::AST::SQLStatement representing the body of the If statement else-branch.
    
=back    


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


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of TSQL::AST::SQLIfStatement



