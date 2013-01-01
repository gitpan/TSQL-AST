use MooseX::Declare;

class TSQL::AST::SQLWhileStatement extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLStatement;
use TSQL::AST::SQLConditionalExpression;
use TSQL::AST::SQLStatementBlock;

has 'condition' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLConditionalExpression',
  );


has 'body' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLStatement',
  );



override parse ( Int $index, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    return ;
}

}


1;