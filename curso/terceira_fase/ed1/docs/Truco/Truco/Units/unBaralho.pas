{Andriely, Aline e Gabriel Morais}
unit unBaralho;

interface

Uses SysUtils;

Type TCarta = record
      iNum   :integer;
      iNaipe :integer;
      iPeso  :integer;
end;

Type TLista = record
      aLista   :array[1..40] of TCarta;
      iNum     :integer;
      iTamPc   :integer;
      iPosAcao :integer;
      iTam     :integer;
end;

Type TFila = record
      aFila    :array[1..40] of TCarta;
      iNum     :integer;
      iTamPc   :integer;
      iPosAcao :integer;
      iTam     :integer;
end;

Type TBaralho = class
  public
    Function  DefinePesoCarta(var iNum :integer) :integer;
    Function  DefineNumero(var iNum :integer) :integer;
    Procedure InsertLista(var Lis :TLista; Carta :TCarta);
    Procedure RemoveLista(var Lis :TLista);
    Procedure InsertFila(var Fil :TFila; Carta :TCarta);
    Procedure RemoveFila(var Fil :TFila);
    Procedure InicializaBaralho(var Lista :TLista);
    Procedure CorteBaralho(var Lis :TLista; var Fil :TFila; jogVez :integer);
end;



var Baralho :TBaralho;
    Lista   :TLista;
    Carta   :TCarta;

    iIdx :integer;

implementation

uses unMensagem;
{ TBaralho }

function TBaralho.DefinePesoCarta(var iNum: integer): integer;
begin
  Case iNum of
    3:   DefinePesoCarta:=15;
    2:   DefinePesoCarta:=14;
    1:   DefinePesoCarta:=13;
    Else DefinePesoCarta:=iNum;
  end;
end;

function TBaralho.DefineNumero(var iNum: integer): integer;
begin
  Case iNum of
    8 : DefineNumero:=10;
    9 : DefineNumero:=11;
    10: DefineNumero:=12;
    Else DefineNumero:= iNum;
  end;
end;

procedure TBaralho.InsertLista(var Lis: TLista; Carta: TCarta);
begin
  Inc(Lis.iTamPc);
  Lis.aLista[Lis.iPosAcao]:= Carta;
end;

procedure TBaralho.RemoveLista(var Lis: TLista);
var iIdx:integer;
begin
  Dec(Lis.iTamPc);
  For iIdx:= Lis.iPosAcao to Lis.iTamPc do
    Lis.aLista[iIdx]:= Lis.aLista[iIdx+1];
end;

procedure TBaralho.InsertFila(var Fil: TFila; Carta: TCarta);
begin
  inc(Fil.iTamPc);
  Fil.aFila[Fil.iTamPc]:= Carta;
end;

procedure TBaralho.RemoveFila(var Fil: TFila);
var iIdx :integer;
begin
  dec(Fil.iTamPc);
  For iIdx:= 1 to Fil.iTamPc do
    Fil.aFila[iIdx]:= Fil.aFila[iIdx+1];
end;

procedure TBaralho.InicializaBaralho(var Lista: TLista);
var iIdxCarta :integer;
    iIdxNaipe :Integer;
    Carta     :TCarta;
begin
  Sleep(200);
  WriteLn('Zerando baralho...');
  Lista.iPosAcao:=0;
  For iIdxCarta:= 1 to 10 do
  begin
    Carta.iNum:= DefineNumero(iIdxCarta);
    Carta.iPeso:=DefinePesoCarta(Carta.iNum);

    For iIdxNaipe:= 1 to 4 do
    begin
      inc(Lista.iPosAcao);
      Carta.iNaipe:= iIdxNaipe;
      InsertLista(Lista,Carta);
    end;
  end;
end;

procedure TBaralho.CorteBaralho(var Lis: TLista; var Fil: TFila; JogVez :integer);
var iIdx :integer;
begin
  Sleep(200);
  WriteLn('Corte do baralho...');
  If JogVez mod 2 <> 0 then
    Fil.iPosAcao:= random(9)+20
  Else
    Fil.iPosAcao:= Mensagem.PerguntaPosCorte;  

  For iIdx := Fil.iPosAcao to 40 do
  begin
    Lis.iPosAcao:=Fil.iPosAcao;
    Baralho.InsertFila(Fil,Lis.aLista[Lis.iPosAcao]);
    Baralho.RemoveLista(Lis);
  end;
  For iIdx:= 1 to lis.iTamPc do
  begin
    Baralho.InsertFila(Fil,Lis.aLista[iIdx]);
    Baralho.RemoveLista(Lis);
  end;
end;

end.
