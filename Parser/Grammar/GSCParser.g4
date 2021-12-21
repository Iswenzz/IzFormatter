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
    :   translationUnit? EOF
    ;

translationUnit
    :   statement+
    ;

statement
    :   Newline? (simpleStatement | compoundStatement)+ Newline?
    ;

simpleStatement
    :   expressionStatement
    |   entityStatement
    |   labeledStatement
    |   jumpStatement
    |   waitStatement
    |   threadStatement
    |   directiveStatement 
    ;

compoundStatement
    :   Newline? '{' statement* '}' Newline?
    |   selectionStatement
    |   iterationStatement
    |   functionStatement
    ;

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;

expressionSequence
    :   expression (',' expression)*
    ;

expression
    :   expression '(' expressionSequence? ')' ws=expression?             # FunctionExpression
    |   expression '[' expression ']' ws=expression?                      # MemberIndexExpression
    |   expression '.' expression                                         # MemberDotExpression
    |   expression '++'                                                   # PostIncrementExpression
    |   expression '--'                                                   # PostDecreaseExpression
    |   PathIdentifier '::' expression                                    # FileExpression
    |   '[[' expression ']]' '(' expressionSequence? ')' ws=expression?   # CallFunctionPointerExpression
    |   '::' expression                                                   # FunctionPointerExpression
    |   '++' expression                                                   # PreIncrementExpression
    |   '--' expression                                                   # PreDecreaseExpression
    |   '+' expression                                                    # UnaryPlusExpression
    |   '-' expression                                                    # UnaryMinusExpression
    |   '~' expression                                                    # BitNotExpression
    |   '!' expression                                                    # NotExpression
    |   expression ws=('*' | '/' | '%') expression                        # MultiplicativeExpression
    |   expression ws=('+' | '-') expression                              # AdditiveExpression
    |   expression ws=('<<' | '>>' | '>>') expression                     # BitShiftExpression
    |   expression ws=('<' | '>' | '<=' | '>=') expression                # RelationalExpression
    |   expression ws=('==' | '!=') expression                            # EqualityExpression
    |   expression ws='&' expression                                      # BitAndExpression
    |   expression ws='^' expression                                      # BitXOrExpression
    |   expression ws='|' expression                                      # BitOrExpression
    |   expression ws='&&' expression                                     # LogicalAndExpression
    |   expression ws='||' expression                                     # LogicalOrExpression
    |   <assoc=right> expression ws='=' expression                        # AssignmentExpression
    |   <assoc=right> expression ws=assignmentOperator expression         # AssignmentOperatorExpression
    |   entityStatement                                                   # EntityStatementExpression
    |   threadStatement                                                   # ThreadStatementExpression
    |   identifier                                                        # IdentifierExpression
    |   entity                                                            # EntityExpression
    |   literal                                                           # LiteralExpression
    |   '(' expressionSequence ')'                                        # ParenthesizedExpression
    ;

functionStatement
    :   identifier '(' identifierList? ')' statement
    ;

expressionStatement
    :   expression? ';'
    ;

labeledStatement
    :   Identifier ':' statement
    |   ws=Case expression ':' statement
    |   Default ':' statement
    ;

selectionStatement
    :   ws=If '(' expression ')' statement (ws=Else statement)?
    |   ws=Switch '(' expression ')' statement
    ;

waitStatement
    :   ws=Wait '('? expression ')'? ';'
    ;

threadStatement
    :   ws=Thread expression ';'
    ;

entityStatement
    :   ws=entity
    (   threadStatement
    |   expression
    )   ';'
    ;

iterationStatement
    :   ws=While '(' expression ')' statement
    |   ws=For '(' expressionSequence? ws=';' expressionSequence? ws=';' expressionSequence? ')' statement
    ;

jumpStatement
    :   
    (   Goto Identifier
    |   (Continue | Break)
    |   ws=Return expression?
    )   ';' 
    ;

directiveStatement
    :   IncludeDirective ';'
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

identifierList
    :   Identifier (',' Identifier)*
    ;

identifier
    :   Identifier
    ;

entity
    :   Self
    |   Level
    |   Identifier
    ;
