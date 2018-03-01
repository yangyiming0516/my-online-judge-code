var a:array[1..25,1..25]of longint;
    f:array[1..25,1..25,0..99]of boolean;
    n,i,j,k:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to i do
   read(a[i,j]);
 fillchar(f,sizeof(f),false);
 for i:=1 to n do
  f[n,i,a[n,i] mod 100]:=true;
 for i:=n-1 downto 1 do
  for j:=1 to i do
   for k:=0 to 99 do
    f[i,j,k]:=(f[i+1,j+1,((k-a[i,j] mod 100)+100)mod 100]
                  or f[i+1,j,((k-a[i,j] mod 100)+100)mod 100]);
 for i:=99 downto 0 do
  if f[1,1,i] then begin writeln(i);break end;
end.