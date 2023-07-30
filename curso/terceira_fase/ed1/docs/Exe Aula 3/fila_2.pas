Program fila_2;

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
	ReadLn(iRes);
	Opcoes:= iRes;
	WriteLn('');
end;

procedure InsertFila(var Fila :TVetor; var PosFila :integer);
var iNum :integer;
begin
	inc(PosFila);
	WriteLn('Informe o numero que deseja inserir na posicao ', PosFila, ': ');
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

procedure StatusFila(PosFila, Tam :integer);
begin
	If PosFila = Tam then
		WriteLn('Fila cheia.')
	Else
	If PosFila=0 then
		WriteLn('A fila esta vazia');
end;

Begin
	iPos:= 0;
	Repeat
		QuebraLinha;
			iOpcao:= Opcoes;
			Case iOpcao of
				1 :
				begin
					If iPos<Tam then
						InsertFila(aFila, iPos)
					Else
						StatusFila(iPos, Tam);;
				end;
				2 :
				begin
					If iPos > 0 then
						RemoveFila(aFila, iPos)
					Else
						StatusFila(iPos, Tam);
				end;
				3 :
				begin
					If iPos > 0 then
						WriteFila(aFila, iPos)
					Else
						StatusFila(iPos,Tam);
				end
				Else
					WriteLn('Digite uma opcao valida.');     				
			end;
		QuebraLinha;
	until iOpcao = 4;
  
End.