Program fatorial_recursivo;

var iNum, iRes :integer;

function CalcFatorial(Num :integer) :integer;
begin  
	If Num = 1 then
		CalcFatorial:= 1
	Else
		CalcFatorial:= Num * CalcFatorial(Num-1);
end;

Begin
	ReadLn(iNum);
	iRes:= CalcFatorial(iNum);
	WriteLn(iRes);    
End.