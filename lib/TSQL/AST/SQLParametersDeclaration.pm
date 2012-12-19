use MooseX::Declare;

class TSQL::AST::SQLParametersDeclaration extends TSQL::AST::SQLFragment {

has 'parameterDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLParameterDeclaration]',
  );


}


1;