var f:array[1..10]of byte;
    n,i:longint;
begin
fillchar(f,sizeof(f),0);
 readln(n);
 if n=0 then writeln(0);
 for i:=1 to 10 do
  BEGIN
  f[i]:=n mod 10;
  n:=n div 10
  end;
 if f[10]>0 then begin write(f[10]);write('shi');end;
 if f[9]>0 then write(f[9]);
 if f[9]+f[10]>0 then write('yi');
 if f[8]>0 then begin write(f[8]);write('qian') end
  else if (f[9]+f[10]>0)and(f[7]+f[6]+f[5]>0)  then write(0);
 if f[7]>0 then begin write(f[7]);write('bai') end
  else if (f[8]>0)and(f[10]+f[9]+f[8]>0)and(f[6]+f[5]>0)then write(0);
 if f[6]>0 then begin write(f[6]);write('shi') end
  else if (f[10]+f[9]+f[8]+f[7]>0)and(f[7]>0)and(f[5]>0)then write(0);
 if f[5]>0 then write(f[5]);
 if f[8]+f[7]+f[6]+f[5]>0 then write('wan');
 if f[4]>0 then begin write(f[4]);write('qian') end
  else if (f[10]+f[9]+f[8]+f[7]+f[6]+f[5]>0)and(f[3]+f[2]+f[1]>0) then write(0);
 if f[3]>0 then begin write(f[3]);write('bai') end
  else if(f[10]+f[9]+f[8]+f[7]+f[6]+f[5]+f[4]>0)and(f[4]>0)and(f[2]+f[1]>0) THEN WRITE(0);
 if f[2]>0 then begin write(f[2]);write('shi') end
  else if(f[10]+f[9]+f[8]+f[7]+f[6]+f[5]+f[4]+f[3]>0)and(f[3]>0)and(f[1]>0) then write(0);
 if f[1]>0 then write(f[1]);
end.