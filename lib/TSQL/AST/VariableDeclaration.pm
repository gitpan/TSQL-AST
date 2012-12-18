use MooseX::Declare;

class TSQL::AST::VariableDeclaration Extends TSQL::AST::SQLFragment {

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