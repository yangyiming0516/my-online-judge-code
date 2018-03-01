{
ID:id
PROG:pprime
LANG:PASCAL
}

var f:array[1..10000000]of boolean;
    s,ss:string;
    a,b,i,j,k:longint;
function pan(h:longint):boolean;
var i:longint;
begin
  for i:=2 to trunc(sqrt(h)) do
   if h mod i=0 then exit(false);
  exit(true)
end;
begin
assign(input,'pprime.in');reset(input);
assign(output,'pprime.out');rewrite(output);
  fillchar(f,sizeof(f),false);
  readln(a,b);
  if b>10000000 then b:=10000000;
  f[11]:=true;
  for i:=1 to 9999 do
   begin
    str(i,s);
    ss:=s;
    for j:=length(s)-1 downto 1 do
      ss:=ss+s[j];
    val(ss,k);
    if pan(k) then f[k]:=true;
   end;
  for i:=a to b do
   if f[i] then writeln(i);
 close(input);close(output)
end.
