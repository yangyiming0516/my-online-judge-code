{
ID:yangyim1
PROG:hamming
LANG:PASCAL
}
var p:array[1..64]of longint;
    n,b,d,k,j:longint;
function haiming(x,y:longint):longint;
var s1,s2:array[1..8]of byte;
    l,r,m,i:longint;
begin
  l:=x;r:=y;m:=0;
  for i:=1 to b do
   begin
   s1[i]:=l mod 2;
   l:=l div 2
   end;
  for i:=1 to b do
   begin
   s2[i]:=r mod 2;
   r:=r div 2
   end;
  for i:=1 to b do
  if s1[i]<>s2[i] then inc(m);
  exit(m)
end;
function ok(h:longint):boolean;
var i:longint;
begin
 for i:=1 to k do
  if haiming(p[i],h)<d then exit(false);
  exit(true)
end;
begin
assign(input,'hamming.in');reset(input);
assign(output,'hamming.out');rewrite(output);
 readln(n,b,d);
 k:=1;p[k]:=0;
 for j:=1 to (1 shl b)-1 do
  if ok(j) then
   begin
   inc(k);
   p[k]:=j;
   if k=n then break
   end;
 for j:=1 to n do
   if j mod 10=0 then writeln(' ',p[j])
   else if j mod 10>1 then write(' ',p[j]) else write(p[j]);
 if n mod 10<>0 then writeln;
 close(input);close(output)
end.