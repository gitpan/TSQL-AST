use MooseX::Declare;

class TSQL::AST::SQLScript extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLBatch;


has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLBatch]',
  );

override parse ( Int $i, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    my $index   = 0;
    while ( $index < $#{$input} ) {
        my $batch   = TSQL::AST::SQLBatch->new()->parse( $index, $input )  ;
#        push $self->statements(), $batch;
        $index++;
    }
    return ;
}

}


1;