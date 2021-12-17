lexer grammar GSCLexer;

tokens { Indent, Dedent }

options 
{
    superClass = GSCLexerBase;
}

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
StringLiteral:                      '"' CharSequence? '"';

IncludeDirective:                   '#' 'include' Whitespace PathIdentifier;

DeveloperSection:                   '/#' .*? '#/'           -> channel(HIDDEN);
BlockComment:                       '/*' .*? '*/'           -> channel(HIDDEN);
LineComment:                        '//' ~[\r\n]*           -> channel(HIDDEN);
Whitespace:                         [ \t]+                  -> channel(HIDDEN);

Newline
    :
    (   {AtStartOfLine()}? Whitespace
    |   ('\r'? '\n' | '\r' | '\f') Whitespace?
    )   {OnNewLine();}
    ;

fragment IdentifierNondigit:        Nondigit;
fragment IdentifierNondigitPath:    NondigitPath;
fragment Nondigit:                  [a-zA-Z_];
fragment NondigitPath:              [a-zA-Z_\\];
fragment Digit:                     [0-9];
fragment NonzeroDigit:              [1-9];
fragment Sign:                      [+-];

fragment SimpleEscapeSequence:      '\\' ['"?abfnrtv\\];
fragment Char:                     ~["\\\r\n] | EscapeSequence | '\\\n' | '\\\r\n';
fragment EscapeSequence:            SimpleEscapeSequence;
fragment CharSequence:              Char+;
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
