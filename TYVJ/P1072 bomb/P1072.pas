type node=^edge;
     vertex=record
      link:node;
      goin,data:longint;
      end;
     edge=record
      next:node;
      point:longint;
      end;
var g:array[1..1000]of vertex;
    x,y,z:array[1..1000]of longint;
    ed:array[1..1000]of boolean;
    match:array[1..1000]of longint;
    i,j,n,ans:longint;
procedure insert(a,b:longint);
var s:node;
begin
 inc(g[b].goin);
 new(S);
 s^.point:=b;
 s^.next:=g[a].link;
 g[a].link:=s;
end;
procedure top;
var l,r,i:longint;
    s:node;
    d:array[1..1000]of longint;
begin
 l:=0;r:=0;
 for i:=1 to n do
  if g[i].goin=0 then
   begin
   inc(r);
   d[r]:=i;
   g[i].data:=1;
   end;
 while l<r do
  begin
  inc(l);
  s:=g[d[l]].link;
  while s<>nil do
   begin
   dec(g[s^.point].goin);
   if g[s^.point].data<g[d[l]].data+1 then g[s^.point].data:=g[d[l]].data+1;
   if g[s^.point].goin=0 then
    begin
    inc(r);
    d[r]:=s^.point
    end;
   s:=s^.next
   end;
  end;
end;
function find(x:longint):boolean;
var s:node;
begin
 s:=g[x].link;
 while s<>nil do
  begin
   if ed[s^.point] then
    begin
    ed[s^.point]:=false;
     if (match[s^.point]=0)or find(match[s^.point]) then
      begin
      match[s^.point]:=x;
      exit(true)
      end;
    end;
   s:=s^.next
  end;
 exit(false)
end;
procedure maxmatch;
var max,i:longint;
begin
 max:=0;
 fillchar(match,sizeof(match),0);
 for i:=1 to n do
  begin
  fillchar(ed,sizeof(ed),true);
  if find(i) then inc(max);
  end;
 writeln(n-max)
end;
begin
 readln(n);
 for i:=1 to n do
  readln(x[i],y[i],z[i]);
fillchar(g,sizeof(g),0);
 for i:=1 to n do
  for j:=1 to n do
   if (x[i]<x[j])and(y[i]<y[j])and(z[i]<z[j]) then insert(i,j);
 top;
 ans:=0;
 for i:=1 to n do
  if g[i].data>ans then ans:=g[i].data;
 writeln(ans);
 maxmatch;
end.
