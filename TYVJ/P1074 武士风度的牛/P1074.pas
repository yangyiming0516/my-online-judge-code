const p:array[1..8]of integer=(2,2,1,-1,-2,-2,-1,1);
      q:array[1..8]of integer=(-1,1,2,2,1,-1,-2,-2);
var d:array[1..40000,1..3]of longint;
    a:array[1..150,1..150]of char;
    m,n,i,j,l,r,x,y,k,ans:longint;
    flag:boolean;
begin
 readln(m,n);
 for i:=1 to n do
  begin
  for j:=1 to m do
  begin
  read(a[i,j]);
  if a[i,j]='K' then begin x:=i;y:=j end;
  end;
  readln
  end;
 l:=0;r:=1;
 d[1,1]:=x;d[1,2]:=y;d[1,3]:=0;
 a[x,y]:='*';
 flag:=true;
 repeat
 inc(l);
 x:=d[l,1];y:=d[l,2];k:=d[l,3];
 for i:=1 to 8 do
  begin
  if (x+p[i]<=0)or(x+p[i]>n)or(y+q[i]<=0)or(y+q[i]>n) then continue;
  if a[x+p[i],y+q[i]]='.' then
   begin
     a[x+p[i],y+q[i]]:='*';
     inc(r);
     d[r,1]:=x+p[i];
     d[r,2]:=y+q[i];
     d[r,3]:=k+1;
     end
    else
     if a[x+p[i],y+q[i]]='H' then
      begin flag:=false;
            ans:=k+1
      end;
   end
 until (l>r)or(flag=false);
  writeln(ans)
end.