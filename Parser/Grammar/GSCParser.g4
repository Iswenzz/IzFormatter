parser grammar GSCParser;

options 
{
    tokenVocab = GSCLexer;
    superClass = GSCParserBase;
}

@parser::header 
{
    using Iswenzz.CoD4.Parser.Recognizers.GSC;
}

@parser::members 
{
    const int Hidden = 1;
}

compilationUnit:        translationUnit? EOF;
simpleInput:            statement;

translationUnit:        externalDeclaration+;
externalDeclaration:    directiveStatement | functionStatement;

statement
    :   expressionStatement
    |   labeledStatement
    |   jumpStatement
    |   selectionStatement
    |   iterationStatement 
    |   compoundStatement
    ;

compoundStatement
    :   ID=LeftBrace statement+ DD=RightBrace
    |   ID=LeftDevSection statement+ DD=RightDevSection
    |   emptyCompoundStatement
    ;

emptyCompoundStatement
    :   WSL_1=LeftBrace WSL_2=RightBrace
    ;

primaryExpression
    :   identifier                                                                      # IdentifierExpression
    |   qualifiedIdentifier                                                             # QualifiedExpression
    |   memberExpression                                                                # MemberStatementExpression
    |   threadExpression                                                                # ThreadStatementExpression
    |   waitExpression                                                                  # WaitStatementExpression
    |   LeftParen expression RightParen                                                 # ParenthesizedExpression
    |   literal                                                                         # LiteralExpression
    ;

postfixExpression
    :   primaryExpression                                                               # PrimaryStatementExpression
    |   postfixExpression LeftBracket expression RightBracket WSL=postfixExpression?    # MemberIndexExpression
    |   postfixExpression LeftParen expressionList? RightParen WSL=postfixExpression?   # FunctionExpression
    |   postfixExpression Dot postfixExpression                                         # MemberDotExpression
    |   postfixExpression (PlusPlus | MinusMinus)                                       # PostExpression
    |   qualifiedIdentifier Qualified postfixExpression                                 # QualifiedCallExpression
    |   LeftBracket LeftBracket postfixExpression RightBracket RightBracket             # FunctionPointerCallExpression
    |   LeftParen expression WSR_1=Comma expression WSR_2=Comma expression RightParen   # VectorExpression
    ;

unaryExpression
    :   postfixExpression                                                               # PostFixStatementExpression
    |   (PlusPlus | MinusMinus | Qualified | unaryOperator) unaryExpression             # PreExpression
    ;

memberExpression
    :   WSR=identifier
    (   threadExpression
    |   expression
    )
    ;

threadExpression
    :   WSR=Thread expression
    ;

waitExpression
    :   WSR=Wait expression
    ;

expressionSequence
    :   WSR=Comma expression
    ;

expressionList
    :   expression expressionSequence*
    ;

expression
    :   unaryExpression                                                                 # UnaryStatementExpression
    |   expression WS=(Mul | Div | Mod) expression                                      # MultiplicativeExpression
    |   expression WS=(Plus | Minus) expression                                         # AdditiveExpression
    |   expression WS=(LeftShift | RightShift) expression                               # BitShiftExpression
    |   expression WS=(Less | Greater | LessEqual | GreaterEqual) expression            # RelationalExpression
    |   expression WS=(Equal | NotEqual) expression                                     # EqualityExpression
    |   expression WS=And expression                                                    # BitAndExpression
    |   expression WS=Xor expression                                                    # BitXorExpression
    |   expression WS=Or expression                                                     # BitOrExpression
    |   expression WS=AndAnd expression                                                 # LogicalAndExpression
    |   expression WS=OrOr expression                                                   # LogicalOrExpression
    |   expression WS=assignmentOperator expression                                     # AssignmentExpression
    ;

functionStatement
    :   identifier LeftParen identifierList? RightParen compoundStatement
    ;

expressionStatement
    :   expression? Semi
    ;

labeledStatement
    :   Case WSL=literal Colon statement
    |   Default Colon statement
    ;

selectionStatement
    :   selectionStatement
    (   WSR_1=Else WSR_2=If LeftParen expression RightParen statement
    |   Else statement
    )
    |   WSR=If LeftParen expression RightParen statement
    |   WSR=Switch LeftParen expression RightParen compoundStatement
    ;

waitStatement
    :   WSR=Wait LeftParen? expression RightParen? Semi
    ;

iterationStatement
    :   WSR=While LeftParen expression RightParen statement
    |   WSR_1=For LeftParen expressionList? Semi WSL_2=expressionList? Semi WSL_3=expressionList? RightParen statement
    ;

jumpStatement
    : 
    (   Continue 
    |   Break
    |   Return WSL=expression?
    )   Semi
    ;

directiveStatement
    :   IncludeDirective Semi
    ;

assignmentOperator
    :   Assign | MulAssign | DivAssign | ModAssign | PlusAssign | MinusAssign 
    |   LeftShiftAssign | RightShiftAssign | AndAssign | XorAssign | OrAssign
    ;

unaryOperator
    :   Or | Mul | And | Plus | Tilde | Minus | Not
    ;

identifierSequence
    :   WSR=Comma identifier
    |   WSR=Comma identifier Dot identifierSequence
    ;

identifierList
    :   identifier identifierSequence*
    |   identifier Dot identifierList
    ;

qualifiedIdentifier
    :   QualifiedIdentifier
    ;

identifier
    :   Identifier
    ;

comment
    :   lineComment
    |   blockComment+
    ;

lineComment
    :   LineComment
    ;

blockComment
    :   BlockComment
    ;

disabledTokens
    :   comment
    |   Newline
    |   Whitespace
    ;

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;
