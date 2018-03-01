type treap=record
     l,r,data,key,f:longint; 
     end; 
var t:array[0..40000]of treap; 
    n,m,i,ans,num:longint; 
function root:longint; 
begin exit(t[0].r) end; 
procedure leftrotate(x:longint); 
var y:longint; 
begin
 y:=t[x].f; 
 t[y].l:=t[x].r;t[t[y].l].f:=y;t[x].r:=y; 
 if t[t[y].f].l=y then t[t[y].f].l:=x else t[t[y].f].r:=x; 
 t[x].f:=t[y].f;t[y].f:=x; 
end; 
procedure rightrotate(x:longint); 
var y:longint; 
begin
 y:=t[x].f; 
 t[y].r:=t[x].l;t[t[y].r].f:=y;t[x].l:=y; 
 if t[t[y].f].l=y then t[t[y].f].l:=x else t[t[y].f].r:=x; 
 t[x].f:=t[y].f;t[y].f:=x; 
end; 
procedure init; 
begin
 randomize;num:=0; 
 t[0].key:=maxlongint; 
 t[0].l:=0;t[0].r:=0;t[0].data:=-maxlongint; 
end; 
procedure insert(m:longint); 
var f,s:longint; 
begin
 s:=root;f:=0; 
 while s<>0 do
  begin
   f:=s; 
   if m<t[s].data then s:=t[s].l else s:=t[s].r 
  end; 
  inc(num);s:=num;t[s].f:=f;t[s].data:=m;t[s].l:=0;t[s].r:=0; 
  t[s].key:=random(maxlongint); 
  if m<t[f].data then t[f].l:=s else t[f].r:=s; 
  while t[s].key>t[f].key do
   begin
   if t[f].l=s then leftrotate(s) else rightrotate(s); 
   f:=t[s].f 
   end; 
end; 
function findpred(m:longint):longint; 
var s:longint; 
begin
  s:=root;findpred:=-maxlongint; 
  while s<>0 do
   if t[s].data<=m then begin findpred:=t[s].data;s:=t[s].r end
   else s:=t[s].l; 
end; 
function findsucc(m:longint):longint; 
var s:longint; 
begin
  s:=root;findsucc:=-maxlongint; 
  while s<>0 do
   if t[s].data>=m then begin findsucc:=t[s].data;s:=t[s].l end
   else s:=t[s].r; 
end; 
function make(m:longint):longint; 
var p:longint; 
begin
 make:=maxlongint; 
 p:=findpred(m); 
 if (p>-maxlongint)and(m-p<make) then make:=m-p; 
 p:=findsucc(m); 
 if (p>-maxlongint)and(p-m<make) then make:=p-m 
end; 
begin
 init; 
 readln(n); 
 readln(m); 
 ans:=m; 
 insert(m); 
 for i:=2 to n do
  begin
  readln(m); 
  ans:=ans+make(m); 
  insert(m); 
  end; 
 writeln(ans); 
end. 