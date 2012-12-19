use MooseX::Declare;

class TSQL::AST::SQLDeclareVariableStatement extends TSQL::AST::SQLStatement {

has 'variableDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLVariableDeclaration]',
  );


}


1;