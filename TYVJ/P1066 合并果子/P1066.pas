var i,j,n,ans,h,k:longint;
    a:array[1..10000]of longint;
procedure qs(l,r:longint);
var i,j,t,x:longint;
begin
  i:=l;j:=r;
  t:=a[(l+r)div 2];
  repeat
  while a[i]>t do inc(i);
  while a[j]<t do dec(j);
  if i<=j then
   begin
   x:=a[i];a[i]:=a[j];a[j]:=x;
   inc(i);dec(j)
   end;
  until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r);
end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 qs(1,n);
 ans:=0;
 h:=n;
 for i:=1 to n-1 do
  begin
  ans:=ans+a[h]+a[h-1];
  a[h-1]:=a[h]+a[h-1];
  dec(h);
  for j:=h-1 downto 1 do
    if a[j]<a[j+1] then
     begin
      k:=a[j];a[j]:=a[j+1];a[j+1]:=k
     end
    else break;
  end;
 writeln(ans)
end.