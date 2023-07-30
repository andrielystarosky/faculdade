Program calc_mdc_recurs_2;

var iNum1, iNum2 :integer;

Function MDC(Num1, Num2 :integer):integer;
begin
	If Num2 = 0 then
		MDC:= Num1
	Else
		MDC:= MDC(Num2, Num1 mod Num2); 
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
	WriteLn(MDC(iNum1, iNum2));
  
End.