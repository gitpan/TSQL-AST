use MooseX::Declare;

class TSQL::AST::SelectAssignmentFromDataSourceStatement Extends TSQL::AST::SQLStatement {


has 'targetVariables' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLIdentifier]',
  );


}


1;