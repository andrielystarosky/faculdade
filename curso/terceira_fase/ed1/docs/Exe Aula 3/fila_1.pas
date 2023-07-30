Program fila_1;

TYPE TVetor = array[1..5] of integer; 

procedure InsertFila(var Fila :TVetor; var PosFila :integer);
begin
	inc(PosFila);
	Writeln('Informe o numero para inserir na posicao ', PosFila, ': ');
	ReadLn(Fila[PosFila]);
end;

procedure RemoveFila(var Fila :TVetor; var PosFila :integer);
var iIdx :integer;
begin
	dec(PosFila);
	For iIdx:= 1 to PosFila do
		Fila[iIdx]:= Fila[iIdx+1];
end;

procedure WriteFila(Fila :TVetor; var PosFila :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to PosFila do
		Write(' | ',Fila[iIdx], ' | ');
end;

function VerifTam(PosFila, TamMaxFila :integer):boolean;
begin
	If PosFila=TamMaxFila then
		VerifTam:= false
	Else
		VerifTam:= true;    		
end;

Procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('-----------------------------------------------------------------------------');
	WriteLn('');
end;


var aFila : TVetor;
    iPos, iOpcao, iTam :integer;
    
Begin
	iPos:=0;
	iTam:= 5;
	Repeat
		QuebraLinha;
		iOpcao:= 99;
		WriteLn('Digite |1| para inserir, |2| para remover, |3| para escrever; |0| para sair');
		ReadLn(iOpcao);
		If (iOpcao=3) and (iPos>0) then
			WriteFila(aFila,iPos)
		Else if (iOpcao=3) and (iPos=0) then
			WriteLn('Nao ha fila.')
		Else if (iOpcao=1) and (iPos>=iTam) then
			WriteLn('Fila cheia.')
		Else if (VerifTam(iPos,iTam)) and (iOpcao=1) then
			InsertFila(aFila, iPos)
		Else if (iOpcao=2) then
			RemoveFila(aFila, iPos)	
		Else if iOpcao<>0 then
			WriteLn('Informe uma opcao valida.');
	until iOpcao = 0;
		
	
	

  
End.