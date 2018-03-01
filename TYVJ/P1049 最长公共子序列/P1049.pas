var a,f:array[0..5000]of int64;
    b:array[1..5000]of boolean;
    i,j,n,p,max,m,s:integer;
BEGIN
 i:=0;
 fillchar(a,sizeof(a),0);
 fillchar(f,sizeof(f),0);
 fillchar(b,sizeof(b),true);
 readln(n);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to n do
   begin
   max:=0;
   for j:=0 to i-1 do
     if ((a[i]<=a[j])and(f[j]>=max)) then begin max:=f[j];end;
   f[i]:=max+1;
   end;
 max:=0;
 p:=0;
 for i:=1 to n do
  if f[i]>=max then begin max:=f[i];p:=i;end;
 m:=0;
 for i:=1 to n do
  if b[i] then begin
        b[i]:=false;
        s:=a[i];
        for j:=i+1 to n do
           if ((a[j]<=s) and (b[j]=true)) then begin b[j]:=false;s:=a[j];end;
        m:=m+1;end;
 writeln(m);

 end.