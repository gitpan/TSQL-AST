use MooseX::Declare;

class TSQL::AST::SQLWhileStatement extends TSQL::AST::SQLStatement {

has 'condition' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLConditionalExpression',
  );


has 'body' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLStatement',
  );


}


1;