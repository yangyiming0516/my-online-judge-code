var ka,kb,i,j:longint;
    a,b:array[0..2000]of char;
    f:array[0..2000,0..2000]of longint;
begin
 ka:=0;
 repeat
 inc(ka);
 read(a[ka])
 until a[ka]=' ';
 dec(ka);
 kb:=0;
 while not eoln do
 begin
 inc(kb);
 read(b[kb]);
 end;
 f[1,0]:=0;f[0,1]:=0;f[0,0]:=0;
 for i:=1 to ka do
  for j:=1 to kb do
   begin
   if f[i-1,j]>f[i,j-1] then f[i,j]:=f[i-1,j]
   else f[i,j]:=f[i,j-1];
   if a[i]=b[j] then if f[i-1,j-1]+1>f[i,j] then f[i,j]:=f[i-1,j-1]+1;
   end;
 writeln(f[ka,kb])
end.