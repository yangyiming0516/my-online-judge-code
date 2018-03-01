{
ID:yangyim1
PROG:cowtour
LANG:PASCAL
}
VAR d:array[1..150,1..150]of real;
    a:array[1..150,1..150]of char;
    f,x,y:array[1..150]of real;
    max1,max2:real;
    i,j,k,n:longint;
    ch:char;
FUNCTION distance(p,q:longint):real;
begin
   if p=q then exit(0);
   if a[p,q]='0' then exit(maxlongint);
   exit(sqrt(sqr(x[p]-x[q])+sqr(y[p]-y[q])))
end;
function dis(p,q:longint):real;
begin
  exit(sqrt(sqr(x[p]-x[q])+sqr(y[p]-y[q])))
end;
BEGIN
assign(input,'cowtour.in');reset(input);
assign(output,'cowtour.out');rewrite(output);
	readln(n);
	for i:=1 to n do
	readln(x[i],y[i]);
	for i:=1 to n do
	 begin
	  for j:=1 to n do read(a[i,j]);
	  readln
	 end;
        for i:=1 to n do
         for j:=1 to n do
          d[i,j]:=distance(i,j);
	 for k:=1 to n do
	  for i:=1 to n do
	   for j:=1 to n do
	   if d[i,k]+d[k,j]<d[i,j] then d[i,j]:=d[i,k]+d[k,j];
	max1:=0;
	for i:=1 to n do
	 begin
          f[i]:=0;
          for j:=1 to n do
           if (d[i,j]<maxlongint)and(d[i,j]>f[i]) then f[i]:=d[i,j];
	  if f[i]>max1 then max1:=f[i]
         end;
	max2:=maxlongint;
	for i:=1 to n do
         for j:=1 to n do
	  if d[i,j]=maxlongint then if dis(i,j)+f[i]+f[j]<max2 then max2:=dis(i,j)+f[i]+f[j];
	if max1>max2 then writeln(max1:0:6) else writeln(max2:0:6);
close(input);close(output)
END.
