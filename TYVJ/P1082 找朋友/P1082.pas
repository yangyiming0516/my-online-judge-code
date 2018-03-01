var s:array[1..10000]of string;
    a:array[1..10000]of longint;
    n,i:longint;
procedure qss(l,r:longint);
var i,j:longint;
    x,t:string;
begin
  i:=l;j:=r;
  t:=s[(l+r)div 2];
  repeat
   while s[i]<t do inc(i);
   while s[j]>t do dec(j);
   if i<=j then
    begin
    x:=s[i];s[i]:=s[j];s[j]:=x;
    inc(i);dec(j);
    end;
  until i>j;
 if l<j then qss(l,j);
 if i<r then qss(i,r)
end;
procedure qsa(l,r:longint);
var i,j,x,t:longint;
begin
 i:=l;j:=r;t:=a[(l+r)div 2];
 repeat
  while a[i]<t do inc(i);
  while a[j]>t do dec(j);
  if i<=j then
   begin
   x:=a[i];a[i]:=a[j];a[j]:=x;
   inc(i);dec(j);
   end;
 until i>j;
 if l<j then qsa(l,j);
 if i<r then qsa(i,r)
end;
begin
  readln(n);
  for i:=1 to n do
  readln(s[i]);
  for i:=1 to n do
  readln(a[i]);
  qss(1,n);
  qsa(1,n);
  for I:=1 TO N DO
   writeln(s[i],' ',a[i])
end.