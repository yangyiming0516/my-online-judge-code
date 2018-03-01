var c:array[1..200,1..200]of longint;
    p:array[0..1000]of longint;
    f:array[0..1,1..200,1..200]of longint;
    i,j,k,l,n,ans:longint;
begin
 readln(l,n);
 for i:=1 to l do
  for j:=1 to l do
   read(c[i,j]);
 for i:=1 to n do
  read(p[i]);
 p[0]:=3;
 filldword(f,sizeof(f)div 4,maxlongint);
 f[0,1,2]:=0;
 for i:=1 to n do
  for j:=1 to l do
   for k:=1 to l do
    begin
    if f[(i-1)mod 2,j,k]<maxlongint then
     begin
     if f[i mod 2,j,k]>f[(i-1)mod 2,j,k]+c[p[i-1],p[i]]
      then f[i mod 2,j,k]:=f[(i-1)mod 2,j,k]+c[p[i-1],p[i]];
     if f[i mod 2,j,p[i-1]]>f[(i-1)mod 2,j,k]+c[k,p[i]]
      then f[i mod 2,j,p[i-1]]:=f[(i-1)mod 2,j,k]+c[k,p[i]];
     if f[i mod 2,k,p[i-1]]>f[(i-1)mod 2,j,k]+c[j,p[i]]
      then f[i mod 2,k,p[i-1]]:=f[(i-1)mod 2,j,k]+c[j,p[i]]
     end;
    f[(i-1)mod 2,j,k]:=maxlongint;
    end;
  ans:=maxlongint;
  for i:=1 to l do
   for j:=1 to l do
    if f[n mod 2,i,j]<ans then ans:=f[n mod 2,i,j];
  writeln(ans)
END.