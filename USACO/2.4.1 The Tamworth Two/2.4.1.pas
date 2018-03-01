{
ID:yangyim1
PROG:ttwo
LANG:PASCAL
}
type node=record
     x,y:longint;
     end;
const dirx:array[0..3]of integer=(-1,0,1,0);
      diry:array[0..3]of integer=(0,1,0,-1);
var a:array[1..10,1..10]of char;
    i,j,dc,df,step:longint;
    pf,pc:node;
procedure move;
begin
 if (pf.x+dirx[df]>10)or(pf.x+dirx[df]<1)or(pf.y+diry[df]>10)or
  (pf.y+diry[df]<1)or(a[pf.x+dirx[df],pf.y+diry[df]]='*')
 then df:=(df+1) mod 4
 else
  begin
   pf.x:=pf.x+dirx[df];
   pf.y:=pf.y+diry[df];
  end;
 if (pc.x+dirx[dc]>10)or(pc.x+dirx[dc]<1)or(pc.y+diry[dc]>10)or
  (pc.y+diry[dc]<1)or(a[pc.x+dirx[dc],pc.y+diry[dc]]='*')
 then dc:=(dc+1) mod 4
 else
  begin
   pc.x:=pc.x+dirx[dc];
   pc.y:=pc.y+diry[dc]
  end;
end;
Begin
assign(input,'ttwo.in');reset(input);
assign(output,'ttwo.out');rewrite(output);
 for i:=1 to 10 do
  begin
  for j:=1 to 10 do
  begin
  read(a[i,j]);
  if a[i,j]='F' then begin pf.x:=i;pf.y:=j end;
  if a[i,j]='C' then begin pc.x:=i;pc.y:=j end;
  end;
  readln
  end;
 step:=0;df:=0;dc:=0;
 repeat
  inc(step);
  move;
  if (pf.x=pc.x)and(pf.y=pc.y) then
   begin
   writeln(step);
   close(input);close(output);
   halt
   end;
 until step=400*400;
  writeln(0);
close(input);close(output)
END.
