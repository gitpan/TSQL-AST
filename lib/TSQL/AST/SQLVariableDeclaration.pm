use MooseX::Declare;

class TSQL::AST::SQLVariableDeclaration extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLIdentifier;
use TSQL::AST::SQLDataType;

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