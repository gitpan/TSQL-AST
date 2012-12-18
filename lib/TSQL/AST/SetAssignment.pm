use MooseX::Declare;

class TSQL::AST::SetAssignment Extends TSQL::AST::SQLStatement {

has 'targetVariable' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLIdentifier',
  );


}


1;