use MooseX::Declare;

class TSQL::AST::SQLSelectAssignmentFromDataSourceStatement extends TSQL::AST::SQLStatement {

use TSQL::AST::SQLIdentifier;


has 'targetVariables' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLIdentifier]',
  );


}


1;