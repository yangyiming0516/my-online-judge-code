VAR i,ans,max:integer;
    a,b:array[1..7]of integer;
BEGIN
  for i:=1 to 7 do
   readln(a[i],b[i]);
  ans:=0;
  for i:=1 to 7 do
    if (a[i]+b[i]>8) and (a[i]+b[i]>max) then
      begin
      ans:=i;
      max:=a[i]+b[i];
      end;
  writeln(ans)
END.