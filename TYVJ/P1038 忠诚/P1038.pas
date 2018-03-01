var n,m,i,j,k,p,q:longint;
    f:array[1..100000,0..20]of longint;
function min(a,b:longint):longint;
begin
 if a<b then exit(a) else exit(b);
end;
begin
 readln(m,n);
 for i:=1 to m do
  read(f[i,0]);
 for j:=1 to trunc(ln(m)/ln(2)) do
  for i:=1 to m+1-(1 shl j) do
   f[i,j]:=min(f[i,j-1],f[i+(1 shl (j-1)),j-1]);
 for i:=1 to n-1 do
  begin
  readln(p,q);
  k:=trunc(ln(q-p+1)/ln(2));
  write(min(f[p,k],f[q+1-(1 shl k),k]),' ');
  end;
 readln(p,q);
 k:=trunc(ln(q-p+1)/ln(2));
 writeln(min(f[p,k],f[q+1-(1 shl k),k]));
end.