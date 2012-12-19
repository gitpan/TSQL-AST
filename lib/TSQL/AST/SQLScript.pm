use MooseX::Declare;

class TSQL::AST::SQLScript extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLBatch;


has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLBatch]',
  );



}


1;