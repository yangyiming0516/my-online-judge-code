VAR a:array[1..1000,1..1000]of char;
    f:array[1..50,1..50]of integer;
    m,n,maxx,maxy,i,j,k:integer;
procedure draw(x,y:integer);
BEGIN
   a[x,y]:='+';
   a[x,y+1]:='-';
   a[x,y+2]:='-';
   a[x,y+3]:='-';
   a[x,y+4]:='+';
   a[x+1,y]:='|';
   a[x+1,y+1]:=' ';
   a[x+1,y+2]:=' ';
   a[x+1,y+3]:=' ';
   a[x+1,y+4]:='|';
   a[x+1,y+5]:='/';
   a[x+2,y]:='|';
   a[x+2,y+1]:=' ';
   a[x+2,y+2]:=' ';
   a[x+2,y+3]:=' ';
   a[x+2,y+4]:='|';
   a[x+2,y+5]:=' ';
   a[x+2,y+6]:='+';
   a[x+3,y]:='+';
   a[x+3,y+1]:='-';
   a[x+3,y+2]:='-';
   a[x+3,y+3]:='-';
   a[x+3,y+5]:=' ';
   a[x+3,y+4]:='+';
   a[x+3,y+6]:='|';
   a[x+4,y+1]:='/';
   a[x+4,y+2]:=' ';
   a[x+4,y+3]:=' ';
   a[x+4,y+4]:=' ';
   a[x+4,y+5]:='/';
   a[x+4,y+6]:='|';
   a[x+5,y+2]:='+';
   a[x+5,y+3]:='-';
   a[x+5,y+4]:='-';
   a[x+5,y+5]:='-';
   a[x+5,y+6]:='+';
end;
BEGIN
readln(m,n);
  maxy:=4*n+2*m+1;
  maxx:=0;
  for i:=1 to m do
    for j:=1 to n do
     begin
     read(f[m-i+1,j]);
     if (f[m-i+1,j]+1)*3+2*(m-i)>maxx then maxx:=(f[m-i+1,j]+1)*3+2*(m-i);
     end;
  fillchar(a,sizeof(a),'.');
  for i:=m downto 1 do
    for j:=1 to n do
      for k:=1 to f[i,j] do
       draw(2*i+3*k-4,2*i+4*(j-1)-1);
  for i:=1 to maxx do
   begin
   for j:=1 to maxy-1 do
    write(a[maxx-i+1,j]);
   writeln(a[maxx-i+1,maxy])
   end;
END.