package TSQL::AST::Factory;

use feature "switch";
use 5.010;

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

use TSQL::Common::Regexp;

use Data::Dumper;
use Carp;

state $qr_begintoken            //= TSQL::Common::Regexp->qr_begintoken();
state $qr_endtoken              //= TSQL::Common::Regexp->qr_endtoken();
state $qr_begintrytoken         //= TSQL::Common::Regexp->qr_begintrytoken();
state $qr_endtrytoken           //= TSQL::Common::Regexp->qr_endtrytoken();
state $qr_begincatchtoken       //= TSQL::Common::Regexp->qr_begincatchtoken();
state $qr_endcatchtoken         //= TSQL::Common::Regexp->qr_endcatchtoken();
state $qr_iftoken               //= TSQL::Common::Regexp->qr_iftoken();
state $qr_elsetoken             //= TSQL::Common::Regexp->qr_elsetoken();
state $qr_whiletoken            //= TSQL::Common::Regexp->qr_whiletoken();
state $qr_GOtoken               //= TSQL::Common::Regexp->qr_GOtoken();

sub makeToken  {

    local $_             = undef ;    
    
    my $invocant         = shift ;    
    my $class            = ref($invocant) || $invocant ;    
    
    my $input            = shift ;
    carp "Missing token input" if ! defined $input;

    my $o ;

    given ($input) {

        when ( m{$qr_begintoken}ix    )
                { $o = TSQL::AST::Token::Begin->new( tokenString => $input ) ; }

        when ( m{$qr_endtoken}ix      )
                { $o = TSQL::AST::Token::End->new( tokenString => $input ) ; }

        when ( m{$qr_begintrytoken}ix    )
                { $o = TSQL::AST::Token::BeginTry->new( tokenString => $input ) ; }

        when ( m{$qr_endtrytoken}ix      )
                { $o = TSQL::AST::Token::EndTry->new( tokenString => $input ) ; }

        when ( m{$qr_begincatchtoken}ix    )
                { $o = TSQL::AST::Token::BeginCatch->new( tokenString => $input ) ; }

        when ( m{$qr_endcatchtoken}ix      )
                { $o = TSQL::AST::Token::EndCatch->new( tokenString => $input ) ; }

        when ( m{$qr_elsetoken}ix      )
                { $o = TSQL::AST::Token::Else->new( tokenString => $input ) ; }

        when ( m{$qr_iftoken}ix  )
                { $o = TSQL::AST::Token::If->new( tokenString => $input ) ; }

        when ( m{$qr_GOtoken}ix  )
                { $o = TSQL::AST::Token::GO->new( tokenString => $input ) ; }

        when ( m{$qr_whiletoken}ix  )
                { $o = TSQL::AST::Token::While->new( tokenString => $input ) ; }

    }

    return $o;  
}

sub makeStatement {

    local $_             = undef ;    
    
    my $invocant         = shift ;    
    my $class            = ref($invocant) || $invocant ;    

    my $input            = shift ;
    carp "Missing statement input" if ! defined $input;

    my $o ;
    
    given ($input) {
#        when ( m{\A \s* (?:\b if \b) \s* }xi    )
#                { $o = TSQL::AST::SQLIfStatement->new( tokenString => $input ) ; }
#        when ( m{\A \s* (?:\b begin \b \s* \b try \b ) \s* \z }xi    )
#                { $o = TSQL::AST::SQLTryCatchBlock->new( tokenString => $input ) ; 
#                }
#        when ( m{\A \s* (?:\b while \b)}xi  )
#                { $o = TSQL::AST::SQLWhileStatement->new( tokenString => $input ) ; }
        default { $o = TSQL::AST::SQLStatement->new( tokenString => $input ) ;
                }

    return $o;  
    }
}


1;

__DATA__

