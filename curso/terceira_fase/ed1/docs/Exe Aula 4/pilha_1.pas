Program pilha_1;

CONST TAM = 5;

Type TVetor = array[1..Tam] of integer;

var aPilha :TVetor;
    iPos, iOpcao :integer;
    
procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('----------------------------------------------------------------');
	WriteLn('');
end;

function Opcoes :integer;
var iRes :integer;
begin
	WriteLn('|1| Inserir');
	WriteLn('|2| Remover');
	WriteLn('|3| Mostrar');
	WriteLn('|4| Sair');
	WriteLn('');
	ReadLn(iRes);
	Opcoes:= iRes;
end;

procedure InsertPilha(var aPilha :TVetor; var PosPilha :integer);
var iNum :integer;
begin
	inc(PosPilha);
	WriteLn('		->Informe o numero a ser inserido na posicao ', PosPilha, ': ');
	ReadLn(iNum);
	aPilha[PosPilha]:= iNum;
end;

procedure RemovePilha(var PosPilha :integer);
begin
	dec(PosPilha);
end;

procedure WritePilha(Pilha :TVetor; PosPilha :integer);
var iIdx :integer;
begin
	For iIdx:=PosPilha downto 1 do
		WriteLn(' | ', Pilha[iIdx] ,' | ');
end;

procedure StatusPilha(PosPilha, Tam :integer);
begin
	If PosPilha = Tam then
		WriteLn('Pilha cheia.')
	Else
	If PosPilha=0 then
		WriteLn('A pilha esta vazia');
end;

Begin
	iPos:= 0;
	Repeat
		QuebraLinha;
		iOpcao:= Opcoes;
		If (iOpcao=1) and (iPos<Tam) then
			InsertPilha(aPilha,iPos)
		Else
		If (iOpcao=2) and (iPos>0) then
					RemovePilha(iPos)
		Else
		If (iOpcao=3) and (iPos>0) then
			WritePilha(aPilha,iPos)
		Else 
		If (iOpcao <> 1) and (iOpcao <> 2) and (iOpcao <> 3) and (iOpcao <> 4) then
			WriteLn('Digite uma opcao valida.')
		Else
		If iOpcao <> 4 then
			StatusPilha(iPos,Tam);
		QuebraLinha;
	
	until iOpcao = 4;
	
	readln;
  
End.