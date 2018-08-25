%{
#include<stdio.h>
%}

%%

if|else|while|do|break|continue|int|double|long|char|float|return|case|sizeof|short|typedef|switch|unsigned|void|static|struct|goto {printf("This is Keyword");}

([a-z]|_)([a-z]|_|[0-9])*   {printf("This is Valid identifier");}


([0-9]+(?:\.[0-9]+)?)(?:\s)   {printf("This is Real Number");}

([0-9])*   {printf("This is Integer");}



%%

int main(){
	yylex();
	return(0);
} 

int yywrap(){

}