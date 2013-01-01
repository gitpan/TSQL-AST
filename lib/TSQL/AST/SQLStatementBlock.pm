use MooseX::Declare;

class TSQL::AST::SQLStatementBlock extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLStatement;

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


override parse ( Int $index, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    return ;
}

}

1;