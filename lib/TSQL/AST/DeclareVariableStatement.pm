use MooseX::Declare;

class TSQL::AST::DeclareVariableStatement extends TSQL::AST::SQLStatement {

has 'variableDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::VariableDeclaration]',
  );


}


1;