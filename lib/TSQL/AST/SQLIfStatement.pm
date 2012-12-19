use MooseX::Declare;

class TSQL::AST::SQLIfStatement extends TSQL::AST::SQLStatement {

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