{
ID:yangyim1
PROG:maze1
LANG:PASCAL
}
type node=record
     x,y:longint;
     end;
const px:array[1..4]of integer=(0,2,0,-2);
      py:array[1..4]of integer=(2,0,-2,0);
      nx:array[1..4]of integer=(0,1,0,-1);
      ny:array[1..4]of integer=(1,0,-1,0);
var i,j,w,h,ans,l,r:longint;
    d:array[1..10000]of node;
    p1,p2:node;
    f:array[1..201,1..77]of longint;
    a:array[1..201,1..77]of char;
    ind:array[1..201,1..77]of boolean;
procedure insert(p,q:longint);
begin
 if p1.x=0 then
  begin
  p1.x:=p;
  p1.y:=q
  end
 else
  begin
  p2.x:=p;
  p2.y:=q
  end;
end;
begin
assign(input,'maze1.in');reset(input);
assign(output,'maze1.out');rewrite(output);
 p1.x:=0;
 readln(w,h);
 for i:=1 to 2*h+1 do
  begin
  for j:=1 to 2*w+1 do
   read(a[i,j]);
  readln;
  end;
 for i:=1 to 2*w+1 do
  begin
  if a[1,i]=' ' then insert(2,i);
  if a[2*h+1,i]=' ' then insert(2*h,i);
  end;
 for i:=1 to 2*h+1 do
  begin
  if a[i,1]=' ' then insert(i,2);
  if a[i,2*w+1]=' ' then insert(i,2*w)
  end;
filldword(f,sizeof(f)div 4,5000);
 l:=0;r:=1;d[1].x:=p1.x;d[1].y:=p1.y;f[p1.x,p1.y]:=1;
fillchar(ind,sizeof(ind),false);
 ind[p1.x,p1.y]:=true;
 while l<r do
  begin
  inc(l);
  ind[d[l].x,d[l].y]:=false;
  for i:=1 to 4 do
   if a[d[l].x+nx[i],d[l].y+ny[i]]=' ' then
   if (d[l].x+px[i]>0)and(d[l].x+px[i]<2*h+1)and(d[l].y+py[i]>0)and(d[l].y+py[i]<2*w+1) then
    if (f[d[l].x,d[l].y]+1<f[d[l].x+px[i],d[l].y+py[i]])
     and(ind[d[l].x+px[i],d[l].y+py[i]]=false) then
     begin
      ind[d[l].x+px[i],d[l].y+py[i]]:=true;
      f[d[l].x+px[i],d[l].y+py[i]]:=f[d[l].x,d[l].y]+1;
      inc(r);
      d[r].x:=d[l].x+px[i];
      d[r].y:=d[l].y+py[i]
     end;
  end;
 l:=0;r:=1;d[1].x:=p2.x;d[1].y:=p2.y;f[p2.x,p2.y]:=1;
fillchar(ind,sizeof(ind),false);
 ind[p2.x,p2.y]:=true;
 while l<r do
  begin
  inc(l);
  for i:=1 to 4 do
   if a[d[l].x+nx[i],d[l].y+ny[i]]=' ' then
   if (d[l].x+px[i]>0)and(d[l].x+px[i]<2*h+1)and(d[l].y+py[i]>0)and(d[l].y+py[i]<2*w+1) then
    if f[d[l].x,d[l].y]+1<f[d[l].x+px[i],d[l].y+py[i]] then
     begin
      f[d[l].x+px[i],d[l].y+py[i]]:=f[d[l].x,d[l].y]+1;
      inc(r);
      d[r].x:=d[l].x+px[i];
      d[r].y:=d[l].y+py[i]
     end;
  end;
 ans:=0;
 for i:=1 to h do
  for j:=1 to w do
   if f[2*i,2*j]>ans then ans:=f[2*i,2*j];
 writeln(ans);
close(input);close(output)
end.
