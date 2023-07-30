Program exe_converter;

CONST TAM = 5;

Type TVetor = array[1..TAM] of integer;

var aFila :TVetor;
		iPos, iOpcao :integer;

Procedure QuebraLinha;
begin
  WriteLn('');
  WriteLn('---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.---');
  WriteLn('');
end;

Procedure Inicializa(iPos, iOpcao :integer);
begin
  iPos:=0;
  iOpcao:=0;
end;

Function EscolheOpcao :integer;
var iAux :integer;
begin
  WriteLn('|1|Editar/Criar');
  WriteLn('|2|Inverter');
  WriteLn('|3|Limpar tela');
  WriteLn('|4|Sair');
  Write('	->');
  ReadLn(iAux);
  EscolheOpcao:= iAux;
  WriteLn('');
end;

Function EscolheNum :integer;
var iAux :integer;
begin
	WriteLn('Informe o numero: ');
	Write('		->');
	ReadLn(iAux);	
	EscolheNum:=iAux;
	WriteLn('');
end;

Procedure Excessao(iPos, Tam, Opcao, MaxOpcao :integer);
begin
	If iPos = Tam then
		WriteLn('	Fila cheia.')
	Else
	If iPos = 0 then
		WriteLn('Fila vazia.')
	Else
	If (Opcao<0) or (Opcao>MaxOpcao) then
		WriteLn('Opcao invalida.');
end;

//FILA

Function EscolheOpcaoFila :integer;
var iAux :integer;
begin
	WriteLn('|1|Inserir');
  WriteLn('|2|Remover');
  WriteLn('|3|Mostrar');
  WriteLn('|4|Voltar');
  Write('	->');
  ReadLn(iAux);
  EscolheOpcaoFila:= iAux;
  WriteLn('');	
end;

Procedure InsertFila(var aFila :TVetor; var PosFila, Num :integer; mensagem :boolean);
begin
	inc(PosFila);
	aFila[PosFila]:= Num;	
	If mensagem then
		WriteLn('	->Inserido com sucesso.');
end;

Procedure RemoveFila(var aFila :TVetor; var PosFila :integer;  mensagem :boolean);
var iIdx :integer;
begin
	Dec(PosFila);
	For iIdx:= 1 to PosFila do
		aFila[iIdx]:= aFila[iIdx+1];
	If mensagem then
		WriteLn('Removido com sucesso.');
end;

Procedure MostrarFila(aFila :TVetor; PosFila :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to PosFila do
		Write(' | ', aFila[iIdx], ' | ');	
end;

Procedure EditFila(var aFila :TVetor; var PosFila :integer);
var iOpcaoFila, iNum :integer;
begin
	iOpcaoFila:= 0;
	Repeat
		QuebraLinha;
		iOpcaoFila:= EscolheOpcaoFila;
		If (iOpcaoFila=1) and (PosFila<TAM) then
		begin
			iNum:= EscolheNum;
			InsertFila(aFila,PosFila, iNum, true);
		end
		Else 
		If (iOpcaoFila=2) and (PosFila>0) then 
			RemoveFila(aFila,PosFila, true)
		Else
		If (iOpcaoFila=3) and (PosFila>0) then
			MostrarFila(aFila,PosFila)
		Else
			Excessao(PosFila, TAM, iOpcaoFila, 4); 
	until iOpcaoFila=4;
end;

//FIM FILA  

//PILHA

Procedure InsertPilha(var aPilha :TVetor; var PosPilha, iNum :integer);
begin
	Inc(PosPilha);
	aPilha[PosPilha]:= iNum;
end;

Procedure RemovePilha(var PosPilha :integer);
begin
	Dec(PosPilha);
end;

//FIM PILHA

Procedure Inverter(var aFila :TVetor; var PosFila :integer);  
Type TPilha = array[1..TAM] of integer;
var aPilha :TPilha; 
		iIdx, iAux, iPosPilha :integer;
begin
	iAux:= PosFila;
	iPosPilha:=0;
	
	For iIdx:= 1 to iAux do
	begin
		InsertPilha(aPilha, iPosPilha, aFila[1]);
		RemoveFila(aFila, PosFila, false);
	end;
		
	For iIdx:= iAux downto 1 do
	begin     
		InsertFila(aFila, PosFila, aPilha[iPosPilha], false);
		RemovePilha(iPosPilha);	
	end;
	
	WriteLn('	->Processo concluido com sucesso.');
end;

Begin
	Inicializa(iPos, iOpcao);
	Repeat
		QuebraLinha;
		iOpcao:= EscolheOpcao;
		If (iOpcao=1) then
			EditFila(aFila, iPos)
		Else
		If (iOpcao=2) then
		begin
			If iPos>1 then
				Inverter(aFila, iPos)
			Else
			If iPos<=1 then
				WriteLn('	->Elementos insuficientes.');
		end
		Else 
		If (iOpcao=3) then
			Clrscr
		Else
			Excessao(iPos, TAM, iOpcao, 4);
	Until iOpcao = 4;  
End.