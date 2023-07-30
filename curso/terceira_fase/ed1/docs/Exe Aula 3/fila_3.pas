Program fila_3;

CONST TAM = 5;

Type TVetor = array[1..Tam] of integer;

var aFila : TVetor; 
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

procedure InsertFila(var Fila :TVetor; var PosFila :integer);
var iNum :integer;
begin
	inc(PosFila);
	WriteLn('		->Informe o numero que deseja inserir na posicao ', PosFila, ': ');
	ReadLn(iNum);
	Fila[PosFila]:= iNum;
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
	for iIdx:= 1 to PosFila do
		write(' | ', Fila[iIdx], ' | ');
end;

procedure Excessao(PosFila, Tam, Opcao :integer);
begin
	If PosFila = Tam then
		WriteLn('Fila cheia.')
	Else
	If PosFila=0 then
		WriteLn('A fila esta vazia')
	Else
	If (Opcao<1) or (Opcao>4) then
		WriteLn('Informe uma opcao valida.')
	
end;

Begin
	iPos:= 0;
	Repeat
		QuebraLinha;
			iOpcao:= Opcoes;
			if (iOpcao=1) and (iPos<Tam) then
				InsertFila(aFila, iPos)
			Else
			If (iOpcao=2) and (iPos > 0) then
				RemoveFila(aFila, iPos)
			Else 
			If (iOpcao=3) and (iPos > 0) then 
				WriteFila(aFila, iPos);				
			Else
			If iOpcao<>4 then 
				Excessao(iPos, Tam, Opcao);   				
		QuebraLinha;
	until iOpcao = 4;
	
  
End.