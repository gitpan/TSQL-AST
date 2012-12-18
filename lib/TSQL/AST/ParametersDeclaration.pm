use MooseX::Declare;

class TSQL::AST::ParametersDeclaration extends TSQL::AST::SQLFragment {

has 'parameterDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::ParameterDeclaration]',
  );


}


1;