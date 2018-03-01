type node=^edge;
     edge=record
      next:node;
      point:longint;
      end;
var g:array[1..200]of node;
    s:node;
    ed:array[1..200]of longint;
    link:array[1..200]of longint;
    m,n,i,j,p,ans:longint;
    k:char;
procedure init;
var i:longint;
begin
 for i:=1 to m+n do
  g[i]:=nil
end;
procedure insert(a,b:longint);
begin
 new(s);
 s^.point:=b;
 s^.next:=g[a];
 g[a]:=s;
 new(s);
 s^.point:=a;
 s^.next:=g[b];
 g[b]:=s
end;
function find(h:longint):boolean;
var w:node;
begin
 w:=g[h];
 while w<>nil do
  begin
  if ed[w^.point]<>p then
   begin
   ed[w^.point]:=p;
   if (link[w^.point]=0)or find(link[w^.point])
    then
    begin
    link[w^.point]:=h;
    exit(true)
    end;
   end;
  w:=w^.next
  end;
 exit(false)
end;
begin
 readln(n,m);
 init;
 for i:=1 to n do
  begin
  for j:=1 to m do
   begin
   read(k);
   if k='1' then insert(i,n+j)
   end;
  readln
  end;
 ans:=0;
fillchar(ed,sizeof(ed),0);
fillchar(link,sizeof(link),0);
 for p:=1 to n do
  if find(p) then inc(ans);
 writeln(ans)
end.