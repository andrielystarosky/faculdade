unit unRodada;

interface

uses unBaralho, SysUtils;

Type TJogador = record
      aCartasJog  :TLista;
      iCartasDisp :integer;
      iPontRod    :integer;
      iPontJogo   :integer;
end;

Type TConfigRodada = record
      PontRodada :integer;
      iJogVez    :integer;
      Jogadores  :array[1..2] of TJogador; //1 :pc, 2:user
end;

Type TRodada = class
      procedure IniciaRodada(var Lis :TLista; var Fil :TFila; var CfgRod :TConfigRodada);
      procedure Embaralhar(var Lis :TLista; var Fil :TFila);
      procedure DistribuirCartas (var Fil :TFila; CfgRod :TConfigRodada);
end;

var ConfigR :TConfigRodada;
    Rodada  :TRodada;
    iIdx    :integer;
implementation

uses unComunicacao;
{ TRodada }

procedure TRodada.DistribuirCartas(var Fil: TFila; CfgRod: TConfigRodada);
var iJog, iIdx :integer;
begin
  for iIdx := 1 to 3 do
  begin
    For iJog:= 1 to 2 do
    begin
      inc(CfgRod.Jogadores[iJog].iCartasDisp);
      Baralho.InsertLista(CfgRod.Jogadores[iJog].aCartasJog, Fil.aFila[1]);
      Baralho.RemoveFila(Fil);
    end;
  end;
end;

procedure TRodada.Embaralhar(var Lis: TLista; var Fil: TFila);
var iAux, iIdx, iCont :integer;
begin
  Randomize;
  iAux:= random(4)+1;
  For iIdx:= 1 to iAux do
  begin
    Fil.iPosAcao:= random(9)+20;
    Baralho.CortaBaralho(Lis,Fil);

    iCont:= 0;
    While iCont <= 40 do
    begin
      Baralho.InsertLista(Lis, Fil.aFila[iCont]);
      Baralho.RemoveFila(Fil);
      inc(iCont);
    end;
  end;
end;

procedure TRodada.IniciaRodada(var Lis: TLista; var Fil: TFila; var CfgRod: TConfigRodada);
begin
  Baralho.InicializaBaralho(Lis);
  Embaralhar(Lis,Fil);
  Baralho.CortaBaralho(Lis,Fil);
  DistribuirCartas(Fil,CfgRod);

  ReadLn;



end;

end.
