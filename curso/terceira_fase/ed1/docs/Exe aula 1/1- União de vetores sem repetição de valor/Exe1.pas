Program Pzim ;

type  TVet = array [1..100] of integer;

var aVet1, aVet2, aVet3 :TVet;
		iTamVet1, iTamVet2, iTamVet3, iTamResult :integer;  
		iIndice :integer;

procedure LeVetor(Vetor: TVet; iTam1: integer);
var iCont :integer;
begin
	For iCont:= 1 to iTam1 do
	begin      
		readln(Vetor[iCont]);
	end;	
end;

Procedure EscreveVetor(Vetor: TVet; iTam:integer);
var iCont :integer;
begin
	For iCont:= 1 to iTam do
	begin
		Write(' | ',Vetor[iCont],' |');	
	end;
end;

Function VerificaValorVetor(aVetor :TVet;iTam, iNum :integer): boolean;
var iCont :integer;
begin
	VerificaValorVetor:= false;
	For iCont:= 1 to iTam do
	begin
		If aVetor[iCont] <> iNum then
			VerificaValorVetor:= true;
	end;	  	
end;  


Function FormaResult(Vet:TVet; iTam :integer): TVet;
var iCont, iContResult :integer;
begin      	
	For iCont:= iCont to iTam	do
	begin
		If (VerificaValorVetor = true) then
		begin
			FormaResult[iTamResult+1]:= Vet[iCont];	
			inc(iTamResult);  
		end;			
	end;	
end; 

Begin
		Writeln('Escreva o vetor 1: ');
		LeVetor(aVet1, iTamVet1);
		EscreveVetor(aVet1, iTamVet1);
		FormaResult(aVet1, iTamVet1);
		Writeln('');
		Writeln('');
		Writeln('Escreva o vetor 2: ');
		LeVetor(aVet2, iTamVet2);
		EscreveVetor(aVet2, iTamVet2);                                     
		FormaResult(aVet2, iTamVet2);
		Writeln('');
		Writeln('');
		Writeln('Escreva o vetor 3: ');
		LeVetor(aVet3, iTamVet3);
		EscreveVetor(aVet3, iTamVet3);
    FormaResult(aVet3, iTamVet3);
    Writeln('');
    Writeln('');
  
End.

{Faça um algoritmo para ler tres vetores de tamanhos distintos e gerar um quarto vetor com todos os elementos dos vetores lidos, 
porém sem que haja repetição de elementos. O algoritmo deverá ainda escrever os quatro vetores. }