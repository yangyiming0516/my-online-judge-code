var f,g:array[1..100]of longint;
    t:array[1..100]of longint;
    n,i,max:longint;
procedure sheng;
var i,j:longint;
begin
 for i:=1 to n do
  begin
  f[i]:=1;
  for j:=1 to i-1 do
   if (t[i]>t[j])and(f[j]+1>f[i]) then f[i]:=f[j]+1;
  end;
end;
procedure jiang;
var i,j:longint;
begin
  for i:=n downto 1 do
   begin
   g[i]:=1;
   for j:=n downto i+1 do
    if (t[i]>t[j])and(g[j]+1>g[i]) then g[i]:=g[j]+1;
   end;
end;
begin
 readln(n);
 for i:=1 to n do
 read(t[i]);
 sheng;jiang;
 max:=0;
 for i:=1 to n do
  if f[i]+g[i]-1>max then max:=f[i]+g[i]-1;
 writeln(n-max)
end.