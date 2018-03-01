var n,b,i,j,s:longint;
   t,f,g,sumt,sumf,time:array[0..5000]of longint;
function min(x,y:longint):longint;
begin
 if x<y then exit(x) else exit(y)
end;
begin
 readln(n);
 readln(s);
 for i:=1 to n do
  readln(t[i],f[i]);
 sumt[0]:=0;sumf[0]:=0;time[0]:=0;
 for i:=1 to n do
  begin
  sumt[i]:=sumt[i-1]+t[i];
  sumf[i]:=sumf[i-1]+f[i]
  end;
 g[0]:=0;
 for i:=1 to n do
  begin
  g[i]:=maxlongint;
  for j:=0 to i-1 do
   g[i]:=min(g[i],g[j]+(sumt[i]-sumt[j]+s)*(sumf[n]-sumf[j]));
  end;
 writeln(g[n])
end.
