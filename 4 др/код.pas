uses GraphABC, Graph3D;

var
  x, h, s, sy: real;
  z1, n, a, b: integer;
  p: Picture;

function f(x: real): real;
begin
  f := 2 * power(x, 3) + 1 * x + 18;
end;

function f1(x: real): real;
begin
  f1 := 0.5 * power(x, 4) + 2 * sqr(x) - 2 * x;
end;

procedure proc0;
begin
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(1, 1, WindowWidth, WindowHeight);
                    p := Picture.Create('enot7.jpg');
    p.Load('enot7.jpg');
    p.Draw(350 ,300, 300, 200);
  SetFontSize(16);
  TextOut(1, 20, 'Cама формула f:=2*x3 + 1*x+18.');
  SetFontSize(16);
  TextOut(1, 50, 'Считаем площадь по этой криволинейной.');
  readln;
end;

procedure proc1;
begin
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(1, 1, WindowWidth, WindowHeight);
                  p := Picture.Create('enot6.jpg');
    p.Load('enot6.jpg');
    p.Draw(350 ,300, 300, 200);
  h := (b - a) / n;
  x := a + h / 2;
  for var ii := 0 to n - 1 do
  begin
    s += f(x);
    x += h;
  end;
  s *= h;
  SetFontSize(16);
  TextOut(1, 20, 'Примерная площадь(S) :');
  textout(311, 20, s);
  readln;
end;

procedure proc2;
begin
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(10, 1, WindowWidth, WindowHeight);
                p := Picture.Create('enott.jpeg');
    p.Load('enott.jpeg');
    p.Draw(350 ,300, 300, 200);
    
  SetFontSize(16);
  TextOut(1, 20, 'Введите промежуток : ');
  read(a, b);
  textOut(296, 20, ';');
  textOut(281, 20, a);
  
  textOut(301, 20, b);
  SetFontSize(16);
  textout(1, 50, 'Введите количество промежутков : ');
  read(n);
  textout(281, 50, n);
  readln;
end;

procedure proc3;
begin
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(1, 1, WindowWidth, WindowHeight);
  
              p := Picture.Create('enot4.jpg');
    p.Load('enot4.jpg');
    p.Draw(350 ,300, 300, 200);
    
  h := (b - a) / n;
  x := a + h / 2;
  for var ii := 0 to n - 1 do
  begin
    s += f(x);
    x += h;
  end;
  sy := f1(b) - f1(a);
  SetFontSize(16);
  TextOut(1, 20, 'Точная площадь:');
  textout(215, 20, sy);
  readln;
end;

procedure proc4;
begin
  h := 0;
  x := 0;
  s := 0;
  sy := 0;
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(1, 1, WindowWidth, WindowHeight);
  
            p := Picture.Create('enot3.jpg');
    p.Load('enot3.jpg');
    p.Draw(350 ,300, 300, 200);
    
  h := (b - a) / n;
  x := a + h / 2;
  for var ii := 0 to n - 1 do
  begin
    s += f(x);
    x += h;
  end;
  s *= h;
  sy := f1(b) - f1(a);
  SetFontSize(16);
  TextOut(1, 20, 'Погрешность:');
  textout(172, 20, (s - sy));
  readln;
end;

procedure proc5;
var
  gx, gy, x0, y0, k, x1, y1, i, x2: integer;
  x, y: real;
begin
  clearwindow;
  p := Picture.Create('fon3.jpg');
  p.Load('fon3.jpg');
  p.Draw(1, 1, WindowWidth, WindowHeight);
  
          p := Picture.Create('enot2.jpg');
    p.Load('enot2.jpg');
    p.Draw(350 ,300, 300, 200);
    
  SetFontSize(16);
  TextOut(1, 20, 'Введите маштаб : ');
  readln(k);
  
  clearwindow; 
  gx := 900;
  gy := 700;   //маштаб
  setwindowsize(gx, gy);
  x0 := gx div 2; // центр х
  y0 := gy div 2; //центр у
  
  
  
    //ось х
  line(0, y0, gx, y0);
  line(gx, y0, gx - 10, y0 + 10);
  line(gx, y0, gx - 10, y0 - 10);
  textout(gx - 10, y0 + 10, 'x');
  
    //ось у
  line(x0, 0, x0, gy);
  line(x0, 0, x0 - 10, 10);
  line(x0, 0, x0 + 10, 10);
  textout(x0 + 10, 10, 'y');
  
    //цикл для черточек х
  i := -20;
  while i < 21 do
  begin
    line(x0 + i * k, y0 + 5, x0 + i * k, y0 - 5);
    SetFontSize(5);
    textout(x0 + i * k, y0 + 15, inttostr(i));
    i += 1;
  end;
  
    //черточки у
  i := -20;
  while i < 21 do
  begin
    if i <> 0 then begin
      line(x0 + 5, y0 + i * k, x0 - 5, y0 + i * k);
      SetFontSize(5);
      textout(x0 + 10, y0 - i * k, inttostr(i));
    end;
    i += 1;
  end;
  
  //прямоугольники в промежутке
  setpencolor(clgreen);
  line(X0 + round(a * k), y0 - round(f(a) * k), X0 + round(a * k), y0);
  line(X0 + round(b * k), y0 - round(f(b) * k), X0 + round(b * k), y0);
  
  h := (b - a) / n;
  x := a + (h / 2);
  while x < b do
  begin
    y := f(x);
    
    x1 := X0 + round((x - h / 2) * k);//координата х отн центра
    x2 :=  X0 + round((x + h / 2) * k);
    y1 := y0 - round(y * k);//координата у отн центра
    
    setpencolor(clgreen);
    Rectangle(x1, y1, x2, y0);
    X += h;
  end;
  
  x := -5;
  while x < 5 do
  begin
    y := 2 * x ** 3 + (1) * x + (18);
    
    x1 := X0 + round(x * k);//координата х отн центра
    y1 := y0 - round(y * k);//координата у отн центра
    
    setpencolor(clRed);
    SetPixel(x1, y1, clRed);
    X += 0.001;
  end;
  readln;
end;


procedure proc8;
var
  oa, ob, ot, yt, xt: string;
  z, y, xxxx, xxxxx, xi: real;
  bb, aa: integer;
begin
  clearwindow; 
  Camera.Position := P3D(1,150,10);
  Camera.LookDirection := V3D(0,-10,1);
  
  var s := Sphere(0, 0, 0, 600);
  s.BackMaterial := ImageMaterial('ffoon.jpg');
  s.AnimRotate(OrtZ,10000,1000).Begin;
  
  oa := inttostr(a);
  ob := inttostr(b);
  ot := '0';
  yt := 'y';
  xt := 'x';
  Text3D(0.5, 0.3, 0.5, ot, 2.5, Colors.Black);
  Text3D(0.5, 0, 30, yt, 2.5, Colors.Black);
  Text3D(-30, 0, 0.5, xt, 2.5, Colors.Black);
  View3D.ShowGridLines := False;
  View3D.ShowViewCube := False;
    View3D.ShowCoordinateSystem := False;
  View3D.ShowCameraInfo := False;
  var  Ar := Arrow(0, 0, -40, 0, 0, 100, Colors.Tan);
  var  Aru := Arrow(0, 0, 0, 400, 0, 10, Colors.Tan);
  var Arount := Arrow(0, 0, 0, -400, 0, 10, Colors.Tan); 
  
  if a  <> 0 then begin
    Text3D(-a, 0.3, 0.5, oa, 2.5, Colors.red);
  end;
  if b <> 0 then begin
    Text3D(-b, 0.3, 0.5, ob, 2.5, Colors.red);
  end;
  
  x := -2.5;
  while x <= 4 do
  begin
    z := f(x);
    Sphere(-x, y, z, 0.2, Colors.Red);
    x += 0.01;
  end;
  
  bb := -b;
  aa := -a;
  
  h := (b - a) / n;
  xxxx := a + (h / 2);
  xxxxx := -xxxx;
  while xxxxx < b do
  begin
    z := 2 * xxxxx ** 3 + 1 * xxxxx + 18;
    xi := xxxxx - (h / 2);
    var ii := Box(-xi, 0, z / 2, h, 0.1, z, Materials.Diffuse(Colors.Green) + 
      Materials.Specular(128, 100) + 
      Materials.Emissive(GrayColor(90)));
    xxxxx += h;
  end;
  readln;
end;


begin
  repeat
    clearwindow;
    rectangle(0, 0, 640, 478);
    rectangle(0, 0, 640, 477);
    
    p := Picture.Create('fon3.jpg');
    p.Load('fon3.jpg');
    p.Draw(1, 1, WindowWidth, WindowHeight);
    
        p := Picture.Create('enot1.jpg');
    p.Load('enot1.jpg');
    p.Draw(350 ,300, 300, 200);
    
    View3D.ShowGridLines := False;
    View3D.ShowViewCube := False;
        View3D.ShowCoordinateSystem := False;
  View3D.ShowCameraInfo := False;
  
    SetFontSize(16);
    TextOut(1, 10, 'Формулировка задания --> 1');
    SetFontSize(16);
    TextOut(1, 40, 'Задать переменные (a,b и n) --> 2');
    SetFontSize(16);
    TextOut(1, 70, 'Примерная площадь криволинейно1 --> 3');
    SetFontSize(16);
    TextOut(1, 100, 'Точная площадь криволинейной --> 4');
    SetFontSize(16);
    TextOut(1, 130, 'Погрешность при расчетах --> 5');
    SetFontSize(16);
    TextOut(1, 160, 'График криволинейной --> 6');
    SetFontSize(16);
    TextOut(1, 190, 'Крутой график --> 7');
    SetFontSize(16);
    TextOut(1, 220, 'Выход из приложения --> 0');
    {SetFontSize(10);
    textout(200, 280, '░░░░░░░░░░░░░░░▄▄▄▄▄▄▄▄░░░░░░░░░░░░░░');
    SetFontSize(10);
    textout(200, 295, '░▄█▀███▄▄████████████████████▄▄███▀█░');
    SetFontSize(10);
    textout(200, 310, '░█░░▀████████████████████████████░░█░');   
    SetFontSize(10);
    textout(200, 325, '░░█▄░░▀████████████████████████░░░▄▀░');
    SetFontSize(10);
    textout(200, 340, '░░░▄███▀▀░░░░░░░░░██░░░░░░░░░▀███▄░░░');      
    SetFontSize(10);
    textout(200, 355, '░░▄██▀░░░░░▄▄▄██▄▄██░▄██▄▄▄░░░░░▀██▄░');
    SetFontSize(10);
    textout(200, 370, '▄██▀░░░▄▄▄███▄██████████▄███▄▄▄░░░▀█▄');
    SetFontSize(10);
    textout(200, 385, '▀██▄▄██████████▀░███▀▀▀█████████▄▄▄█▀');
    SetFontSize(10);
    textout(200, 400, '░░▀██████████▀░░░███░░░▀███████████▀░');
    SetFontSize(10);
    textout(200, 415, '░░░░▀▀▀██████░░░█████▄░░▀██████▀▀░░░░');
    SetFontSize(10);
    textout(200, 430, '░░░░░░░░░▀▀▀▀▄░░█████▀░▄█▀▀▀░░░░░░░░░');
    SetFontSize(10);
    textout(200, 445, '░░░░░░░░░░░░░░▀▀▄▄▄▄▄▀▀░░░░░░░░░░░░░░');
    }
    
    readln(z1);
    case z1 of
      1: proc0;
      2: proc2;
      3: proc1;
      4: proc3;
      5: proc4;
      6: proc5;
      7: proc8;
    end;
  until z1 = 0;
end.