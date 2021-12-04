grammar GSC;

compilationUnit
    :   translationUnit? EOF
    ;

translationUnit
    :   externalDeclaration+
    ;

externalDeclaration
    :   functionDeclaration
    |   directive
    |   ';'
    ;

functionDeclaration
    :   declarator compoundStatement
    ;

declaration
    :   primaryExpression
    |   threadExpression primaryExpression?
    ;

primaryExpression
    :   entityExpression
    |   extraExpression
    |   Identifier
    |   Constant
    ;

extraExpression
    :   Wait
    ;

entityExpression
    :   Self
    |   Level
    ;

threadExpression
    :   Thread
    ;

postfixExpression
    :   declaration
    (   ']]'
    )*
    (   '[' expression ']'
    |   '(' argumentExpressionList? ')'
    |   '.' Identifier
    |   ('++' | '--')
    )*
    ;

argumentExpressionList
    :   assignmentExpression (',' assignmentExpression)*
    ;

unaryExpression
    :
    (   '++' | '--' | '[[' | Sizeof
    )*
    (   PathIdentifier '::'
    )*
    (   postfixExpression
    |   unaryOperator castExpression
    )
    ;

unaryOperator
    :   '&' | '*' | '+' | '-' | '~' | '!'
    ;

castExpression
    :   unaryExpression
    |   DigitSequence
    ;

multiplicativeExpression
    :   castExpression (('*'|'/'|'%') castExpression)*
    ;

additiveExpression
    :   multiplicativeExpression (('+'|'-') multiplicativeExpression)*
    ;

shiftExpression
    :   additiveExpression (('<<'|'>>') additiveExpression)*
    ;

relationalExpression
    :   shiftExpression (('<'|'>'|'<='|'>=') shiftExpression)*
    ;

equalityExpression
    :   relationalExpression (('=='| '!=') relationalExpression)*
    ;

andExpression
    :   equalityExpression ( '&' equalityExpression)*
    ;

exclusiveOrExpression
    :   andExpression ('^' andExpression)*
    ;

inclusiveOrExpression
    :   exclusiveOrExpression ('|' exclusiveOrExpression)*
    ;

logicalAndExpression
    :   inclusiveOrExpression ('&&' inclusiveOrExpression)*
    ;

logicalOrExpression
    :   logicalAndExpression ( '||' logicalAndExpression)*
    ;

conditionalExpression
    :   logicalOrExpression ('?' expression ':' conditionalExpression)?
    ;

assignmentExpression
    :   conditionalExpression
    |   unaryExpression assignmentOperator assignmentExpression
    |   DigitSequence
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

expression
    :   assignmentExpression (',' assignmentExpression)*
    ;

constantExpression
    :   conditionalExpression
    ;

initDeclaratorList
    :   initDeclarator (',' initDeclarator)*
    ;

initDeclarator
    :   declarator ('=' initializer)?
    ;

declarator
    :   Identifier
    |   declarator '(' identifierList? ')'
    ;

directive
    :   IncludeDirective
    ;

identifierList
    :   Identifier (',' Identifier)*
    ;

initializer
    :   assignmentExpression
    ;

statement
    :   labeledStatement
    |   compoundStatement
    |   expressionStatement
    |   selectionStatement
    |   iterationStatement
    |   jumpStatement
    ;

labeledStatement
    :   Identifier ':' statement
    |   Case constantExpression ':' statement
    |   Default ':' statement
    ;

compoundStatement
    :   '{' blockItemList? '}'
    ;

blockItemList
    :   blockItem+
    ;

blockItem
    :   declaration
    |   statement
    ;

expressionStatement
    :   expression? ';'
    ;

selectionStatement
    :   If '(' expression ')' statement (Else statement)?
    |   Switch '(' expression ')' statement
    ;

iterationStatement
    :   While '(' expression ')' statement
    |   Do statement While '(' expression ')' ';'
    |   For '(' forCondition ')' statement
    ;

forCondition
	:   (forDeclaration | expression?) ';' forExpression? ';' forExpression?
	;

forDeclaration
    :   initDeclaratorList
    ;

forExpression
    :   assignmentExpression (',' assignmentExpression)*
    ;

jumpStatement
    :   
    (   Goto Identifier
    |   (Continue | Break)
    |   Return expression?
    )   ';'
    ;

Break : 'break';
Case : 'case';
Default: 'default';
Continue : 'continue';
Do : 'do';
Else : 'else';
For : 'for';
Goto : 'goto';
If : 'if';
Return : 'return';
Sizeof : 'sizeof';
Switch : 'switch';
While : 'while';

Thread : 'thread';
Self : 'self';
Level : 'level';
Wait : 'wait';
Undefined : 'undefined';
EmptyArray : '[]';

LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
PlusPlus : '++';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';
LeftShiftAssign : '<<=';
RightShiftAssign : '>>=';
AndAssign : '&=';
XorAssign : '^=';
OrAssign : '|=';

Equal : '==';
NotEqual : '!=';

Dot : '.';
PathCall : '::';
LeftFunctionPointer : '[[';
RightFunctionPointer : ']]';

Identifier
    :   IdentifierNondigit
    (   IdentifierNondigit
    |   Digit
    )*
    ;

PathIdentifier
    :   IdentifierNondigitPath
    (   IdentifierNondigitPath
    |   Digit
    )*
    ;

fragment IdentifierNondigit
    :   Nondigit
    ;

fragment IdentifierNondigitPath
    :   NondigitPath
    ;

fragment Nondigit
    :   [a-zA-Z_]
    ;

fragment NondigitPath
    :   [a-zA-Z_\\]
    ;

fragment Digit
    :   [0-9]
    ;

fragment NonzeroDigit
    :   [1-9]
    ;

fragment Sign
    :   [+-]
    ;

fragment EscapeSequence
    :   SimpleEscapeSequence
    ;

fragment SimpleEscapeSequence
    :   '\\' ['"?abfnrtv\\]
    ;

fragment SCharSequence
    :   SChar+
    ;

fragment SChar
    :   ~["\\\r\n]
    |   EscapeSequence
    |   '\\\n'
    |   '\\\r\n'
    ;

fragment DecimalConstant
    :   NonzeroDigit Digit*
    ;

fragment IntegerConstant
    :   DecimalConstant
    ;

fragment FloatingConstant
    :   DecimalFloatingConstant
    ;

fragment DecimalFloatingConstant
    :   FractionalConstant
    |   DigitSequence
    ;

fragment FractionalConstant
    :   DigitSequence? '.' DigitSequence
    |   DigitSequence '.'
    ;

fragment StringConstant
    :   StringLiteral+
    ;

fragment UndefinedConstant
    :   Undefined
    ;

fragment ArrayConstant
    :   EmptyArray
    ;

fragment Whitespace
    :   [ \t]+
    ;

fragment Newline
    :   
    (   '\r' '\n'?
    |   '\n'
    )
    ;

fragment DeveloperSection
    :   '/#' .*? '#/'
    ;

fragment BlockComment
    :   '/*' .*? '*/'
    ;

fragment LineComment
    :   '//' ~[\r\n]*
    ;

Constant
    :   IntegerConstant
    |   FloatingConstant
    |   StringConstant
    |   UndefinedConstant
    |   ArrayConstant
    ;

StringLiteral
    :   '"' SCharSequence? '"'
    ;

DigitSequence
    :   Digit+
    ;

IncludeDirective
    :   '#' Whitespace? 'include' Whitespace PathIdentifier Whitespace? ';'
    ;

Skip
    :
    (   Whitespace
    |   BlockComment
    |   LineComment
    |   Newline
    )
    ->  channel(HIDDEN)
    ;
