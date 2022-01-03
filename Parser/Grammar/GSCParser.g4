parser grammar GSCParser;

options 
{
    tokenVocab = GSCLexer;
}

compilationUnit
    :   translationUnit? EOF
    ;

simpleInput
    :   statement
    ;

translationUnit
    :   externalDeclaration+
    ;

externalDeclaration
    :   directiveStatement 
    |   functionStatement
    ;

statement
    :   simpleStatement 
    |   compoundStatement 
    |   shortStatement
    ;

simpleStatement
    :   expressionStatement
    |   labeledStatement
    |   jumpStatement
    |   waitStatement
    ;

compoundStatement
    :   indent=LeftBrace statement+ dedent=RightBrace
    |   newline=emptyCompoundStatement
    ;

emptyCompoundStatement
    :   wsl_1=LeftBrace wsl_2=RightBrace
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
    |   waitExpression                                                                  # WaitStatementExpression
    |   LeftParen expression RightParen                                                 # ParenthesizedExpression
    |   literal                                                                         # LiteralExpression
    ;

postfixExpression
    :   primaryExpression                                                               # PrimaryStatementExpression
	|   postfixExpression LeftBracket expression RightBracket wsl=postfixExpression?    # MemberIndexExpression
	|   postfixExpression LeftParen expressionList? RightParen wsl=postfixExpression?   # FunctionExpression
	|   postfixExpression Dot postfixExpression                                         # MemberDotExpression
	|   postfixExpression (PlusPlus | MinusMinus)                                       # PostExpression
    |   qualifiedIdentifier Qualified postfixExpression                                 # QualifiedCallExpression
    |   LeftBracket LeftBracket postfixExpression RightBracket RightBracket             # FunctionPointerCallExpression
    |   LeftParen expression wsr_1=Comma expression wsr_2=Comma expression RightParen   # VectorExpression
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

waitExpression
    :   wsr=Wait expression
    ;

expressionSequence
    :   wsr=Comma expression
    ;

expressionList
    :   expression expressionSequence*
    ;

expression
    :   unaryExpression                                                                 # UnaryStatementExpression
    |   expression ws=(Mul | Div | Mod) expression                                      # MultiplicativeExpression
    |   expression ws=(Plus | Minus) expression                                         # AdditiveExpression
    |   expression ws=(LeftShift | RightShift) expression                               # BitShiftExpression
    |   expression ws=(Less | Greater | LessEqual | GreaterEqual) expression            # RelationalExpression
    |   expression ws=(Equal | NotEqual) expression                                     # EqualityExpression
    |   expression ws=And expression                                                    # BitAndExpression
    |   expression ws=Xor expression                                                    # BitXorExpression
    |   expression ws=Or expression                                                     # BitOrExpression
    |   expression ws=AndAnd expression                                                 # LogicalAndExpression
    |   expression ws=OrOr expression                                                   # LogicalOrExpression
    |   expression ws=assignmentOperator expression                                     # AssignmentExpression
    ;

functionStatement
    :   identifier LeftParen identifierList? RightParen newline=compoundStatement
    ;

expressionStatement
    :   expression? newline=Semi
    ;

labeledStatement
    :   wsr=Case literal Colon indentShort=statement
    |   Default Colon indentShort=statement
    ;

selectionStatement
    :   selectionStatement wsr_1=Else wsr_2=If LeftParen expression RightParen indentShort=statement
    |   selectionStatement wsr=Else indentShort=statement
    |   wsr=If LeftParen expression RightParen indentShort=statement
    |   wsr=Switch LeftParen expression RightParen statement
    ;

waitStatement
    :   wsr=Wait LeftParen? expression RightParen? newline=Semi
    ;

iterationStatement
    :   wsr=While LeftParen expression RightParen indentShort=statement
    |   wsr_1=For LeftParen expressionList? Semi wsl_2=expressionList? Semi wsl_3=expressionList? RightParen indentShort=statement
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

identifierSequence
    :   wsr=Comma identifier
    |   wsr=Comma identifier Dot identifierSequence
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

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;
