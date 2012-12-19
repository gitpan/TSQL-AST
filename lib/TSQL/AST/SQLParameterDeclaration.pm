use MooseX::Declare;

class TSQL::AST::SQLParametersDeclaration extends TSQL::AST::SQLFragment {

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