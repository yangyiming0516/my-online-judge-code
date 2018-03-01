var  n,ans,f,y,m,d,k:longint;
begin
 readln(n);
 ans:=0;
 f:=6;
 for y:=2010 downto n+1 do
  for m:=12 downto 1 do
   begin
   if m in [1,3,5,7,8,10,12] then k:=31
    else if m in [4,6,9,11] then k:=30
     else if ((y mod 100<>0)and(y mod 4=0)) or (y mod 400=0)
      then k:=29 else k:=28;
  for d:=k downto 1 do
   begin
   dec(f);
   if f=0 then f:=7;
   if (f=5)and(d=30) then inc(ans)
   end;
   end;
 writeln(ans)
end.