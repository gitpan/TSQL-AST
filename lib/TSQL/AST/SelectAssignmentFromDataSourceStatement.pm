use MooseX::Declare;

class TSQL::AST::SelectAssignmentFromDataSourceStatement extends TSQL::AST::SQLStatement {


has 'targetVariables' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLIdentifier]',
  );


}


1;