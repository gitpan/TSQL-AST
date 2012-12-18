use MooseX::Declare;

class TSQL::AST::DeclareTableVariable extends TSQL::AST::SQLStatement {


has 'tableName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLVariableName',
  );


}


1;