var ka,kb,i,j,h:longint;
    a,b,x,y:array[1..4]of longint;
    flag:boolean;
function ata(p,q:longint):boolean;
begin
 if ka=1 then
  if a[1]*p+a[2]*q+a[3]=0 then exit(true);
 if ka=2 then
  if (a[1]+p)*(a[1]+p)+(a[2]+q)*(a[2]+q)+a[3]=0
   then exit(true);
 if ka=3 then
  if a[1]*p*p+a[2]*p+a[3]+a[4]*q=0 then exit(true);
 exit(false);
end;
function atb(p,q:longint):boolean;
begin
 if kb=1 then
  if b[1]*p+b[2]*q+b[3]=0 then exit(true);
 if kb=2 then
  if (b[1]+p)*(b[1]+p)+(b[2]+q)*(b[2]+q)+b[3]=0
   then exit(true);
 if kb=3 then
  if b[1]*p*p+b[2]*p+b[3]+b[4]*q=0 then exit(true);
 exit(false);
end;
function what:longint;
begin
 if (ka=1)and(kb=1) then exit(2);
 if ((ka=1)and(kb=2))or((ka=2)and(kb=1)) then exit(h);
 if (ka=1)and(kb=3) then
  if a[2]=0 then exit(2) else exit(h);
 if (ka=3)and(kb=1) then
  if b[2]=0 then exit(2) else exit(h);
 if (ka=2)and(kb=3) then
  if h=1 then exit(1) else
   if (h=2)and(b[4]*(x[1]+a[1])=(2*b[1]*x[1]+b[2])*(y[1]+a[2]))
    and(b[4]*(x[2]+a[1])=(2*b[1]*x[2]+b[2])*(y[2]+a[2])) then exit(1)
    else exit(2);
 if (ka=3)and(kb=2) then
  if h=1 then exit(1) else
   if (h=2)and(a[4]*(x[1]+b[1])=(2*a[1]*x[1]+a[2])*(y[1]+b[2]))
    and(a[4]*(x[2]+b[1])=(2*a[1]*x[2]+a[2])*(y[2]+b[2])) then exit(1)
    else exit(2);
 if (ka=3)and(kb=3) THEN
  if (h=1)and(a[4]*(2*b[1]*x[1]+b[2])=b[4]*(2*a[1]*x[1]+a[2])) then exit(1)
   else exit(2);
 if (ka=2)and(kb=2) then exit(h);
end;
begin
 readln(ka,kb);
 if ka=3
  then readln(a[1],a[2],a[3],a[4])
  else readln(a[1],a[2],a[3]);
 if kb=3 then
  readln(b[1],b[2],b[3],b[4])
  else readln(b[1],b[2],b[3]);
 h:=0;
 for i:=-1000 to 1000 do
  for j:=-1000 to 1000 do
   if ata(i,j)and atb(i,j) then
    begin
    inc(h);
    x[h]:=i;y[h]:=j
    end;
 if h=0 then writeln(0)
 else
  begin
  writeln(what);
  for i:=1 to h do
   writeln(x[i],' ',y[i])
  end;
end.