use MooseX::Declare;

class AST::StatementBlock extends TSQL::AST::SQLStatement {

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


}


1;