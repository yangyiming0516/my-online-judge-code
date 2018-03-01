var n,i,a,b,x,ans,k:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   readln(a,b);
   x:=a mod 1012;
   ans:=1;
   repeat
    k:=b and 1;
    if k=1 then ans:=(ans*x)mod 1012;
    x:=(x*x)mod 1012;
    b:=b shr 1;
   until b=0;
   writeln(ans)
  end;
end.