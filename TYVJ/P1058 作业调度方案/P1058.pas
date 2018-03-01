var a:array[1..400]of byte;
    g,t:array[1..20,1..20]of byte;
    f:array[1..20,0..400]of boolean;
    d,h:array[1..20]of integer;
    m,n,i,j,l,p,ans:longint;
begin
 readln(m,n);
 for i:=1 to m*n do
  read(a[i]);
 for i:=1 to n do
  for j:=1 to m do
   read(g[i,j]);
 for i:=1 to n do
  for j:=1 to m do
   read(t[i,j]);
 fillchar(d,sizeof(d),0);
 fillchar(h,sizeof(h),0);
 fillchar(f,sizeof(f),true);
 for i:=1 to m*n do
  begin
  inc(d[a[i]]);
  l:=h[a[i]];
  p:=0;
   repeat
   inc(l);
   if f[g[a[i],d[a[i]]],l] then inc(p)
   else p:=0;
   until p=t[a[i],d[a[i]]];
  h[a[i]]:=l;
  for j:=l downto l-p+1 do
   f[g[a[i],d[a[i]]],j]:=false;
  end;
 ans:=0;
 for i:=1 to n do
  if h[i]>ans then ans:=h[i];
 writeln(ans)
end.