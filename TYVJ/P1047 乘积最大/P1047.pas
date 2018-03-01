const p:array['0'..'9']of byte=(0,1,2,3,4,5,6,7,8,9);
var n,k,i,j,h:longint;
    max:int64;
    s:string;
    num,f:array[0..40,0..40]of int64;
begin
 readln(n,k);
 readln(s);
 num[1,0]:=0;
 for i:=1 to n do
  for j:=i to n do
   num[i,j]:=num[i,j-1]*10+p[s[j]];
 for i:=1 to n do
  f[i,0]:=num[1,i];
 for i:=2 to n do
  for j:=1 to k do
   if j<=i-1 then
   begin
    max:=0;
    for h:=1 to i-1 do
    if f[h,j-1]*num[h+1,i]>max then max:=f[h,j-1]*num[h+1,i];
    f[i,j]:=max
   end;
 writeln(f[n,k])
end.