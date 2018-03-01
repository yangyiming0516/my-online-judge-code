{
ID:id
PROG:packrec
LANG: PASCAL
}
program packrec;
var
  a:array[1..4,1..2]of longint;  //初始的边
  s1,s2,s3,s4, //枚举矩形
  d1,d2,d3,d4, // 枚举矩形的两条边（长宽）
  x1,x2,x3,x4, //  临时每个矩形的W(同报告解析)
  y1,y2,y3,y4:longint; //  临时每个矩形的H(同报告解析)
  min,x,y,total:longint;
  ans:array[1..20,1..2]of longint;      //记录结果
procedure init;
begin
  assign(input,'packrec.in');
  assign(output,'packrec.out');
  reset(input);
  rewrite(output);
end;
procedure terminate;
begin
  close(input);
  close(output);
  halt;
end;
function max2(x,y:longint):longint;
begin
  if x>y then exit(x) else exit(y);
end;
function max(t1,t2,t3,t4:longint):longint;
begin
  exit(max2(max2(t1,t2),max2(t3,t4)));
end;
procedure  swap(var x,y:longint);
var
  t:longint;
begin
  t:=x;
  x:=y;
  y:=t;
end;
procedure update;//更新最优解，
var
  i,j:longint;
begin
  if x*y>min then exit;
  if x*y<min then
      begin
        min:=x*y;
        total:=0;
        
      end;
  if x>y then           //保证短边在前
      swap(x,y);
  for i:=1 to total do                  //无重复
      if (ans[i,1]=x) and (ans[i,2]=y) then exit;
  inc(total);
  ans[total,1]:=x;
  ans[total,2]:=y;
end;
procedure work;
var
  i,j:longint;
begin
  x1:=a[s1,d1];
  x2:=a[s2,d2];
  x3:=a[s3,d3];
  x4:=a[s4,d4];
  y1:=a[s1,3-d1];
  y2:=a[s2,3-d2];
  y3:=a[s3,3-d3];
  y4:=a[s4,3-d4];
  
  x:=x1+x2+x3+x4;         //第一种
  y:=max(y1,y2,y3,y4);
      update;
      
  x:=max(x1+x2+x3,x4,0,0); //第二种
  y:=y4+max(y1,y2,y3,0);
      update;
x:=max(x1+x2,x3,0,0)+x4;     //第三种
  y:=max(y3+y1,y3+y2,y4,0);
      update;
      
  x:=x1+x2+max(x3,x4,0,0);     //第四种
  y:=max(y1,y2,y3+y4,0);
      update;
      
  y:=max(y1+y3,y2+y4,0,0);                 //以下为第五种
      if y3>=y2+y4 then x:=max(x1,x3+x2,x3+x4,0);
      if (y3>y4) and (y3<y2+y4) then
        x:=max(x1+x2,x3+x4,x3+x2,0);
       if (y3<y4) and (y4<y3+y1) then
        x:=max(x3+x4,x1+x2,x1+x4,0);
      if (y4>=y1+y3) then
        x:=max(x2,x1+x4,x3+x4,0);
      if (y3=y4) then
        x:=max(x1+x2,x3+x4,0,0);
       update;
end;
procedure main;
var
  i,j:longint;
begin
  fillchar(ans,sizeof(ans),0);
  total:=0;
  min:=100000;
  for i:=1 to 4 do
      begin
        read(a[i,1],a[i,2]);
      end;
  for s1:=1 to 4 do
      for s2:=1 to 4 do
        if s1<>s2 then
          for s3:=1 to 4 do
            if (s3<>s2) and (s3<>s1) then
              begin
                s4:=10-s1-s2-s3;
                for d1:=1 to 2 do
                  for d2:=1 to 2 do
                    for d3:=1 to 2 do
                      for d4:=1 to 2 do
                        work;
                
              end;
end;
procedure print;
var
  i,j:longint;
  t:array[1..2]of longint;
begin
  for i:=1 to total-1 do                     //冒泡排个序
      for j:=i+1 to total do
        if ans[i,1]>ans[j,1] then
          begin
            t:=ans[i];
            ans[i]:=ans[j];
            ans[j]:=t;
          end;
  writeln(min);
  for i:=1 to total do
      writeln(ans[i,1],' ',ans[i,2]);
end;
begin
  init;
  main;
  print;
  terminate;
end.
