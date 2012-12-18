use MooseX::Declare;

class TSQL::AST::DeclareVariableStatement Extends TSQL::AST::SQLStatement {

has 'variableDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::VariableDeclaration]',
  );


}


1;