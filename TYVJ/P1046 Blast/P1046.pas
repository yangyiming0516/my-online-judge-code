var h1,h2,i,j,k:longint;
    a,b:array[1..2000]of char;
    f:array[0..2000,0..2000]of longint;
begin
 h1:=0;
 while not eoln do
  begin
  inc(h1);
  read(a[h1])
  end;
 readln;
 h2:=0;
 while not eoln do
  begin
  inc(h2);
  read(b[h2]);
  end;
 readln;
 readln(k);
 for i:=0 to h1 do
  f[i,0]:=i*k;
 for i:=0 to h2 do
  f[0,i]:=i*k;
 for i:=1 to h1 do
  for j:=1 to h2 do
   begin
   f[i,j]:=f[i-1,j-1]+abs(ord(a[i])-ord(b[j]));
   if f[i-1,j]+k<f[i,j] then f[i,j]:=f[i-1,j]+k;
   if f[i,j-1]+k<f[i,j] then f[i,j]:=f[i,j-1]+k
   end;
 writeln(f[h1,h2])
end.