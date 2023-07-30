Program calc_mdc_2;

var iNum1, iNum2 :integer;

Function MDC(Num1, Num2 :integer):integer;
var aux, iCont :integer;
begin
	iCont:= Num1;
	aux:=0;
	While (iCont>0) and (aux=0) do
	begin
		If (num1 mod iCont = 0) and (num2 mod iCont = 0) then
		begin
			MDC:=iCont;
			inc(aux);
		end;
		
		dec(iCont);
	end;
end;

Procedure MenorNum(var Num1, Num2 :integer);
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
	MenorNum(iNum1, iNum2);
	WriteLn(MDC(iNum1, iNum2));
  
End.

{Faça um algoritmo que leia dois números inteiros e positivos e encontre o número que seja o maior divisor de ambos os números }