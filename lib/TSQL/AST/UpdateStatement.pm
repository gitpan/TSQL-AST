use MooseX::Declare;

class TSQL::AST::UpdateStatement extends TSQL::AST::SQLStatement {


has 'updateTarget' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName | TSQL::AST::SQLVariableName ',
  );


}


1;