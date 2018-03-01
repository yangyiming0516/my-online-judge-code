VAR  s1:array[1..8]of integer=(-1,-1,-1,0,1,1,1,0);
     s2:array[1..8]of integer=(-1,0,1,1,1,0,-1,-1);
     a:array[0..101,0..101]of char;
     f:array[1..10000,1..2]of integer;
     l,r,p,q,i,j,mx,my,x,y,max:integer;
BEGIN
  readln(x,y,mx,my);
fillchar(a,sizeof(a),'!');
  for i:=1 to y do
  begin
   for j:=1 to x do
    read(a[y-i+1,j]);
    readln;
  end;
  l:=1;r:=1;
  f[1,1]:=my;f[1,2]:=mx;
  a[my,mx]:='m';
  max:=-1;
  while l<=r do
   begin
   max:=max+1;
   p:=l;q:=r;l:=r+1;
   for i:=p to q do
    for j:=1 to 8 do
      if a[f[i,1]+s1[j],f[i,2]+s2[j]]='.' then
       begin
        r:=r+1;
        f[r,1]:=f[i,1]+s1[j];
        f[r,2]:=f[i,2]+s2[j];
        a[f[i,1]+s1[j],f[i,2]+s2[j]]:='m';
       end;
   end;
  writeln(max);
END.