use MooseX::Declare;

class TSQL::AST::SQLFragment {

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

has 'tokenString' => (
      is  => 'rw',
      isa => 'Str',
  );


method makeToken ( Str  $input) {
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

method parse ( Int $index, ArrayRef[Str] $input,  ArrayRef[TSQL::AST::SQLFragment] $output ) {
    return ;
}


}


1;