var a,b:array[1..1000] of longint;
    f:array[0..1000,0..1000]of longint;
    i,j,n,max:longint;
procedure qsa(l,r:longint);
var i,j,x,t:longint;
begin
  i:=l;j:=r;t:=a[(l+r) div 2];
  repeat
  while a[i]>t do inc(i);
  while a[j]<t do dec(j);
  if i<=j then
   begin
   x:=a[i];
   a[i]:=a[j];
   a[j]:=x;
   inc(i);dec(j)
   end;
  until i>j;
 if i<r then qsa(i,r);
 if l<j then qsa(l,j)
end;
procedure qsb(l,r:longint);
var i,j,x,t:longint;
begin
  i:=l;j:=r;t:=b[(l+r) div 2];
  repeat
  while b[i]>t do inc(i);
  while b[j]<t do dec(j);
  if i<=j then
   begin
   x:=b[i];
   b[i]:=b[j];
   b[j]:=x;
   inc(i);dec(j)
   end;
  until i>j;
 if i<r then qsb(i,r);
 if l<j then qsb(l,j)
end;
function money(i,j:longint):longint;
begin
 if b[i]<a[j] then exit(-200);
 if b[i]=a[j] then exit(0);
 if b[i]>a[j] then exit(200)
end;
begin
 readln(n);
 for i:=1 to n do
  read(b[i]);
 for i:=1 to n do
  read(a[i]);
 qsa(1,n);qsb(1,n);
 fillchar(f,sizeof(f),0);
 for i:=1 to n do
  begin
  f[i,0]:=f[i-1,0]+money(n-i+1,i);
  f[i,i]:=f[i-1,i-1]+money(i,i);
  if i>=2 then
  for j:=1 to i-1 do
  begin
  f[i,j]:=f[i-1,j-1]+money(j,i);
  if f[i-1,j]+money(n-(i-j)+1,i)>f[i,j]
  then f[i,j]:=f[i-1,j]+money(n-(i-j)+1,i);
  end;
  end;
 max:=0;
 for i:=0 to n do
 if f[n,i]>max then max:=f[n,i];
 writeln(max);
end.