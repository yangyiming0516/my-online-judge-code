var v,p,q:array[1..60] of longint;
    m,n:longint;
    f:array[0..3200] of longint;
    vv,ww:array[1..4] of longint;
procedure load;
var i:longint;
begin
  read(n,m);
  n:=n div 10;
  for i:=1 to m do
  begin
    read(v[i],p[i],q[i]);
    v[i]:=v[i] div 10;
    p[i]:=p[i]*v[i];
  end;
end;
function zu(k:longint):longint;
var i,j,s:longint;
begin
  s:=1;
  vv[1]:=v[k];
  ww[1]:=p[k];
  for i:=1 to m do
    if q[i]=k then
    begin
      for j:=1 to s do
      begin
        vv[j+s]:=vv[j]+v[i];
        ww[j+s]:=ww[j]+p[i];
      end;
      s:=s*2;
    end;
  zu:=s;
end;
procedure dp;
var i,j,k,vt,temp:longint;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to m do
  begin
    if q[i]<>0 then continue;
    for j:=n downto 1 do
    for k:=1 to zu(i) do
      if j>=vv[k] then
        if f[j]<f[j-vv[k]]+ww[k] then
          f[j]:=f[j-vv[k]]+ww[k];
  end;
end;
begin
  load;
  dp;
  writeln(f[n]*10);
end.