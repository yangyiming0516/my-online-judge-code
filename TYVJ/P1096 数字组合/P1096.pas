var a:array[1..100] of longint;
    f:array[0..10000]of longint;
    n,m,i,j:longint;
begin
  readln(n,m);
  f[0]:=1;
  for i:=1 to n do
   read(a[i]);
  for i:=1 to n do
   for j:=m-a[i] downto 0 do
    if f[j]<>0 then f[j+a[i]]:=f[j+a[i]]+f[j];
  writeln(f[m])
end.