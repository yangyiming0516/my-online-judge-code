var f:array[1..6,0..150000]of boolean;
    a:array[1..6]of longint;
    i,j,k,mid:longint;
function sum(p,q:integer):longint;
var i:longint;
begin
 sum:=0;
 for i:=p to q do
 sum:=sum+i*a[i];
end;
function min(p,q:longint):longint;
begin
 if p<q then exit(p) else exit(q)
end;
procedure make;
begin
 for i:=1 to 6 do
  read(a[i]);
 if sum(1,6)=0 then halt;
 if sum(1,6) mod 2<>0 then
  begin
  writeln('Can''t');
  exit
  end;
 mid:=sum(1,6)div 2;
 fillchar(f,sizeof(f),false);
 for i:=2 to 6 do f[i,0]:=true;
 for i:=0 to a[1] do
  f[1,i]:=true;
 if f[1,mid] then begin writeln('Can');exit end;
 for i:=2 to 6 do
  begin
  for j:=0 to min(mid,sum(1,i-1)) do
   if f[i-1,j] then
    for k:=0 to a[i] do
     f[i,j+k*i]:=true;
  if f[i,mid] then begin writeln('Can');exit end;
  end;
  writeln('Can''t')
end;
begin
 while true do make;
END.