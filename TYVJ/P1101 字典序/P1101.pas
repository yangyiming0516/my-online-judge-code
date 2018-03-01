var a:array[1..10000]of ansistring;
    n,i:longint;
procedure qs(l,r:longint);
var i,j:longint;
    x,t:ansistring;
begin
 i:=l;j:=r;t:=a[(l+r)div 2];
 repeat
  while a[i]<t do inc(i);
  while a[j]>t do dec(j);
  if i<=j then
  begin
  x:=a[i];a[i]:=a[j];a[j]:=x;
  inc(i);dec(j)
  end;
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
begin
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 qs(1,n);
 for i:=1 to n do
  writeln(a[i])
end.