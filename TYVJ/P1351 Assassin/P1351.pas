type tt=^t;
     t=record
     data:longint;
     next:tt
     end;
     ttt=record
     data:longint;
     link:tt
     end;
var g:array[1..1000000]of ttt;
    f,h:array[1..1000000]of boolean;
    ans,anss,n,m,i,j,x:longint;
    s:tt;
procedure mark(k:longint;flag:boolean);
var p:tt;
    r:longint;
begin
 f[k]:=flag;
 h[k]:=false;
 if flag=true then ans:=ans+g[k].data;
 p:=g[k].link;
 while p<>nil do
  begin
  r:=p^.data;
  if h[r]=false then
   begin
   if (f[r]=f[k])and(flag=true) then
    begin
     writeln('NO');
     halt
    end
   end
  else
   mark(r,not flag);
  p:=p^.next
  end;
end;
begin
 readln(n,m);
 for i:=1 to n do
  begin
   read(g[i].data);
   g[i].link:=nil;
  end;
 for x:=1 to m do
  begin
   readln(i,j);
   new(s);
   s^.data:=j;
   s^.next:=g[i].link;
   g[i].link:=s;
   new(s);
   s^.data:=i;
   s^.next:=g[j].link;
   g[j].link:=s;
  end;
  fillchar(f,sizeof(f),false);
  fillchar(h,sizeof(h),true);
  ans:=0;
  mark(1,true);
  anss:=ans;
  fillchar(f,sizeof(f),false);
  fillchar(h,sizeof(h),true);
  ans:=0;
  mark(1,false);
  if anss<ans then writeln(anss) else writeln(ans)
end.