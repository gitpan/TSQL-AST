use MooseX::Declare;

class TSQL::AST::MergeStatement Extends TSQL::AST::SQLStatement {

has 'mergeTarget' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName | TSQL::AST::SQLVariableName ',
  );


}


1;