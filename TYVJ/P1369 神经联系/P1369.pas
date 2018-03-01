const lim=maxlongint div 2;

var r:array[1..100,1..100]of longint;
    dist:array[1..100]of longint;
    g:array[1..100]of boolean;
    n,m,i,j,l,d,x,y:longint;
    st:string;
function dp(s:string):longint;
var i,j,max,ans:longint;
    f:array[1..300]of integer;
begin
 ans:=0;
 for i:=1 to length(s) do
  begin
  f[i]:=1;
  max:=0;
  for j:=1 to i-1 do
   if (s[j]<s[i])and(f[j]>max) then
    max:=f[j];
  f[i]:=f[i]+max;
  if f[i]>ans then ans:=f[i]
  end;
 exit(ans);
end;
function make(s:string):longint;
var u:longint;
begin
 val(s,u);
 if (u>0)or(s='0') then exit(u);
 if s='memory' then exit(0);
 if pos('memory',s)>0 then exit(1);
 if dp(s)>=6 then exit(2);
 exit(length(s))
end;
begin
 readln(n,m);
 for i:=1 to n do
  for j:=1 to n do
   r[i,j]:=lim;
 for i:=1 to m do
  begin
  read(x,y);
  readln(st);
  r[x,y]:=make(copy(st,2,length(st)-1));
  r[y,x]:=r[x,y];
  end;
 g[1]:=true;
 for i:=2 to n do
  begin
  g[i]:=false;
  dist[i]:=r[1,i];
  end;
 for i:=1 to n-2 do
  begin
  l:=lim;
  d:=1;
   for j:=1 to n do
    if (g[j]=false)and(dist[j]<l) then
     begin
     l:=dist[j];
     d:=j;
     end;
   g[d]:=true;
   for j:=1 to n do
    if (g[j]=false)and(dist[d]+r[d,j]<dist[j]) then
    dist[j]:=dist[d]+r[d,j];
  end;
 writeln(dist[n])
end.