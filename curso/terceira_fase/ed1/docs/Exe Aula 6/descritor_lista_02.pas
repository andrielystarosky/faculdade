Program desscritor_lista_2 ;

Type TLista = record
	aLista :array[1..100] of integer;
	iTam   :integer;
	iPos   :integer;
	iTamPc :integer;
	iOpcao :integer;
	iNum   :integer;
end;

var Lista :TLista;

Function EscolheOpcao :integer;
var iAux :integer;
begin
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Limpar');
	WriteLn('|5|Sair');	
	Write('  ->');
	ReadLn(iAux);
	EscolheOpcao:= iAux;
	ClrScr; 	
end;

Function EscolheTam :integer;
var iAux :integer;
begin
	WriteLn('	Qual o tamanho da pilha?');
	Write('	->');
	Read(iAux);
	EscolheTam:=iAux;
	ReadKey;
	ClrScr;
end;

Function EscolheNum :integer;
var iAux :integer;
begin
	WriteLn('	Digite o numero:');
	Write('	->');
	ReadLn(iAux);
	EscolheNum:=iAux;
end;

Procedure Inicializa(var Lista :TLista);
begin
	With Lista do
	begin
		iTam :=EscolheTam;
		iPos:=0;
		iTamPc:=0;
		iOpcao:=0;
	end;
end;

Procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('------------------------------------------------------------');
	WriteLn('');
end;

//GERAL
Function PosNumExiste(Lista :TLista) :integer;
var iInicio, iMeio, iFim, iAux :integer;
begin
	iInicio:= 1;
	iFim:=Lista.iTamPc+1;
	iAux:=-1;
	While (iInicio<=iFim) and (iAux=-1) do
	begin
		iMeio:=(iInicio+iFim) div 2;
		If Lista.aLista[iMeio]=Lista.iNum then
			iAux:= iMeio
		Else
		If Lista.aLista[iMeio]>Lista.iNum then
			iFim:= iMeio-1
		Else
			iInicio:= iMeio+1;
	end;
	
  PosNumExiste:=iAux;
end;

//FIM GERAL

//INSERIR
Procedure PosInsert(var Lista :TLista);
var iAux :integer;
begin
	If (Lista.iTamPc=0) or (Lista.iNum>=Lista.aLista[Lista.iTamPc]) then
		Lista.iPos:=Lista.iTamPc+1
	Else
	begin
		iAux:= PosNumExiste(Lista);
		If iAux<>-1 then
			Lista.iPos:=-1  //se iPos=-1 o numero ja existe na lista e nao deve ser inserido
		Else
		begin
			iAux:=1; 
			While Lista.aLista[iAux]<=Lista.iNum do    
				Inc(iAux);
			Lista.iPos:=iAux;
		end;
	end;		
end;

Procedure InsertLista(var Lista :TLista);
var iAux :integer;
begin
	Lista.iNum:= EscolheNum;
	PosInsert(Lista);
	If Lista.iPos=-1 then
		WriteLn('    O numero ja esta na lista. ')
	Else
	begin
		inc(Lista.iTamPc);
		For iAux:= Lista.iTamPc downto Lista.iPos+1 do
			Lista.aLista[iAux]:= Lista.aLista[iAux-1];
		Lista.aLista[Lista.iPos]:= Lista.iNum;
	end;
	WriteLn('  Inserido com sucesso!');
end;
//FIM INSERIR

//MOSTRAR
Procedure MostrarLista(Lista :TLista);
var iIdx :integer;
begin
	For iIdx:= 1 to Lista.iTamPc do
		WriteLn('  ->', Lista.aLista[iIdx]);
end;
//FIM MOSTRAR

Begin
	Inicializa(Lista);
	Repeat
		QuebraLinha;
		With Lista do
		begin
			iOpcao:= EscolheOpcao;
			If (iOpcao=1) and (iTamPc<iTam) then
				InsertLista(Lista)
			Else
			If (iOpcao=3) and (iTamPc>0) then
				MostrarLista(Lista); 
		end;
	until Lista.iOpcao=5;
End.