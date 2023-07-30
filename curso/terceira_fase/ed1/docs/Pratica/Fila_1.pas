Program pr_fila_1;

CONST TAM = 5;

Type 	
	TVetor = array[1..TAM] of integer;

Var aFila :TVetor;
    iOpcao, iPosicao :integer;
    
procedure Inicializa;
begin
	iOpcao:=0;
	iPosicao:=0;
end;
    
procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('------------------------------------------------------------');
	WriteLn('');
end;

function EscolheOpcao :integer;
var iRes :integer;
begin
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Limpar');
	WriteLn('|5|Sair');
	WriteLn('');
	ReadLn(iRes); 
	EscolheOpcao:= iRes;
end;

procedure InsertFila(var Fila :TVetor; var Posicao :integer);
var iNum :integer;
begin
	inc(Posicao);
	WriteLn('Qual valor deseja inserir? ');
	ReadLn(iNum);

  Fila[Posicao]:= iNum;
end;

procedure RemoveFila(var Fila :TVetor; var Posicao :integer);
var iIdx :integer;
begin
	dec(Posicao);
	For iIdx:= 1 to Posicao do
		Fila[iIdx]:= Fila[iIdx+1];	
end;

procedure MostraFila(Fila :TVetor; Posicao :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to Posicao do
		Write(' | ', Fila[iIdx], ' | ');
end;

procedure Excessao(Posicao, Tam, Opcao :integer);
begin
	If Posicao=Tam then
		WriteLn('Fila cheia.')
	Else 
	If Posicao=0 then
		WriteLn('Fila vazia.')
	Else
	If (Opcao<0) or (Opcao>5) then
		WriteLn('Opcao invalida');  		
end;

Begin
	Inicializa;
	Repeat 
		iOpcao:= EscolheOpcao;
		If (iOpcao=1) and (iPosicao<TAM) then
			InsertFila(aFila, iPosicao)
		Else
		If (iOpcao=2) and (iPosicao>0) then
			RemoveFila(aFila, iPosicao)
		Else
		If (iOpcao=3) and (iPosicao>0) then
			MostraFila(aFila, iPosicao)
		Else
		If (iOpcao=4) then
			Clrscr
		Else
			Excessao(iPosicao, TAM, iOpcao);
	until iOpcao = 5;  
End.