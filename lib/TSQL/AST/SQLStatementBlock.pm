use MooseX::Declare;

class TSQL::AST::SQLStatementBlock extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLStatement;

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


}


1;