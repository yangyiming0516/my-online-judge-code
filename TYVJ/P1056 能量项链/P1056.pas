VAR i,n:longint;
    a:array[1..1000]of int64;
    d:array[1..1000,1..1000]of int64;
    m:int64;
function f(p,q:longint):int64;
VAR max,h:int64;
    j:longint;
BEGIN
  if abs(p-q)<=1 then exit(0);
  if d[p,q]<>0 then exit(d[p,q]);
  max:=0;
  for j:=p+1 to q-1 do
    begin
    h:=f(p,j)+f(j,q)+a[p]*a[q]*a[j];
    if h>max then max:=h
    end;
  d[p,q]:=max;
  exit(max);
end;
BEGIN
 readln(n);
 for i:=1 to n do
  begin
  read(a[i]);
  a[i+n]:=a[i]
  end;
 m:=0;
for i:=1 to n do
  begin
    if f(i,i+n)>m then m:=f(i,i+n)
  end;
writeln(m);
END.