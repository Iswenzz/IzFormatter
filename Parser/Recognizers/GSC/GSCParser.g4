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
    :   TNL=simpleStatement
    |   compoundStatement
    |   NL=devStatement
    ;

simpleStatement
    :   expressionStatement
    |   labeledStatement
    |   jumpStatement
    |   selectionStatement
    |   iterationStatement
    ;

compoundStatement
    :   IDB=LeftBrace statement+ DDB=RightBrace
    |   emptyCompoundStatement
    ;

devStatement
    :   IDB=LeftDevSection statement+ DDB=RightDevSection
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
    :   primaryExpression                                                               # PostFixPrimaryExpression
    |   postfixExpression LeftBracket expression RightBracket WSL=postfixExpression?    # MemberIndexExpression
    |   postfixExpression LeftParen expressionList? RightParen WSL=postfixExpression?   # FunctionExpression
    |   postfixExpression Dot postfixExpression                                         # MemberDotExpression
    |   postfixExpression (PlusPlus | MinusMinus)                                       # PostExpression
    |   qualifiedIdentifier Qualified postfixExpression                                 # QualifiedCallExpression
    |   LeftBracket LeftBracket postfixExpression RightBracket RightBracket             # FunctionPointerCallExpression
    |   LeftParen expression WSR_1=Comma expression WSR_2=Comma expression RightParen   # VectorExpression
    ;

unaryExpression
    :   postfixExpression                                                               # UnaryPostExpression
    |   (PlusPlus | MinusMinus | Qualified | unaryOperator) unaryExpression             # UnaryPreExpression
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
    :   identifier LeftParen identifierList? RightParen NL=compoundStatement
    ;

expressionStatement
    :   expression? Semi
    ;

switchStatement
    :   IDB=LeftBrace labeledStatement+ DDB=RightBrace
    ;

labeledStatement
    :   TNL=caseBlock
    ;

caseStatement
    :   NLT_1=expressionStatement
    |   NLT_2=jumpStatement
    |   NLT_3=selectionStatement
    |   NLT_4=iterationStatement
    |   NLT_5=compoundStatement
    ;

caseBlock
    :   Case WSL=literal Colon compoundStatement caseStatement*
    |   Case WSL=literal ID=Colon caseStatement* DD=caseStatement
    |   Case WSL=literal Colon
    |   Default Colon compoundStatement caseStatement*
    |   Default ID=Colon caseStatement* DD=caseStatement
    |   Default Colon
    ;

selectionStatement
    :   WSR_1=Else WSR_2=If LeftParen expression RightParen compoundStatement
    |   WSR_1=Else WSR_2=If LeftParen expression RightParen IDDD=simpleStatement
    |   Else compoundStatement
    |   Else IDDD=simpleStatement
    |   WSR=If LeftParen expression RightParen compoundStatement
    |   WSR=If LeftParen expression RightParen IDDD=simpleStatement
    |   WSR=Switch LeftParen expression RightParen switchStatement
    ;

iterationStatement
    :   WSR=While LeftParen expression RightParen compoundStatement
    |   WSR=While LeftParen expression RightParen IDDD=simpleStatement
    |   WSR_1=For LeftParen expressionList? Semi WSL_2=expressionList? Semi WSL_3=expressionList? RightParen compoundStatement
    |   WSR_1=For LeftParen expressionList? Semi WSL_2=expressionList? Semi WSL_3=expressionList? RightParen IDDD=simpleStatement
    ;

jumpStatement
    :   
    (   Continue
    |   Break
    |   Return WSL=expression?
    )   Semi
    ;

directiveStatement
    :   IncludeDirective NL=Semi
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

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;
