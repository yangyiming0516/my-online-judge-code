const m=1000;
      ch:array[1..10]of char=('0','1','2','3','4','5','6','7','8','9');
var s,ss:string;
    i,j,n,p:longint;
    flag:boolean;
    k:array[1..10]of longint;
function valuein(c:char):longint;
begin
 case c of
  '(':exit(1);
  ')':exit(8);
  '^':exit(7);
  '*':exit(5);
  '+','-':exit(3);
  '#':exit(0)
  end;
end;
function valueou(c:char):longint;
begin
 case c of
  '(':exit(8);
  ')':exit(1);
  '^':exit(6);
  '*':exit(4);
  '+','-':exit(2);
  '#':exit(0)
  end
end;
function make(st:string):string;
var i,num:longint;
begin
 while pos(' ',st)<>0 do
  delete(st,pos(' ',st),1);
 i:=0;num:=0;
 while i<length(st) do
  begin
  inc(i);
  if st[i]='(' then inc(num)
  else if st[i]=')' then
        if num>0 then dec(num) else begin delete(st,i,1);dec(i) end;
  end;
 i:=length(st)+1;num:=0;
 while i>1 do
  begin
  dec(i);
  if st[i]=')' then inc(num)
  else if st[i]='(' then
        if num>0 then dec(num) else delete(st,i,1);
  end;
 exit(st)
end;
function suan(a,b:longint;c:char):longint;
var x,i:longint;
begin
 case c of
  '+':exit((a+b)mod m);
  '-':exit((a-b+m)mod m);
  '*':exit((a*b)mod m);
  end;
  x:=1;
  for i:=1 to b do
   x:=(x*a)mod m;
  exit(x)
end;
function cal(st:string):longint;
var sc:array[0..60]of char;
    sn:array[0..60]of longint;
    i,tc,tn,x:longint;
begin
fillchar(sn,sizeof(sn),0);
 sc[0]:='#';
 i:=1;tn:=0;tc:=0;
 while i<=length(st) do
  if st[i] in ['0'..'9'] then
   begin
   x:=0;
   while st[i] in ['0'..'9'] do
    begin
    x:=x*10+ord(st[i])-48;
    inc(i)
    end;
   inc(tn);sn[tn]:=x mod m
   end
  else
   begin
   while valuein(sc[tc])>valueou(st[i]) do
    begin
    dec(tn);dec(tc);
    sn[tn]:=suan(sn[tn],sn[tn+1],sc[tc+1]);
    end;
   if valuein(sc[tc])=valueou(st[i]) then dec(tc)
    else begin inc(tc);sc[tc]:=st[i];end;
   inc(i)
   end;
 exit(sn[1])
end;
begin
 readln(s);
 s:=make(s);
 for i:=1 to 10 do
  begin
  ss:=s;
  for j:=1 to length(ss) do
   if ss[j]='a' then ss[j]:=ch[i];
  k[i]:=cal('('+ss+')')
  end;
 readln(n);
 for i:=1 to n do
  begin
  readln(s);s:=make(s);flag:=true;
  for j:=1 to 10 do
   begin
   ss:=s;
   for p:=1 to length(ss) do if ss[p]='a' then ss[p]:=ch[j];
   if k[j]<>cal('('+ss+')') then flag:=false
   end;
  if flag then write(chr(i+64));
  end;
end.
