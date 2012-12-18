use MooseX::Declare;

class TSQL::AST::ExecuteStatement Extends TSQL::AST::SQLStatement {


has 'procedureName' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName',
  );


has 'parameterUsage' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::ParameterUsage]',
  );

}


1;