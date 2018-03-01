type node=^edge;
     vertex=record
      ed:boolean;
      link:node
      end;
     edge=record
      point:longint;
      next:node
      end;
     que=record
      point,time:longint;
      end;
var g:array[1..100000]of vertex;
    s:node;
    d:array[1..100000]of que;
    n,p,c,m,i,l,r,a,b,max:longint;
procedure insert(x,y:longint);
begin
 new(s);
 s^.point:=y;
 s^.next:=g[x].link;
 g[x].link:=s
end;
begin
 readln(n,p,c);
 readln(m);
 for i:=1 to n do
  begin
  g[i].link:=nil;
  g[i].ed:=false
  end;
 for i:=1 to p do
  begin
  readln(a,b);
  insert(a,b);
  insert(b,a)
  end;
 d[1].point:=c;d[1].time:=1;g[c].ed:=true;
 l:=0;r:=1;max:=0;
 while l<r do
  begin
  inc(l);
  s:=g[d[l].point].link;
  while s<>nil do
   begin
   if not g[s^.point].ed then
    begin
    inc(r);
    d[r].point:=s^.point;
    g[s^.point].ed:=true;
    d[r].time:=d[l].time+1;
    end;
   s:=s^.next
   end;
  end;
 writeln(d[r].time+m)
end.
