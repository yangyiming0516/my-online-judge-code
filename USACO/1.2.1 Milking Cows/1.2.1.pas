{
ID:yangyim1
PROG:milk2
LANG:PASCAL
}
VAR n,i:integer;
   s,e:array[1..5000]of longint;
   st,en,max1,max2:longint;
procedure qs(a,b:integer);
VAR  l,r:integer;
     temp,x:longint;
BEGIN
  l:=a;r:=b;temp:=s[(l+b) div 2];
  repeat
    while s[l]<temp do inc(l);
    while temp<s[r] do dec(r);
    if l<=r then
     begin
      x:=s[l];
      s[l]:=s[r];
      s[r]:=x;
      x:=e[l];
      e[l]:=e[r];
      e[r]:=x;
      inc(l);
      dec(r);
     end;
  until l>r;
  if a<r then qs(a,r);
  if l<b then qs(l,b);
end;
BEGIN
assign(input,'milk2.in');reset(input);
assign(output,'milk2.out');rewrite(output);
  readln(n);
  for i:=1 to n do
   readln(s[i],e[i]);
  qs(1,n);
  st:=s[1];en:=e[1];
  max1:=e[1]-s[1];
  max2:=0;
  for i:=2 to n do
    begin
     if s[i]<=en then begin if e[i]>en then en:=e[i] end
       else begin
             if s[i]-en>max2 then max2:=s[i]-en;
             st:=s[i];en:=e[i];
            end;
     if en-st>max1 then max1:=en-st;
    end;
  writeln(max1,' ',max2);
close(input);close(output)
END.