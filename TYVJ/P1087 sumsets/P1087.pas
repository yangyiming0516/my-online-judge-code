var f:array[0..1000000] of longint;
    n,i:longint;
begin
  readln(n);
  f[1]:=1;
  f[2]:=2;
  f[0]:=1000000000;
  for i:=3 to n do
   if i mod 2=0 then
    f[i]:=(f[i-1]+f[i div 2])mod f[0]
   else f[i]:=f[i-1];
  writeln(f[n])
end.