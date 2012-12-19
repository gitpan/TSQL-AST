use MooseX::Declare;

class TSQL::AST::SQLVariableDeclaration extends TSQL::AST::SQLFragment {

has 'variableName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLIdentifier',
  );


has 'variableType' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLDataType',
  );

}


1;