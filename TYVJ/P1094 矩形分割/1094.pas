var n,m,k,x,i,j,p,q,ans:longint;
    value:array[1..4000]of longint;
    kind:array[1..4000]of byte;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
 i:=l;j:=r;x:=value[l+random(r-l+1)];
 repeat
  while value[i]>x do inc(i);
  while value[j]<x do dec(j);
  if i<=j then
   begin
   t:=value[i];value[i]:=value[j];value[j]:=t;
   t:=kind[i];kind[i]:=kind[j];kind[j]:=t;
   inc(i);dec(j)
   end;
 until i>j;
if l<j then qs(l,j);
if i<r then qs(i,r)
end;
begin
randomize;
 readln(n,m);k:=0;
 for i:=1 to n-1 do
  begin
  read(x);
  inc(k);
  value[k]:=x;
  kind[k]:=1;
  end;
 for i:=1 to m-1 do
  begin
  read(x);
  inc(k);
  value[k]:=x;
  kind[k]:=2
  end;
 p:=0;q:=0;
 qs(1,m+n-2);
 ans:=0;
 for i:=1 to m+n-2 do
  if kind[i]=1 then
   begin
   inc(ans,value[i]*(q+1));
   inc(p)
   end else
   begin
   inc(ans,value[i]*(p+1));
   inc(q)
   end;
 writeln(ans)
end.
