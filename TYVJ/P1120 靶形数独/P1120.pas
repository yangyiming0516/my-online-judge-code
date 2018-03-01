const value:array[1..9,1..9] of longint=((6,6,6,6,6,6,6,6,6),
                                         (6,7,7,7,7,7,7,7,6),
                                         (6,7,8,8,8,8,8,7,6),
                                         (6,7,8,9,9,9,8,7,6),
                                         (6,7,8,9,10,9,8,7,6),
                                         (6,7,8,9,9,9,8,7,6),
                                         (6,7,8,8,8,8,8,7,6),
                                         (6,7,7,7,7,7,7,7,6),
                                         (6,6,6,6,6,6,6,6,6));
var  heng,shu,box:array[0..9,0..9] of boolean;
     a,map:array[0..9,0..9] of longint;
     i,j,n,max,time:longint;
function sum:longint;
var i,j:longint;
begin
  sum:=0;
  for i:=1 to 9 do
  for j:=1 to 9 do
    sum:=sum+a[i,j]*value[i,j];
  if sum>max then max:=sum;
end;
procedure dfs(x,y:longint);
var i:longint;
begin
  if time>15000000 then begin writeln(max);halt; end;
inc(time);
a[x,y]:=map[x,y];
if a[x,y]=0 then
 begin
  for i:=1 to 9 do
   begin
    if (heng[x,i]=false) and (shu[y,i]=false) and (box[((x-1) div 3)*3+((y-1) div 3)+1,i]=false) then
     begin
      a[x,y]:=i;
      heng[x,i]:=true;
      shu[y,i]:=true;
      box[((x-1) div 3)*3+((y-1) div 3)+1,i]:=true;
      if (x=1) and (y=1) then begin sum; end else
       if y=1 then dfs(x-1,9) else dfs(x,y-1);
      heng[x,i]:=false;
      shu[y,i]:=false;
      box[((x-1) div 3)*3+((y-1) div 3)+1,i]:=false;
     end;
   end;
 end
else
 begin
  if (x=1) and (y=1) then begin sum;exit; end else
  if y=1 then dfs(x-1,9) else dfs(x,y-1);
 end;
end;
begin
max:=-1;
for i:=1 to 9 do
 for j:=1 to 9 do
 begin
  read(map[i,j]);
  if map[i,j]<>0 then
   begin
    heng[i,map[i,j]]:=true;
    shu[j,map[i,j]]:=true;
    box[((i-1) div 3)*3+((j-1) div 3)+1,map[i,j]]:=true;
   end;
 end;
dfs(9,9);
writeln(max);
end.