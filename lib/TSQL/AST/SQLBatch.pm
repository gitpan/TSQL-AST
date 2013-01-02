use MooseX::Declare;

class TSQL::AST::SQLBatch extends TSQL::AST::SQLFragment {

use feature "switch";
use TSQL::AST::SQLStatement ;
use TSQL::AST::Factory;

use Data::Dumper;

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );

override parse ( ScalarRef[Int] $index, ArrayRef[Str] $input ){ 

    while ( $$index <= $#{$input} ) {
        my $ln = $$input[$$index];
        my $t  = TSQL::AST::Factory->makeToken($ln) ;
        given ($t) {
            when ( defined $_ && $_->isa('TSQL::AST::Token::GO') ) 
                { last ;
                }
            default 
                {
#warn Dumper "hello", $ln;                
                my $statement = TSQL::AST::Factory->makeStatement($ln);
                  push @{$self->statements()}, $statement;
                } 
        }
        $$index++;
    }
    return $self ;
}

}



1;