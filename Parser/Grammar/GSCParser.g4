parser grammar GSCParser;

options 
{
    tokenVocab = GSCLexer;
}

compilationUnit
    :   translationUnit? EOF
    ;

translationUnit
    :   statement+
    ;

statement
    :   simpleStatement
    |   Newline? Indent? (simpleStatement | compoundStatement)+ Dedent?
    ;

simpleStatement
    :   
    (   variableStatement
    |   entityStatement
    |   labeledStatement
    |   expressionStatement
    |   jumpStatement
    |   waitStatement
    |   threadStatement
    |   directiveStatement
    )   ';'
    ;

compoundStatement
    :   '{' (Newline | statement)* '}'
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
    |   <assoc=right> expression assignmentOperator expression            # AssignmentOperatorExpression
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

variableDeclaration
    :   assignable ('=' expression)?
    ;

expressionStatement
    :   expression?
    ;

variableStatement
    :   variableDeclarationList
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
    :   Goto Identifier
    |   (Continue | Break)
    |   Return expression?  
    ;

directiveStatement
    :   IncludeDirective
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

identifierList
    :   Identifier (',' Identifier)*
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
