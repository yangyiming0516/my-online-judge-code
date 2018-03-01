var l,r:array[1..1000,1..1000]of longint;
    g,d,w:array[0..1000]of longint;
    n,v,i,j:longint;
function min(x,y:longint):longint;
begin
 if x<y then exit(x) else exit(y)
end;
function sum(x,y:longint):longint;
begin
 if x>y then exit(0);
 exit(g[y]-g[x-1])
end;
begin
 readln(n);
 readln(v);
 for i:=1 to n do
  readln(d[i],w[i]);
 g[0]:=0;
 for i:=1 to n do
  g[i]:=g[i-1]+w[i];
filldword(l,sizeof(l)div 4,maxlongint div 2);
filldword(r,sizeof(r)div 4,maxlongint div 2);
 l[v,v]:=0;
 r[v,v]:=0;
 for i:=1 to n-1 do
  for j:=1 to n-i do
   begin
   l[j,j+i]:=min(l[j+1,j+i]+(d[j+1]-d[j])*(sum(1,j)+sum(j+i+1,n)),
                 r[j+1,j+i]+(d[j+i]-d[j])*(sum(1,j)+sum(j+i+1,n)));
   r[j,j+i]:=min(l[j,j+i-1]+(d[j+i]-d[j])*(sum(1,j-1)+sum(j+i,n)),
                 r[j,j+i-1]+(d[j+i]-d[j+i-1])*(sum(1,j-1)+sum(j+i,n)));
   end;
 writeln(min(l[1,n],r[1,n]))
end.