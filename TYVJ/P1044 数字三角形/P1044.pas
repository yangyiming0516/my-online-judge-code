var  a,f:array[0..1000,0..1000] of longint;
     n,i,j,max:longint;
BEGIN
  fillchar(a,sizeof(a),0);
  fillchar(f,sizeof(f),0);
  readln(n);
  for i:=1 to n do
    for j:=1 to i do
     read(a[i,j]);
     readln;
  f[1,1]:=a[1,1];
  for i:=2 to n do
   for j:=1 to i do
   if f[i-1,j]>=f[i-1,j-1] then
     f[i,j]:=f[i-1,j]+a[i,j] else
     f[i,j]:=f[i-1,j-1]+a[i,j];
  max:=0;
  for i:=1 to n do
   if f[n,i]>max then max:=f[n,i];
  writeln(max);
end.