var  st:string;
     time,i,j:longint;
function change(sss:string):string;
var s:string;
    i:longint;
begin
   s:=sss;
   for i:=1 to length(sss) do
    if s[i]='-' then s[i]:='+'
    else if s[i]='+' then s[i]:='-';
   change:=s
end;
function premake(sss:string):string;
var ss,s:string;
    k,l,r,a,b,m,i:longint;
begin
 s:=sss;
 while pos('^',s)<>0 do
   begin
   k:=pos('^',s);
   l:=k;
   r:=l;
   repeat
    dec(l)
   until (l=0)or(s[l]<'0')or(s[l]>'9');
   repeat
    inc(r)
   until (r>length(s))or(s[r]<'0')or(s[r]>'9');
   val(copy(s,l+1,k-l-1),a);
   val(copy(s,k+1,r-k-1),b);
   m:=1;
   for i:=1 to b do
    m:=m*a;
   str(m,ss);
   s:=copy(s,1,l)+ss+copy(s,r,length(s)-r+1)
   end;
   while pos('/',s)<>0 do
   begin
   k:=pos('/',s);
   l:=k;
   r:=l;
   repeat
    dec(l)
   until (l=0)or(s[l]<'0')or(s[l]>'9');
   repeat
    inc(r)
   until (r>length(s))or(s[r]<'0')or(s[r]>'9');
   val(copy(s,l+1,k-l-1),a);
   val(copy(s,k+1,r-k-1),b);
   m:=a div b;
   str(m,ss);
   s:=copy(s,1,l)+ss+copy(s,r,length(s)-r+1)
   end;
   while pos('*',s)<>0 do
   begin
   k:=pos('*',s);
   l:=k;
   r:=l;
   repeat
    dec(l)
   until (l=0)or(s[l]<'0')or(s[l]>'9');
   repeat
    inc(r)
   until (r>length(s))or(s[r]<'0')or(s[r]>'9');
   val(copy(s,l+1,k-l-1),a);
   val(copy(s,k+1,r-k-1),b);
   m:=a*b;
   str(m,ss);
   s:=copy(s,1,l)+ss+copy(s,r,length(s)-r+1)
   end;
   premake:=s
end;
function move(sss:string;x:longint):string;
var s:string;
    y:longint;
begin
 s:=sss;
 y:=x;
  repeat
  dec(y)
  until (s[y]='+')or(s[y]='-');
  if s[y]='+' then s[y]:='-' else s[y]:='+';
  delete(s,x,1);
 move:=s;
end;
function minus(sss:string):string;
var  s,ss:string;
     k,l,r,a,b,m,i:longint;
begin
  s:=sss;
  repeat
  if s[1]='-' then begin s:=change(s);inc(time) end;
  while pos('-',s)>1 do
   begin
   k:=pos('-',s);
   l:=k;
   r:=l;
   repeat
    dec(l)
   until (l=0)or(s[l]<'0')or(s[l]>'9');
   repeat
    inc(r)
   until (r>length(s))or(s[r]<'0')or(s[r]>'9');
   val(copy(s,l+1,k-l-1),a);
   val(copy(s,k+1,r-k-1),b);
   m:=a-b;
   str(m,ss);
   s:=copy(s,1,l)+ss+copy(s,r,length(s)-r+1);
   if a<b then s:=move(s,l+1)
   end;
  until pos('-',s)=0;
  minus:=s
end;
function plus(sss:string):string;
var s,ss:string;
    k,l,r,a,b,m,i:longint;
begin
  s:=sss;
  delete(s,1,1);
  while pos('+',s)<>0 do
   begin
   k:=pos('+',s);
   l:=k;
   r:=l;
   repeat
    dec(l)
   until (l=0)or(s[l]<'0')or(s[l]>'9');
   repeat
    inc(r)
   until (r>length(s))or(s[r]<'0')or(s[r]>'9');
   val(copy(s,l+1,k-l-1),a);
   val(copy(s,k+1,r-k-1),b);
   m:=a+b;
   str(m,ss);
   s:=copy(s,1,l)+ss+copy(s,r,length(s)-r+1)
   end;
  plus:=s
end;
function qu(sss:string):string;
var s:string;
    i,j:longint;
begin
  s:='';j:=0;
  for i:=1 to length(sss) do
   if (sss[i]='(')or(sss[i]=')') then
    begin
    s:=s+copy(sss,j+1,i-j-1);
    j:=i
    end;
  s:=s+copy(sss,j+1,length(sss)-j);
  qu:=s
end;
function make(sss:string):string;
var s:string;
begin
 s:='+'+sss;
 s:=premake(s);
 s:=minus(s);
 s:=plus(s);
 make:=s
end;
begin
 readln(st);
 time:=0;
 i:=length(st);
 repeat
 if st[i]<>'(' then dec(i)
 else
  begin
  j:=i;
  repeat inc(j) until (j>length(st))or(st[j]=')');
  if j>length(st) then break
    else
    begin
    st:=copy(st,1,i-1)+make(copy(st,i+1,j-i-1))+copy(st,j+1,length(st)-j);
    dec(i)
    end
  end
 until i=0;
 st:=qu(st);
 st:='+'+st;
 st:=premake(st);
 st:=minus(st);
 st:=plus(st);
 if time mod 2=1 then st:='-'+st;
 writeln(st)
end.