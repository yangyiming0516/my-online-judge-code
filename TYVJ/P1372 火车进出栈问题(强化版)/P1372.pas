type
pt=record
         data:array[1..4000] of longint;
         l:longint;
   end;
var
re,b:pt;
yi,er:pt;
i,n,j,x,sum:longint;
h:pt;
flag:boolean;
su:array[1..10453] of longint;
a:array[1..10453] of longint;

function mult(a:pt;b:int64):pt;
var
i,j,x:longint;
t:int64;
begin
  fillchar(mult,sizeof(mult),0);
  for i:=1 to a.l do
  begin
  t:=mult.data[i]+(a.data[i]*b);
    mult.data[i]:=t mod 1000000000;
    mult.data[i+1]:=t div 1000000000;
  end;
  mult.l:=a.l+2;
  while (mult.data[mult.l]=0) and (mult.l>1) do dec(mult.l);

  //for i:=mult[0] downto 1 do write(mult[i]);
end;

procedure prin(a:pt);
var
i:longint;
begin
for i:=a.l downto 1 do
begin
if i<>a.l then
begin
if a.data[i]<100000000 then write(0);
if a.data[i]<10000000 then write(0);
if a.data[i]<1000000 then write(0);
if a.data[i]<100000 then write(0);
if a.data[i]<10000 then write(0);
if a.data[i]<1000 then write(0);
if a.data[i]<100 then write(0);
if a.data[i]<10 then write(0);
write(a.data[i]);
end
else write(a.data[i]);
end;
end;

begin

sum:=0;
for i:=1 to 110000 do
begin
flag:=true;
    for j:=2 to trunc(sqrt(i))+1 do
      begin
       if i mod j=0 then begin flag:=false;break;end;
      end;
      if flag then begin inc(sum);su[sum]:=i;end;
end;
su[1]:=2;

fillchar(h,sizeof(h),0);
readln(n);
yi.l:=1;
yi.data[1]:=1;
er.l:=1;
er.data[1]:=2;
h:=yi;

fillchar(a,sizeof(a),0);

i:=2*n;
j:=1;
while su[j]<=i do
begin
x:=i;
while x>=su[j] do
begin
x:=x div su[j];
inc(a[j],x);
end;
inc(j);
end;

i:=n;
j:=1;
while su[j]<=i do
begin
x:=i;
while x>=su[j] do
begin
x:=x div su[j];
dec(a[j],2*x);
end;
inc(j);
end;

i:=n+1;
j:=1;
while su[j]<=i do
begin
if i mod su[j]=0 then begin i:=i div su[j];dec(a[j]); end else inc(j);
end;


for i:=1 to 10453 do
begin
for j:=1 to a[i] do
begin
h:=mult(h,su[i]);
end;
end;
prin(h);   
end.