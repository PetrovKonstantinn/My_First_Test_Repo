program calc;
uses crt, modul;
type TRec = RECORD 
a,b,e,x1,x2: real;
a2,b2,p,m,n,h,ax,ay,bx,by: SmallInt;
c: real;
d,d2,d1: string; 
a3: array [1..30,1..30] of real;
b3: array [1..30,1..30] of real;
c3: array [1..30,1..30] of real;
end; 
var dis: real;
i,j,k,e: integer;
l:string;
Rec: TRec; 
f: file of TRec; 
function fact(var n1:real):real; 
begin 
fact:=1;
while (n1>1) do begin 
fact:=fact*n1*(n1-1);
n1:=n1-2;
end;
end; 
begin
ClrScr;

assign(f,'calc.database');
writeln('Хотите загрузить последний ввод? Если да, то введите y, если нет, то n.');
readln(l);
if (l='y') then 
begin
reset(f);
read(f,Rec);
close(f);
writeln;
writeln('Последнее действие');
if (Rec.p=2) then begin
writeln('Числа: ', Rec.a:3:1,', ',Rec.b:3:1); 
writeln('Результат: ', Rec.c:3:1); 
writeln('Действие: ', Rec.d); 
end;
if (Rec.p=3)  then begin 
writeln('Число: ', Rec.a:3:1); 
writeln('Результат: ', Rec.c:3:1); 
writeln('Действие: ', Rec.d); 
end; 
if (Rec.p=1) or (Rec.p=0) then begin 
writeln('Числа: ', Rec.a:3:1,', ',Rec.b:3:1,', ',Rec.e:3:1); 
writeln('Результат: ', Rec.x1:3:1,' ' ,Rec.x2:3:1); 
writeln('Действие: ', Rec.d);  
end;
if (Rec.p=4)  then begin 
writeln('Число: ', Rec.a:3:1); 
writeln('Результат: ', Rec.c:3:1); 
writeln('Действие: ', Rec.d); 
end;
if (Rec.p=5) then begin 
writeln('Вектора: ', Rec.a2,', ', Rec.b2);
writeln('Результат: ', Rec.c:3:1); 
writeln('Действие: ', Rec.d2);
end;
if (Rec.p=7) then begin
writeln('Вектора: ', '(', Rec.ax,', ',Rec.ay,')(',  Rec.bx,', ',Rec.by,')');
writeln('Результат: ', Rec.c:3:1); 
writeln('Действие: ', Rec.d2);
end;
if (Rec.p=6) then begin 
writeln('Матрица 1');
for  i:= 1 to Rec.n do begin 
       for j:= 1 to Rec.m do  
         write(Rec.a3[i,j]:3:2, ' ');
         writeln;
       end;
writeln('Матрица 2');
    for  i:= 1 to Rec.m do begin 
      for j:= 1 to Rec.h do  
        write(Rec.b3[i,j]:3:2, ' ');
        writeln;
      end;
writeln('Результат'); 
    for  i:= 1 to Rec.n do begin 
      for j:= 1 to Rec.h do  
        write(Rec.c3[i,j]:3:2, ' ');
        writeln;
      end;
writeln('Действие: ', Rec.d1); 
end;
end
else 
begin
if (l='n') then 
writeln('Ok')
else
writeln('uncorrect');
end;
writeln; 
writeln('Это калькулятор. Действия:');
writeln('"+" - сумма,'); 
writeln('"-" - разность,');
writeln('"*" - произведение,'); 
writeln('"/" - частное,');
writeln('"sq" - квадратный корень,'); 
writeln('"ln" - натуральный логарифм,'); 
writeln('"kv" - решает квадратное уавнение,'); 
writeln('"vek" - действия с векторами,');
writeln('"mat" - действия с матрицами');
   writeln('Введите действие');
   readln(Rec.d);
  case Rec.d of
     '+'  : begin writeln('Введите 1 число'); readln(Rec.a); writeln('Введите 2 число'); readln(Rec.b); Rec.c:=Rec.a+Rec.b; Rec.p:=2; end;
     '-'  : begin  writeln('Введите 1 число'); readln(Rec.a); writeln('Введите 2 число'); readln(Rec.b); Rec.c:=Rec.a-Rec.b; Rec.p:=2;end;
     '*'  : begin writeln('Введиет 1 число'); readln(Rec.a); writeln('Введите 2 число'); readln(Rec.b); Rec.c:=Rec.a*Rec.b; Rec.p:=2; end; 
     '/'  : begin writeln('Введите 1 число'); readln(Rec.a); writeln('Введите 2 число'); readln(Rec.b); Rec.c:=Rec.a/Rec.b; Rec.p:=2; end; 
     'sq' : begin writeln('Введите число'); readln(Rec.a); Rec.c:=sqrt(Rec.a); Rec.p:=3; end; 
     'ln' : begin writeln('Введите число'); readln(Rec.a); Rec.c:= ln(Rec.a); Rec.p:=3; end;
     'mat': begin  Rec.p:=6;
 write('Введите кол-во строк  1 матрицы n=');
 readln(Rec.n); 
 write('Введите кол-во столбцов 1 матрицы, строк 2 матрицы m='); 
readln(Rec.m); 
write('Кол-во столбцов 2 матрицы  h=');
 readln(Rec.h);    
 writeln('Введите действие (Если сложение/вычитания, то матрицы должны быть квадратными, то есть n=m=h)');         
  readln(Rec.d1); 
     for  i:= 1 to Rec.n do 
      for j:= 1 to Rec.m do begin
        write('a[', i, ',', j,']=');
        read(Rec.a3[i,j]);
       end;
for  i:= 1 to Rec.m do 
      for j:= 1 to Rec.h do begin
   write('b[', i, ',', j,']=');
        read(Rec.b3[i,j]);
end; 
writeln;
for  i:= 1 to Rec.n do begin 
       for j:= 1 to Rec.m do  
         write(Rec.a3[i,j]:3:2, ' ');
         writeln;
       end;
         writeln(Rec.d1);
    for  i:= 1 to Rec.m do begin 
      for j:= 1 to Rec.h do  
        write(Rec.b3[i,j]:3:2, ' ');
        writeln;
      end;
         writeln('=');
 case (Rec.d1) of 
'+': begin if (Rec.n=Rec.h) and (Rec.n=Rec.m) and (Rec.h=Rec.m) then begin 
     for i:= 1 to Rec.n do 
       for j:= 1 to Rec.m do begin 
         Rec.c3[i,j]:=Rec.a3[i,j]+Rec.b3[i,j];  
       end;
    for  i:= 1 to Rec.n do begin 
      for j:= 1 to Rec.m do  
        write(Rec.c3[i,j]:3:2, ' ');
        writeln;
      end;
 end 
 else writeln('Error'); 
end;
'-': begin if (Rec.n=Rec.h) and (Rec.n=Rec.m) and (Rec.h=Rec.m) then begin 
     for i:= 1 to Rec.n do 
       for j:= 1 to Rec.m do begin 
         Rec.c3[i,j]:=Rec.a3[i,j]-Rec.b3[i,j];  
       end;
    for  i:= 1 to Rec.n do begin 
      for j:= 1 to Rec.m do  
        write(Rec.c3[i,j]:3:2, ' ');
        writeln;
      end;
 end 
 else writeln('Error'); 
end; 
'*': begin 
     for i:= 1 to Rec.n do 
       for j:= 1 to Rec.h do begin 
         Rec.c3[i,j]:=0;
        for k:=1 to Rec.m do 
        Rec.c3[i,j]:=Rec.c3[i,j]+Rec.a3[i,k]*Rec.b3[k,j];
       end;
    for  i:= 1 to Rec.n do begin 
      for j:= 1 to Rec.h do  
        write(Rec.c3[i,j]:3:2, ' ');
        writeln;
      end;
end;
end;
Rec.p:=6;
end;
     'vek': begin writeln('Введите действие с вектором'); readln(Rec.d2); 
case Rec.d2 of 
'+': begin writeln('Введите 1 вектор'); readln(Rec.a2); writeln('Введите 2 вектор'); readln(Rec.b2); Rec.c:=vsum(Rec.a2,Rec.b2); Rec.p:=5; end; 
'-': begin writeln('Введите 1 вектор'); readln(Rec.a2); writeln('Введите 2 вектор'); readln(Rec.b2); Rec.c:=vras(Rec.a2,Rec.b2); Rec.p:=5; end; 
'*': begin writeln('Введите координаты 1 вектора'); readln(Rec.ax, Rec.ay); writeln('Введите координаты 2 вектора'); readln(Rec.bx, Rec.by); Rec.c:=vpro(Rec.ax,Rec.bx,Rec.ay,Rec.by); Rec.p:=7; end; 
'/': begin writeln('Введите 1 вектор'); readln(Rec.a2); writeln('Введите 2 вектор'); readln(Rec.b2); Rec.c:=vdel(Rec.a2,Rec.b2); Rec.p:=5; end; end; end;
     '!'  : begin writeln('Введите число'); readln(Rec.a); Rec.c:= fact(Rec.a); Rec.p:=4; end;
     'kv' : begin writeln('Введите 1 число'); readln(Rec.a); writeln('Введите 2 число'); readln(Rec.b); writeln('Введите 3 число');    readln(Rec.e);   dis:=Rec.b*Rec.b-4*Rec.a*Rec.e;
if (dis >= 0) then begin  Rec.x1:=(-Rec.b+sqrt(dis))/2*Rec.a; Rec.x2:=(-Rec.b-sqrt(dis))/2*Rec.a; Rec.p:=0; end; if (dis<0) then Rec.p:=1; end;
  end;
if (Rec.p=2) or (Rec.p=3) or (Rec.p=4) or (Rec.p=5) or (Rec.p=7) then 
	writeln('Результат равен =', Rec.c:3:1);
     if (Rec.p=0) then begin
   writeln('Корни равны:');
   writeln('x1=',' ', Rec.x1:3:1);
   writeln('x2=',' ', Rec.x2:3:1);
     end;
     if (Rec.p=1) then
	writeln('Корней нет'); 
writeln;
writeln('Хотите сохранить ввод? Если да, то введите 1. Если нет, то введите 2'); 
readln(e);
if (e=1) then begin 
assign(f,'calc.database'); 
rewrite(f); 
write(f,Rec); 
close(f); 
reset(f); 
read(f,Rec); 
close(f);
end;
end.
