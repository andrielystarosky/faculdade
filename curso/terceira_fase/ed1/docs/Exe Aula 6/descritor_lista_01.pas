Program lista_descritor;

CONST TAM = 5;

Type TLista = record
		iOpcao :integer;
		iTamPc :integer;
		iNum :integer;
		iPos :integer;
		aLista :array[1..TAM] of integer;
end;

var Lista :TLista;

Procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('--------------------------------------------------------------');
	WriteLn('');
end;

Procedure Inicializa(var Lista :TLista);
begin
	With Lista do
	begin
		iOpcao:=-0;
		iTamPc:=0;
	end;
end;

Procedure EscolheOpcao(var Lista :TLista);
begin
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Limpar Tela');
	WriteLn('|5|Sair');
	WriteLn('');
	ReadLn(Lista.iOpcao);
end;

Procedure EscolheNum(var Lista :TLista);
begin
	WriteLn('	->Informe o numero: ');
	ReadLn(Lista.iNum);	
end;

Function PosNumExiste(Lista :TLista):integer;
var iInicio, iMeio, iFim, iAux :integer;                                     
begin
	iInicio:=1;
	iFim:=Lista.iTamPc;
	iAux:=-1;
	While (iAux=-1) and (iInicio<=iFim) do
	begin
		iMeio:= (iInicio+iFim) div 2;
		If Lista.aLista[iMeio]=Lista.iNum then
			iAux:=iMeio
		Else
		If Lista.aLista[iMeio]>Lista.iNum then
			iFim:= iMeio-1
		Else
			iInicio:= iMeio+1;
	end;
	
	PosNumExiste:= iAux;
end;

//INSERT

Function PosInsert(var Lista :TLista) :integer;
var iAux, iPos :integer;
begin
	iAux:=1;
	If Lista.iTamPc=0 then
		PosInsert:=1
	Else
	If Lista.iNum>Lista.aLista[Lista.iTamPc] then
		PosInsert:=Lista.iTamPc+1
	Else
	begin
		If PosNumExiste(Lista)=-1 then
			iAux:=-1
		Else
			While iAux<= Lista.iNum do
				inc(iAux);
		PosInsert:=iAux+1;
	end;
end;

Procedure InsertLista(var Lista :TLista);
var iIdx :integer;
begin
	EscolheNum;
	Lista.iPos:= PosInsert(Lista);
	If Lista.iPos=-1 then
		WriteLn('	->Numero ja esta na lista.')
	Else	
	begin
		inc(Lista.iTamPc);
		If Lista.iPos=1 then
			Lista.iPos:= Lista.iNum
		Else 
		begin	
			For iIdx:= Lista.iTamPc downto Lista.iPos+1 do
				Lista.aLista[iIdx]:=Lista.aLista[iIdx-1];
			Lista.aLista[Lista.iPos]:= Lista.iNum;
		end;
	end;
	
	WriteLn('Inserido com sucesso.');
end;

//FIM INSERT

//REMOVE
Procedure RemoveLista(var Lista :TLista);
var iIdx :integer;
begin
	EscolheNum(Lista);
	Lista.iPos:=PosNumExiste(Lista);
	If Lista.iPos<>-1 then
		WriteLn('Numero nao esta na lista.')
	Else
	begin
		dec(Lista.iTamPc);
		For iIdx:= Lista.iPos to Lista.iTamPc do 
			Lista.aLista[iIdx]:= Lista.aLista[iIdx+1]
	end;
end;

//FIM REMOVE

//MOSTRAR LISTA
Procedure MostrarLista(Lista :TLista);
var iIdx :integer;
begin
	For iIdx:= 1 to Lista.iTamPc do
		Write(' | ', Lista.aLista[iIdx], ' | ');
end;

//FIM MOSTRAR

Procedure Excessao(Lista :TLista);
begin
	With Lista do
	begin
		If (iOpcao<0) or (iOpcao>5) then
			WriteLn('Opcao invalida.')
		Else
		If iTamPc=TAM then
			WriteLn('Lista cheia.')
		Else
		If iTamPc=0 then
			WriteLn('Lista vazia.');	 
	end;
end;

Begin
	Inicializa(Lista);
	Repeat
		QuebraLinha;
		EscolheOpcao(Lista);
		If (Lista.iOpcao=1) and (Lista.iTamPc<TAM) then
			InsertLista(Lista)
		Else
		If (Lista.iOpcao=2) and (Lista.iTamPc>0) then
			RemoveLista(Lista)
		Else
		If (Lista.iOpcao=3) and (Lista.iTamPc>0) then
			MostrarLista(Lista)
		Else
		If Lista.iOpcao=4 then
			Clrscr
		Else
			Excessao(Lista);
	until Lista.iOpcao=5;
  
End.