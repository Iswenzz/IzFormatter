parser grammar GSCParser;

options 
{
    tokenVocab = GSCLexer;
    superClass = GSCParserBase;
}

@parser::header 
{
    using Iswenzz.CoD4.Parser.Grammar;
}

compilationUnit
    :   translationUnit? EOF { BuildFormatting(); }
    ;

translationUnit
    :   (directiveStatement | functionStatement)+
    ;

statement
    :   (simpleStatement | compoundStatement | shortStatement)+
    ;

simpleStatement
    :   expressionStatement
    |   labeledStatement
    |   jumpStatement
    |   waitStatement
    ;

compoundStatement
    :   indent=LeftBrace statement* dedent=RightBrace
    ;

shortStatement
    :   selectionStatement
    |   iterationStatement
    ;

primaryExpression
    :   identifier                                                                      # IdentifierExpression
    |   qualifiedIdentifier                                                             # QualifiedExpression
    |   memberExpression                                                                # MemberStatementExpression
    |   threadExpression                                                                # ThreadStatementExpression
    |   LeftParen expression RightParen                                                 # ParenthesizedExpression
    |   literal                                                                         # LiteralExpression
    ;

postfixExpression
    :   primaryExpression                                                               # PrimaryStatementExpression
	|   postfixExpression LeftBracket expression RightBracket wsl=postfixExpression?    # MemberIndexExpression
	|   postfixExpression LeftParen expressionSequence? RightParen                      # FunctionExpression
	|   postfixExpression Dot postfixExpression                                         # MemberDotExpression
	|   postfixExpression (PlusPlus | MinusMinus)                                       # PostExpression
    |   qualifiedIdentifier Qualified postfixExpression                                 # QualifiedCallExpression
    |   LeftFunctionPointer postfixExpression RightFunctionPointer                      # FunctionPointerCallExpression
    |   LeftParen expression wsr=Comma expression wsr=Comma expression RightParen       # VectorExpression
    ;

unaryExpression
    :   postfixExpression                                                               # PostFixStatementExpression
	|   (PlusPlus | MinusMinus | Qualified | unaryOperator) unaryExpression             # PreExpression
    ;

memberExpression
    :   wsr=identifier
    (   threadExpression
    |   expression
    )
    ;

threadExpression
    :   wsr=Thread expression
    ;

expressionSequence
    :   expression (wsr=Comma expression)*
    ;

expression
    :   unaryExpression                                                         # UnaryStatementExpression
    |   expression ws=(Mul | Div | Mod) expression                              # MultiplicativeExpression
    |   expression ws=(Plus | Minus) expression                                 # AdditiveExpression
    |   expression ws=(LeftShift | RightShift) expression                       # BitShiftExpression
    |   expression ws=(Less | Greater | LessEqual | GreaterEqual) expression    # RelationalExpression
    |   expression ws=(Equal | NotEqual) expression                             # EqualityExpression
    |   expression ws=And expression                                            # BitAndExpression
    |   expression ws=Xor expression                                            # BitXorExpression
    |   expression ws=Or expression                                             # BitOrExpression
    |   expression ws=AndAnd expression                                         # LogicalAndExpression
    |   expression ws=OrOr expression                                           # LogicalOrExpression
    |   expression ws=assignmentOperator expression                             # AssignmentExpression
    ;

functionStatement
    :   identifier LeftParen identifierList? RightParen compoundStatement
    ;

expressionStatement
    :   expression newline=Semi
    ;

labeledStatement
    :   wsr=Case literal Colon indentShort=statement
    |   Default Colon indentShort=statement
    ;

selectionStatement
    :   selectionStatement wsr=Else If LeftParen expression RightParen indentShort=statement
    |   selectionStatement wsr=Else indentShort=statement
    |   wsr=If LeftParen expression RightParen indentShort=statement
    |   wsr=Switch LeftParen expression RightParen statement
    ;

waitStatement
    :   wsr=Wait LeftParen? expression RightParen? newline=Semi
    ;

iterationStatement
    :   wsr=While LeftParen expression RightParen indentShort=statement
    |   wsr=For LeftParen expressionSequence? wsr=Semi expressionSequence? wsr=Semi expressionSequence? RightParen indentShort=statement
    ;

jumpStatement
    :   
    (   (Continue | Break)
    |   Return wsl=expression?
    )   newline=Semi
    ;

directiveStatement
    :   IncludeDirective newline=Semi
    ;

assignmentOperator
    :   Assign | MulAssign | DivAssign | ModAssign | PlusAssign | MinusAssign 
    |   LeftShiftAssign | RightShiftAssign | AndAssign | XorAssign | OrAssign
    ;

unaryOperator
    :   Or | Mul | And | Plus | Tilde | Minus | Not
    ;

identifierList
    :   identifier (wsr=Comma identifier)*
    ;

qualifiedIdentifier
    :   QualifiedIdentifier
    ;

identifier
    :   Identifier
    ;

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;
