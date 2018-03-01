var n,k,i:longint;
    f:array[1..100,1..6]of longint;
function make(p,q:integer):longint;
var max,i:longint;
begin
  if f[p,q]<>0 then
   exit(f[p,q]);
  max:=0;
  for i:=q downto 1 do
   max:=max+make(p-1,i);
  f[p,q]:=max;
  make:=max
end;
begin
 readln(n);
 fillchar(f,sizeof(f),0);
 for i:=1 to 6 do
  f[1,i]:=i;
 writeln(make(n,6));
end.