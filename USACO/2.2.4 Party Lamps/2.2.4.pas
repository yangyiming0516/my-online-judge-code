{
ID:yangyim1
PROG:lamps
LANG:PASCAL
}
Var
  state:string;
  impossible:boolean;
  ans:array[0..17] of string;
  n,cm,num,i,j,l,l1,l2:longint;
  ons,offs:array[1..100]of longint;
Procedure check(state:string);
 Begin
   For i:=1 to l1 do
     If state[ons[i]]<>'1' then exit;
   For i:=1 to l2 do
     If state[offs[i]]<>'0' then exit;
   inc(l);
   For i:=1 to l do
     If (ans[i-1]<state)and(state<ans[i]) then
       Begin
         For j:=l+1 downto i+1 do ans[j]:=ans[j-1];
         ans[i]:=state;
         impossible:=false;  exit
       End;
   dec(l)
 End;
Procedure button4(state:string;c:longint);
  Var
    s:string;
  Begin
    s:=state;
    For i:=0 to (n div 3) do
      s[i*3+1]:=chr(ord('0')+ord('1')-ord(s[i*3+1]));
    check(s)
  End;
Procedure button3(state:string;c:longint);
  Var
    s:string;
  Begin
    s:=state;
    button4(s,c);
    For i:=1 to (n div 2) do
      s[i*2]:=chr(ord('0')+ord('1')-ord(s[i*2]));
    check(s);
    If c+1<=cm then button4(s,c+1)
  End;
Procedure button2(state:string;c:longint);
  Var
    s:string;
  Begin
    s:=state;
    button3(s,c);
    For i:=0 to (n div 2) do
      s[i*2+1]:=chr(ord('0')+ord('1')-ord(s[i*2+1]));
    check(s);
    If c+1<=cm then button3(s,c+1)
  End;
Procedure button1(state:string;c:longint);
  Var
    s:string;
  Begin
    s:=state;
    check(s);
    button2(s,c);
    For i:=1 to n do
      s[i]:=chr(ord('0')+ord('1')-ord(s[i]));
    check(s);
    If c+1<=cm then button2(s,c+1)
  End;
Begin
  assign(input,'lamps.in');reset(input);
  assign(output,'lamps.out');rewrite(output);
  impossible:=true;  l:=1;  ans[0]:='/';  ans[1]:='2';
  read(n,cm);
  state:='';
  For i:=1 to n do state:=state+'1';
  read(num);
  While num<>-1 do
    Begin
      inc(l1);  ons[l1]:=num;
      read(num)
    End;
  read(num);
  While num<>-1 do
    Begin
      inc(l2);  offs[l2]:=num;
      read(num)
    End;
  check(state);
  If cm>=1 then button1(state,1);
  For i:=1 to l-1 do  writeln(ans[i]);
  If impossible then writeln('IMPOSSIBLE');
  close(input);close(output)
End.