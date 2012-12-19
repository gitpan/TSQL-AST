use MooseX::Declare;

class TSQL::AST::SQLParametersDeclaration extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLIdentifier;
use TSQL::AST::SQLDataType;

has 'parameterName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLIdentifier',
  );


has 'parameterType' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLDataType',
  );


}


1;