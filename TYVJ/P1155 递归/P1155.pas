type
typ=record
        a11,a12,a21,a22:extended;
        end;

var
f0,f1:longint;
a,b:real;
n,i:longint;
ans,x,yi:typ;


function cheng(x,y:typ):typ;
begin
cheng.a11:=x.a11*y.a11+x.a12*y.a21;
cheng.a12:=x.a11*y.a12+x.a12*y.a22;
cheng.a21:=x.a21*y.a11+x.a22*y.a21;
cheng.a22:=x.a21*y.a12+x.a22*y.a22;
end;

function erfen(n:longint):typ;
var
temp:typ;
begin
if n=0 then exit(yi);
if n=1 then exit(x);
temp:=erfen(n div 2);
if odd(n) then begin erfen:=cheng(temp,temp);erfen:=cheng(erfen,x);end
          else begin erfen:=cheng(temp,temp);end;
end;

begin
yi.a11:=1;yi.a22:=1;
yi.a12:=0;yi.a21:=0;
readln(f0,f1,a,b,n);
if (f0=0)and(f1=0) then begin writeln(0);exit;end;
x.a11:=0;
x.a12:=1;
x.a21:=b;
x.a22:=a;
ans:=erfen(n-1);
writeln(ans.a21*f0+ans.a22*f1:0:0);
readln;readln;
end.