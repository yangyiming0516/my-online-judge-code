const
 p:array[1..9,0..5]of byte=((4,1,2,4,5,0),       ｛9种方案｝
                            (3,1,2,3,0,0),
                            (4,2,3,5,6,0),
                            (3,1,4,7,0,0),
                            (5,2,4,5,6,8),
                            (3,3,6,9,0,0),
                            (4,4,5,7,8,0),
                            (3,7,8,9,0,0),
                            (4,5,6,8,9,0));
var  d:array[1..270000,1..9]of byte;｛记录时钟状态的队列｝
     k:array[1..270000,0..9]of byte;｛记录方案使用次数的队列｝
     i,j,l,r:longint;
function ok(l:longint):boolean;
var i:integer;
begin
 for i:=1 to 9 do
  if d[l,i]mod 4<>0 then exit(false);
 exit(true)
end;
procedure shuchu(l:longint);
var i,j:integer;
    s:string;
begin
 s:='';
 for i:=1 to 9 do
  for j:=1 to k[l,i] do
   s:=s+chr(i+48)+' ';
  writeln(copy(s,1,length(s)-1));
close(input);close(output);

 halt
end;
begin
assign(input,'clocks.in');reset(input);
assign(output,'clocks.out');rewrite(output);
for i:=1 to 9 do
  begin
  read(d[1,i]);
  d[1,i]:=d[1,i] div 3;
  end;
  k[1,0]:=1;
  l:=0;r:=1;
  repeat
  inc(l);
  if ok(l) then shuchu(l);
  for i:=k[l,0]to 9 do ｛非递减扩展｝
   begin
   if k[l,i]>=3 then continue;｛一种方案至多进行3次｝
   inc(r);
   for j:=1 to 9 do
    begin
    d[r,j]:=d[l,j];
    k[r,j]:=k[l,j];
    end;
    k[r,0]:=i; ｛用一个变量记录下次从哪里开始扩展｝
    inc(k[r,i]);
   for j:=1 to p[i,0] do
    inc(d[r,p[i,j]]);
   end;
  until l=r;
writeln('NONE');
close(input);close(output)
end.
