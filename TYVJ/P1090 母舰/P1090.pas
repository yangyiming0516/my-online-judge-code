var m,n,i,sumf,sumg,p,h:longint;
    f,g:array[1..100000]of longint;
procedure qsf(l,r:longint);
var i,j,x,t:longint;
begin
  i:=l;j:=r;t:=f[(l+r)div 2];
  repeat
   while f[i]<t do inc(i);
   while f[j]>t do dec(j);
   if i<=j then
    begin
    x:=f[i];f[i]:=f[j];f[j]:=x;
    inc(i);dec(j)
    end;
  until i>j;
 if l<j then qsf(l,j);
 if i<r then qsf(i,r)
end;
procedure qsg(l,r:longint);
var i,j,x,t:longint;
begin
  i:=l;j:=r;t:=g[(l+r)div 2];
  repeat
   while g[i]<t do inc(i);
   while g[j]>t do dec(j);
   if i<=j then
    begin
    x:=g[i];g[i]:=g[j];g[j]:=x;
    inc(i);dec(j)
    end;
  until i>j;
 if l<j then qsg(l,j);
 if i<r then qsg(i,r)
end;
begin
 readln(m,n);
 sumf:=0;sumg:=0;
 for i:=1 to m do
  begin
  readln(f[i]);
  sumf:=sumf+f[i]
  end;
 for i:=1 to n do
  begin
  readln(g[i]);
  sumg:=sumg+g[i]
  end;
 qsf(1,m);
 qsg(1,n);
 if (m>n) or (sumf>sumg) then begin writeln(0); exit end;
 h:=1;
 p:=0;
 repeat
  inc(p);
  if g[p]>f[h] then begin inc(h);sumg:=sumg-g[p] end;
 until (h=m+1)or(p=n);
 if h=m+1 then writeln(sumg) else writeln(0)
end.