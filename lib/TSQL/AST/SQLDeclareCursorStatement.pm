use MooseX::Declare;

class TSQL::AST::SQLDeclareCursorStatement extends TSQL::AST::SQLStatement {


has 'cursorName' => (
      is  => 'rw',
      isa => 'Str',
  );

}


1;