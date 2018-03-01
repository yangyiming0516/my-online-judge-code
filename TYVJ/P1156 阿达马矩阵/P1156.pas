var
x,y:qword;
k,i:integer;
a:array[0..64] of qword;
flag:boolean;
begin
flag:=true;
a[0]:=1;
for i:=1 to 63 do
a[i]:=2*a[i-1];

readln(k,x,y);

while k>0 do
begin
if (x>a[k-1])and(y>a[k-1]) then flag:=not(flag);
if (x>a[k-1]) then x:=x-a[k-1];
if (y>a[k-1]) then y:=y-a[k-1];
dec(k);
end;
if flag then writeln(1)
        else writeln(0);

end.