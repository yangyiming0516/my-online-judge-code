var n,b,i,tall:longint;
    h:array[1..20000]of longint;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
 i:=l;j:=r;t:=h[(l+r)div 2];
 repeat
  while h[i]>t do inc(i);
  while h[j]<t do dec(j);
  if i<=j then
   begin
   x:=h[i];h[i]:=h[j];h[j]:=x;
   inc(i);dec(j)
   end;
 until i>j;
if l<j then qs(l,j);
if i<r then qs(i,r)
end;
begin
 readln(n,b);
 for i:=1 to n do
  read(h[i]);
 qs(1,n);
 tall:=0;
 for i:=1 to n do
  begin
  tall:=tall+h[i];
  if tall>=b then
   begin
   writeln(i);
   break
   end
  end
end.