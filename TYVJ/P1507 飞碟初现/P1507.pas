var c:array[1..50000]of char;
    n,i,l,ans:longint;
function ok(a,b:char):boolean;
begin
 if ((a='A')and(b='T'))or((a='T')and(b='A'))or
  ((a='C')and(b='G'))or((a='G')and(b='C')) then exit(true);
  exit(false)
end;
begin
 readln(n);
 for i:=1 to n do read(c[i]);
 ans:=0;
 for i:=1 to n do
  begin
  l:=0;
  while (i-l>0)and(i+l+1<=n)and ok(c[i-l],c[i+l+1]) do inc(l);
  if l>ans then ans:=l
  end;
 writeln(ans*2)
end.