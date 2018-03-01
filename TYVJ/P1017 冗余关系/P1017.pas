VAR f:array[1..1000]of integer;
    i,j,n,m,a,b,max,k:integer;
BEGIN
  readln(n,m);
  for i:=1 to m do f[i]:=i;
  max:=0;
  for i:=1 to n do
   begin
   readln(a,b);
   if f[a]=f[b] then max:=max+1
    else
      begin
       k:=f[b];
        for j:=1 to m do
         if f[j]=k then f[j]:=f[a];
      end;
   end;
  writeln(max)
END.