use MooseX::Declare;

class TSQL::AST::SQLIfStatement extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLStatement;
use TSQL::AST::SQLConditionalExpression;
use TSQL::AST::SQLStatementBlock;

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


}


1;