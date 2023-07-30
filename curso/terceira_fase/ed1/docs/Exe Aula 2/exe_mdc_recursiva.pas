Program calc_mdc_recurs;

var iNum1, iNum2, iAux :integer;

Function MDC(Num1, Num2 :integer; var Aux :integer):integer;
begin
	If (num1 mod aux = 0) and (num2 mod aux = 0) then
		MDC:= aux
	Else 
	begin
		Dec(Aux);
		MDC:= MDC(Num1,Num2,Aux);	
	end;
end;

Procedure Ordena(var Num1, Num2 :integer);
var aux:integer;
begin
	If Num1>Num2 then
	begin
		aux:=Num1;
		Num1:=Num2;
		Num2:=aux;
	end;
end;

Begin

	ReadLn(iNum1, iNum2);
	Ordena(iNum1, iNum2);
	WriteLn(MDC(iNum1, iNum2, iNum1));
  
End.