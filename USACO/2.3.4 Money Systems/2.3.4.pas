{
ID:yangyim1
PROG:money
LANG:PASCAL
}
VAR f:array[0..10000]of int64;
    a:array[1..25]of int64;
    v,n,i,j:longint;
BEGIN
assign(input,'money.in');reset(input);
assign(output,'money.out');rewrite(output);
  readln(v,n);
  fillchar(f,sizeof(f),0);
  for i:=1 to v do
   read(a[i]);
  f[0]:=1;
  for i:=1 to v do
   for j:=0 to n do
    if (f[j]>0)and(a[i]+j<=n) then
     inc(f[a[i]+j],f[j]);
  writeln(f[n]);
close(input);close(output)
END.
