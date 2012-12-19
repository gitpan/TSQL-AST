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
      isa => 'TSQL::AST::SQLStatement | TSQL::AST::SQLStatementBlock',
  );


}


1;