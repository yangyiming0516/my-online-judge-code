var f:array[0..2000,0..2000] of longint;
    a:array[1..2000]of integer;
    n,i,j,ans:longint;
function max(p,q:longint):longint;
begin
 if p>q then exit(p) else exit(q)
end;
begin
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 fillchar(f,sizeof(f),0);
 for i:=1 to n do
  begin
  f[i,i]:=f[i-1,i-1]+i*a[i];
  f[i,0]:=f[i-1,0]+i*a[n-i+1];
  for j:=1 to i-1 do
  f[i,j]:=max(f[i-1,j-1]+i*a[j],f[i-1,j]+i*a[n-i+j+1]);
  end;
 ans:=0;
 for i:=0 to n do
  if f[n,i]>ans then ans:=f[n,i];
 writeln(ans)
end.