var f,p:array[0..200001]of longint;
    a,b:array[0..200000]of char;
    n,m,k,i,x:longint;
begin
 readln(n,m,k);
 for i:=1 to n do read(A[i]);
 readln;
 for i:=1 to m do read(B[i]);
 readln;
fillchar(f,sizeof(f),0);
 p[1]:=0;
 x:=0;
 for i:=2 to m do
  begin
  while (x>0)and(b[x+1]<>b[i]) do x:=p[x];
  if b[x+1]=b[i] then inc(x);
  p[i]:=x
  end;
 x:=0;
 for i:=1 to n do
  begin
  while (x>0)and(b[x+1]<>a[i]) do x:=p[x];
  if b[x+1]=a[i] then inc(x);
  inc(f[x]);
  if x=m then x:=p[x]
  end;
 for i:=m downto 1 do
   f[p[i]]:=f[p[i]]+f[i];
 for i:=1 to k do
  begin
  readln(x);
  writeln(f[x]-f[x+1])
  end;
end.