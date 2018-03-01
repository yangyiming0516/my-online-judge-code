var n,m,i,r,leng,dif,ans,h:longint;
    a,num:array[1..200000]of longint;
begin
 readln(n,m);
 for i:=1 to n do read(a[i]);
 fillchar(num,sizeof(num),0);
 leng:=0;dif:=0;
 repeat
  if leng=n then break;
  inc(leng);
  inc(num[a[leng]]);
  if num[a[leng]]=1 then inc(dif);
 until dif=m;
 if dif<m then writeln('NO')
 else
 begin
 ans:=leng;
 h:=leng;
 dec(num[a[leng]]);
 dec(leng);
 for r:=h to n do
  begin
  inc(num[a[r]]);
  inc(leng);
  while num[a[r-leng+1]]>1 do
   begin
    dec(num[a[r-leng+1]]);
    dec(leng)
   end;
  if leng<ans then ans:=leng;
  end;
 writeln(ans)
 end
end.