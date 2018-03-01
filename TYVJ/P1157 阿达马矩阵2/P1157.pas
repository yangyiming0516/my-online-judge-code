type
w1=record
        l:longint;
        data:array[1..7000] of byte;
        end;
w2=record
        l:longint;
        data:array[1..20000] of boolean;
        end;
var
k:longint;
x,y,yi,er:w1;
flag:boolean;
xx,yy:w2;

function minus(a,b:w1):w1;
var
i,j,x:longint;
t:byte;
begin
 fillchar(minus,sizeof(minus),0);
t:=0;
for i:=1 to a.l do begin
                   if a.data[i]>=(b.data[i]+t) then
                   begin minus.data[i]:=a.data[i]-b.data[i]-t;t:=0;end
                   else begin minus.data[i]:=10+a.data[i]-b.data[i]-t;t:=1;end;
                   end;
minus.l:=a.l;
while (minus.data[minus.l]=0) and (minus.l>1) do dec(minus.l);
end;

procedure prin(a:w1);
var
i:longint;
begin
for i:=a.l downto 1 do write(a.data[i]);
end;

function chuer(x:w1):w1;
var
i:longint;
t:byte;
begin

fillchar(chuer,sizeof(chuer),0);
if (x.l=1)and(x.data[1]=1) then begin exit; end;
t:=0;
for i:=x.l downto 1 do
begin
chuer.data[i]:=(t+x.data[i]) div 2;
if odd(x.data[i]) then t:=10 else t:=0;
end;
chuer.l:=x.l;
while (chuer.data[chuer.l]=0) and (chuer.l>=1) do dec(chuer.l);
end;

function zhuan(x:w1):w2;
begin
x:=minus(x,yi);
fillchar(zhuan,sizeof(zhuan),0);
while x.l>0 do
begin
inc(zhuan.l);
zhuan.data[zhuan.l]:=odd(x.data[1]);
x:=chuer(x);
end;

end;

procedure readpt(var a:w1);
var
t:char;
i:longint;
b:w1;
begin
 fillchar(a,sizeof(a),0);
b.l:=0;
while not(eoln) do
      begin
      inc(b.l);
      read(t);
      b.data[b.l]:=ord(t)-ord('0');
      end;
a.l:=b.l;
for i:=1 to a.l do
a.data[i]:=b.data[a.l-i+1];
end;


begin
yi.l:=1;
yi.data[1]:=1;
er.l:=1;
er.data[1]:=2;
readln(k);
readpt(x);readln;
readpt(y);readln;
xx:=zhuan(x);
yy:=zhuan(y);

flag:=true;
while k>0 do
begin
if (xx.data[k])and(yy.data[k]) then
begin
flag:=not(flag);
end;
dec(k);
end;

if flag then writeln(1)
        else writeln(0);


end.