var
x1,x2,y1,y2:longint;
p,n:longint;
temp1,temp2:longint;
begin
readln(p,n);
x2:=1;y2:=1;
x1:=trunc(sqrt(p));y1:=x1+1;
while true do
begin
temp1:=x1+y1;
temp2:=x2+y2;
if temp1>n then begin writeln(x1,'/',x2,' ',y1,'/',y2);break;end;
if temp1/temp2<sqrt(p) then begin x1:=temp1;x2:=temp2;end
                      else begin y1:=temp1;y2:=temp2;end;
end;

end.