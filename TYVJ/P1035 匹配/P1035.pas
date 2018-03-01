const p:array[1..4]of integer=(0,1,0,-1);
      q:array[1..4]of integer=(1,0,-1,0);
var  a,s:array[1..100,1..100]of boolean;
     f:array[1..100,1..100,1..2]of integer;
     n,m,i,j,x,y:integer;
     ans:longint;
function ok(r,t:integer):boolean;
var i,u,v:integer;
begin
  for i:=1 to 4 do
   begin
   u:=r+p[i];
   v:=t+q[i];
   if (u<1)or(u>n)or(v<1)or(v>n) then continue;
   if (a[u,v]=false)or(s[u,v]=false) then continue;
   s[u,v]:=false;
   if (f[u,v,1]=0)or ok(f[u,v,1],f[u,v,2]) then
   begin
    f[u,v,1]:=r;
    f[u,v,2]:=t;
    exit(true)
   end;
   end;
  exit(false)
end;
begin
fillchar(a,sizeof(a),true);
fillchar(f,sizeof(f),0);
  readln(n,m);
  for i:=1 to m do
  begin
  readln(x,y);
  a[x,y]:=false;
  end;
 ans:=0;
 for i:=1 to n do
  for j:=1 to n do
   if a[i,j] and (i mod 2=j mod 2) then
   begin
   fillchar(s,sizeof(s),true);
   s[i,j]:=false;
   if ok(i,j) then inc(ans)
   end;
  writeln(ans);
end.