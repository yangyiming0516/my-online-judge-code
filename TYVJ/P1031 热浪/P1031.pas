VAR f:array[1..2500]of boolean;
    dist:array[1..2500]of longint;
    road:array[1..2500,1..2500]of longint;
    i,j,t,c,ts,te,rs,re,l,m:longint;
BEGIN
 readln(t,c,ts,te);
 fillchar(road,sizeof(road),0);
 for i:=1 to c do
   begin
   read(rs,re);
   readln(road[rs,re]);
   road[re,rs]:=road[rs,re]
   end;
 for i:=1 to t do
  begin
   if i<>ts then f[i]:=false else f[i]:=true;
   if road[ts,i]=0 then dist[i]:=maxlongint else
   dist[i]:=road[ts,i];
  end;
 for i:=1 to t-2 do
  begin
   l:=maxlongint;
   m:=ts;
    for j:=1 to t do
     if (f[j]=false) and (dist[j]<l) then
      begin
      l:=dist[j];
      m:=j
      end;
   f[m]:=true;
   for j:=1 to t do
    if road[m,j]>0 then
    if (f[j]=false)and(dist[m]+road[m,j]<dist[j]) then dist[j]:=dist[m]+road[m,j];
  end;
 writeln(dist[te]);
END.