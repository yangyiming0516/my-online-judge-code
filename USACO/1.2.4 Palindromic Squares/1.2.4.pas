{
ID:id
PROG:palsquare
LANG:PASCAL
}
var f:array[0..19]of char=('0','1','2','3','4','5','6','7','8','9','A',
                            'B','C','D','E','F','G','H','I','J');
    i,m:integer;
procedure find(n:longint);
var i,j,x,k:longint;
    a1,a2:array[1..20]of integer;
    flag:boolean;
begin
  i:=0;
  x:=sqr(n);
  repeat
   inc(i);
   a2[i]:=x mod m;
   x:=x div m
  until x=0;
 flag:=true;
 for k:=1 to i do
  if a2[k]<>a2[i+1-k] then begin flag:=false;break end;
 if flag then
  begin
  j:=0;
  x:=n;
  repeat
   inc(j);
   a1[j]:=x mod m;
   x:=x div m
  until x=0;
  end;
 if flag then
  begin
  for k:=j downto 1 do
   write(f[a1[k]]);
  write(' ');
  for k:=i downto 1 do
   write(f[a2[k]]);
  writeln
  end;
end;
BEGIN
assign(input,'palsquare.in');reset(input);
assign(output,'palsquare.out');rewrite(output);
 readln(m);
 for i:=1 to 300 do
  find(i);
close(input);close(output)
END.