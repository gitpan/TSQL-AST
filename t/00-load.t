#!perl -T

use Test::More tests => 41;

BEGIN {

    use_ok( 'TSQL::AST' ) || print "Bail out!\n";
    
    
    use_ok( 'TSQL::AST::SQLLabel' ) || print "Bail out!\n";
    
    use_ok( 'TSQL::AST::SQLBegin' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLEnd' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLBeginCatch' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLEndCatch' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLBeginTry' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLEndTry' ) || print "Bail out!\n";

    use_ok( 'TSQL::AST::SQLElse' ) || print "Bail out!\n";
    
    use_ok( 'TSQL::AST::SQLConditionalExpression' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDeclareCursorStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDeclareTableVariable' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDeclareVariableStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDeleteStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLExecuteStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLExpression' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLIfStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLInlineQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLInsertStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLMergeStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLParameterDeclaration' ) || print "Bail out!\n";
#    use_ok( 'TSQL::AST::SQLParametersDeclaration' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLParameterUsage' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLScalarSubQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLSelectAssignmentFromDataSourceStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLSelectAssignmentWithoutDataSourceStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLSelectIntoStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLSelectStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLSetAssignment' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLBatch' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLDataType' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLFragment' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLIdentifier' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLMultiPartName' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLQuery' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLScript' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLStatement' ) || print "Bail out!\n";
#    use_ok( 'TSQL::AST::SQLVariableName' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLStatementBlock' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLTryCatchBlock' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLUpdateStatement' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLVariableDeclaration' ) || print "Bail out!\n";
    use_ok( 'TSQL::AST::SQLWhileStatement' ) || print "Bail out!\n";
    
}

diag( "Testing TSQL::AST $TSQL::AST::VERSION, Perl $], $^X" );
