{
ID:id
PROG:milk
LANG:PASCAL
}
VAR n,m,h,p,q,i:longint;
    a:array[0..1000]of int64;
    ans:int64;
BEGIN
assign(input,'milk.in');reset(input);
assign(output,'milk.out');rewrite(output);
  readln(n,m);
 fillchar(a,sizeof(a),0);
  for i:=1 to m do
   begin
   readln(p,q);
   a[p]:=a[p]+q;
   end;
  h:=0;
  ans:=0;
  for i:=0 to 1000 do
    if a[i]+h<=n then
     begin
     h:=a[i]+h;
     ans:=ans+i*a[i];
     end
    else
     begin
     ans:=ans+i*(n-h);
     break
     end;
  writeln(ans);
close(input);close(output)
end.