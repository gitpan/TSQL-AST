use MooseX::Declare;

class TSQL::AST::SQLDeclareVariableStatement extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLVariableDeclaration ;

has 'variableDeclarations' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLVariableDeclaration]',
  );


}


1;