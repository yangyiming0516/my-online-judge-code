var i,j,k,n,h,hx,hy,hz,lz,lx,ly:longint;
function cal(a,b,c:longint):longint;
begin
 exit(2*(a*b+b*c+a*c)-16-4*(a+b+c-6))
end;
begin
 readln(n);
 hx:=0;hy:=0;hz:=0;lx:=maxlongint;ly:=maxlongint;lz:=maxlongint;
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do
    begin
    read(h);
    if h=1 then
     begin
     if i<lx then lx:=i;if i>hx then hx:=i;
     if j<ly then ly:=j;if j>hy then hy:=j;
     if k<lz then lz:=k;if k>hz then hz:=k
     end;
    end;
 writeln(cal(hx-lx+3,hy-ly+3,hz-lz+3))
end.