VAR i,n:longint;
    a:array[1..1000]of longint;
    d:array[1..1000,1..1000]of longint;
function f(p,q:longint):longint;
VAR j,min:longint;
BEGIN
  if abs(p-q)<=1 then exit(0);
  if d[p,q]<>0 then exit(d[p,q]);
  min:=maxlongint;
  for j:=p+1 to q-1 do
    if (f(p,j)+f(j,q)+a[p]*a[q]*a[j])<min then min:=f(p,j)+f(j,q)+a[p]*a[q]*a[j];
  d[p,q]:=min;
  exit(min);
end;
BEGIN
 readln(n);
 for i:=1 to n do
   read(a[i]);
 writeln(f(1,n))
END.