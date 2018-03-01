var f:array[1..300,1..300]of boolean;
    a,t:array[0..300]of longint;
    n,m,i,j,b,c:longint;
begin
 readln(n,m);
 fillchar(f,sizeof(f),false);
 for i:=1 TO M DO
  begin
  readln(b,c);
  f[c,b]:=true;
  f[b,c]:=true
  end;
 a[0]:=0;
 t[0]:=0;
 for i:=1 to n do
  begin
  a[i]:=a[i-1];
  t[i]:=t[i-1];
  for j:=1 to i do
   if f[i,j] then
    if a[j-1]+2>a[i] then
     begin
     a[i]:=a[j-1]+2;
     t[i]:=t[j-1]+i-j-1;
     end
    else
    if a[j-1]+2=a[i]
     then if t[j-1]+i-j-1<t[i] then t[i]:=t[j-1]+i-j-1;
  end;
 writeln(a[n],' ',t[n])
end.