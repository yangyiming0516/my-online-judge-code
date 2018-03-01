{
ID:yangyim1
TASK:nocows
LANG:PASCAL
}
var n,k,i,j,s:longint;
    f,g:array[0..100,0..200] of longint;
begin
assign(input,'nocows.in');reset(input);
assign(output,'nocows.out');rewrite(output);
fillchar(f,sizeof(f),0);
fillchar(g,sizeof(g),0);
readln(n,k);
f[1,1]:=1;
for i:=2 to k do
  for j:=1 to n do
   begin
   g[i-1,j]:=(g[i-2,j]+f[i-1,j]) mod 9901;
   for s:=1 to j-1 do
    begin
    f[i,j]:=(f[i,j]+g[i-2,s]*f[i-1,j-s-1]*2) mod 9901;
    f[i,j]:=(f[i,j]+f[i-1,s]*f[i-1,j-s-1]) mod 9901;
    end;
   end;
   writeln(f[k,n]);
close(input);close(output);
end.
