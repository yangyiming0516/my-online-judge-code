type
 node=^edge;
 edge=record
  next:node;
  p:longint
  end;
var g1,g2:array[1..100000]of node;
    f,g,Q,w:array[1..100000]of longint;
    ok:array[1..100000]of boolean;
    i,n,m,h,ans,x,y,z,k,head,tail:longint;
    s:node;
procedure init;
var i:longint;
begin
 for i:=1 to n do
  begin
   g1[i]:=nil;
   g2[i]:=nil
  end;
end;
function min(a,b:longint):longint;
begin if a<b then exit(a) else exit(b) end;
function max(a,b:longint):longint;
begin if a<b then exit(b) else exit(a) end;
procedure insert(a,b:longint);
begin
  new(s);
  s^.p:=b;
  s^.next:=g1[a];
  g1[a]:=s;
  new(s);
  s^.p:=a;
  s^.next:=g2[b];
  g2[b]:=s
end;
begin
 readln(n,m);
 init;
 for i:=1 to n do
  read(w[i]);
 for i:=1 to m do
  begin
   readln(x,y,z);
   insert(x,y);
   if z=2 then insert(y,x)
  end;
filldword(f,sizeof(f)div 4,maxlongint);
filldword(g,sizeof(g)div 4,0);
fillchar(ok,sizeof(ok),true);
 head:=1;tail:=1;k:=1;q[1]:=1;ok[1]:=false;f[1]:=w[1];
 while k>0 do
  begin
   dec(k);
   h:=q[head];
   ok[h]:=true;
   head:=(head mod n)+1;
   s:=g1[h];
   while s<>nil do
    begin
    if f[s^.p]>min(f[h],w[s^.p]) then
     begin
     if ok[s^.p] then
      begin
      tail:=(tail mod n)+1;
      q[tail]:=s^.p;
      ok[s^.p]:=false;
      inc(k);
      end;
     f[s^.p]:=min(f[h],w[s^.p]);
     end;
    s:=s^.next
    end;
  end;
fillchar(ok,sizeof(ok),true);
 head:=1;tail:=1;k:=1;q[1]:=n;ok[n]:=false;g[n]:=w[n];
 while k>0 do
  begin
  dec(k);
  h:=q[head];
  ok[h]:=true;
  head:=(head mod n)+1;
  s:=g2[h];
  while s<>nil do
   begin
   if g[s^.p]<max(g[h],w[s^.p]) then
    begin
    if ok[s^.p] then
     begin
     tail:=(tail mod n)+1;
     q[tail]:=s^.p;
     ok[s^.p]:=false;
     inc(k);
     end;
    g[s^.p]:=max(g[h],w[s^.p]);
    end;
   s:=s^.next
   end;
  end;
 ans:=0;
 for i:=1 to n do
  if g[i]-f[i]>ans then ans:=g[i]-f[i];
 writeln(ans);
end.