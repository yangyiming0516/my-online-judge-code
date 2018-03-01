var c,m,e,sum,num:array[1..300]of longint;
    l,ll,i,j,n:longint;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
 randomize;
 i:=l;j:=r;t:=sum[random(r-l)+l];
 repeat
  while sum[i]>t do inc(i);
  while sum[j]<t do dec(j);
  if i<=j then
   begin
   x:=sum[i];sum[i]:=sum[j];sum[j]:=x;
   x:=num[i];num[i]:=num[j];num[j]:=x;
   x:=c[i];c[i]:=c[j];c[j]:=x;
   inc(i);dec(j)
   end;
 until i>j;
if l<j then qs(l,j);
if i<r then qs(i,r)
end;
procedure qsc(l,r:longint);
var i,j,x,t:longint;
begin
 randomize;
 i:=l;j:=r;t:=c[random(r-l)+l];
 repeat
  while c[i]>t do inc(i);
  while c[j]<t do dec(j);
  if i<=j then
   begin
   x:=num[i];num[i]:=num[j];num[j]:=x;
   x:=c[i];c[i]:=c[j];c[j]:=x;
   inc(i);dec(j)
   end;
 until i>j;
if l<j then qsc(l,j);
if i<r then qsc(i,r)
end;
procedure qsn(l,r:longint);
var i,j,x,t:longint;
begin
 randomize;
 i:=l;j:=r;t:=num[random(r-l)+l];
 repeat
  while num[i]<t do inc(i);
  while num[j]>t do dec(j);
  if i<=j then
   begin
   x:=num[i];num[i]:=num[j];num[j]:=x;
   inc(i);dec(j)
   end;
 until i>j;
if l<j then qsn(l,j);
if i<r then qsn(i,r)
end;
begin
 readln(n);
 for i:=1 to n do
 readln(c[i],m[i],e[i]);
 for i:=1 to n do
 begin
 sum[i]:=c[i]+m[i]+e[i];
 num[i]:=i
 end;
 qs(1,n);
 l:=1;
 for i:=2 to n+1 do
  if (i=n+1)or(sum[i]<>sum[i-1]) then
   begin
    qsc(l,i-1);
    ll:=l;
    for j:=l+1 to i do
     if (j=i)or(c[j]<>c[j-1])  then
       begin
        qsn(ll,j-1);
        ll:=j
       end;
    l:=i
   end;
 for i:=1 to 5 do
  writeln(num[i],' ',sum[i])
end.