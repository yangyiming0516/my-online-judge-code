const max=maxlongint div 2;
var n,m,i,j,k,a,b,ans:longint;
    w:array[1..100,1..100]of longint;
begin
 readln(N,M);
 for i:=1 to n do
  for j:=1 to n do
   w[i,j]:=max;
 for i:=1 to m do
  begin
   readln(a,b);
   w[a,b]:=1;
   w[b,a]:=1;
  end;
 for k:=1 to n do
  for i:=1 to n do
   for j:=1 to n do
    if w[i,k]+w[k,j]<w[i,j]
     then w[i,j]:=w[i,k]+w[k,j];
 ans:=0;
 for i:=1 to n do
  for j:=1 to n do
   if w[i,j]>ans then ans:=w[i,j];
 writeln(ans)
end.