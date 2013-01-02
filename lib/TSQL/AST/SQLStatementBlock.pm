use MooseX::Declare;

class TSQL::AST::SQLStatementBlock extends TSQL::AST::SQLStatement {

use feature "switch";
#use TSQL::AST::SQLStatement;
use TSQL::AST::Factory;
use Data::Dumper;

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


override parse ( ScalarRef[Int] $index, ArrayRef[Str] $input) {

    while ( $$index <= $#{$input} ) {
        my $ln = $$input[$$index];
        my $t  = TSQL::AST::Factory->makeToken($ln) ;
        given ($t) {
            when ( defined $_ && $_->isa('TSQL::AST::Token::End') ) {
                last ;
                }
            when ( defined $_ && $_->isa('TSQL::AST::Token::Begin') ) {
                my $block = TSQL::AST::SQLStatementBlock->new( statements => [] ) ;
                $block->parse($index,$input);
                push @{$self->statements()}, $block;
                }
            default 
                { my $statement = TSQL::AST::Factory->makeStatement($ln);
#warn Dumper $statement;                  
                  push @{$self->statements()}, $statement;
                } 
        }
        $$index++;
    }
    return $self ;}

}

1;