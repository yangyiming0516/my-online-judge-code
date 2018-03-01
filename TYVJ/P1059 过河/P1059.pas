var i,j,s,t,m,l,k,ans,min:longint;
    f:array[0..100,0..10]of longint;
    a:array[0..100]of longint;
    ok:array[0..100]of boolean;
procedure qs(l,r:longint);
var i,j,t,x:longint;
begin
 i:=l;j:=r;
 x:=a[(l+r)div 2];
 repeat
  while a[i]<x do inc(i);
  while a[j]>x do dec(j);
  if i<=j then
  begin
  t:=a[i];a[i]:=a[j];a[j]:=t;
  inc(i);dec(j);
  end;
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
function can(p,q:longint):boolean;
begin
 if q-p>=s*(s-1) then exit(true);
 if p<0 then exit(false);
 exit(ok[q-p])
end;
begin
//assign(input,'river.in');reset(input);
//assign(output,'river.out');rewrite(output);
 readln(L);
 readln(s,t,m);
 for i:=1 to m do
  read(a[i]);
 if s=t then
  begin
  ans:=0;
  for i:=1 to m do
   if a[i] mod s=0 then inc(ans);
  writeln(ans);
  halt
  end;
 qs(1,m);
 a[0]:=0;
 a[m+1]:=l;
 fillchar(ok,sizeof(ok),false);
 ok[0]:=true;
 for i:=s to t do
  ok[i]:=true;
 for i:=t+1 to s*(s-1) do
  for j:=s to t do
   if ok[i-j] then ok[i]:=true;
 fillchar(f,sizeof(f),0);
 for i:=1 to m+1 do
  for j:=0 to t-1 do
   if a[i]-j<=a[i-1] then f[i,j]:=f[i-1,a[i-1]-(a[i]-j)]
   else
    begin
    min:=m+1;
    for k:=0 to t-1 do
     if can(a[i-1]-k,a[i]-j) and (f[i-1,k]<min)
      then min:=f[i-1,k];
    f[i,j]:=min;
    if j=0 then inc(f[i,j])
    end;
 ans:=m+1;
 for i:=0 to t-1 do
  if f[m+1,i]<ans then ans:=f[m+1,i];
 writeln(ans);
//close(input);close(output)
END.