use MooseX::Declare;

class AST::StatementBlock Extends TSQL::AST::SQLStatement {

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


}


1;