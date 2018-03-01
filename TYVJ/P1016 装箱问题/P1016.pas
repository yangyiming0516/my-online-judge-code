VAR  v,n,i,j,max:longint;
     a:array[1..30]of longint;
     f:array[0..30,0..20000]of boolean;
bEGIN
  readln(v);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  fillchar(f,sizeof(f),false);
for i:=0 to n do
f[i,0]:=true;
  for i:=1 to n do
   for j:=0 to v do
    if (f[i-1,j]=true)
    then
       begin
       f[i,j]:=true;
       if j+a[i]<=v then f[i,j+a[i]]:=true;
       end;
  for i:=0 to v do
   if f[n,i]=true then max:=i;
    writeln(v-max)
END.