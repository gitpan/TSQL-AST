#!perl -T

use Test::More tests => 33;

BEGIN {

eval "use TSQL::AST;";

    use_ok( 'TSQL::AST' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::ConditionalExpression' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::DeclareCursorStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::DeclareTableVariable' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::DeclareVariableStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::DeleteStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::ExecuteStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::Expression' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::IfStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::InlineQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::InsertStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::MergeStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::ParameterDeclaration' ) || print "Bail out!\n";
#    use_ok( 'TSQL::AST::ParametersDeclaration' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::ParameterUsage' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::ScalarSubQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SelectAssignmentFromDataSourceStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SelectAssignmentWithoutDataSourceStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SelectIntoStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SelectStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SetAssignment' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLBatch' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDataType' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLFragment' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLIdentifier' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLMultiPartName' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLScript' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLStatement' ) || print "Bail out!\n";
#    use_ok( 'TSQL::AST::SQLVariableName' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::StatementBlock' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::TryCatchBlock' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::UpdateStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::VariableDeclaration' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::WhileStatement' ) || print "Bail out!\n";
    
}

diag( "Testing TSQL::AST $TSQL::AST::VERSION, Perl $], $^X" );
