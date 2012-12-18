use MooseX::Declare;

class TSQL::AST::TryCatchBlock extends TSQL::AST::SQLStatement {

has 'tryBlock' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


has 'catchBlock' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );


}


1;