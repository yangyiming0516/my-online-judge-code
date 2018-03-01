VAR  t,m,i,j,ans:longint;
     time,value:array[1..100]of longint;
     f:array[0..100,0..1000]of longint;
BEGIN
 readln(t,m);
 for i:=1 to m do
  readln(time[i],value[i]);
fillchar(f,sizeof(f),0);
 for i:=1 to m do
  begin
   f[i,time[i]]:=value[i];
   for j:=0 to t do
     if f[i-1,j]>0 then
       begin
        if f[i-1,j]>f[i,j] then f[i,j]:=f[i-1,j];
        if (j+time[i]<=t)and(f[i-1,j]+value[i]>f[i,j+time[i]])
           then  f[i,j+time[i]]:=f[i-1,j]+value[i];
       end;
  end;
 ans:=0;
 for i:=1 to t do
  if f[m,i]>ans then ans:=f[m,i];
 writeln(ans)
END.