use MooseX::Declare;

class TSQL::AST::UpdateStatement Extends TSQL::AST::SQLStatement {


has 'updateTarget' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName | TSQL::AST::SQLVariableName ',
  );


}


1;