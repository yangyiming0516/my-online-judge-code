VAR  n,i,j:integer;
     ans:int64;
   x:array[1..10000]of int64;
BEGIN
  readln(n);
  for i:=1 to n do
   readln(x[i]);
  ans:=0;
  for i:=1 to n do
   for j:=i+1 to n do
    ans:=ans+abs(x[i]-x[j]);
  writeln(ans*2)
END.