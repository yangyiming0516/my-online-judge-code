var
a,b:qword;
x:qword;
begin
readln(x);
a:=1;
b:=1;
while b<=x do
begin
b:=a+b;
a:=b-a;
end;
writeln(b-a,'/',a);
end.