var n,m,k,ans:int64;
    i:longint;
begin
  readln(n);
  k:=0;
  m:=n*n;
  for i:=1 to m do
    k:=k+i;
  ans:=k div n;
  writeln(ans);
end.