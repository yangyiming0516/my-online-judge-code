var a:array[1..100]of longint;
    n,i,m:longint;
function gcd(x,y:longint):longint;
var h,p,q:longint;
begin
  p:=x;q:=y;
  if p<q then begin h:=p;p:=q;q:=h end;
  repeat
    h:=p mod q;
    if h=0 then exit(q);
    if h>q then p:=h else begin p:=q;q:=h end
  until p mod q=0;
  exit(q)
end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to n-1 do
  a[i]:=abs(a[i+1]-a[i]);
 m:=a[1];
 for i:=2 to n-1 do
  m:=gcd(m,a[i]);
 writeln(m)
end.