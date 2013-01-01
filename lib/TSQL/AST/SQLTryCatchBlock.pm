use MooseX::Declare;

class TSQL::AST::SQLTryCatchBlock extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLStatement;

has 'tryBlock' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


has 'catchBlock' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


override parse ( Int $index, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    return ;
}

}


1;