{Andriely, Aline e Gabriel Morais}
unit unRodada;

interface

uses sysutils, unBaralho;

Type TJogador = record
      CartasRod  :TLista;
      iPontRod   :integer;
      iPontJogo  :integer;
      iCartasDip :integer;
end;

Type TConfigRod = record
      Jogadores   :array[1..2] of TJogador; //1:PC; 2:User
      iJogVez     :integer;
      iJogCorta   :integer;
      iRodPont    :integer;
      Manilha     :TCarta; // posicao 1:carta virou; outras sao as manilhas
      CartaJogada :TCarta;
      CartaAnt    :TCarta;
      bCond       :boolean; //para marcar o fim da subrodada
      iCountRod   :integer;
      iJogTrucou  :integer;
      iVencePri   :integer;
      iMaoOnze    :integer;  //0:não esta em 11; 1:esta em 11; 2: vao jogar na mao de onze
      bEscurinha  :boolean;
end;

Type TRodada = class
      Procedure IniciaRod(var Lis :TLista; var Fil :TFila; var cfgRod :TConfigRod);
      Procedure ExecutaRod(var Lis :TLista; var Fil :TFila; var cfgRod :TConfigRod);
      Procedure Embaralhar(var Lis :TLista);
      Procedure DistribuirCartas(var Fil :TFila; var cfgRod :TConfigRod);
      Procedure DefineManilha(var Fil :TFila; var cfgRod :TConfigRod);
      Procedure DefineVezJog (var cfgRod :TConfigRod);
      Procedure PesoCartas(var cfgRod :TConfigRod);
      Procedure VerificaMaoOnze(var cfgRod :TConfigRod);
      Procedure VerificaEscurinha(var cfgRod :TConfigRod);
      Procedure AcrescentaPontPart(var cfgRod :TConfigRod);
end;

var Rodada :TRodada;

implementation

uses unMovimentos, unMensagem;
{ TRodada }

procedure TRodada.IniciaRod(var Lis: TLista; var Fil: TFila; var cfgRod: TConfigRod);
var iIdx :integer;
begin
  cfgRod.iRodPont:=1;
  inc(cfgRod.iCountRod);
  cfgRod.bEscurinha:=False;
  for iIdx:= 1 to 2 do
  begin
    With cfgRod.Jogadores[iIdx] do
    begin
      iCartasDip:=0;
      iPontRod:=0;
    end;
  end;

  Baralho.InicializaBaralho(Lis);
  Embaralhar(Lis);
  DefineVezJog(cfgRod);
  Baralho.CorteBaralho(Lis,Fil, cfgRod.iJogCorta);
  DistribuirCartas(Fil,cfgRod);
  PesoCartas(cfgRod);
  VerificaMaoOnze(cfgRod);
  If cfgRod.iMaoOnze=1 then
  begin
    Movimentos.JogoMaoOnze(cfgRod);
    If cfgRod.iMaoOnze=2 then
    begin
      ExecutaRod(Lis,Fil,cfgRod);
    end;
  end
  Else
    ExecutaRod(Lis,Fil,cfgRod);

  AcrescentaPontPart(cfgRod);

end;

procedure TRodada.ExecutaRod(var Lis: TLista; var Fil: TFila;var cfgRod: TConfigRod);
begin
 Repeat
    cfgRod.bCond:=true;
    cfgRod.CartaJogada.iPeso:=0;
    Mensagem.QuebraLinha;
    Movimentos.Jogar(cfgRod);
    inc(cfgRod.iJogVez);
    Sleep(200);
    Mensagem.QuebraLinha;
    Movimentos.Jogar(cfgRod);
    Movimentos.VerificaPont(cfgRod);
  until (cfgRod.Jogadores[1].iPontRod>=2) or (cfgRod.Jogadores[2].iPontRod>=2);
end;

procedure TRodada.Embaralhar(var Lis: TLista);
var iIdx, i, j :integer;
    iAux :TCarta;
begin
  WriteLn('Embaralhando...');
  Randomize;
  For iIdx:= 1 to 40 do
  begin
    i:= random(39)+1;
    j:= random(39)+1;
    iAux:= Lis.aLista[j];
    Lis.aLista[j]:= Lis.aLista[i];
    Lis.aLista[i]:= iAux;
  end;
end;

procedure TRodada.DistribuirCartas(var Fil: TFila; var cfgRod: TConfigRod);
var iJog, iIdx :integer;
begin
  WriteLn('Distribuindo as cartas...');
  For iIdx:= 1 to 3 do
    For iJog:= 1 to 2 do
    begin
      inc(cfgRod.Jogadores[iJog].iCartasDip);
      cfgRod.Jogadores[iJog].CartasRod.iPosAcao:= iIdx;
      Baralho.InsertLista(cfgRod.Jogadores[iJog].CartasRod,Fil.aFila[1]);
      Baralho.RemoveFila(Fil);
    end;
  DefineManilha(fil,cfgRod);
end;


procedure TRodada.DefineManilha(var Fil :TFila; var cfgRod: TConfigRod);
begin
  cfgRod.Manilha:= Fil.aFila[1];
  Baralho.RemoveFila(Fil);
end;

procedure TRodada.DefineVezJog(var cfgRod :TConfigRod);
begin
  If cfgRod.iCountRod mod 2 <> 0 then
    cfgRod.iJogVez:=1
  Else
    cfgRod.iJogVez:=2;
end;

procedure TRodada.PesoCartas(var cfgRod: TConfigRod);
var iJog, iIdx, iAux :integer;
begin
  Case cfgRod.Manilha.iNum of
    12 : iAux:= 1;
    7  : iAux:= 10
    Else iAux:= cfgRod.Manilha.iNum + 1;
  end;
  For iJog:= 1 to 2 do
    For iIdx:= 1 to 3 do
      If (cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iNum) = iAux then
        Case cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iNaipe of
          1: cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iPeso:=20;
          2: cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iPeso:=19;
          3: cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iPeso:=18;
          4: cfgRod.Jogadores[iJog].CartasRod.aLista[iIdx].iPeso:=17;
        end;
end;

procedure TRodada.VerificaMaoOnze(var cfgRod: TConfigRod);
var iIdx :integer;
begin
  iIdx:=1;
  cfgRod.iMaoOnze:=0;
  While (iIdx<=2) and (cfgRod.iMaoOnze=0) do
  begin
    If cfgRod.Jogadores[iIdx].iPontJogo = 11 then
      cfgRod.iMaoOnze:=1;
    inc(iIdx);
  end;
end;

procedure TRodada.AcrescentaPontPart(var cfgRod: TConfigRod);
begin
  If cfgRod.Jogadores[1].iPontRod>cfgRod.Jogadores[2].iPontRod then
  begin
    WriteLn('Jogador 1 venceu a rodada.');
    cfgRod.Jogadores[1].iPontJogo:= cfgRod.Jogadores[1].iPontJogo + cfgRod.iRodPont;
    If cfgRod.iCountRod=1 then
      cfgRod.iVencePri:=1;
  end
  Else
  begin
    WriteLn('Jogador 2 venceu a rodada.');
    cfgRod.Jogadores[2].iPontJogo:= cfgRod.Jogadores[2].iPontJogo + cfgRod.iRodPont;
    If cfgRod.iCountRod=1 then
      cfgRod.iVencePri:=2;
  end;
end;

procedure TRodada.VerificaEscurinha(var cfgRod: TConfigRod);
begin
  If (cfgRod.Jogadores[2].iPontJogo=11) and (cfgRod.Jogadores[2].iPontJogo=11) then
    cfgRod.bEscurinha:=true
  Else
    cfgRod.bEscurinha:=false;
end;

end.
