var n,i,j,k:longint;
    c,a,h:array[1..400]of longint;
    f:array[0..1000000]of boolean;
procedure qs(l,r:longint);
var i,j,t,x:longint;
begin
 i:=l;j:=r;t:=a[(l+r)div 2];
 repeat
  while a[i]<t do inc(i);
  while a[j]>t do dec(j);
  if i<=j then
   begin
   x:=a[i];a[i]:=a[j];a[j]:=x;
   x:=c[i];c[i]:=c[j];c[j]:=x;
   x:=h[i];h[i]:=h[j];h[j]:=x;
   inc(i);dec(j);
   end;
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
begin
 readln(n);
 for i:=1 to n do
 readln(h[i],a[i],c[i]);
 qs(1,n);
 fillchar(f,sizeof(f),false);
 f[0]:=true;
 for i:=1 to n do
  for j:=1 to c[i] do
   for k:=a[i] downto h[i] do
    if f[k-h[i]] then f[k]:=true;
 for i:=a[n] downto 0 do
  if f[i] then begin writeln(i);break end;
end.