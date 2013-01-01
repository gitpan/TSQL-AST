use MooseX::Declare;

class TSQL::AST::SQLBatch extends TSQL::AST::SQLFragment {

use feature "switch";
use TSQL::AST::SQLStatement ;

use Data::Dumper;

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );

override parse ( Int $index, ArrayRef[Str] $input ){ #,  TSQL::AST::SQLBatch $output ) {
    while ( $index < $#{$input} ) {
        my $ln = $$input[$index];
        my $t  = $self->makeToken($ln) ;
        given ($t) {
            when ( defined $_ && $_->isa('TSQL::AST::Token::GO') ) { break;}
            default 
                { my $o = TSQL::AST::SQLStatement->new( tokenString => $ln ) ;
warn Dumper $o;                
#                  push $self->statements(), $o;
                } 
        }
        $index++;
    }
    return $self ;
}

}



1;