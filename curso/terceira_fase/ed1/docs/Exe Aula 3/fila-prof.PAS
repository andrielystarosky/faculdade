program fila_simples;
uses crt;

const tam= 3;

type
   vet = array[1..tam] of integer;

var fila: vet;
    op,elem,posi_livre:integer;

procedure inicializa(var pos:integer);
begin
   pos:=0;
end;

procedure ler_elemento(var el:integer);
begin
  writeln('Digite o elemento');
  readln(el);
end;

procedure insere_fila(var f:vet; var posi,el:integer);
begin
  if (posi<tam) then 
	begin
    posi:=posi+1;
    f[posi]:=el;
  end
  else begin
      writeln('Fila cheia');
      readkey
  end
end;

procedure remove_fila(var f:vet;var posi:integer);
var i,el:integer;
begin
  if posi>0 then 
	begin
     el:=f[1];
     for i:=1 to posi-1 do
        f[i]:=f[i+1];
     posi:=posi-1;
     writeln ('Elemento removido ',el);
  end
  else 
      writeln('Fila vazia');
  readkey
end;

procedure cons_fila(f:vet;posi:integer);
begin
  if posi>0 then
      writeln ('Próximo elemento a ser removido ',f[1])
  else 
      writeln('Fila vazia');
  readkey;
end;

procedure escreve_fila(f:vet;posi:integer);
var i:integer;

begin
  for I:=1 to posi do
     write (f[i],' ');
end;


{Programa Principal}
begin
   clrscr;
   inicializa(posi_livre);
   op:=0;
   while op<> 5 do 
	 begin
     clrscr;
     writeln ('    MENU    ');
     writeln ('------------');
     writeln;
     writeln (' 1-Inserir  ');
     writeln (' 2-Remover  ');
     writeln (' 3-Consultar');
     writeln (' 4-Escrever ');
     writeln (' 5-Sair     ');
     writeln;
     write('    ==> ');
     readln (op);
     clrscr;
     if op =1 then 
		 begin
       ler_elemento(elem);
       insere_fila(fila,posi_livre,elem);
     end 
		 else if op =2 then 
        remove_fila(fila,posi_livre)
     else if op=3 then 
         cons_fila(fila,posi_livre)
     else if op=4 then 
		 begin
         escreve_fila(fila,posi_livre);
         readkey;
     end;
   end;
end.