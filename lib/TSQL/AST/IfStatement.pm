use MooseX::Declare;

class TSQL::AST::IfStatement Extends TSQL::AST::SQLStatement {

has 'condition' => (
      is  => 'rw',
      isa => 'TSQL::AST::ConditionalExpression',
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