var n,min,m1,m2,i,j,max,k:longint;
    s,e:array[1..10100] of longint;
    b,c:array[1..30000] of longint;
function zhishu(n:longint):boolean;
var i:longint;
begin
  zhishu:=true;
  for i:=2 to round(sqrt(n)) do
    if (n mod i=0) then exit(false);
end;
begin
  read(n,m1,m2);
  for i:=1 to n do read(s[i]);
  min:=2000000001;
  max:=0;
  for i:=2 to m1 do
    if (zhishu(i))and(m1 mod i=0) then
    begin
      while (m1 mod i=0) do
      begin
        inc(b[i]);
        m1:=m1 div i;
      end;
      inc(k);
      e[k]:=i;
      for j:=1 to n do
        if (s[j] mod i<>0) then s[j]:=0;
    end;
  for i:=1 to 30000 do b[i]:=b[i]*m2;
  for i:=1 to n do if s[i]<>0 then
  begin
    for j:=1 to k do
    begin
      while (s[i] mod e[j]=0) do
      begin
        inc(c[e[j]]);
        s[i]:=s[i] div e[j];
      end;
    end;
    for j:=1 to k do
    begin
      if b[e[j]]>=c[e[j]] then
      begin
        if ((b[e[j]]+c[e[j]]-1) div c[e[j]])>=max then
        begin
          max:=(b[e[j]]+c[e[j]]-1) div c[e[j]];
        end;
      end
      else if 1>max then max:=1;
    end;
    for j:=1 to 30000 do c[j]:=0;
    if max<min then min:=max;
    max:=0;
  end;
  if min<2000000001 then writeln(min)
  else writeln('-1');
end.