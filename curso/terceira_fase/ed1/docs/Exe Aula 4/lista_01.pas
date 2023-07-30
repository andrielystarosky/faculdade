Program Lista_01 ;

CONST TAM = 5;

Type TVetor = array[1..TAM] of integer;

var aLista : TVetor;
iTamPc, iOpcao :integer;

Procedure Inicializa(var TamPc, Opcao :integer);
begin
  TamPc:= 0;
  Opcao:=0;
end;

Procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('-------------------------------------------------------------');
	WriteLn('');
end;

Procedure EscolheOpcao(var Opcao :integer);
begin
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Limpar Tela');
	WriteLn('|5|Sair');
	WriteLn('');
	ReadLn(Opcao);
end;

Function PosNumExiste(Lista :TVetor; TamPc, Num :integer) :integer;
var iInicio, iFim, iMeio, iAux :integer;
begin
  iAux:= -1;
  iInicio:= 1;
  iFim:= TamPc;
  While (iInicio<=iFim) and (iAux=-1) do
  begin
    iMeio:= (iInicio + iFim) div 2;
    If Lista[iMeio]=Num then
    	iAux:= iMeio
    Else
    If Lista[iMeio]>Num then
    	iFim:= iMeio-1
    Else
    	iInicio:= iMeio + 1;
  end;
  PosNumExiste:= iAux;
end;

//INSERIR

Procedure PosInsert(Lista :TVetor; TamPc, Num :integer; var PosInsert :integer);
var iIdx :integer;
begin
  iIdx:=1;
  If (TamPc=1) then
  PosInsert:= TamPc
  Else
  IF Lista[TamPc-1]<=Num then
  PosInsert:= TamPc
  Else
  begin
  	If PosNumExiste(Lista, TamPc, Num)<>-1 then  
			iIdx:= -1
		Else
		begin
	    While Lista[iIdx]<=Num do
	      inc(iIdx);
	  end;
    PosInsert:= iIdx;
  end;
  
end;

Procedure InsertLista(var Lista :TVetor; var TamPc :integer);
var iNum, iIdx, iPos :integer;
begin
  WriteLn('	-->Informe o numero: ');
  ReadLn(iNum);
 	
  Inc(TamPc);
  PosInsert(Lista, TamPc, iNum, iPos);
  If iPos = -1 then
  begin
  	WriteLn('Valor ja esta na lista.');
  	dec(TamPc);
  end
  Else
  begin
	  For iIdx:= TamPc downTo iPos+1 do
	  	Lista[iIdx]:= Lista[iIdx-1];
	  Lista[iPos]:=iNum;
	end;
end;

//FIM INSERIR

//REMOVER


Procedure RemoveLista(var Lista :TVetor; var TamPc :integer);
var iIdx, iNum, iPos :integer;
begin
  WriteLn('	-->Informe o numero: ');
  ReadLn(iNum);
  iPos:= PosNumExiste(Lista, TamPc, iNum);
  If iPos = -1 then
		WriteLn('Valor nao esta na lista.') 
	Else
	begin
		Dec(TamPc);
		For iIdx:= iPos to TamPc do
			Lista[iIdx]:= Lista[iIdx+1];
	end
  
end;

//FIM REMOVER

Procedure MostraLista(Lista :TVetor; TamPc :integer);
var iIdx :integer;
begin
  For iIdx:= 1 to TamPc do
  WriteLn('  => ', Lista[iIdx]);
end; 

Procedure Excessao(TamPc, Tam, Opcao :integer);
begin
	If TamPc=Tam then
		WriteLn('Lista cheia.')
	Else
	If TamPc=0 then
		WriteLn('Lista vazia.')
	Else
	If (Opcao<1) or (Opcao>5) then
		WriteLn('Opcao invalida.');
end;

Begin
  Inicializa(iTamPc, iOpcao);
  Repeat
  	QuebraLinha;
  	EscolheOpcao(iOpcao);
  	If (iOpcao=1) and (iTamPc<TAM) then
  		InsertLista(aLista, iTamPc)
		Else 
		If (iOpcao=2) and (iTamPc>0) then	
			RemoveLista(aLista, iTamPc)
		Else
		If (iOpcao=3) and (iTamPc>0) then
			MostraLista(aLista, iTamPc)
		Else
		If iOpcao=4 then
			Clrscr
		Else
			Excessao(iTamPc, TAM, iOpcao);
			
  until iOpcao=5;
End.
