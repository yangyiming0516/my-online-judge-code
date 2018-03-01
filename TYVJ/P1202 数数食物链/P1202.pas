const x=11129;
type
  t=^node;
  node=record
    data:longint;
    next:t;
    end;
var g:array[1..50000]of t;
    f,p,d:array[1..50000]of longint;
    ding:array[1..50000]of boolean;
    s:^node;
    n,m,i,j,a,b,r,h,ans:longint;
begin
 readln(n,m);
 for i:=1 to n do
  g[i]:=nil;
fillchar(p,sizeof(p),0);
fillchar(ding,sizeof(ding),true);
 for i:=1 to m do
  begin
  readln(a,b);
  new(s);
  s^.next:=g[a];
  s^.data:=b;
  g[a]:=s;
  inc(p[b]);
  ding[a]:=false
  end;
 r:=0;
fillchar(f,sizeof(f),0);
 for i:=1 to n do
  if p[i]=0 then
   begin
   inc(r);
   d[r]:=i;
   f[i]:=1;
   end;
 while r>0 do
  begin
   h:=d[r];
   s:=g[h];
   dec(r);
   while s<>nil do
    begin
    j:=s^.data;
    f[j]:=(f[j]+f[h])mod x;
    dec(p[j]);
    if p[j]=0 then
     begin inc(r);d[r]:=j end;
    s:=s^.next
    end;
  end;
 ans:=0;
 for i:=1 to n do
  if ding[i] then ans:=(ans+f[i])mod x;
 writeln(ans)
end.