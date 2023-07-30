{Andriely, Aline e Gabriel Morais}
program index;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  unBaralho    in 'Units\unBaralho.pas ',
  unRodada     in 'Units\unRodada.pas',
  unMensagem   in 'Units\unMensagem.pas',
  unMovimentos in 'Units\unMovimentos.pas';

var Baralho :TLista;
    Corte   :TFila;
    cfgRod  :TConfigRod;

Procedure InicializaPartida(var Lis :TLista; var Fil :TFila; cfgRod :TConfigRod);
var iIdx :integer;
begin
  For iIdx:= 1 to 2 do
    cfgRod.Jogadores[iIdx].iPontJogo:=0;
  cfgRod.iJogCorta:=0;
  cfgRod.iCountRod:=0;
  cfgRod.iMaoOnze:=0;
end;

begin
  TBaralho.Create;
  TRodada.Create;
  InicializaPartida(Baralho,Corte,cfgRod);

  cfgRod.Jogadores[1].iPontJogo:=11;
  cfgRod.Jogadores[2].iPontJogo:=11;
  Repeat
    WriteLn('Iniciando rodada.');
    cfgRod.iJogTrucou:=0;
    Sleep(150);
    Mensagem.QuebraLinha;
    inc(cfgRod.iJogCorta);
    Rodada.IniciaRod(Baralho,Corte,cfgRod);
  Until (cfgRod.Jogadores[1].iPontJogo>=12) or (cfgRod.Jogadores[2].iPontJogo>=12);
  Mensagem.MostraVencedor(cfgRod);
  ReadLn;

  If TBaralho <> Nil then
    FreeAndNil(Baralho);
  If TRodada <> Nil then
    FreeAndNil(Rodada);
end.





