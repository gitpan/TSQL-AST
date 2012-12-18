use MooseX::Declare;

class TSQL::AST::SQLScript Extends TSQL::AST::SQLFragment {

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLBatch]',
  );



}


1;