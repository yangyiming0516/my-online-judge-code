type node=^edge;
     edge=record
      next:node;
      point:longint
      end;
var s:node;
    g:array[1..1000]of node;
    ed,link:array[1..1000]of longint;
    x,y,v:real;
    doorx,doory:array[1..1000]of real;
    i,j,t,a,r,p,ans:longint;
procedure insert(x,y:longint);
begin
 new(s);
 s^.point:=y;
 s^.next:=g[x];
 g[x]:=s
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
   if (link[w^.point]=0)or find(link[w^.point]) then
    begin
    link[w^.point]:=h;
    exit(true)
    end
   end;
  w:=w^.next
  end;
 exit(false)
end;
begin
 readln(r,a,t);
 for i:=1 to r do g[i]:=nil;
 for i:=1 to a do
  begin
  read(x,y);
  doorx[i]:=x;
  doory[i]:=y
  end;
 for i:=1 to r do
  begin
  readln(x,y,v);
  for j:=1 to a do
   if sqrt((x-doorx[j])*(x-doorx[j])+(y-doory[j])*(y-doory[j]))<=v*t then
    insert(i,j);
  end;
 fillchar(ed,sizeof(ed),0);
 fillchar(link,sizeof(link),0);
 ans:=0;
 for p:=1 to r do
  if find(p) then inc(ans);
 writeln(ans)
END.