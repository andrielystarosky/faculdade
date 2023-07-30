Program pesquisa_binaria;

CONST TAM = 10;

Type TVetor = array[1..TAM] of integer;

Var aVetor :TVetor;
    iNum, iPesq :integer;

procedure LeVetor(var Vetor :TVetor; Tamanho :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to tamanho do
		Vetor[iIdx]:= random(99);
end;

procedure EscreveVetor(Vetor :TVetor; Tamanho :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to Tamanho do
		Write(' | ', Vetor[iIdx], ' | ');
end;

function PesqBinaria(Vetor :TVetor; Tamanho, Num :integer): integer;
var iPesq, iInicio, iFim, iMeio :integer;
begin
	iInicio:= 1;
	iFim:= Tamanho;
	iPesq:= -1;
	while (iInicio<=iFim) and (iPesq=-1) do
	begin
		iMeio:= (iInicio + iFim) div 2;
		If Vetor[iMeio] = Num then	
			iPesq:= iMeio
		Else
		If Vetor[iMeio]>Num then
		begin
			iFim:= iMeio-1;	
		end
		Else 
		begin
			iInicio:= iMeio+1;
		end; 
	end;
	PesqBinaria:= iPesq;
end; 

Procedure OrdenaVetor(var Vetor :TVetor; Tamanho :integer);
var i, j, iAux :integer;
begin
	for i:= 1 to Tamanho do
		for j:= 1 to Tamanho-1 do
		begin
			If Vetor[j]>Vetor[j+1] then
			begin
				iAux:= Vetor[j];
				Vetor[j]:= Vetor[j+1];
				Vetor[j+1]:= iAux;
			end
		end;
end;

Begin
	LeVetor(aVetor, TAM);  
	OrdenaVetor(aVetor, TAM);
	WriteLn('');
	EscreveVetor(aVetor,TAM);
	WriteLn('');
	WriteLn('Informe um número para pesquisar: ');
	ReadLn(iNum); 
	iPesq:= PesqBinaria(aVetor, TAM, iNum);
	If iPesq <> -1 then
		WriteLn('Numero encontrado na posicao ', iPesq)
	Else
		WriteLn('Numero nao encontrado.');
End.