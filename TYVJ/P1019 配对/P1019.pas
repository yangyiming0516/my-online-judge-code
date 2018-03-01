VAR n,i:integer;
    ans:int64;
    a:array[1..20000]of integer;
procedure qs(l,r:integer);
VAR i,j,x,k:integer;
BEGIN
  i:=l;
  j:=r;
  x:=a[(i+j) div 2];
  repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then
    begin
    k:=a[i];
    a[i]:=a[j];
    a[j]:=k;
    inc(i);dec(j);
    end;
  until i>j;
  if l<j then qs(l,j);
  if i<r then qs(i,r)
end;
BEGIN
  readln(n);
  for i:=1 to n do
   read(a[i]);
  for i:=1 to n do
   read(a[i+n]);
  qs(1,2*n);
  for i:=n downto 1 do
    ans:=ans+a[i+n];
  for i:=n downto 1 do
    ans:=ans-a[i];
  writeln(ans)
END.