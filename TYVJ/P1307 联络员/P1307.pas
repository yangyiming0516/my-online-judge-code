var father:array[1..2000]of integer;
    d:array[1..10000,0..2]of longint;
    n,m,i,p,u,v,w,r,ans:longint;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
 i:=l;j:=r;t:=d[(l+r)div 2,0];
 repeat
  while d[i,0]<t do inc(i);
  while d[j,0]>t do dec(j);
  if i<=j then
   begin
   x:=d[i,0];d[i,0]:=d[j,0];d[j,0]:=x;
   x:=d[i,1];d[i,1]:=d[j,1];d[j,1]:=x;
   x:=d[i,2];d[i,2]:=d[j,2];d[j,2]:=x;
   inc(i);dec(j);
   end;
  until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
function getfather(x:integer):integer;
begin
  if father[x]=0 then exit(x);
  exit(getfather(father[x]))
end;
begin
 readln(n,m);
fillchar(father,sizeof(father),0);
ans:=0;r:=0;
 for i:=1 to m do
  begin
  read(p);
  if p=1 then
   begin
   readln(u,v,w);
   if getfather(u)<>getfather(v) then
   father[getfather(v)]:=getfather(u);
   ans:=ans+w
   end
  else
   begin
   readln(u,v,w);
   inc(r);
   d[r,1]:=u;
   d[r,2]:=v;
   d[r,0]:=w
   end;
  end;
  qs(1,r);
  for i:=1 to r do
   if getfather(d[i,1])<>getfather(d[i,2]) then
    begin
     ans:=ans+d[i,0];
     father[getfather(d[i,1])]:=getfather(d[i,2])
    end;
  writeln(ans)
end.