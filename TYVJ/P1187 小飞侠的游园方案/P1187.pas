var d:array[0..1000]of longint;
    t,f:array[1..1000]of longint;
    n,h,i,j,ans:longint;
begin
 readln(n);
 readln(h);
 for i:=1 to n do
  readln(f[i],t[i]);
fillchar(d,sizeof(d),0);
 for i:=1 to n do
  begin
  for j:=h-t[i] downto 1 do
  if (d[j]>0)and(d[j]+f[i]>d[j+t[i]])then
   d[j+t[i]]:=d[j]+f[i];
  if d[t[i]]<f[i] then d[t[i]]:=f[i]
  end;
  ans:=0;
  for i:=h downto 0 do
   if d[i]>ans then ans:=d[i];
  writeln(ans)
end.