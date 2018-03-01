var
  n,n1,kt:longint;
  i,j,asdf:longint;
  a,b,k,d:array[1..100] of longint;
  t:longint;
function rc(k:byte):longint;
begin
  rc:=0;
  if k<=t then
  begin
  b[k]:=0;inc(rc,rc(k+1));
  b[k]:=1;inc(rc,rc(k+1));
  end
  else begin
  rc:=1;
  asdf:=0;
  for i:=1 to t do if b[i]=1 then begin rc:=rc*a[i];inc(asdf);end;
  if asdf=0 then rc:=0 else rc:=n1 div rc;

  if not odd(asdf) then rc:=-rc;
  end;
end;
function ys:longint;
begin
  ys:=1;
  for i:=1 to t do  ys:=ys*(k[i]+1);
  ys:=ys-1;
end;
begin
  readln(n);
  if n=1 then begin writeln(0);exit;end;
  t:=0;n1:=n;kt:=trunc(sqrt(n))+1;
  for i:=2 to kt do begin
    if n mod i =0 then begin
     inc(t);
     a[t]:=i;
     k[t]:=0;
     repeat
     n:=n div i;
     inc(k[t]);
     until n mod i<>0;
     if n=1 then break;
     end;
  end;
  if n<>1 then begin inc(t);a[t]:=n;k[t]:=1;end;
  n:=rc(1)-ys;
  writeln(n);
end.