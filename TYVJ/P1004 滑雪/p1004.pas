VAR k,f:array[1..100,1..100]of longint;
    x,y,i,j,max:longint;
function hua(a,b:longint):longint;
var  dh:array[1..4]of integer=(0,1,0,-1);
     ds:array[1..4]of integer=(1,0,-1,0);
     u,m,aa,bb,t:longint;
begin
  if f[a,b]<>0 then exit(f[a,b]);
   m:=0;
   for u:=1 to 4 do
    begin
      aa:=a+dh[u];
      bb:=b+ds[u];
      if (aa<=x)and(aa>=1)and(bb<=y)and(bb>=1)and(k[a,b]<k[aa,bb])then
          begin
           t:=hua(aa,bb)+1;
           if t>=m then m:=t;
           end;
   end;
   f[a,b]:=m;
   hua:=m;
end;
BEGIN
  readln(x,y);
  for i:=1 to x do
   for j:=1 to y do
    read(k[i,j]);
  for i:=1 to x do
    for j:=1 to y do
        f[i,j]:=hua(i,j);
  max:=0;
  for i:=1 to x do
    for j:=1 to y do
     if f[i,j]>max then
      max:=f[i,j];
  writeln(max+1)
END.