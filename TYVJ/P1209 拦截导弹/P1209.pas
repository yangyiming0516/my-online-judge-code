var a,f:array[0..1000]of longint;
    n,i,j,ans,max:longint;
    s,ss:string;
begin
//assign(input,'missile.in');reset(input);
//assign(output,'missile.out');rewrite(output);
 n:=0;
 readln(s);
 while pos(',',s)>0 do
  begin
  ss:=copy(s,1,pos(',',s)-1);
  inc(n);
  val(ss,a[n]);
  delete(s,1,pos(',',s));
  end;
 inc(n);
 val(s,a[n]);
 ans:=0;
 f[0]:=0;
 a[0]:=0;
 for i:=1 to n do
  begin
  max:=0;
  for j:=0 to i-1 do
   if a[j]>=a[i] then
    if f[j]>max then max:=f[j];
  f[i]:=max+1;
  if f[i]>ans then ans:=f[i];
  end;
 write(ans,',');
 ans:=0;
 f[0]:=0;
 a[0]:=0;
 for i:=1 to n do
  begin
  max:=0;
  for j:=0 to i-1 do
   if a[j]<a[i] then
    if f[j]>max then max:=f[j];
  f[i]:=max+1;
  if f[i]>ans then ans:=f[i];
  end;
 writeln(ans-1);
//close(input);close(output)
end.