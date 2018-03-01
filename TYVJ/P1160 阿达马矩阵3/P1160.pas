type
pt=record
         data:array[1..17000] of integer;
         l:longint;
   end;

var

x,y:pt;
k:integer;
a:pt;
flag:boolean;

yi,er:pt;
i,j:longint;

function minus(a,b:pt):pt;
var
i,j,x:longint;
t:byte;
begin
 fillchar(minus,sizeof(minus),0);
t:=0;
for i:=1 to a.l do begin
                   if a.data[i]>=(b.data[i]+t) then
                   begin minus.data[i]:=a.data[i]-b.data[i]-t;t:=0;end
                   else begin minus.data[i]:=100+a.data[i]-b.data[i]-t;t:=1;end;
                   end;
minus.l:=a.l;
while (minus.data[minus.l]=0) and (minus.l>1) do dec(minus.l);
end;

function mult(a,b:pt):pt;
var
i,j,x:longint;
begin
  fillchar(mult,sizeof(mult),0);
  for i:=1 to a.l do
  begin
    x:=0;
    for j:=1 to b.l do
    begin
      x:=a.data[i]*b.data[j]+x div 100+mult.data[i+j-1];

      mult.data[i+j-1]:=x mod 100;
    end;
    mult.data[i+b.l]:=x div 100;
  end;
  mult.l:=a.l+b.l;
  while (mult.data[mult.l]=0) and (mult.l>1) do dec(mult.l);

 end;

procedure prin(a:pt);
var
i:longint;
begin
for i:=a.l downto 1 do begin if (a.data[i]<10)and(i<>a.l) then write('0');write(a.data[i]);end;
end;


begin
flag:=true;
yi.l:=1;
yi.data[1]:=1;
er.l:=1;
er.data[1]:=2;
x:=yi;
readln(k);

begin
for i:=1 to k-1 do
begin
x:=mult(er,x);
end;
y:=mult(x,x);

y:=mult(y,er);

prin(minus(y,x));
end;
readln;readln;
end.