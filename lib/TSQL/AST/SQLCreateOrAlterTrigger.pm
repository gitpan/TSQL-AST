use MooseX::Declare;

class TSQL::AST::Trigger extends TSQL::AST::SQLFragment {

use TSQL::AST::SQLStatement;
#use TSQL::AST::SQLMultiPartName;
#use TSQL::AST::SQLParametersDeclaration;
#use TSQL::AST::SQLQuery;

has 'name' => (
      is  => 'rw',
      isa => 'TSQL::AST::SQLMultiPartName',
  );


has 'body' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );



}


1;