var a,b:array[0..11]of byte;
    n,i,min:longint;
procedure make(h:integer);
begin
 if a[h]=0 then a[h]:=1
 else a[h]:=0
end;
function ok:boolean;
var  i:integer;
begin
 for i:=1 to n do
  if a[i]<>b[i] then exit(false);
 exit(true)
end;
procedure dfs(k,l:longint);
begin
 if k=n+1 then
  begin
  if ok then if l<min then min:=l
  end
 else
  begin
  make(k);make(k-1);make(k+1);
  dfs(k+1,l+1);
  make(k);make(k-1);make(k+1);
  dfs(k+1,l)
  end
end;
begin
 readln(n);
 for i:=1 to n do
 read(a[i]);
 for i:=1 to n do
 read(b[i]);
 a[0]:=0;a[n+1]:=0;
 min:=maxlongint;
 dfs(1,0);
 if min=maxlongint then writeln('Boring') else writeln(min)
end.