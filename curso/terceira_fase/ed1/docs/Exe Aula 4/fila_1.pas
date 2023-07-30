Program Lista_1;

Const TAM = 5;
Type TVetor = array[1..TAM] of integer;

var aLista : TVetor;
    iPos´, TamPc :integer;
    
procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('---------------------------------------------------------------------------');
	WriteLn('');
end;

function Opcoes :integer;
begin
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Sair');
	WriteLn('');
	ReadLn(Opcoes);
end;

function Posicao(Lista: TVetor; Tam, Num :integer;) :integer;
var iIdx :integer;
begin
	iIdx:= 1;
	While Lista[iIdx]>Num do
	begin
		inc[iIdx];
	end;
	Posicao:= inc(iIdx);
end;

procedure PosicionaNum(var Lista :TVetor; TamPc, Num, Posicao :integer);
var iIdx :integer;
begin
	inc(TamPc)
	For iIdx:= TamPc downto inc(Posicao) do
	begin
		Lista[iIdx]:= Lista[iIdx+1];
	end;
	Lista[Posicao]:= Num;
end;

function EncontraNum(Lista :TVetor; TamPc, Num :integer) :integer;
var iIdx, iAux :integer;
begin
	inc(iIdx);
	iAux:= 0;
	while (iIdx<=TamPc) and (iAux=0) do
	begin
		If Lista[iIdx]=Num then
			iAux:= iIdx;
		inc(iIdx);
	end;
	EncontraNum:= iIdx;
end;

procedure InsertLista(var Lista :TVetor; var TamPc :integer; );
var iNum, iPosicao :integer;
begin
	WriteLn('Informe o numero que deseja inserir: ');
	ReadLn(iNum);
	If Lista[Tam]<Num then
		Lista[Tam+1]:=iNum
	Else
	begin
		iPosicao:= Posicao(Lista,Tampc,iNum);
		PosicionaNum(Lista, TamPc, iNum, iPosicao);
	end;  
	in(TamPc);  	
end;

procedure RemoveLista(var Lista :TVetor; var TamPc :integer);
var iPosicao, iNum :integer;
begin
	WriteLn('Informe o numero que deseja remover: ');
	ReadLn(iNum);
	iPocicao:= EncontraNum(Lista, TamPc, iNum);
	For iPosicao:= iPosicao to dec(TamPc) do
		Lista[iPosicao]:= Lista[iPosicao+1];
	dec(TamPc); 
end;

procedure MostraLista(lista :TVetor; TamPc :integer);
var iIdx :integer;
begin
	For iIdx:= 1 to TamPc do
		WriteLn(' | ', Lista[iIdx], ' | ');
end;

Begin
	iPos:= 0;
	Repeat
		QuebraLinha;
		iOpcao:= Opcoes;
		If (iOpcao=1) and (TamPc<TAM) then
			InsertLista()
		Else 
		If (iOpcao=2) and (TamPc>0) then
			RemoveLista()
		Else 
		If (iOpcao=3) and (TamPc>0) then
			MostraLista()
		Else 
		If (iOpcao<>1) and (iOpcao<>2) and (iOpcao<>3) and (iOpcao<>4) then
		QuebraLinha;
	until iPos = 4;
  
End.