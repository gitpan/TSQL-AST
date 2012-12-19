use MooseX::Declare;

class TSQL::AST::SQLDeclareTableVariable extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLVariableName;

has 'tableName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLVariableName',
  );


}


1;