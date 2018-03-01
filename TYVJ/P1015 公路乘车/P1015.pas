var a:array[1..10] of longint;
    f:array[0..100]of longint;
    max,i,j,n:longint;
BEGIN
    fillchar(a,sizeof(a),0);
    fillchar(f,sizeof(f),0);
    for i:=1 to 10 do
     read(a[i]);
    readln(n);
    for i:=1 to n do
      begin
       max:=50000;
        for j:=i-1 downto i-10 do
          if (j>=0) and (f[j]+a[i-j]<max) then
            max:=f[j]+a[i-j];
        f[i]:=max;
      end;
    writeln(f[n])
end.