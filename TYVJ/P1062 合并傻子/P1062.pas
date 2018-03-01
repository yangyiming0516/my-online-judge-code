var r,d:array[0..200] of longint;
    f,g:array[1..200,1..200]of longint;
    n,m,i,j,k,min,max,rpx,rpm:longint;
function sum(a,b:longint):longint;
begin
 exit(d[b]-d[a-1])
end;
begin
 readln(n,m);
 for i:=1 to n do
  read(r[i]);
 for i:=1 to n do
  r[i+n]:=r[i];
 d[0]:=0;
 for i:=1 to 2*n do
  d[i]:=d[i-1]+r[i];
 fillchar(f,sizeof(f),0);
 fillchar(g,sizeof(g),0);
 for j:=2 to n do
  for i:=1 to n do
   begin
   max:=0;
   for k:=i to i+j-2 do
    if f[i,k]+f[k+1,i+j-1]>max then max:=f[i,k]+f[k+1,i+j-1];
   f[i,i+j-1]:=max+sum(i,i+j-1);
   if i+j-1<n then f[i+n,i+j+n-1]:=f[i,i+j-1];
   end;
 for j:=2 to n do
  for i:=1 to n do
   begin
   min:=maxlongint;
   for k:=i to i+j-2 do
    if g[i,k]+g[k+1,i+j-1]<min then min:=g[i,k]+g[k+1,i+j-1];
   g[i,i+j-1]:=min+sum(i,i+j-1);
   if i+j-1<n then g[i+n,i+j+n-1]:=g[i,i+j-1];
   end;
 rpx:=0;
 for i:=1 to n do
  if f[i,i+n-1]>rpx then rpx:=f[i,i+n-1];
 rpm:=maxlongint;
 for i:=1 to n do
  if g[i,i+n-1]<rpm then rpm:=g[i,i+n-1];
 if m>rpx then writeln('It is easy')
  else if m<rpm then writeln('I am..Sha...X')
   else writeln('I will go to play WarIII');
end.