program laba1Dyldina;

{$APPTYPE CONSOLE}

uses
  SysUtils;
type mas=array of longint;
var t1,t2:text;
n,i,j,x,min:integer;
Time: TDateTime;
TimeHour, TimeMin, TimeSec, TimeMilli:word;
TimeSum: double;
nazv: string[100];
w:char;
a,b,c:array[1..100]of integer;
r:mas;


procedure InsertSort(var b:array of integer;n:longint);
var
  x,m:integer;
  i,j:integer;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
begin
   m:=0;

  for i:=2 to n do
  begin
    x:=a[i];
    j:=i;
    while (j>1)and(x<a[j-1]) do
    begin
      a[j]:=a[j-1];
      j:=j-1;
      m:=m+1;
    end;
    a[j]:=x;
  end;
end;

procedure InsSortShag (n:longint; var a:mas);
 var
   x: integer;
   i, j,m: integer;
 begin
   for i := 1 to n-1 do
   begin
     x := a[i];
     j := i;
     while (j > 0) and (x < a[j - 1]) do
     begin
       a[j] := a[j - 1];
       j := j - 1;
     end;
     a[j] := x;
     for m := 0 to n-1 do
     write (a[m],' ');
     writeln;
   end;
 end;

    procedure bubblesort(var b: array of integer;n:longint);
var
  x:integer;
  i,j:integer;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;

  begin

  for i:=1 to n-1 do
  for j:=i+1 to n do
	if b[i]>b[j] then begin x:=b[i];b[i]:=b[j];b[j]:=x;end;

end;

procedure selectsort(var a:array of integer;n:longint);
var i,j,min,m:integer;
Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
begin
for i:=1 to n-1 do
begin
	min:=i;
	for j:=i+1 to n do
		if c[min]>c[j] then min:=j;
	m:=c[i];c[i]:=c[min];c[min]:=m;
end;
end;

procedure SelSortShag(n:longint; var a:mas);
 var
   x: longint;
   i, j, k,m: longint;
 begin
   for i := 0 to n - 2 do
   begin
     k := i;
     x := a[i];
     for j := i + 1 to n-1 do
     begin
       if a[j] < x then
       begin
         k := j;
         x := a[k];
       end;
     end;
     a[k] := a[i];
     a[i] := x;
     for m := 0 to n - 1 do
     write (a[m],' ');
     writeln;
   end;
 end;
       procedure BubbleSortShag(n:longint; var a:mas);
 var
 i,j,k,x:longint;

 begin
    for i := 0 to n-2 do
      begin
      for j:=n-1 downto i+1 do begin
      if a[j-1]>a[j] then
      begin
      x:=a[j-1];
      a[j-1]:=a[j];
      a[j]:=x;
      end;
      end;
      for k := 0 to n-1 do
      write (a[k],' ');
      writeln;
      end;
      end;


begin
  { TODO -oUser -cConsole Main : Insert code here }
  Write('Vvedite nazv vhodnogo faila: ');
  Readln(nazv);
assignfile(t1,nazv);
reset(t1);
nazv:='vyhod.txt';
assignfile(t2,nazv);
rewrite(t2);
readln(t1,n);
begin
for i:=1 to n do
read(t1,a[i]);
b:=a;c:=a;
for i:=1 to n do
write(b[i],' ');
writeln;
writeln('poshagovoe vypolnenie algoritma?');
readln(w);
if w='n' then
  begin
  Writeln ('Vsvtavka(vs), Vybor(vb), Puzyriok(p)?');
  readln(w);
  if w='vs' then
    begin
Time:= Now;
insertsort(a,n);
Time:= Now-Time;
DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
writeln(t2,n);
for i:=0 to n-1 do
write(t2,a[i],' ');
writeln(t2,a[n]);
writeln(t2,'Vstavka');
writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    end
  else
  if w='vb' then
    begin
    Time:=Now;
    selectsort(n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Vybor');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    end
  else

  if w='p' then
    begin
    Time:=Now;
    BubbleSort(n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:=0 to n-1 do
      write(t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Puzyriok');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
  end;
end

else
  Writeln ('Vsvtavka (vs), Vybor(vb), Puzyriok(p)?');
  readln(w);
  if w='vs' then
    begin
    Time:=Now;
    InsSortShag (n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write(t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Vstavka');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    readln;
    end
    else
  if w='vb' then
    begin
    Time:=Now;
    SelSort(n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Vybor');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    end
  else

  if w='p' then
    begin
    Time:=Now;
    BubbleSort (n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Puzyriok');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
  end
 else
  Writeln ('Vsvtavka (vs), Vybor(vb), Puzyriok(p)?');
  readln(w);
  if w='vs' then
    begin
    Time:=Now;
    InsertSortShag(n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Vstavka');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    readln;
    end

  else
  if w='vb' then
    begin
    Time:=Now;
    SelSortShag(n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Vybor');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    readln;
    end
  else

  if w='p' then
    begin
    Time:=Now;
    BubbleSortShag (n,r);
    Time:=Now-Time;
    DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
    writeln(t2,n);
    for i:= 0 to n-1 do
      write (t2,r[i],' ');
    writeln(t2);
    writeln(t2,'Puzyriok');
    writeln(t2,TimeHour*3600+TimeMin*60+TimeSec+TimeMilli/1000:0:3,' sec');
    readln;
    end;
  closefile (t1);
  closefile (t2);
  end.


