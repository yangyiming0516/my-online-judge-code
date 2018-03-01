var sum:array[0..2000]of longint;
    f:array[0..2000,0..2000]of longint;
    i,j,n:longint;
function min(a,b:longint):longint;
begin
 if a>b then exit(b) else exit(a)
end;
begin
 readln(n);
 for i:=n downto 1 do
  readln(sum[i]);
 for i:=2 to n do
  sum[i]:=sum[i-1]+sum[i];
 sum[0]:=0;
 for i:=1 to n do
  begin
  f[i,0]:=sum[i];
  for j:=1 to i do
   begin
   f[i,j]:=f[i-1,j-1]+sum[i]-sum[i-1];
   if i-3*j+1>=0 then f[i,j]:=min(f[i,j],sum[i]-f[i-j,2*j-1]);
   if i-3*j>=0 then f[i,j]:=min(f[i,j],sum[i]-f[i-j,2*j]);
   end;
  end;
 if f[n,1]>f[n,2] then writeln(f[n,1]) else writeln(f[n,2])
end.