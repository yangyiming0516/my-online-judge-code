var n,c,i,ans,rest,k,s,r,l:LONGINT;
    num,mon:array[1..20]of longint;
    over:boolean;
procedure  qs(l,r:integer);
var  i,j,temp,h:longint;
begin
  i:=l;j:=r;temp:=mon[(l+r) div 2];
  repeat
    while mon[i]<temp do inc(i);
    while mon[j]>temp do dec(j);
    if i<=j then
     begin
     h:=mon[i];
     mon[i]:=mon[j];
     mon[j]:=h;
     h:=num[i];
     num[i]:=num[j];
     num[j]:=h;
     inc(i);dec(j)
     end;
  until  i>j;
  if i<r then qs(i,r);
  if j>l then qs(l,j)
end;
begin
  readln(n,c);
  for i:=1 to n do
    readln(mon[i],num[i]);
  ans:=0;over:=false;
  qs(1,n);
  for i:=n downto 1 do
   if mon[i]<c then
     begin
      k:=i;
      break
     end
    else ans:=ans+num[i];
  s:=1;
  repeat
   rest:=c;r:=k;l:=s;
   for i:=r downto l do
    begin
     if num[i]=0  then
      begin
       if i=k then dec(k);
       continue
      end;
     if num[i]-(rest div mon[i])>=0 then
      begin
       num[i]:=num[i]-(rest div mon[i]);
       rest:=rest mod mon[i]
      end
      else begin
            rest:=rest-num[i]*mon[i];
            num[i]:=0
           end;
     end;
     r:=k;l:=s;over:=true;
     if rest=0 then begin
                       inc(ans);
                       over:=false;
                       continue
                    end   else
      for i:=l to r do
       begin
        if (num[i])=0 then begin if i=s then inc(s);continue end;
        if rest<=mon[i] then  begin
                          inc(ans);
                          dec(num[i]);
                          over:=false;
                          break
                          end;
       end;
   until over;
   writeln(ans)
end.