{
ID:yangyim1
PROG:concom
LANG:PASCAL
}
var i,j,n,p,q,max:longint;
    f:array[1..100,1..100]of longint;
    ed:array[1..100,1..100]of boolean;
    flag:boolean;
procedure dfs(a,b:longint);
var i:longint;
begin
 if (ed[a,b])or(a=b) then exit;
 ed[a,b]:=true;
 for i:=1 to max do
  begin
  if i<>a then f[a,i]:=f[a,i]+f[b,i];
  if f[a,i]>50 then dfs(a,i)
  end;
end;
begin
assign(input,'concom.in');reset(input);
assign(output,'concom.out');rewrite(output);
 readln(n);
 fillchar(f,sizeof(f),0);
 fillchar(ed,sizeof(ed),false);
 max:=0;
 for i:=1 to n do
  begin
   read(p,q);
   if p>max then max:=p;
   if q>max then max:=q;
   readln(f[p,q]);
  end;
 for i:=1 to max do
  for j:=1 to max do
   if f[i,j]>50 then dfs(i,j);
 flag:=true;
 for i:=1 to max do
  for j:=1 to max do
   begin
   if ed[i,j] then writeln(i,' ',j);
   flag:=false
   end;
 if flag then writeln(0);
close(input);close(output)
end.
