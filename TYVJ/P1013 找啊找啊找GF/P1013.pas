VAR f,t:array[0..100,0..100]of longint;
    rmb,rp,time:array[0..100]of integer;
    n,m,r,k,i,j:integer;
BEGIN
  readln(n);
  for i:=1 to n do
   readln(rmb[i],rp[i],time[i]);
  readln(m,r);
fillchar(f,sizeof(f),0);
fillchar(t,sizeof(t),0);
  for k:=1 to n do
   for i:=m downto rmb[k] do
    for j:=r downto rp[k] do
     begin
     if f[i-rmb[k],j-rp[k]]+1=f[i,j]
        then if t[i-rmb[k],j-rp[k]]+time[k]<t[i,j]
               then t[i,j]:=t[i-rmb[k],j-rp[k]]+time[k];
     if f[i-rmb[k],j-rp[k]]+1>f[i,j]
       then
          begin
          f[i,j]:=f[i-rmb[k],j-rp[k]]+1;
          t[i,j]:=t[i-rmb[k],j-rp[k]]+time[k];
          end;
     end;
  writeln(t[m,r])
END.