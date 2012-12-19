use MooseX::Declare;

class TSQL::AST::SQLInsertStatement extends TSQL::AST::SQLStatement {


has 'insertTarget' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName | TSQL::AST::SQLVariableName ',
  );



}


1;