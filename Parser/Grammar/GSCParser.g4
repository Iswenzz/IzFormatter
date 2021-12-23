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
    :   translationUnit? EOF {BuildFormatting();}
    ;

translationUnit
    :   statement+
    ;

statement
    :   (simpleStatement | compoundStatement)+
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
    :   indent='{' statement* dedent='}'
    |   selectionStatement
    |   iterationStatement
    |   newline=functionStatement
    ;

literal
    :   UndefinedLiteral
    |   BooleanLiteral
    |   StringLiteral
    |   ArrayLiteral
    |   DecimalLiteral
    ;

expressionSequence
    :   expression (wsr=',' expression)*
    ;

expression
    :   expression '(' expressionSequence? ')' wsl=expression?            # FunctionExpression
    |   expression '[' expression ']' wsl=expression?                     # MemberIndexExpression
    |   expression '.' expression                                         # MemberDotExpression
    |   expression '++'                                                   # PostIncrementExpression
    |   expression '--'                                                   # PostDecreaseExpression
    |   PathIdentifier '::' expression                                    # FileExpression
    |   '[[' expression ']]' '(' expressionSequence? ')' wsl=expression?  # CallFunctionPointerExpression
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
    :   expression newline=';'
    ;

labeledStatement
    :   Identifier ':' newline=statement
    |   wsr=Case expression ':' indent=statement
    |   Default ':' indent=statement
    ;

selectionStatement
    :   wsr=If '(' expression ')' statement (wsr=Else statement)?
    |   wsr=Switch '(' expression ')' statement
    ;

waitStatement
    :   wsr=Wait '('? expression ')'? newline=';'
    ;

threadStatement
    :   wsr=Thread expressionStatement
    ;

entityStatement
    :   wsr=entity
    (   threadStatement
    |   newline=expressionStatement
    )
    ;

iterationStatement
    :   wsr=While '(' expression ')' statement
    |   wsr=For '(' expressionSequence? wsr=';' expressionSequence? wsr=';' expressionSequence? ')' statement
    ;

jumpStatement
    :   
    (   Goto Identifier
    |   (Continue | Break)
    |   wsr=Return expression?
    )   newline=';' 
    ;

directiveStatement
    :   IncludeDirective newline=';'
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

identifierList
    :   Identifier (wsr=',' Identifier)*
    ;

identifier
    :   Identifier
    ;

entity
    :   Self
    |   Level
    |   Identifier
    ;
