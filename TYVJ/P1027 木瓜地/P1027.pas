VAR xx:array[1..4] of integer=(-1,0,1,0);
    yy:array[1..4] of integer=(0,1,0,-1);
    f:array[0..41,0..41]of longint;
    n,m,a,b,x,y,i,j:integer;
    max,ans:longint;
BEGIN
  readln(n,m);
  for i:=1 to n do
   for j:=1 to m do
    read(f[i,j]);
  a:=1;b:=1;
  ans:=f[1,1];
  repeat
   max:=0;
   f[a,b]:=0;
   for i:=1 to 4 do
     if f[a+xx[i],b+yy[i]]>max then
      begin
       max:=f[a+xx[i],b+yy[i]];
       x:=xx[i];
       y:=yy[i]
     end;
   ans:=ans+max;
   a:=a+x;
   b:=b+y
  until (a=n)and(b=m);
  writeln(ans)
END.