Program Pzim ;
var x,y:integer;

Function mdc (a,b:integer):integer;

begin          
  if a=b then
     mdc:=a
  else 
	  if a> b then 
      mdc:=mdc(a-b,b)
		else
		  mdc:=mdc(a,b-a)
end;

Begin
   readln (x,y);
   writeln (mdc(x,y))
End.