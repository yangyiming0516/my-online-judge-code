var f:array[1..9]of boolean;
    a:array[1..9,1..9]of byte;
    n,i,j,k:byte;
    flag1,flag2,flag3:boolean;
procedure heng(h:integer);
var i:byte;
begin
fillchar(f,sizeof(f),false);
 for i:=1 to 9 do
  if f[a[h,i]] then begin flag1:=false; exit end
   else f[a[h,i]]:=true;
end;
procedure shu(h:integer);
var i:byte;
begin
fillchar(f,sizeof(f),false);
 for i:=1 to 9 do
  if f[a[i,h]] then begin flag2:=false; exit end
   else f[a[i,h]]:=true;
end;
procedure fang(h:integer);
var i,j,aa,bb:byte;
begin
fillchar(f,sizeof(f),false);
 aa:=((h-1) div 3)*3+1;
 bb:=((h-1) mod 3)*3+1;
  for i:=0 to 2 do
   for j:=0 to 2 do
    if f[a[aa+i,bb+j]] then begin flag3:=false; exit end
     else f[a[aa+i,bb+j]]:=true;
end;
begin
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to 9 do
    for k:=1 to 9 do
     read(a[j,k]);
  flag1:=true;flag2:=true;flag3:=true;
   for j:=1 to 9 do
     if flag1 then heng(j);
   for j:=1 to 9 do
     if flag2 then shu(j);
   for j:=1 to 9 do
     if flag3 then fang(j);
  if flag1 and flag2 and flag3 then writeln('Right')
     else writeln('Wrong');
  end;
end.