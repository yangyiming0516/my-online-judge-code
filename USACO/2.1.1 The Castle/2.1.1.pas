{
ID:yangyim1
PROG:castle
LANG:PASCAL
}
var d:array[1..50,1..50]of boolean;
    f:array[1..50,1..50,1..4]of boolean;
    p:array[1..2500]of longint;
    s:array[1..50,1..50]of longint;
    m,n,h,i,j,k,max,maxx1,maxx2,x1,y1,x2,y2,num,q:longint;
function floodfill(a,b,q:longint):longint;
var ans:longint;
begin
 if not d[a,b] then exit(0);
 d[a,b]:=false;
 s[a,b]:=q;
 ans:=1;
 if f[a,b,1] then ans:=ans+floodfill(a+1,b,q);
 if f[a,b,2] then ans:=ans+floodfill(a,b+1,q);
 if f[a,b,3] then ans:=ans+floodfill(a-1,b,q);
 if f[a,b,4] then ans:=ans+floodfill(a,b-1,q);
 exit(ans)
end;
begin
assign(input,'castle.in');reset(input);
assign(output,'castle.out');rewrite(output);
 readln(m,n);
 fillchar(f,sizeof(f),true);
 for i:=1 to n do
  for j:=1 to m do
   begin
   read(h);
   if h>=8 then
    begin h:=h-8;f[i,j,1]:=false;end;
   if h>=4 then
    begin h:=h-4;f[i,j,2]:=false;end;
   if h>=2 then
    begin h:=h-2;f[i,j,3]:=false;end;
   if h>=1 then f[i,j,4]:=false;
   end;
 fillchar(d,sizeof(d),true);
 max:=0;num:=0;q:=0;
 for i:=1 to n do
  for j:=1 to m do
   if d[i,j] then
     begin
     inc(q);
     k:=floodfill(i,j,q);
     inc(num);
     p[q]:=k;
     if k>max then max:=k;
     end;
 maxx1:=0;maxx2:=0;
 for i:=1 to n do
  for j:=m-1 downto 1 do
  if not f[i,j,2] then
   if s[i,j]<>s[i,j+1] then
   if p[s[i,j]]+p[s[i,j+1]]>=maxx1 then
   begin
   maxx1:=p[s[i,j]]+p[s[i,j+1]];
   x1:=i;y1:=j
   end;
 for j:=m downto 1 do
  for i:=2 to n do
  if not f[i,j,3] then
   if s[i,j]<>s[i-1,j] then
   if p[s[i,j]]+p[s[i-1,j]]>=maxx2 then
   begin
   maxx2:=p[s[i,j]]+p[s[i-1,j]];
   x2:=i;y2:=j
   end;
  writeln(num);
  writeln(max);
  if maxx1>maxx2 then
   begin
   writeln(maxx1);
   writeln(x1,' ',y1,' ','E');
   end;
  if maxx1<maxx2 then
   begin
   writeln(maxx2);
   writeln(x2,' ',y2,' ','N');
   end;
  if maxx1=maxx2 then
   begin
   if y1<y2 then
    begin
    writeln(maxx1);
    writeln(x1,' ',y1,' ','E');
    end;
   if y1>y2 then
    begin
    writeln(maxx2);
    writeln(x2,' ',y2,' ','N');
    end;
   if y1=y2 then
    begin
    if x1>x2 then
    begin
    writeln(maxx1);
    writeln(x1,' ',y1,' ','E');
    end
    else
    begin
    writeln(maxx2);
    writeln(x2,' ',y2,' ','N');
    end;
    end
   end;
 close(input);close(output)
end.
