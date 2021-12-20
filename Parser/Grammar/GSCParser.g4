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
    |   Case expression ':' statement
    |   Default ':' statement
    ;

selectionStatement
    :   If '(' expression ')' statement (Else statement)?
    |   Switch '(' expression ')' statement
    ;

waitStatement
    :   Wait ('(')? expression (')')? ';'
    ;

threadStatement
    :   Thread expression ';'
    ;

entityStatement
    :   entity
    (   threadStatement
    |   expression
    )   ';'
    ;

iterationStatement
    :   While '(' expression ')' statement
    |   For '(' expressionSequence? ';' expressionSequence? ';' expressionSequence? ')' statement
    ;

jumpStatement
    :   
    (   Goto Identifier
    |   (Continue | Break)
    |   Return expression?
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
