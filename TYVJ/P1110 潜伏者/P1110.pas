var s1,s2,s:string;
    f:array['A'..'Z']of char;
    h:array['A'..'Z']of boolean;
    i:longint;
begin
 readln(s1);
 readln(s2);
 readln(s);
 if length(s1)<>length(s2) then begin writeln('Failed');halt end;
 fillchar(f,sizeof(f),'.');
 for i:=1 to length(s1) do
  if f[s1[i]]='.' then f[s1[i]]:=s2[i]
  else if f[s1[i]]<>s2[i] then begin writeln('Failed');halt end;
 fillchar(h,sizeof(h),false);
 for i:=1 to 26 do
  if f[chr(64+i)]='.' then begin writeln('Failed');halt end
  else begin
       if h[f[chr(64+i)]] then begin writeln('Failed');halt end;
       h[f[chr(64+i)]]:=true;
       end;
 for i:=1 to length(s) do
  write(f[s[i]]);
 writeln
end.