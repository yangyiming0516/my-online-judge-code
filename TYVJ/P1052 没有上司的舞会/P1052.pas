var  a:array[0..6000]of boolean;
     r,fy,fn:array[0..6000]of longint;
     s:array[0..6000,0..6000]of integer;
     n,i,k,l,m:longint;
function no(k:longint):longint;
forward;
function yes(k:longint):longint;
var i,ans:longint;
begin
  if fy[k]>0 then exit(fy[k]);
  if s[k,0]=0 then exit(r[k]);
  ans:=r[k];
  for i:=1 to s[k,0] do
   ans:=ans+no(s[k,i]);
  fy[k]:=ans;
  exit(ans);
end;
function no(k:longint):longint;
var i,ans:longint;
begin
  if fn[k]>0 then exit(fn[k]);
  if s[k,0]=0 then exit(0);
  ans:=0;
  for i:=1 to s[k,0] do
   if yes(s[k,i])>no(s[k,i]) then
    ans:=ans+yes(s[k,i]) else ans:=ans+no(s[k,i]);
  fn[k]:=ans;
  exit(ans)
end;
begin
 readln(n);
 for i:=1 to n do
 readln(r[i]);
 fillchar(a,sizeof(a),true);
 fillchar(s,sizeof(s),0);
 for i:=1 to n do
  begin
  readln(l,k);
  a[l]:=false;
  inc(s[k,0]);
  s[k,s[k,0]]:=l
  end;
 for i:=1 to n do
  if a[i] then begin m:=i;break end;
 fillchar(fy,sizeof(fy),0);
 fillchar(fn,sizeof(fn),0);
 if yes(m)>no(m) then writeln(yes(m)) else writeln(no(m));
end.