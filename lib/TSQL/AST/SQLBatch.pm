package TSQL::AST::SQLBatch;
use Moose;

extends 'TSQL::AST::SQLFragment';

has 'statements' => (
      is  => 'rw',
      isa => 'ArrayRef[TSQL::AST::SQLStatement]',
  );



no Moose;
__PACKAGE__->meta->make_immutable;

1;