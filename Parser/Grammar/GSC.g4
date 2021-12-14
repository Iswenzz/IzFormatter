grammar GSC;

compilationUnit
    :   translationUnit? EOF
    ;

translationUnit
    :   statement+
    ;

statement
    :   variableStatement
    |   entityStatement
    |   labeledStatement
    |   compoundStatement
    |   expressionStatement
    |   selectionStatement
    |   iterationStatement
    |   jumpStatement
    |   waitStatement
    |   threadStatement
    |   functionDeclaration
    ;

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;

expressionSequence
    : expression (',' expression)*
    ;

expression
    :   expression '(' expressionSequence? ')' expression?                # FunctionExpression
    |   expression '[' expression ']' expression?                         # MemberIndexExpression
    |   expression '.' expression                                         # MemberDotExpression
    |   expression '++'                                                   # PostIncrementExpression
    |   expression '--'                                                   # PostDecreaseExpression
    |   PathIdentifier '::' expression                                    # FileExpression
    |   '[[' expression ']]' '(' expressionSequence? ')' expression?      # CallFunctionPointerExpression
    |   '::' expression                                                   # FunctionPointerExpression
    |   '++' expression                                                   # PreIncrementExpression
    |   '--' expression                                                   # PreDecreaseExpression
    |   '+' expression                                                    # UnaryPlusExpression
    |   '-' expression                                                    # UnaryMinusExpression
    |   '~' expression                                                    # BitNotExpression
    |   '!' expression                                                    # NotExpression
    |   expression ('*' | '/' | '%') expression                           # MultiplicativeExpression
    |   expression ('+' | '-') expression                                 # AdditiveExpression
    |   expression ('<<' | '>>' | '>>') expression                        # BitShiftExpression
    |   expression ('<' | '>' | '<=' | '>=') expression                   # RelationalExpression
    |   expression ('==' | '!=') expression                               # EqualityExpression
    |   expression '&' expression                                         # BitAndExpression
    |   expression '^' expression                                         # BitXOrExpression
    |   expression '|' expression                                         # BitOrExpression
    |   expression '&&' expression                                        # LogicalAndExpression
    |   expression '||' expression                                        # LogicalOrExpression
    |   <assoc=right> expression '=' expression                           # AssignmentExpression
    |   <assoc=right> expression assignmentOperator expression            # AssignmentOperatorExpression
    |   entityStatement                                                   # EntityStatementExpression
    |   threadStatement                                                   # ThreadStatementExpression
    |   directive                                                         # DirectiveExpression
    |   identifier                                                        # IdentifierExpression
    |   entity                                                            # EntityExpression
    |   literal                                                           # LiteralExpression
    |   '(' expressionSequence ')'                                        # ParenthesizedExpression
    ;

functionDeclaration
    :   identifier '(' identifierList? ')' compoundStatement
    ;

variableDeclaration
    :   assignable ('=' expression)? ';'
    ;

expressionStatement
    :   expression? ';'
    ;

variableStatement
    :   variableDeclarationList ';'
    ;

labeledStatement
    :   Identifier ':' statement
    |   Case expression ':' statement
    |   Default ':' statement
    ;

selectionStatement
    :   If '(' expression ')' statement (Else statement)?
    |   Switch '(' expression ')' statement
    ;

waitStatement
    :   Wait ('(')? expression (')')?
    ;

threadStatement
    :   Thread expression
    ;

entityStatement
    :   entity
    (   threadStatement
    |   expression
    )
    ;

iterationStatement
    :   While '(' expression ')' statement
    |   For '(' (expressionSequence | variableDeclarationList)? ';' expressionSequence? ';' expressionSequence? ')' statement
    ;

jumpStatement
    :   
    (   Goto Identifier
    |   (Continue | Break)
    |   Return expression?
    )   ';'
    ;

compoundStatement
    :   '{' blockItemList? '}'
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

identifierList
    :   Identifier (',' Identifier)*
    ;

blockItemList
    :   statement+
    ;

variableDeclarationList
    :   variableDeclaration (',' variableDeclaration)*
    ;

identifier
    :   Identifier
    ;

entity
    :   Self
    |   Level
    |   Identifier
    ;

assignable
    :   identifier
    ;

directive
    :   IncludeDirective
    ;

Break:                              'break';
Case:                               'case';
Default:                            'default';
Continue:                           'continue';
Else:                               'else';
For:                                'for';
Goto:                               'goto';
If:                                 'if';
Return:                             'return';
Switch:                             'switch';
While:                              'while';

Thread:                             'thread';
Self:                               'self';
Level:                              'level';
Wait:                               'wait';

LeftParen:                          '(';
RightParen:                         ')';
LeftBracket:                        '[';
RightBracket:                       ']';
LeftBrace:                          '{';
RightBrace:                         '}';

Less:                               '<';
LessEqual:                          '<=';
Greater:                            '>';
GreaterEqual:                       '>=';
LeftShift:                          '<<';
RightShift:                         '>>';

Plus:                               '+';
PlusPlus:                           '++';
Minus:                              '-';
MinusMinus:                         '--';
Star:                               '*';
Div:                                '/';
Mod:                                '%';
And:                                '&';
Or:                                 '|';
AndAnd:                             '&&';
OrOr:                               '||';
Caret:                              '^';
Not:                                '!';
Tilde:                              '~';

Question:                           '?';
Colon:                              ':';
Semi:                               ';';
Comma:                              ',';

Assign:                             '=';
StarAssign:                         '*=';
DivAssign:                          '/=';
ModAssign:                          '%=';
PlusAssign:                         '+=';
MinusAssign:                        '-=';
LeftShiftAssign:                    '<<=';
RightShiftAssign:                   '>>=';
AndAssign:                          '&=';
XorAssign:                          '^=';
OrAssign:                           '|=';
Equal:                              '==';
NotEqual:                           '!=';

Dot:                                '.';
PathCall:                           '::';
LeftFunctionPointer:                '[[';
RightFunctionPointer:               ']]';

ArrayLiteral:                       '[]';
BooleanLiteral:                     'true' | 'false';
UndefinedLiteral:                   'undefined';
DecimalLiteral:                     DecimalIntegerLiteral | DecimalFractionalLiteral;
StringLiteral:                      '"' SCharSequence? '"';

DeveloperSection:                   '/#' .*? '#/'           -> channel(HIDDEN);
BlockComment:                       '/*' .*? '*/'           -> channel(HIDDEN);
LineComment:                        '//' ~[\r\n]*           -> channel(HIDDEN);
Whitespace:                         [ \t]+                  -> channel(HIDDEN);
Newline:                            ('\r' '\n'? | '\n')     -> channel(HIDDEN);

IncludeDirective:                   '#' Whitespace? 'include' Whitespace PathIdentifier Whitespace?;

fragment IdentifierNondigit:        Nondigit;
fragment IdentifierNondigitPath:    NondigitPath;
fragment Nondigit:                  [a-zA-Z_];
fragment NondigitPath:              [a-zA-Z_\\];
fragment Digit:                     [0-9];
fragment NonzeroDigit:              [1-9];
fragment Sign:                      [+-];

fragment SimpleEscapeSequence:      '\\' ['"?abfnrtv\\];
fragment SChar:                     ~["\\\r\n] | EscapeSequence | '\\\n' | '\\\r\n';
fragment EscapeSequence:            SimpleEscapeSequence;
fragment SCharSequence:             SChar+;
fragment DigitSequence:             Digit+;

fragment IntegerConstant:           DecimalIntegerLiteral;
fragment FloatingConstant:          DecimalFractionalLiteral;
fragment StringConstant:            StringLiteral;
fragment UndefinedConstant:         UndefinedLiteral;
fragment BooleanConstant:           BooleanLiteral;
fragment ArrayConstant:             ArrayLiteral;

fragment DecimalIntegerLiteral:     '0' | [1-9] [0-9]*;
fragment DecimalFractionalLiteral:  DecimalIntegerLiteral? '.' [0-9]*;

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
