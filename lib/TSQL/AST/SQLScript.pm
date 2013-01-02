use MooseX::Declare;

class TSQL::AST::SQLScript extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLBatch;
use 5.010;
use Data::Dumper;

has 'batches' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLBatch]',
  );

override parse ( ScalarRef[Int] $index, ArrayRef[Str] $input ) {
    while ( $$index <= $#{$input} ) {
        my $batch   = TSQL::AST::SQLBatch->new(statements => [])->parse( $index, $input )  ;
        push @{$self->batches()}, $batch;
        $$index++;
    }
    return ;
}

}


1;