{
ID:yangyim1
PROG:zerosum
LANG:PASCAL
}
var a:array[1..10]of char;
    n:longint;
procedure print;
var i:integer;
begin
 write(1);
 for i:=2 to n do
  write(a[i],i);
 writeln
end;
procedure dfs(h,sum,now:longint);
begin
 if h=n+1 then
  begin
  if sum=0 then print;
  exit
  end;
 a[h]:=' ';
 if now>=0 then dfs(h+1,sum-now+now*10+h,now*10+h)
  else dfs(h+1,sum-now+now*10-h,now*10-h);
 a[h]:='+';
 dfs(h+1,sum+h,h);
 a[h]:='-';
 dfs(h+1,sum-h,-h)
end;
begin
assign(input,'zerosum.in');reset(input);
assign(output,'zerosum.out');rewrite(output);
 readln(n);
 dfs(2,1,1);
close(input);close(output)
end.