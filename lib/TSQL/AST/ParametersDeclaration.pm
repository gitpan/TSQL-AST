use MooseX::Declare;

class TSQL::AST::ParametersDeclaration Extends TSQL::AST::SQLFragment {

has 'parameterDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::ParameterDeclaration]',
  );


}


1;