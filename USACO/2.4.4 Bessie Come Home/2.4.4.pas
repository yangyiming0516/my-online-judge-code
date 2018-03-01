{
ID:yangyim1
PROG:comehome
LANG:PASCAL
}
type node=^edge;
     edge=record
      next:node;
      p,data:longint
      end;
     vertex=record
      link:node;
      dis:longint
      end;
var g:array[1..52]of vertex;
    ind:array[1..52]of boolean;
    d:array[1..1000]of longint;
    i,p,l,r,h,ans,w:longint;
    a,b,space:char;
    s:node;
procedure insert(a,b:char;h:longint);
var x,y:longint;
begin
 if (a>='a')and(a<='z') then x:=ord(a)-96 else x:=ord(a)-38;
 if (b>='a')and(b<='z') then y:=ord(b)-96 else y:=ord(b)-38;
 new(s);
 s^.data:=h;
 s^.p:=y;
 s^.next:=g[x].link;
 g[x].link:=s
end;
begin
assign(input,'comehome.in');reset(input);
assign(output,'comehome.out');rewrite(output);
 for i:=1 to 52 do
  begin
  g[i].link:=nil;
  g[i].dis:=maxlongint;
  end;
 readln(p);
 for i:=1 to p do
  begin
  read(a);
  read(space);
  read(b);
  read(space);
  readln(h);
  insert(a,b,h);
  insert(b,a,h);
  end;
fillchar(ind,sizeof(ind),false);
 l:=0;r:=1;d[1]:=52;ind[52]:=true;g[52].dis:=0;
 while l<r do
  begin
  inc(l);
  ind[d[l]]:=false;
  s:=g[d[l]].link;
  while s<>nil do
   begin
   if g[d[l]].dis+s^.data<g[s^.p].dis then
   begin
   g[s^.p].dis:=g[d[l]].dis+s^.data;
   if not ind[s^.p] then
    begin
    inc(r);
    d[r]:=s^.p;
    ind[s^.p]:=true
    end;
   end;
   s:=s^.next
   end;
  end;
 ans:=maxlongint;
 for i:=27 to 51 do
  if g[i].dis<ans then
   begin
   ans:=g[i].dis;
   w:=i
   end;
 writeln(chr(w+38),' ',ans);
close(input);close(output)
END.
