VAR m,n,p,q,h,k,i,j,iy,jy,max:integer;
    a:array[0..50,0..50]of integer;
    f:array[0..100,0..500,0..500]of integer;
BEGIN
 readln(n,m);
fillchar(a,sizeof(a),0);
 for i:=1 to n do
  for j:=1 to m do
   read(a[i,j]);
fillchar(f,sizeof(f),0);
for k:=1 to N+M-2 do
 for i:=1 to n do
  for j:=1 to n do
   begin
   if (i=j)or(i-1>k)or(j-1>k)then continue;
   iy:=k-i+2;
   jy:=k-j+2;
   if (iy>m)or(jy>m) then continue;
   max:=0;
   if (iy>1)and(jy>1)then if f[k-1,i,j]>max then max:=f[k-1,i,j];
   if (iy>1)and(j>1)then if f[k-1,i,j-1]>max then max:=f[k-1,i,j-1];
   if (i>1) and(jy>1)then if f[k-1,i-1,j]>max then max:=f[k-1,i-1,j];
   if (i>1) and(j>1) then if f[k-1,i-1,j-1]>max then max:=f[k-1,i-1,j-1];
   f[k,i,j]:=max+a[i,iy]+a[j,jy];
   end;
   writeln(f[n+m-3,n-1,n]);
END.