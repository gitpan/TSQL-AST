use MooseX::Declare;

class TSQL::AST::DeclareCursorStatement Extends TSQL::AST::SQLStatement {


has 'cursorName' => (
      is  => 'rw',
      isa => 'Str',
  );

}


1;