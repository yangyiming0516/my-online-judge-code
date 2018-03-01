type node=^edge;
   edge=record
    next:node;
    p,data:longint;
    end;
var g:array[1..700]of node;s:node;
    a:array[1..700]of longint;
    rr:array[1..700]of longint;
    d:array[1..1000000]OF LONGINT;
    ind:array[1..700]of boolean;
    n,i,j,k,p,l,r,ans,sum:longint;
procedure insert(a,b:longint);
begin
  new(s);
  s^.p:=b;
  s^.data:=(a*b)mod 10+(a+b)mod 6+1;
  s^.next:=g[a];
  g[a]:=s
end;
begin
 readln(n);
 for i:=1 to n do g[i]:=nil;
 for i:=1 to n do
  a[i]:=(i-1)mod 10+1;
 for i:=1 to n do
  if i<=5 then
   begin
   for j:=1 to 5 do
    if i<>j then insert(i,j);
   end
  else
   begin
   insert(i,i-1);insert(i-1,i);
   insert(i,i-3);insert(i-3,i);
   end;
 ans:=maxlongint;
 for i:=1 to n do
  begin
  filldword(rr,sizeof(rr)div 4,maxlongint div 2);
  fillchar(ind,sizeof(ind),false);
  l:=0;r:=1;rr[i]:=0;d[1]:=i;ind[i]:=true;
  while l<r do
   begin
   inc(l);
   s:=g[d[l]];
   while s<>nil do
    begin
    if rr[d[l]]+s^.data<rr[s^.p] then
     begin
     rr[s^.p]:=rr[d[l]]+s^.data;
      if not ind[s^.p] then
       begin
       ind[s^.p]:=true;
       inc(r);
       d[r]:=s^.p
       end;
     end;
    s:=s^.next
    end;
   end;
 sum:=0;
 for j:=1 to n do
  sum:=sum+a[j]*rr[j]+a[j];
 if sum<ans then begin ans:=sum;p:=i end;
 end;
 writeln(ans);
 writeln(p)
end.