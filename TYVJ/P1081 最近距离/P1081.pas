var n,i,j,l,r:longint;
    x,y:array[1..2000]of int64;
    min:int64;
begin
 read(n);
 for i:=1 to n do
  read(x[i],y[i]);
 min:=maxlongint;
 for i:=2 to n do
  for j:=1 to i-1 do
  if sqr(x[i]-x[j])+sqr(y[i]-y[j])<min then
    begin
    min:=sqr(x[i]-x[j])+sqr(y[i]-y[j]);
    l:=j;r:=i;
    end;
 writeln(l,' ',r);
end.