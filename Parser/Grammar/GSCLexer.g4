lexer grammar GSCLexer;

tokens { Indent, Dedent }

Break:                              'break';
Case:                               'case';
Default:                            'default';
Continue:                           'continue';
Else:                               'else';
For:                                'for';
If:                                 'if';
Return:                             'return';
Switch:                             'switch';
While:                              'while';

Thread:                             'thread';
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
Mul:                                '*';
Div:                                '/';
Mod:                                '%';
And:                                '&';
Or:                                 '|';
AndAnd:                             '&&';
OrOr:                               '||';
Xor:                                '^';
Not:                                '!';
Tilde:                              '~';

Question:                           '?';
Colon:                              ':';
Semi:                               ';';
Comma:                              ',';

Assign:                             '=';
MulAssign:                          '*=';
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
Qualified:                           '::';

ArrayLiteral:                       '[]';
BooleanLiteral:                     'true' | 'false';
UndefinedLiteral:                   'undefined';
DecimalLiteral:                     DecimalIntegerLiteral | DecimalFractionalLiteral;
StringLiteral:                      '"' CharSequence? '"';

IncludeDirective:                   '#' 'include' Whitespace QualifiedIdentifier;

DeveloperSection:                   '/#' .*? '#/'           -> channel(HIDDEN);
BlockComment:                       '/*' .*? '*/'           -> channel(HIDDEN);
LineComment:                        '//' ~[\r\n]*           -> channel(HIDDEN);
Whitespace:                         [ \t]+                  -> channel(HIDDEN);
Newline:                            ('\r'? '\n' | '\r')     -> channel(HIDDEN);

fragment IdentifierNondigit:        Nondigit;
fragment IdentifierQualified:       NondigitQualified;
fragment Nondigit:                  [a-zA-Z_];
fragment NondigitQualified:         [a-zA-Z_\\];
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

fragment DecimalIntegerLiteral:     '0' | [0-9]+;
fragment DecimalFractionalLiteral:  DecimalIntegerLiteral? '.' [0-9]*;

Identifier
    :   IdentifierNondigit
    (   IdentifierNondigit
    |   Digit
    )*
    ;

QualifiedIdentifier
    :   IdentifierQualified
    (   IdentifierQualified
    |   Digit
    )*
    ;
