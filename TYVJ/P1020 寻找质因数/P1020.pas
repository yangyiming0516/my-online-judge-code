VAR n,i,k,m,x,ans:integer;
    a:array[1..5000]of integer;
BEGIN
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 m:=0;
 for i:=1 to n do
  begin
   x:=a[i];
   k:=1;
   repeat
    k:=k+1;
    while x mod k=0 do
      x:=x div k;
   until x=1;
   if k>m then
     begin
      m:=k;
      ans:=a[i]
     end;
  end;
 writeln(ans)
END.