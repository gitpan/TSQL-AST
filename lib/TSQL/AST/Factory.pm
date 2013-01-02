package TSQL::AST::Factory;

use feature "switch";

use TSQL::AST::Token::Begin;
use TSQL::AST::Token::BeginCatch;
use TSQL::AST::Token::BeginTry;
use TSQL::AST::Token::Else;
use TSQL::AST::Token::End;
use TSQL::AST::Token::EndCatch;
use TSQL::AST::Token::EndTry;
use TSQL::AST::Token::GO;
use TSQL::AST::Token::If;
use TSQL::AST::Token::While;

use TSQL::AST::SQLIfStatement;
use TSQL::AST::SQLTryCatchBlock;
use TSQL::AST::SQLWhileStatement;
use TSQL::AST::SQLStatement;

use Data::Dumper;
use Carp;

sub makeToken  {
    my $x = shift;
    my $input = shift ;
    carp "Missing token input" if ! defined $input;
    my $o ;
    given ($input) {
        when ( m{\A \s* (?:\b begin \b) \s* \z }xi    )
                { $o = TSQL::AST::Token::Begin->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b) \s* \z }xi      )
                { $o = TSQL::AST::Token::End->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b begin \b \s* \b try \b ) \s* \z }xi    )
                { $o = TSQL::AST::Token::BeginTry->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b \s* \b try \b ) \s*  \z }xi      )
                { $o = TSQL::AST::Token::EndTry->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b begin \b  \s* \b catch \b) \s*  \z }xi    )
                { $o = TSQL::AST::Token::BeginCatch->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b end \b  \s* \b catch \b) \s*  \z }xi      )
                { $o = TSQL::AST::Token::EndCatch->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b else \b ) \s* \z }xi      )
                { $o = TSQL::AST::Token::Else->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b if \b)}xi  )
                { $o = TSQL::AST::Token::If->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b go \b)}xi  )
                { $o = TSQL::AST::Token::GO->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b while \b)}xi  )
                { $o = TSQL::AST::Token::While->new( tokenString => $input ) ; }
    }
    return $o;  
}

sub makeStatement {
    my $x = shift;
    my $input = shift ;
#warn Dumper $input; 
    carp "Missing statement input" if ! defined $input;

    my $o ;
    given ($input) {
        when ( m{\A \s* (?:\b if \b) \s* }xi    )
                { $o = TSQL::AST::SQLIfStatement->new( tokenString => $input ) ; }
        when ( m{\A \s* (?:\b begin \b \s* \b try \b ) \s* \z }xi    )
                { $o = TSQL::AST::SQLTryCatchBlock->new( tokenString => $input ) ; 
                }
        when ( m{\A \s* (?:\b while \b)}xi  )
                { $o = TSQL::AST::SQLWhileStatement->new( tokenString => $input ) ; }
        default { $o = TSQL::AST::SQLStatement->new( tokenString => $input ) ;
                }

    return $o;  
    }
}


1;

__DATA__

