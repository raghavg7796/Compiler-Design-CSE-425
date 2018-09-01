
#Assignment4 : Build a Top-down Parser
import string
import re

def valid_id(id):
	print(id)
	if( not id[0].isalpha() and id[0]!='_'):
		return(False)
	for i in id:
		if not i[0].isalnum() and i[0]!='_':
			return False
	return True

def func(func1,func2,exp,eps):
	ans=False
	if(not exp and eps):
		ans=True

	for i in range(0,len(exp)+1):
		ans=ans or (func1(exp[:i]) and func2(exp[i:]))

		if ans:
			break

	return ans

def F(exp):
	if(len(exp)==1):
		return(valid_id(exp[0]))
	elif( len(exp)>2 and exp[0]=='(' and exp[-1]==")"):
		return(E(exp[1:-1]))
	return(False)

def T_(exp):
	if(len(exp)==0):
		return(True)
	elif(exp[0]!='*'):
		return False
	return(func(F,T_,exp[1:],True))

def T(exp):
	#print(exp)
	return(func(F,T_,exp,False))

def E_(exp):
	#print(exp)
	if(len(exp)==0):
		return(True)
	elif(exp[0]!='+'):
		return False
	return(func(T,E_,exp[1:],True))


def E(exp):
	#print(exp)
	return( func(T,E_,exp,False))

def parser(exp):
	exp=exp.replace(" ","")
	exp=exp.replace("\t","")
	exp=exp.replace("\n","")
	exp=exp.replace("*","$*$")
	exp=exp.replace("+","$+$")
	exp=exp.replace("(","$($")
	exp=exp.replace(")","$)$")
	
	exp=exp.split("$")
	exp=[i for i in exp if i!='$' and i!='']
	print(exp)
	return(E(exp))



while True:
	exp=raw_input("Enter the input :\n")
	if(parser(exp)==True):
		print("***Expression is syntactically true")
	else:
		print("***Expression is syntactically false/wrong")
	print("\n\n")