use MooseX::Declare;

class TSQL::AST::SQLSelectAssignmentFromDataSourceStatement extends TSQL::AST::SQLStatement {


has 'targetVariables' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLIdentifier]',
  );


}


1;