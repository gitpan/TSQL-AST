use MooseX::Declare;

class TSQL::AST::SQLDeclareTableVariable extends TSQL::AST::SQLStatement {


has 'tableName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLVariableName',
  );


}


1;