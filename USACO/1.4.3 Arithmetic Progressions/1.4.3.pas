{
ID:id
PROG:ariprog
LANG:PASCAL
}
VAR
  f:array[0..130000]of boolean;
  n,m,i,j,d,h,l:longint;
  a,b:array[1..10001]of longint;
  flag:boolean;
procedure qsa(l,r:longint);
var i,j,x,k:longint;
begin
 i:=l;j:=r;x:=a[(l+r)div 2];
 repeat
  while a[i]<x do inc(i);
  while a[j]>x do dec(j);
  if i<=j then
  begin
  k:=a[i];
  a[i]:=a[j];
  a[j]:=k;
  inc(i);dec(j)
  end;
 until i>j;
 if l<j then qsa(l,j);
 if r>i then qsa(i,r)
end;
procedure qsb(l,r:longint);
var i,j,x,k:longint;
begin
 i:=l;j:=r;x:=b[(l+r)div 2];
 repeat
  while b[i]<x do inc(i);
  while b[j]>x do dec(j);
  if i<=j then
  begin
  k:=a[i];
  a[i]:=a[j];
  a[j]:=k;
  k:=b[i];
  b[i]:=b[j];
  b[j]:=k;
  inc(i);dec(j)
  end;
 until i>j;
 if l<j then qsb(l,j);
 if r>i then qsb(i,r)
end;
begin
assign(input,'ariprog.in');reset(input);
assign(output,'ariprog.out');rewrite(output); 
 readln(n);
 readln(m);
 fillchar(f,sizeof(f),false);
 for i:=0 to m do
   for j:=0 to i do
    f[i*i+j*j]:=true;
 h:=0;
 for i:=2*m*m downto n-1 do
  if f[i] then
  for d:=1 to trunc(i/(n-1)) do
   begin
    flag:=true;
    for j:=1 to n-1 do
     if f[i-d*j]=false then begin flag:=false;break end;
    if flag then
     begin
      inc(h);
      b[h]:=d;
      a[h]:=i-d*(n-1);
     end;
   end;
 if h=0 then writeln('NONE')
 else begin
   b[h+1]:=0;
   qsb(1,h);
   l:=1;
   for i:=2 to h+1 do
    if b[i]<>b[i-1] then
     begin
     qsa(l,i-1);
     for j:=l to i-1 do
      writeln(a[j],' ',b[j]);
     l:=i
     end;
   end;
close(input);close(output)
end.