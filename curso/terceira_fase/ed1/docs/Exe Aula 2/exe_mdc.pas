Program calc_mdc;

var iNum1, iNum2 :integer;

Function MMC(Num1, Num2 :integer):integer;
var aux :integer;
begin
	aux:=1;
	For aux:= 1 to num1 do
		If (num1 mod aux = 0) and (num2 mod aux = 0) then
			MMC:=aux;
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
	WriteLn(MMC(iNum1, iNum2));
  
End.

{Faça um algoritmo que leia dois números inteiros e positivos e encontre o número que seja o maior divisor de ambos os números }