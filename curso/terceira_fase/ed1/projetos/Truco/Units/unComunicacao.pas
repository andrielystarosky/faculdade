unit unComunicacao;

interface

Type TMensagem = class
      Public
        Function PosCorte :integer;
end;

var Mensagem :TMensagem;

implementation

{ TMensagem }

function TMensagem.PosCorte: integer;
begin
  WriteLn('Qual a posicao do corte?');
  Write(' ->');
  ReadLn(Result);
end;

end.
