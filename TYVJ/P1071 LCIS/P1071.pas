var a,b,f:array[0..3000]of longint;
    n,i,j,max,ans:longint;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do read(b[i]);
fillchar(f,sizeof(f),0);
 for i:=1 to n do
  begin
  max:=0;
  for j:=1 to n do
   begin
   if a[i]=b[j] then f[j]:=max+1;
   if a[i]>b[j] then
     if f[j]>max then max:=f[j];
   end;
  end;
 ans:=0;
 for i:=1 to n do
  if f[i]>ans then ans:=f[i];
 writeln(ans)
end.