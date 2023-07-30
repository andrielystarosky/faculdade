//Andriely R Starosky
Program exe_01;

const TAM = 5;

Type TVetor = array[1..TAM] of integer;

Var aFila :TVetor;
		iOpcao, iPosFila :integer;
		
Procedure Inicializa(var Opcao, PosFila :integer);
begin
	Opcao:=0;
	PosFila:=0;
end;
		
Function EscolheOpcao : integer;
var iAux :integer;
begin
	WriteLn('|1|Criar/Editar Fila');
	WriteLn('|2|Inverter Fila');
	WriteLn('|3|Limpar Tela');
	WriteLn('|4|Sair');
	WriteLn('');
	ReadLn(iAux);
	EscolheOpcao:=iAux;
end;

procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('----------------------------------------------------------------');
	WriteLn('');
end;

//FILA

function EscolheOpcaoFila :integer;
var iAux :integer;
begin
	WriteLn('|1| Inserir');
	WriteLn('|2| Remover');
	WriteLn('|3| Mostrar');
	WriteLn('|4| Voltar');
	WriteLn('');
	ReadLn(iAux);
	EscolheOpcaoFila:= iAux;
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
	WriteLn('');
	for iIdx:= 1 to PosFila do
		write(' | ', Fila[iIdx], ' | ');
	WriteLn('');
end;

procedure ExcessaoFila(PosFila, Tam, Opcao :integer);
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

Procedure EditFila(var Fila :TVetor; var PosFila :integer; Tam : integer);
var iOpcaoFila :integer;
begin
	iOpcaoFila:=0;
	Repeat
		QuebraLinha;
			iOpcaoFila:= EscolheOpcaoFila;
			if (iOpcaoFila=1) and (PosFila<Tam) then
				InsertFila(aFila, PosFila)
			Else
			If (iOpcaoFila=2) and (PosFila > 0) then
				RemoveFila(aFila, PosFila)
			Else 
			If (iOpcaoFila=3) and (PosFila > 0) then 
				WriteFila(aFila, PosFila)
			Else
			If iOpcaoFila<>4 then 
				ExcessaoFila(PosFila, Tam, iOpcaoFila);   				
		QuebraLinha;
	until iOpcaoFila = 4;
end;

//FIM FILA

//INVERTER

Procedure Inverte(var Fila :TVetor; PosFila :integer);
var aPilha :array[1..100] of integer;
		iIdx1, iIdx2 :integer;
begin
	For iIdx1:= 1 to PosFila do
		aPilha[iIdx1]:=Fila[iIdx1];
	iIdx2:= PosFila;
	For iIdx1:= 1 to PosFila do
		begin
			Fila[iIdx1]:=aPilha[iIdx2];
			dec(iIdx2);
		end;		
end;

//FIM INVERTER

Procedure Excessao(PosFila, Opcao :integer);
begin
	If (PosFila<2) and (iOpcao<>4) then
		WriteLn('Nao ha elementos suficiente.')	
	Else
	If (Opcao<1) or (Opcao>4) then
		WriteLn('Informe uma opcao valida.');	
end;

Begin

	Inicializa(iOpcao, iPosFila);
	Repeat
		QuebraLinha;
		iOpcao:= EscolheOpcao;
		If iOpcao = 1 then
			EditFila(aFila, iPosFila, TAM)	
		Else
		If (iOpcao=2) and (iPosFila>=2) then
			Inverte(aFila, iPosFila)
		Else 
		If (iOpcao=3) then
			Clrscr
		Else
			Excessao(iPosFila, iOpcao); 
	until iOpcao = 4;
  
End.
