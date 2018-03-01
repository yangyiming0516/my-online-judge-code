VAR
   m,n,i,j:longint;
   w:array[0..2000] of longint;
   f:array[0..2000,0..500] of longint;
BEGIN
   readln(n,m);
   for i:=1 to n do
      readln(w[i]);
   fillchar(f,sizeof(f),0);
   f[1,1]:=w[1];
   f[2,0]:=w[1];
   f[2,1]:=w[2];
   for i:=2 to n do
     begin
       for j:=1 to m do
         if f[i-1,j-1]<>0 then f[i,j]:=f[i-1,j-1]+w[i];
       for j:=1 to m do
         if i-j>=1 then
           if f[i-j,j]>f[i,0]then f[i,0]:=f[i-j,j];
       if f[i-1,0]>f[i,0]then f[i,0]:=f[i-1,0]
     end;
   writeln(f[n,0])
END.