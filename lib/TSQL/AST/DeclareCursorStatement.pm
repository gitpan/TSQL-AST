use MooseX::Declare;

class TSQL::AST::DeclareCursorStatement extends TSQL::AST::SQLStatement {


has 'cursorName' => (
      is  => 'rw',
      isa => 'Str',
  );

}


1;