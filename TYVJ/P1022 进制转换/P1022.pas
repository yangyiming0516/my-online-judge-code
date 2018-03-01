VAR i,k,n,x:longint;
    a:array[1..1000]of integer;
BEGIN
  readln(n);
  k:=0;
   repeat
    inc(k);
    if n>=0 then
     begin
     a[k]:=n mod 2;
     n:=n div -2
     end
    else
     begin
     a[k]:=abs(n mod 2);
     n:=(n-1) div -2
     end
   until n=0;
  for i:=k downto 1 do
   write(a[i])
END.