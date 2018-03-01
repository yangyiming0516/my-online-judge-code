{
ID:id
PROG:crypt1
LANG:PASCAL
}
VAR a:array[1..9]of integer;
    f:array[0..9]of boolean;
    n,i,j,w1,w2,w3,w4,w5,h,ans,p,q,r:integer;
BEGIN
assign(input,'crypt1.in');reset(input);
assign(output,'crypt1.out');rewrite(output);
fillchar(f,sizeof(f),true);
ans:=0;
 readln(n);
 for i:=1 to n do
  begin
  read(a[i]);
  f[a[i]]:=false;
  end;
 for w1:=1 to n do
 for w4:=1 to n do
 begin
 if a[w1]*a[w4]>=10 then continue;
 for w5:=1 to n do
 begin
 if a[w1]*a[w5]>=10 then continue;
 for w2:=1 to n do
 for w3:=1 to n do
   begin
   p:=a[w5]*(100*a[w1]+10*a[w2]+a[w3]);if p>=1000 then continue;
   q:=a[w4]*(100*a[w1]+10*a[w2]+a[w3]);if q>=1000 then continue;
   r:=p+10*q;if r>=10000 then continue;
   h:=0;
   for i:=1 to 3 do
    begin
    if f[p mod 10] then break;
    p:=p div 10;
    inc(h);
    end;
   if h<>3 then continue;
   h:=0;
   for i:=1 to 3 do
    begin
    if f[q mod 10] then break;
    q:=q div 10;
    inc(h);
    end;
   if h<>3 then continue;
   h:=0;
   for i:=1 to 4 do
    begin
    if f[r mod 10] then break;
    r:=r div 10;
    inc(h);
    end;
   if h=4 then inc(ans)
   end;
   end;
   end;
 writeln(ans);
close(input);close(output)
END.