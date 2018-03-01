var d,m:array[0..100]of real;
    f:array[1..100]of integer;
    n,i:integer;
begin
 readln(n);
 for i:=1 to n do
 readln(f[i]);
 d[0]:=100;m[0]:=0;
 for i:=1 to n do
  begin
  d[i]:=d[i-1];
  if m[i-1]/f[i]*100>d[i] then d[i]:=m[i-1]/f[i]*100;
  m[i]:=m[i-1];
  if d[i-1]*f[i]/100>m[i] then m[i]:=d[i-1]*f[i]/100;
  end;
 writeln(d[n]:0:2);
end.