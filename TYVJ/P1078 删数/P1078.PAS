var f:array[1..100,1..100]of longint;
    a:array[1..100]of longint;
    n,i,j,r:longint;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do f[i,i]:=a[i];
 for i:=2 to n do
  for j:=1 to n-i+1 do
   begin
   f[j,i+j-1]:=abs(a[j]-a[i+j-1])*i;
   for r:=j to i+j-2 do
   if f[j,r]+f[r+1,i+j-1]>f[j,i+j-1] then
    f[j,i+j-1]:=f[j,r]+f[r+1,i+j-1];
   end;
 writeln(f[1,n])
end.