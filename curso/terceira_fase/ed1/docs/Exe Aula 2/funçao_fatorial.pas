Program fatorial;

var iNum, iRes :integer;

function CalcFatorial(Num :integer) :integer;
var iCont, Res :integer;
begin  
	Res:= 1;
	For iCont:= 2 to Num do
		Res:= Res * iCont;
	CalcFatorial:= Res;
end;

Begin
	ReadLn(iNum);
	iRes:= CalcFatorial(iNum);
	WriteLn(iRes);    
End.
