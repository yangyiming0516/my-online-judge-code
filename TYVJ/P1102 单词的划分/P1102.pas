var f:array[0..100]of longint;
   st:string;
   s:array[1..100]of string;
   n,i,j:longint;
begin
  readln(st);
  readln(n);
  for i:=1 to n do
   readln(s[i]);
  f[0]:=0;
  for i:=1 to length(st) do
   begin
   f[i]:=maxlongint;
   for j:=1 to n do
    if i>=length(s[j]) then
    if copy(st,i-length(s[j])+1,length(s[j]))=s[j] then
     if f[i-length(s[j])]+1<f[i] then f[i]:=f[i-length(s[j])]+1;
   end;
  writeln(f[i])
end.