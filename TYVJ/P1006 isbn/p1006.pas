var str:string;
    a:array[1..9]of integer;
    i,he:integer;
    k:char;
BEGIN  readln(str);
       a[1]:=ord(str[1])-48;
       a[2]:=ord(str[3])-48;
       a[3]:=ord(str[4])-48;
       a[4]:=ord(str[5])-48;
       a[5]:=ord(str[7])-48;
       a[6]:=ord(str[8])-48;
       a[7]:=ord(str[9])-48;
       a[8]:=ord(str[10])-48;
       a[9]:=ord(str[11])-48;
       he:=0;
       for i:=1 to 9 do
        he:=he+a[i]*i;
       he:=he mod 11;
       if he=10 then k:='X' else k:=chr(he+48);
       if k=str[13] then writeln('Right')
         else writeln(a[1],'-',a[2],a[3],a[4],'-',a[5],a[6],a[7],a[8],a[9],'-',k)
END.