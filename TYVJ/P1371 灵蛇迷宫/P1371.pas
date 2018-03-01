var a:array[1..1010,1..1010]of boolean;
    f:array[1..1010,0..1]of boolean;
    v:array[1..1010,0..1]of boolean;
    vi:array[1..1010]of boolean;
    ans:array[0..1010]of longint;
    i,j,n,m,p,x,y:longint;

procedure dp(k,p:longint);
var i:longint;
begin
if v[k,p] then exit;
f[k,p]:=false;
for i:=k+1 to n do
  if a[k,i] then
    begin
      dp(i,1-p);
      if not(f[i,1-p]) then f[k,p]:=true;
    end;
v[k,p]:=true;
end;

procedure dfs(k,p:longint);
var i:longint;
begin
if v[k,p] then exit;
v[k,p]:=true;
if not(vi[k]) then
  begin
    inc(ans[0]);
    ans[ans[0]]:=k;
    vi[k]:=true;
  end;
if f[k,p] then
  for i:=k+1 to n do
    if (a[k,i])and(not(f[i,1-p])) then
       dfs(i,1-p);
if f[k,p]=false then
  for i:=k+1 to n do
    if (a[k,i]) then
       dfs(i,1-p);
end;


begin
read(n,m,p);
fillchar(a,sizeof(a),0);
for i:=1 to m do
  begin
    read(x,y);
    a[x,y]:=true;
    a[y,x]:=true;
  end;
fillchar(v,sizeof(v),0);
dp(1,p);
if f[1,p] then writeln(p) else writeln(1-p);
ans[0]:=0;
fillchar(vi,sizeof(vi),0);
fillchar(v,sizeof(v),0);
dfs(1,p);
for i:=1 to ans[0]-1 do
  for j:=i+1 to ans[0] do
    if ans[i]>ans[j] then
      begin
        p:=ans[i];
        ans[i]:=ans[j];
        ans[j]:=p;
      end;
for i:=1 to ans[0]-1 do
  write(ans[i],' ');
writeln(ans[ans[0]]);
end.