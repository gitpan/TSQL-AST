use MooseX::Declare;

class TSQL::AST::SQLSelectAssignmentWithoutDataSourceStatement extends TSQL::AST::SQLStatement {


has 'targetVariables' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLIdentifier]',
  );

}


1;