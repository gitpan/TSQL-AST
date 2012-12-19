use MooseX::Declare;

class TSQL::AST::SQLExecuteStatement extends TSQL::AST::SQLStatement {


has 'procedureName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName',
  );


has 'parameterUsage' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLParameterUsage]',
  );

}


1;