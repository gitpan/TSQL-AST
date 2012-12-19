use MooseX::Declare;

class TSQL::AST::SQLBatch extends TSQL::AST::SQLFragment {

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );

}


1;