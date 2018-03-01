var f:array[0..15,0..15]of longint;
    n,k,i,j,m,d,max:longint;
function sum(i,j:integer):int64;
begin
 sum:=f[j,0]-f[i-1,0]
end;
begin
 readln(n,k);
 f[0,0]:=0;
 for i:=1 to n do
  begin
  read(m);
  f[i,0]:=f[i-1,0]+m
  end;
 for i:=1 to n do
  for j:=1 to k do
   begin
   if j=i then break;
   max:=0;
   for d:=1 to i-1 do
   if f[d,j-1]*sum(d+1,i)>max
    then max:=f[d,j-1]*sum(d+1,i);
   f[i,j]:=max
   end;
 writeln(f[n,k])
end.