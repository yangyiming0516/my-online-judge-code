{
ID:yangyim1
PROG:subset
LANG:PASCAL
}
var n,i,j:longint;
    f:array[1..39,0..1000]of longint;
begin
assign(input,'subset.in');reset(input);
assign(output,'subset.out');rewrite(output);
 readln(n);
 if (n*(n+1) div 2)mod 2<>0 then
  begin
  writeln(0);
  exit
  end;
 fillchar(f,sizeof(f),0);
 f[1,0]:=1;
 for i:=2 to n do
  for j:=(n*(n+1) div 2)div 2 downto 0 do
   if j<i then f[i,j]:=f[i-1,j]
   else
     f[i,j]:=f[i-1,j]+f[i-1,j-i];
 writeln(f[n,n*(n+1)div 4]);
 close(input);close(output)
end.
