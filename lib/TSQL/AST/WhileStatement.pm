use MooseX::Declare;

class TSQL::AST::WhileStatement extends TSQL::AST::SQLStatement {

has 'condition' => (
      is  => 'rw',
      isa => 'TSQL::AST::ConditionalExpression',
  );


has 'body' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLStatement',
  );


}


1;