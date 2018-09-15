unit ScrollBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls;

type
  TPlanoArquitectonico = class(TForm)
    pnl1: TPanel;
    Muro: TButton;
    Ventana: TButton;
    Mueble: TButton;
    Mesa: TButton;
    scrlbx1: TScrollBox;
    img1: TImage;
    Estufa: TButton;
    Lavabo: TButton;
    Tasa: TButton;
    Cama: TButton;
    Cerrar: TButton;
    Edit1: TEdit;
    AnexarDisenio: TButton;
    AbrirDisenio: TButton;
    SalvarDisenio: TButton;
    Borrar: TButton;
    Limpiar: TButton;
    Repintar: TButton;
    Autor: TButton;
    Label1: TLabel;
    ElementosPintados: TButton;
    BorrarCache: TButton;
    OpenDialog1: TOpenDialog;
    Label4metros: TLabel;
    Metros: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure MuroClick(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CerrarClick(Sender: TObject);
    procedure VentanaClick(Sender: TObject);
    procedure MuebleClick(Sender: TObject);
    procedure MesaClick(Sender: TObject);
    procedure EstufaClick(Sender: TObject);
    procedure LavaboClick(Sender: TObject);
    procedure TasaClick(Sender: TObject);
    procedure CamaClick(Sender: TObject);
    procedure LimpiarClick(Sender: TObject);
    procedure BorrarClick(Sender: TObject);
    procedure RepintarClick(Sender: TObject);
    procedure ElementosPintadosClick(Sender: TObject);
    procedure BorrarCacheClick(Sender: TObject);
    procedure AutorClick(Sender: TObject);
    procedure SalvarDisenioClick(Sender: TObject);
    procedure AbrirDisenioClick(Sender: TObject);
    procedure AnexarDisenioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlanoArquitectonico: TPlanoArquitectonico;

//Variables globales
var x1,y1,x2,y2:Integer;
var a:Real;
var band:boolean;
var muros,ventanas:array[1..100,1..2] of TPoint;
//ELEMENTOS ORIGINALES
var contMuros,contVentanas,contMuebles,contMesas,contEstufas,contLavabos,contTasas,contCamas: Integer;
var muebles,mesas,estufas,lavabos,tasas,camas:array[1..100,1..1] of TPoint;
var grdMueble,grdMesa,grdEstufa,grdLavabo,grdTasa,grdCama:array[1..100] of Real;
//ELEMENTOS BORRADOS
var murosB,ventanasB:array[1..100,1..2] of TPoint;
var contMurosB,contVentanasB,contMueblesB,contMesasB,contEstufasB,contLavabosB,contTasasB,contCamasB: Integer;
var mueblesB,mesasB,estufasB,lavabosB,tasasB,camasB:array[1..100,1..1] of TPoint;
var grdMuebleB,grdMesaB,grdEstufaB,grdLavaboB,grdTasaB,grdCamaB:array[1..100] of Real;

implementation

{$R *.dfm}

procedure TPlanoArquitectonico.FormCreate(Sender: TObject);
var i :Integer;
begin
 //Cuadricula
 //contMuros:=0;
 //contVentanas:=0;
 //contMuebles:=0;
 img1.Canvas.Pen.Color:=clGray;
 img1.Canvas.pen.Mode:=pmNotXor;
 band:=false;
 for i:=1 to 100 do
 begin
   img1.Canvas.MoveTo(20*i,0);
   img1.Canvas.LineTo(20*i,2000);
 end;
 for i:=1 to 100 do
 begin
   img1.Canvas.MoveTo(0,20*i);
   img1.Canvas.LineTo(2000,20*i);
 end;
end;

procedure TPlanoArquitectonico.MuroClick(Sender: TObject);
begin
  if(x1=x2)and(y1=y2)then begin  exit; end;
  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  img1.Canvas.Pen.Color:= clRed;
  img1.Canvas.Pen.Width:= 8;
  img1.Canvas.MoveTo(x1,y1);
  img1.Canvas.LineTo(x2,y2);
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contMuros:=contMuros+1;
  muros[contMuros][1]:=point(x1,y1);
  muros[contMuros][2]:=point(x2,y2);

end;

procedure TPlanoArquitectonico.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 x1:=X;
 y1:=Y;
 band:=true;
 if((x1 mod 20)<>0)then
 begin
  if((x1 mod 20)>11)then begin x1:=x1+20-(x1 mod 20); end;
  if((x1 mod 20)<10)then begin x1:=x1-(x1 mod 20); end;
 end;

 if((y1 mod 20)<>0)then
 begin
  if((y1 mod 20)>11)then begin y1:=y1+20-(y1 mod 20); end;
  if((y1 mod 20)<10)then begin y1:=y1-(y1 mod 20); end;
 end;

end;

procedure TPlanoArquitectonico.img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  x2:=X;
  Y2:=Y;

  if((x2 mod 20)<>0)then
  begin
    if((x2 mod 20)>11)then begin x2:=x2+20-(x2 mod 20); end;
    if((x2 mod 20)<10)then begin x2:=x2-(x2 mod 20); end;
  end;

  if((y2 mod 20)<>0)then
  begin
    if((y2 mod 20)>11)then begin y2:=y2+20-(y2 mod 20); end;
    if((y2 mod 20)<10)then begin y2:=y2-(y2 mod 20); end;
  end;

  if (x1<>x2)then begin metros.Caption:= floatToStr(  (x2-x1)/ 40  ); end;
  if (y1<>y2) and (x1=x2) then begin metros.Caption:= floatToStr(  (y2-y1)/ 40  ); end;
end;

procedure TPlanoArquitectonico.CerrarClick(Sender: TObject);
begin
  Close();
end;

procedure TPlanoArquitectonico.VentanaClick(Sender: TObject);
begin
  if(x1=x2)and(y1=y2)then begin  exit; end;
  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 4;

  img1.Canvas.MoveTo(x1,y1);
  img1.Canvas.LineTo(x2,y2);

  img1.Canvas.Pen.Width:= 1;

  contVentanas:=contVentanas+1;
  ventanas[contVentanas][1]:=point(x1,y1);
  ventanas[contVentanas][2]:=point(x2,y2);
end;

procedure TPlanoArquitectonico.MuebleClick(Sender: TObject);
var xaux,yaux:Real;
var i:integer;
var puntos:array[1..2] of TPoint;
begin
   puntos[1].X :=0;
   puntos[1].Y :=0;
   puntos[2].X :=20;
   puntos[2].Y :=20;

  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  //ponemos valores segun la figura
  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;
  img1.Canvas.Brush.Color := RGB(200,90,0);

  a:=((strToint(Edit1.Text))*pi)/ 180; //PASO DE GRADOS A RADIANES

  for i:= 1 to 2 do
  begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;
  img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);
  //Restablecemos valores por defecto
  img1.Canvas.Brush.Color := clWhite;
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contMuebles:=contMuebles+1;
  muebles[contMuebles][1]:=point(x1,y1);
  grdMueble[contMuebles]:= a;

end;

procedure TPlanoArquitectonico.MesaClick(Sender: TObject);
var puntos:array[1..2] of TPoint;
var xaux,yaux:Real;
var i:integer;
begin

   puntos[1].X :=0;
   puntos[1].Y :=0;
   puntos[2].X :=40;
   puntos[2].Y :=40;
   if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  //ponemos valores segun la figura
  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;
  img1.Canvas.Brush.Color := RGB(200,90,0);

  a:= strtofloat(Edit1.Text);
  //ShowMessageFMT('a = %f',[a]);
  if ((a>=0)and(a<90)or(a=360)) or ((a<=0) and (a>-90) or (a=-360))then begin a:=0.0; end;
  if ((a>=90)and(a<180))or((a>-360) and (a<=-270)) then begin a:=90.0; end;
  if (((a>=180) and (a<270))or ((a>-270) and (a<=-180))) then begin a:=180.0; end;
  if (((a>=270) and (a<360))or ((a>-180) and (a<=-90)) ) then begin a:=270.0; end;
  a:= ((a)*pi)/ 180; //PASO DE GRADOS A RADIANES

 for i:= 1 to 2 do
 begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;

 img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);

  //Restablecemos valores por defecto
  img1.Canvas.Brush.Color := clWhite;
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contMesas:=contMesas+1;
  mesas[contMesas][1]:=point(x1,y1);
  grdMesa[contMesas]:= a;
  
end;

procedure TPlanoArquitectonico.EstufaClick(Sender: TObject);
var puntos:array[1..10] of TPoint;
var xaux,yaux:Real;
var i:integer;
begin

  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  //ponemos valores segun la figura
  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;
  img1.Canvas.Brush.Color := RGB(200,90,0);

   //cuadros de la estufa
    puntos[1]:=point(0,0);
    puntos[2]:=point(20,20);
    puntos[3]:=point(20,0);
    puntos[4]:=point(40,20);
    //Lineas de la estufa
    puntos[5]:=point(0,20);
    puntos[6]:=point(40,0);
    //circulos de la estufa
    puntos[7]:=point(4,4);
    puntos[8]:=point(16,16);
    puntos[9]:=point(24,4);
    puntos[10]:=point(36,16);

  a:= strtofloat(Edit1.Text);
  //ShowMessageFMT('a = %f',[a]);
  if ((a>=0)and(a<90)or(a=360)) or ((a<=0) and (a>-90) or (a=-360))then begin a:=0.0; end;
  if ((a>=90)and(a<180))or((a>-360) and (a<=-270)) then begin a:=90.0; end;
  if (((a>=180) and (a<270))or ((a>-270) and (a<=-180))) then begin a:=180.0; end;
  if (((a>=270) and (a<360))or ((a>-180) and (a<=-90)) ) then begin a:=270.0; end;
  a:= ((a)*pi)/ 180; //PASO DE GRADOS A RADIANES

 for i:= 1 to 10 do
 begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;

   //Graficamos la figura
  //Cuadrosde la estufa
  img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);
  img1.Canvas.Rectangle(puntos[3].X,puntos[3].Y,puntos[4].X,puntos[4].Y);
  //Lineas primer parrilla
  img1.Canvas.MoveTo(puntos[1].X,puntos[1].Y);
  img1.Canvas.LineTo(puntos[2].X,puntos[2].Y);
  img1.Canvas.MoveTo(puntos[3].X,puntos[3].Y);
  img1.Canvas.LineTo(puntos[5].X,puntos[5].Y);
  //Lineas segunda parrilla
  img1.Canvas.MoveTo(puntos[3].X,puntos[3].Y);
  img1.Canvas.LineTo(puntos[4].X,puntos[4].Y);
  img1.Canvas.MoveTo(puntos[2].X,puntos[2].Y);
  img1.Canvas.LineTo(puntos[6].X,puntos[6].Y);
  //circulos
  img1.Canvas.Ellipse(puntos[7].X,puntos[7].Y,puntos[8].X,puntos[8].Y);
  img1.Canvas.Ellipse(puntos[9].X,puntos[9].Y,puntos[10].X,puntos[10].Y);

  //Restablecemos valores por defecto
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;
  img1.Canvas.Brush.Color := clWhite;

  contEstufas:=contEstufas+1;
  estufas[contEstufas][1]:=point(x1,y1);
  grdEstufa[contEstufas]:= a;
end;

procedure TPlanoArquitectonico.LavaboClick(Sender: TObject);
var puntos:array[1..4] of TPoint;
var xaux,yaux:Real;
var i:integer;
begin

  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;

  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;
  
  //rectangulo del labavo
    puntos[1]:= point(0,0);
    puntos[2]:= point(40,20);
    //Elipse del Lavabo
    puntos[3]:= point(5,5);
    puntos[4]:= point(35,15);
    a:= strtofloat(Edit1.Text);
  //ShowMessageFMT('a = %f',[a]);
  if ((a>=0)and(a<90)or(a=360)) or ((a<=0) and (a>-90) or (a=-360))then begin a:=0.0; end;
  if ((a>=90)and(a<180))or((a>-360) and (a<=-270)) then begin a:=90.0; end;
  if (((a>=180) and (a<270))or ((a>-270) and (a<=-180))) then begin a:=180.0; end;
  if (((a>=270) and (a<360))or ((a>-180) and (a<=-90)) ) then begin a:=270.0; end;
  a:= ((a)*pi)/ 180; //PASO DE GRADOS A RADIANES

 for i:= 1 to 4 do
 begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;
  img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);
  img1.Canvas.Ellipse(puntos[3].X,puntos[3].Y,puntos[4].X,puntos[4].Y);
  
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contLavabos:=contLavabos+1;
  lavabos[contLavabos][1]:=point(x1,y1);
  grdLavabo[contLavabos]:= a;
end;

procedure TPlanoArquitectonico.TasaClick(Sender: TObject);

var puntos:array[1..4] of TPoint;
var xaux,yaux:Real;
var i:integer;
begin
  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;

  //Respaldo de la tasa
    puntos[1]:=point(0,0);
    puntos[2]:=point(10,20);
    //Elipse de la tasa
    puntos[3]:=point(10,3);
    puntos[4]:=point(30,17);

  a:= strtofloat(Edit1.Text);
  //ShowMessageFMT('a = %f',[a]);
  if ((a>=0)and(a<90)or(a=360)) or ((a<=0) and (a>-90) or (a=-360))then begin a:=0.0; end;
  if ((a>=90)and(a<180))or((a>-360) and (a<=-270)) then begin a:=90.0; end;
  if (((a>=180) and (a<270))or ((a>-270) and (a<=-180))) then begin a:=180.0; end;
  if (((a>=270) and (a<360))or ((a>-180) and (a<=-90)) ) then begin a:=270.0; end;
  a:= ((a)*pi)/ 180; //PASO DE GRADOS A RADIANES

 for i:= 1 to 4 do
 begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;
  //graficamos la tasa
  img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);
  img1.Canvas.Ellipse(puntos[3].X,puntos[3].Y,puntos[4].X,puntos[4].Y);

  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contTasas:=contTasas+1;
  tasas[contTasas][1]:=point(x1,y1);
  grdTasa[contTasas]:= a;

end;

procedure TPlanoArquitectonico.CamaClick(Sender: TObject);
var puntos:array[1..5] of TPoint;
var xaux,yaux:Real;
var i:integer;
begin
  if(band=false)then begin ShowMessageFMT('De click para ubicar la figura',[]); exit; end;
  img1.Canvas.Pen.Color:= RGB(153,76,0);
  img1.Canvas.Pen.Width:= 2;

  a:= strtofloat(Edit1.Text);
  if ((a>=0)and(a<90)or(a=360)) or ((a<=0) and (a>-90) or (a=-360))then begin a:=0.0; end;
  if ((a>=90)and(a<180))or((a>-360) and (a<=-270)) then begin a:=90.0; end;
  if (((a>=180) and (a<270))or ((a>-270) and (a<=-180))) then begin a:=180.0; end;
  if (((a>=270) and (a<360))or ((a>-180) and (a<=-90)) ) then begin a:=270.0; end;
  a:= ((a)*pi)/ 180; //PASO DE GRADOS A RADIANES

  //Recpaldo de la cama
    puntos[1]:=point(0,0);
    puntos[2]:=point(20,40);
    //colchon
    puntos[3]:=point(20,0);
    puntos[4]:=point(80,40);
    //punto linea
    puntos[5]:=point(0,40);

  for i:= 1 to 5 do
 begin
   xaux := puntos[i].X * Cos(a) + puntos[i].Y * Sin(a);
   yaux := -1*puntos[i].X * Sin(a) + puntos[i].Y * Cos(a);
   puntos[i].X := Round(xaux);
   puntos[i].Y := Round(yaux);
   puntos[i].X := puntos[i].X +x1;
   puntos[i].Y := puntos[i].Y +y1;
 end;

   //Respaldo de la cama
  img1.Canvas.Rectangle(puntos[1].X,puntos[1].Y,puntos[2].X,puntos[2].Y);
  //Colchon
  img1.Canvas.Rectangle(puntos[3].X,puntos[3].Y,puntos[4].X,puntos[4].Y);
  //lineas
  img1.Canvas.MoveTo(puntos[3].X,puntos[3].Y);
  img1.Canvas.LineTo(puntos[5].X,puntos[5].Y);
  img1.Canvas.MoveTo(puntos[1].X,puntos[1].Y);
  img1.Canvas.LineTo(puntos[2].X,puntos[2].Y);
  img1.Canvas.Pen.Color:= clBlack;
  img1.Canvas.Pen.Width:= 1;

  contCamas:=contCamas+1;
  camas[contCamas][1]:=point(x1,y1);
  grdCama[contCamas]:= a;
end;

procedure TPlanoArquitectonico.LimpiarClick(Sender: TObject);
var i:Integer;
begin
 img1.Canvas.Pen.Mode:= pmCopy;
 img1.Canvas.Rectangle(0,0,2000,2000);
 //Dibujamos la Cuadricula
 img1.Canvas.Pen.Color:=clGray;

 for i:=1 to 100 do
 begin
   img1.Canvas.MoveTo(20*i,0);
   img1.Canvas.LineTo(20*i,2000);
 end;
 for i:=1 to 100 do
 begin
   img1.Canvas.MoveTo(0,20*i);
   img1.Canvas.LineTo(2000,20*i);
 end;
 //Guardamos los elementos borrados
 {-----MUROS-------------------------------------------------------------------}
 if(contMuros>0) then
 begin
    for i:=1 to contMuros do
    begin
      contMurosB:=contMurosB+1;
      murosB[contMurosB][1]:=muros[i][1];
      murosB[contMurosB][2]:=muros[i][2];
    end;
    contMuros:=0;
 end;
 {-----VENTANAS-------------------------------------------------------------------}
 if(contVentanas>0) then
 begin
    for i:=1 to contVentanas do
    begin
      contVentanasB:=contVentanasB+1;
      ventanasB[contVentanasB][1]:=ventanas[i][1];
      ventanasB[contVentanasB][2]:=ventanas[i][2];
    end;
    contVentanas:=0;
 end;
 {-----MUEBLES--------------------------------------------------------------------}
 if(contMuebles>0) then
 begin
    for i:=1 to contMuebles do
    begin
      contMueblesB:=contMueblesB+1;
      mueblesB[contMueblesB][1]:=muebles[i][1];
      grdMuebleB[contMueblesB]:=grdMueble[i];
    end;
    contMuebles:=0;
 end;
 {-----MESAS----------------------------------------------------------------------}
 if(contMesas>0) then
 begin
    for i:=1 to contMesas do
    begin
      contMesasB:=contMesasB+1;
      mesasB[contMesasB][1]:=Mesas[i][1];
      grdMesaB[contMesasB]:=grdMesa[i];
    end;
    contMesas:=0;
 end;
 {-----ESTUFAS--------------------------------------------------------------------}
 if(contEstufas>0) then
 begin
    for i:=1 to contEstufas do
    begin
      contEstufasB:=contEstufasB+1;
      EstufasB[contEstufasB][1]:=Estufas[i][1];
      grdEstufaB[contEstufasB]:=grdEstufa[i];
    end;
    contEstufas:=0;
 end;
 {-----LAVABOS--------------------------------------------------------------------}
 if(contLavabos>0) then
 begin
    for i:=1 to contLavabos do
    begin
      contLavabosB:=contLavabosB+1;
      lavabosB[contLavabosB][1]:=Lavabos[i][1];
      grdLavaboB[contLavabosB]:=grdLavabo[i];
    end;
    contLavabos:=0;
 end;
 {-----TASAS----------------------------------------------------------------------}
 if(contTasas>0) then
 begin
    for i:=1 to contTasas do
    begin
      contTasasB:=contTasasB+1;
      TasasB[contTasasB][1]:=Tasas[i][1];
      grdTasaB[contTasasB]:=grdTasa[i];
    end;
    contTasas:=0;
 end;
 {-----CAMAS----------------------------------------------------------------------}
 if(contCamas>0) then
 begin
    for i:=1 to contCamas do
    begin
      contCamasB:=contCamasB+1;
      CamasB[contCamasB][1]:=Camas[i][1];
      grdCamaB[contCamasB]:=grdCama[i];
    end;
    contCamas:=0;
 end;
 {-----FIN------------------------------------------------------------------------}
 //Ponemos la pluma en el pmNotXor
 img1.Canvas.Pen.Mode:= pmNotXor;

end;

procedure TPlanoArquitectonico.BorrarClick(Sender: TObject);
var i:integer;
begin
  //MUROS
  if(x1<>x2)or(y1<>y2)then
  begin
    for i:=1 to contMuros do
      begin
        if((muros[i][1].X=x1)and(muros[i][1].Y=y1))and
          ((muros[i][2].X=x2)and(muros[i][2].Y=y2)) then
        begin
          //Guardamos elemento borrado
          contMurosB:=contMurosB+1;

          murosB[contMurosB][1].X:=muros[i][1].X;
          murosB[contMurosB][1].Y:=muros[i][1].Y;
          murosB[contMurosB][2].X:=muros[i][2].X;
          murosB[contMurosB][2].Y:=muros[i][2].Y;
         //----------
          muros[i][1].X:=muros[contMuros][1].X;
          muros[i][1].Y:=muros[contMuros][1].Y;
          muros[i][2].X:=muros[contMuros][2].X;
          muros[i][2].Y:=muros[contMuros][2].Y;
          Muro.Click;
          contMuros:=contMuros-2;
          break;
        end; //del if
      end;//end del for
  end;//if de si son muro o ventana
{---------------------------------------------------------------------------------------}
  //Ventanas
  if(x1<>x2)or(y1<>y2)then
  begin
   for i:=1 to contVentanas do
      begin
        if((ventanas[i][1].X=x1)and(ventanas[i][1].Y=y1))and
          ((ventanas[i][2].X=x2)and(ventanas[i][2].Y=y2)) then
        begin
          //Guardamos elemento borrado
          contVentanasB:=contVentanasB+1;

          ventanasB[contVentanasB][1].X:=ventanas[i][1].X;
          ventanasB[contVentanasB][1].Y:=ventanas[i][1].Y;
          ventanasB[contVentanasB][2].X:=ventanas[i][2].X;
          ventanasB[contVentanasB][2].Y:=ventanas[i][2].Y;
         //----------
          ventanas[i][1].X:=ventanas[contVentanas][1].X;
          ventanas[i][1].Y:=ventanas[contVentanas][1].Y;
          ventanas[i][2].X:=ventanas[contVentanas][2].X;
          ventanas[i][2].Y:=ventanas[contVentanas][2].Y;
          Ventana.Click;
          contVentanas:=contVentanas-2;
          break;
        end; //del if
      end;//end del for
  end;//end if
{---------------------------------------------------------------------------------------}
  a:=((strToint(Edit1.Text))*pi)/ 180;

  if(x1=x2)or(y1=y2)then
  begin
      //Muebles
      for i:=1 to contMuebles do
        begin
          if((muebles[i][1].X=x1)and(Muebles[i][1].Y=y1))and( grdMueble[i]=a )then
              begin
              //Guardamos elemento borrado
                contMueblesB:=contMueblesB+1;

                mueblesB[contMueblesB][1].X:=muebles[i][1].X;
                mueblesB[contMueblesB][1].Y:=muebles[i][1].Y;
                grdMuebleB[contMueblesB]:=grdMueble[i];
                 //----------
                  muebles[i][1].X:=muebles[contMuebles][1].X;
                  muebles[i][1].Y:=muebles[contMuebles][1].Y;
                  grdMueble[i]:= grdMueble[contMuebles];
                  Mueble.Click;
                  contMuebles:=contMuebles-2;
                  break;
              end; //del if
        end;//end del for
       {||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
      //Mesas
      for i:=1 to contMesas do
        begin
          if((Mesas[i][1].X=x1)and(Mesas[i][1].Y=y1))and( grdMesa[i]=a )then
              begin
                //Guardamos elemento borrado
                 contMesasB:=contMesasB+1;
                 mesasB[contMesasB][1].X:=mesas[i][1].X;
                 mesasB[contMesasB][1].Y:=mesas[i][1].Y;
                 grdMesaB[contMesasB]:=grdMesa[i];
                 //----------
                  Mesas[i][1].X:=Mesas[contMesas][1].X;
                  Mesas[i][1].Y:=Mesas[contMesas][1].Y;
                  grdMesa[i]:= grdMesa[contMesas];
                  Mesa.Click;
                  contMesas:=contMesas-2;
                  break;
              end; //del if
      end;//end del for
      {||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
      //Estufas
      for i:=1 to contEstufas do
        begin
          if((Estufas[i][1].X=x1)and(Estufas[i][1].Y=y1))and( grdEstufa[i]=a )then
              begin
                  //Guardamos elemento borrado
                 contEstufasB:=contEstufasB+1;
                 estufasB[contEstufasB][1].X:=estufas[i][1].X;
                 estufasB[contEstufasB][1].Y:=estufas[i][1].Y;
                 grdEstufaB[contEstufasB]:=grdEstufa[i];
                 //----------
                  Estufas[i][1].X:=Estufas[contEstufas][1].X;
                  Estufas[i][1].Y:=Estufas[contEstufas][1].Y;
                  grdEstufa[i]:= grdEstufa[contEstufas];
                  Estufa.Click;
                  contEstufas:=contEstufas-2;
                  break;
              end; //del if
      end;//end del for
      {||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
      //Lavabo
      for i:=1 to contLavabos do
        begin
          if((Lavabos[i][1].X=x1)and(Lavabos[i][1].Y=y1))and( grdLavabo[i]=a )then
              begin
                //Guardamos elemento borrado
                 contLavabosB:=contLavabosB+1;
                 lavabosB[contLavabosB][1].X:=Lavabos[i][1].X;
                 lavabosB[contLavabosB][1].Y:=Lavabos[i][1].Y;
                 grdLavaboB[contLavabosB]:=grdLavabo[i];
                 //----------
                  Lavabos[i][1].X:=Lavabos[contLavabos][1].X;
                  Lavabos[i][1].Y:=Lavabos[contLavabos][1].Y;
                  grdLavabo[i]:= grdLavabo[contLavabos];
                  Lavabo.Click;
                  contLavabos:=contLavabos-2;
                  break;
              end; //del if
      end;//end del for
      {||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
      //Tasa
      for i:=1 to contTasas do
        begin
          if((Tasas[i][1].X=x1)and(Tasas[i][1].Y=y1))and( grdTasa[i]=a )then
              begin
                //Guardamos elemento borrado
                 contTasasB:=contTasasB+1;
                 TasasB[contTasasB][1].X:=Tasas[i][1].X;
                 TasasB[contTasasB][1].Y:=Tasas[i][1].Y;
                 grdTasaB[contTasasB]:=grdTasa[i];
                 //----------
                  Tasas[i][1].X:=Tasas[contTasas][1].X;
                  Tasas[i][1].Y:=Tasas[contTasas][1].Y;
                  grdTasa[i]:= grdTasa[contTasas];
                  Tasa.Click;
                  contTasas:=contTasas-2;
                  break;
              end; //del if
      end;//end del for
      {||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
      //Cama
      for i:=1 to contCamas do
        begin
          if((camas[i][1].X=x1)and(camas[i][1].Y=y1))and( grdCama[i]=a )then
              begin
                //Guardamos elemento borrado
                  contCamasB:=contCamasB+1;
                  camasB[contCamasB][1].X:=camas[i][1].X;
                  camasB[contCamasB][1].Y:=camas[i][1].Y;
                  grdCamaB[contCamasB]:=grdCama[i];
                 //----------
                  Camas[i][1].X:=Camas[contCamas][1].X;
                  Camas[i][1].Y:=Camas[contCamas][1].Y;
                  grdCama[i]:= grdCama[contCamas];
                  Cama.Click;
                  contCamas:=contCamas-2;
                  break;
              end; //del if
      end;//end del for


  end;//end if


end;

procedure TPlanoArquitectonico.RepintarClick(Sender: TObject);
var band: Boolean;
var a,mensaje:String;
var i,elemento:Integer;
begin
  mensaje:=chr(13);
  band:=false;
  if(contMurosB>=1)   then begin mensaje:=mensaje+'-> Muros'+chr(13);     band:=true;end;
  if(contVentanasB>=1)then begin mensaje:=mensaje+'-> Ventanas'+chr(13);  band:=true;end;
  if(contMueblesB>=1) then begin mensaje:=mensaje+'-> Muebles' +chr(13);  band:=true;end;
  if(contMesasB>=1)   then begin mensaje:=mensaje+'-> Mesas'   +chr(13);  band:=true;end;
  if(contEstufasB>=1) then begin mensaje:=mensaje+'-> Estufas' +chr(13);  band:=true;end;
  if(contLavabosB>=1) then begin mensaje:=mensaje+'-> Lavabos' +chr(13);  band:=true;end;
  if(contTasasB>=1)   then begin mensaje:=mensaje+'-> Tasas'   +chr(13);  band:=true;end;
  if(contCamasB>=1)   then begin mensaje:=mensaje+'-> Camas'   +chr(13);  band:=true;end;

  if(band=false)then begin ShowMessage('NO HAY FIGURAS A REPINTAR'); exit; end;
  a:=inputbox('Elementos a repintar','Seleccion tipo de elemento'+mensaje,'');
  a:= lowerCase(a);
  mensaje:=chr(13);
 {________________MUROS__________________________________________________________}
  if(a='muros')then
  begin
    for i:=1 to contMurosB do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Muro: ('+ intToStr(murosB[i][1].X)+','+intToStr(murosB[i][1].Y) +'),('
             + intToStr(murosB[i][2].X) +','+ intToStr(murosB[i][2].Y)+')'+chr(13);
    end;
    elemento:=strToint(inputbox('Muros a repintar'+mensaje,'Seleccione elemento'+mensaje,''));
    x1:=murosB[elemento][1].X;
    y1:=murosB[elemento][1].Y;
    x2:=murosB[elemento][2].X;
    y2:=murosB[elemento][2].Y;

    murosB[elemento][1].X:=murosB[contMurosB][1].X;
    murosB[elemento][1].Y:=murosB[contMurosB][1].Y;
    murosB[elemento][2].X:=murosB[contMurosB][2].X;
    murosB[elemento][2].Y:=murosB[contMurosB][2].Y;

    contMurosB:=contMurosB-1;
    Muro.Click;
  end;
 {________________Ventanas__________________________________________________________}
  if(a='ventanas')then
  begin

    for i:=1 to contVentanasB do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Ventana: ('+ intToStr(ventanasB[i][1].X)+','+intToStr(ventanasB[i][1].Y) +'),('
             + intToStr(ventanasB[i][2].X) +','+ intToStr(ventanasB[i][2].Y)+')'+chr(13);
    end;
    elemento:=strToint(inputbox('Muros a repintar'+mensaje,'Seleccione elemento'+mensaje,''));
    x1:=ventanasB[elemento][1].X;
    y1:=ventanasB[elemento][1].Y;
    x2:=ventanasB[elemento][2].X;
    y2:=ventanasB[elemento][2].Y;

    ventanasB[elemento][1].X:=ventanasB[contVentanasB][1].X;
    ventanasB[elemento][1].Y:=ventanasB[contVentanasB][1].Y;
    ventanasB[elemento][2].X:=ventanasB[contVentanasB][2].X;
    ventanasB[elemento][2].Y:=ventanasB[contVentanasB][2].Y;

    contVentanasB:=contVentanasB-1;
    ventana.Click;
  end;
  {________________Muebles__________________________________________________________}
  if(a='muebles')then
  begin

    for i:=1 to contMueblesB do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Mueble: ('+ intToStr(mueblesB[i][1].X)+','+intToStr(mueblesB[i][1].Y) +') grd = '+floatToStr((grdMuebleB[i]*180)/pi)+chr(13);
    end;
    elemento:=strToint(inputbox('Muebles a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
    if(elemento<1)then begin exit; end;
    x1:=mueblesB[elemento][1].X;
    y1:=mueblesB[elemento][1].Y;
    Edit1.Text:=floatToStr((grdMuebleB[elemento]*180)/pi);

    mueblesB[elemento][1].X:=mueblesB[contMueblesB][1].X;
    mueblesB[elemento][1].Y:=mueblesB[contMueblesB][1].Y;
    grdMuebleB[elemento]:=grdMuebleB[contMueblesB];

    contMueblesB:=contMueblesB-1;
    Mueble.Click;
  end;
  {________________Mesas__________________________________________________________}
  if(a='mesas')then
  begin

      for i:=1 to contMesasB do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Mesa: ('+ intToStr(mesasB[i][1].X)+','+intToStr(mesasB[i][1].Y) +') grd = '+floatToStr((grdMesaB[i]*180)/pi)+chr(13);
      end;
      elemento:=strToint(inputbox('Mesas a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
      if(elemento<1)then begin exit; end;
      x1:=mesasB[elemento][1].X;
      y1:=mesasB[elemento][1].Y;
      Edit1.Text:=floatToStr((grdMesaB[elemento]*180)/pi);

      mesasB[elemento][1].X:=mesasB[contMesasB][1].X;
      mesasB[elemento][1].Y:=mesasB[contMesasB][1].Y;
      grdMesaB[elemento]:=grdMesaB[contMesasB];

      contMesasB:=contMesasB-1;
      Mesa.Click;
  end;
  {________________Estufa__________________________________________________________}
  if(a='estufas')then
  begin

      for i:=1 to contEstufasB do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Estufa: ('+ intToStr(estufasB[i][1].X)+','+intToStr(estufasB[i][1].Y) +') grd = '+floatToStr((grdEstufaB[i]*180)/pi)+chr(13);
      end;
      elemento:=strToint(inputbox('Estufa a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
      if(elemento<1)then begin exit; end;
      x1:=estufasB[elemento][1].X;
      y1:=estufasB[elemento][1].Y;
      Edit1.Text:=floatToStr((grdEstufaB[elemento]*180)/pi);

      estufasB[elemento][1].X:=estufasB[contEstufasB][1].X;
      estufasB[elemento][1].Y:=estufasB[contEstufasB][1].Y;
      grdEstufaB[elemento]:=grdEstufaB[contEstufasB];

      contEstufasB:=contEstufasB-1;
      Estufa.Click;
  end;

  {________________Lavabo__________________________________________________________}
  if(a='lavabos')then
  begin

      for i:=1 to contLavabosB do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Lavabos: ('+ intToStr(lavabosB[i][1].X)+','+intToStr(lavabosB[i][1].Y) +') grd = '+floatToStr((grdLavaboB[i]*180)/pi)+chr(13);
      end;
      elemento:=strToint(inputbox('Estufa a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
      if(elemento<1)then begin exit; end;
      x1:=lavabosB[elemento][1].X;
      y1:=lavabosB[elemento][1].Y;
      Edit1.Text:=floatToStr((grdLavaboB[elemento]*180)/pi);

      lavabosB[elemento][1].X:=lavabosB[contLavabosB][1].X;
      lavabosB[elemento][1].Y:=lavabosB[contLavabosB][1].Y;
      grdLavaboB[elemento]:=grdLavaboB[contLavabosB];

      contLavabosB:=contLavabosB-1;
      Lavabo.Click;
  end;

  {________________Tasa__________________________________________________________}
  if(a='tasas')then
  begin

      for i:=1 to contTasasB do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Tasas: ('+ intToStr(tasasB[i][1].X)+','+intToStr(tasasB[i][1].Y) +') grd = '+floatToStr((grdTasaB[i]*180)/pi)+chr(13);
      end;
      elemento:=strToint(inputbox('Tasa a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
      if(elemento<1)then begin exit; end;
      x1:=tasasB[elemento][1].X;
      y1:=tasasB[elemento][1].Y;
      Edit1.Text:=floatToStr((grdTasaB[elemento]*180)/pi);

      tasasB[elemento][1].X:=tasasB[contTasasB][1].X;
      tasasB[elemento][1].Y:=tasasB[contTasasB][1].Y;
      grdTasaB[elemento]:=grdTasaB[contTasasB];

      contTasasB:=contTasasB-1;
      Tasa.Click;
  end;

  {________________Cama__________________________________________________________}
  if(a='camas')then
  begin

      for i:=1 to contCamasB do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Camas: ('+ intToStr(camasB[i][1].X)+','+intToStr(camasB[i][1].Y) +') grd = '+floatToStr((grdCamaB[i]*180)/pi)+chr(13);
      end;
      elemento:=strToint(inputbox('Cama a repintar'+mensaje,'Seleccione elemento'+mensaje,'0'));
      if(elemento<1)then begin exit; end;
      x1:=camasB[elemento][1].X;
      y1:=camasB[elemento][1].Y;
      Edit1.Text:=floatToStr((grdCamaB[elemento]*180)/pi);

      camasB[elemento][1].X:=camasB[contCamasB][1].X;
      camasB[elemento][1].Y:=camasB[contCamasB][1].Y;
      grdCamaB[elemento]:=grdCamaB[contCamasB];

      contCamasB:=contCamasB-1;
      Cama.Click;
  end;

  {________________FIN__________________________________________________________}




end;

procedure TPlanoArquitectonico.ElementosPintadosClick(Sender: TObject);
var i: integer;
var a,mensaje:String;
var band:boolean;
begin
  mensaje:=chr(13);
  band:=false;
  if(contMuros>=1)   then begin mensaje:=mensaje+'-> Muros'+chr(13);     band:=true;end;
  if(contVentanas>=1)then begin mensaje:=mensaje+'-> Ventanas'+chr(13);  band:=true;end;
  if(contMuebles>=1) then begin mensaje:=mensaje+'-> Muebles' +chr(13);  band:=true;end;
  if(contMesas>=1)   then begin mensaje:=mensaje+'-> Mesas'   +chr(13);  band:=true;end;
  if(contEstufas>=1) then begin mensaje:=mensaje+'-> Estufas' +chr(13);  band:=true;end;
  if(contLavabos>=1) then begin mensaje:=mensaje+'-> Lavabos' +chr(13);  band:=true;end;
  if(contTasas>=1)   then begin mensaje:=mensaje+'-> Tasas'   +chr(13);  band:=true;end;
  if(contCamas>=1)   then begin mensaje:=mensaje+'-> Camas'   +chr(13);  band:=true;end;

  if(band=false)then begin ShowMessage('NO HAY FIGURAS PINTADAS'); exit; end;

  a:=inputbox('Elementos a Pintados','Seleccion tipo de elemento'+mensaje,'');
  a:= lowerCase(a);
  mensaje:=chr(13);
  {-------MUROS----------------------------------------------------------------------}
  if(a='muros')then
  begin
    for i:=1 to contMuros do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Muro: ('+ intToStr(muros[i][1].X)+','+intToStr(muros[i][1].Y) +'),('
             + intToStr(muros[i][2].X) +','+ intToStr(muros[i][2].Y)+')'+chr(13);
    end;
    ShowMessage(mensaje);
  end;
  {-------VENTANAS------------------------------------------------------------------}
  if(a='ventanas')then
  begin
    for i:=1 to contVentanas do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Ventana: ('+ intToStr(ventanas[i][1].X)+','+intToStr(ventanas[i][1].Y) +'),('
             + intToStr(ventanas[i][2].X) +','+ intToStr(ventanas[i][2].Y)+')'+chr(13);
    end;
    ShowMessage(mensaje);
  end;
  {-------MUEBLES-------------------------------------------------------------------}
  if(a='muebles')then
  begin
    for i:=1 to contMuebles do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Mueble: ('+ intToStr(muebles[i][1].X)+','+intToStr(muebles[i][1].Y) +') grd = '+floatToStr((grdMueble[i]*180)/pi)+chr(13);
    end;
    ShowMessage(mensaje);
  end;
  {-------MESAS---------------------------------------------------------------------}
  if(a='mesas')then
  begin
    for i:=1 to contMesas do
    begin
      mensaje:=mensaje+intToStr(i)+'.-Mesa: ('+ intToStr(mesas[i][1].X)+','+intToStr(mesas[i][1].Y) +') grd = '+floatToStr((grdMesa[i]*180)/pi)+chr(13);
    end;
    ShowMessage(mensaje);
  end;
  {-------ESTUFAS-------------------------------------------------------------------}
  if(a='estufas')then
  begin
      for i:=1 to contEstufas do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Estufa: ('+ intToStr(estufas[i][1].X)+','+intToStr(estufas[i][1].Y) +') grd = '+floatToStr((grdEstufa[i]*180)/pi)+chr(13);
      end;
      ShowMessage(mensaje);
  end;
  {-------LAVABOS-------------------------------------------------------------------}
  if(a='lavabos')then
  begin
      for i:=1 to contLavabos do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Lavabos: ('+ intToStr(lavabos[i][1].X)+','+intToStr(lavabos[i][1].Y) +') grd = '+floatToStr((grdLavabo[i]*180)/pi)+chr(13);
      end;
      ShowMessage(mensaje);
  end;
  {-------TASAS---------------------------------------------------------------------}
  if(a='tasas')then
  begin
      for i:=1 to contTasas do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Tasas: ('+ intToStr(tasas[i][1].X)+','+intToStr(tasas[i][1].Y) +') grd = '+floatToStr((grdTasa[i]*180)/pi)+chr(13);
      end;
      ShowMessage(mensaje);
  end;
  {-------CAMAS---------------------------------------------------------------------}
  if(a='camas')then
  begin
      for i:=1 to contCamas do
      begin
        mensaje:=mensaje+intToStr(i)+'.-Camas: ('+ intToStr(camas[i][1].X)+','+intToStr(camas[i][1].Y) +') grd = '+floatToStr((grdCama[i]*180)/pi)+chr(13);
      end;
      ShowMessage(mensaje);
  end;
  {-------FIN-----------------------------------------------------------------------}
end;

procedure TPlanoArquitectonico.BorrarCacheClick(Sender: TObject);
var opcion:Integer;
begin
  //messagedlg('Confirmacion',mtError,mbOkCancel,0); MENSAJE DE ERROR
  //MESAGE DE CONFIRMACION
  opcion:=messagedlg(  //aceptar ->1, cancelar ->2
      'Se perderan todos los objetos borrados'+chr(13)+'¿Desea continuar?',
       mtConfirmation,     //Tipo de mensaje
      [mbOK,mbCancel],     //Botones de interaccion
      0                    //Valor por defecto
    );

 if(opcion=1)then
 begin
    contMurosB:=0;
    contVentanasB:=0;
    contMueblesB:=0;
    contMesasB:=0;
    contEstufasB:=0;
    contLavabosB:=0;
    contTasasB:=0;
    contCamasB:=0;
    showMessage('Se ha borrado cache con exito');
 end;
 if(opcion=2)then
 begin
  showMessage('Se a cancelado la acción');
 end;

end;

procedure TPlanoArquitectonico.AutorClick(Sender: TObject);
begin
  ShowMessage('José Enrique Sevilla Larrea');
end;

procedure TPlanoArquitectonico.SalvarDisenioClick(Sender: TObject);
var saveDialog: tsavedialog;
var f: TextFile;
var i:integer;
var nombre:String;
begin
  //Creamos el dialogo de salvado
  saveDialog := TSavedialog.Create(self);
  //Le damos al dialog un titulo
  saveDialog.Title:= 'Salvar Diseño';
  //Configurar el direcctorio inicial para que sea el actual
  saveDialog.InitialDir:= GetCurrentDir;
  //Permitimos que solo los tipo de .txt y .doc se guarden
  saveDialog.Filter:='Text file|*.txt|word file|*.doc';
  //Ponemos la extension por default
  saveDialog.DefaultExt:= '.txt';
  //Seleccionamos archivos de texto como tipo de filtro inicial

  //Ejecutamos el saveDialog
  if saveDialog.Execute then
  begin
      nombre:= saveDialog.FileName;
      AssignFile(f,nombre);
      ReWrite(f);

      {-----MUROS-------------------------------------------------------------------------}
      writeLn(f,contMuros);
      for i:=1 to contMuros do
      begin
        writeLn(f,muros[i][1].X,' ',muros[i][1].Y,' ',muros[i][2].X,' ',muros[i][2].Y);
      end;
      {-----VENTANAS----------------------------------------------------------------------}
      writeLn(f,contVentanas);
      for i:=1 to contVentanas do
      begin
        writeLn(f,ventanas[i][1].X,' ',ventanas[i][1].Y,' ',ventanas[i][2].X,' ',ventanas[i][2].Y);
      end;
      {-----MUEBLES-----------------------------------------------------------------------}
      writeLn(f,contMuebles);
      for i:=1 to contMuebles do
      begin
          writeLn(f,muebles[i][1].X,' ',muebles[i][1].Y,' ',floatToStr((grdMueble[i]*180)/pi));
      end;
      {-----MESAS-------------------------------------------------------------------------}
      writeLn(f,contMesas);
      for i:=1 to contMesas do
      begin
          writeLn(f,mesas[i][1].X,' ',mesas[i][1].Y,' ',floatToStr((grdmesa[i]*180)/pi));
      end;
      {-----ESTUFAS-----------------------------------------------------------------------}
      writeLn(f,contEstufas);
      for i:=1 to contEstufas do
      begin
          writeLn(f,estufas[i][1].X,' ',estufas[i][1].Y,' ',floatToStr((grdestufa[i]*180)/pi));
      end;
      {-----LAVABOS-----------------------------------------------------------------------}
      writeLn(f,contLavabos);
      for i:=1 to contLavabos do
      begin
          writeLn(f,lavabos[i][1].X,' ',lavabos[i][1].Y,' ',floatToStr((grdLavabo[i]*180)/pi));
      end;
      {-----TASAS-------------------------------------------------------------------------}
      writeLn(f,contTasas);
      for i:=1 to contTasas do
      begin
          writeLn(f,tasas[i][1].X,' ',tasas[i][1].Y,' ',floatToStr((grdTasa[i]*180)/pi));
      end;
      {-----CAMAS-------------------------------------------------------------------------}
      writeLn(f,contCamas);
      for i:=1 to contCamas do
      begin
          writeLn(f,camas[i][1].X,' ',camas[i][1].Y,' ',floatToStr((grdCama[i]*180)/pi));
      end;
      {-----FIN---------------------------------------------------------------------------}
      closeFile(f);

  end;

  //Liberamos la memoria del saveDialog
  saveDialog.Free;



end;

procedure TPlanoArquitectonico.AbrirDisenioClick(Sender: TObject);
var opcion,i,aux,auxGrd:Integer;
var nombre:string;
var f: TextFile;
begin
  //MESAGE DE CONFIRMACION
  opcion:=messagedlg(  //aceptar ->1, cancelar ->2
      'Se perderan todo avance realizado'+chr(13)+'¿Desea continuar?',
       mtConfirmation,     //Tipo de mensaje
      [mbOK,mbCancel],     //Botones de interaccion
      0                    //Valor por defecto
    );

  if(opcion=1)then
  begin
     img1.Canvas.Pen.Mode:= pmCopy;
     img1.Canvas.Rectangle(0,0,2000,2000);
     //Dibujamos la Cuadricula
     img1.Canvas.Pen.Color:=clGray;

     for i:=1 to 100 do
     begin
      img1.Canvas.MoveTo(20*i,0);
      img1.Canvas.LineTo(20*i,2000);
     end;
     for i:=1 to 100 do
     begin
      img1.Canvas.MoveTo(0,20*i);
      img1.Canvas.LineTo(2000,20*i);
     end;
     img1.Canvas.Pen.mode:=pmNotXor;

    contMurosB:=0;
    contVentanasB:=0;
    contMueblesB:=0;
    contMesasB:=0;
    contEstufasB:=0;
    contLavabosB:=0;
    contTasasB:=0;
    contCamasB:=0;

    contMuros:=0;
    contVentanas:=0;
    contMuebles:=0;
    contMesas:=0;
    contEstufas:=0;
    contLavabos:=0;
    contTasas:=0;
    contCamas:=0;

    if openDialog1.Execute then
    begin
      nombre:= openDialog1.FileName; //Obtenemoes el nombre del archivo a abrir
      AssignFile(f,nombre); //ASOSIA f al nombre del archivo
      Reset(f); //ABRIR PARA LECTURA
    {---Variable de dar click en el image o sale mensaje de dar click--desactivamos-}
     band:=true;
    {------Muros----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,x2,y2);
        muro.Click;
      end;
    {------Ventanas-------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,x2,y2);
        ventana.Click;
      end;
    {------MUEBLES-------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        mueble.Click;
      end;
    {------Mesas----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        Mesa.Click;
      end;
    {------Estufa---------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        Estufa.Click;
      end;
    {------Lavabo---------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        Lavabo.Click;
      end;
    {------Tasa-----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        Tasa.Click;
      end;
    {------Cama-----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        Cama.Click;
      end;
    {------Fin------------------------------------------------------------------}



      CloseFile(f);
    {---Variable de dar click en el image o sale mensaje de dar click--activamos-}
     band:=false;
    end; //Ejecucion del saveDialog


  end;//DEL IF DE ACEPTAR
  if(opcion=2)then
  begin
    showMessage('Se a cancelado la acción');
  end;


end;

procedure TPlanoArquitectonico.AnexarDisenioClick(Sender: TObject);
var i,aux,auxGrd,ejeX,ejeY:Integer;
var nombre,opcion:string;
var f: TextFile;
begin
  opcion:=inputbox('Desplazamiento','¿Desea desplazar los elementos sobre los ejes? S/N','');
  opcion:=lowerCase(opcion);
  if opcion='s' then
  begin
    ejeX:=strToint(inputbox('Desplazar eje X','Cantidad en metros','0'))*40;
    ejeY:=strToint(inputbox('Desplazar eje Y','Cantidad en metros','0'))*40;
  end;

  if openDialog1.Execute then
  begin
      nombre:= openDialog1.FileName; //Obtenemoes el nombre del archivo a abrir
      AssignFile(f,nombre); //ASOSIA f al nombre del archivo
      Reset(f); //ABRIR PARA LECTURA
    {---Variable de dar click en el image o sale mensaje de dar click--desactivamos-}
     band:=true;

    {------Muros----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,x2,y2);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        x2:=x2+ejeX;
        y2:=y2+ejeY;
        muro.Click;
      end;
    {------Ventanas-------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,x2,y2);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        x2:=x2+ejeX;
        y2:=y2+ejeY;
        ventana.Click;
      end;
    {------MUEBLES-------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        mueble.Click;
      end;
    {------Mesas----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        Mesa.Click;
      end;
    {------Estufa---------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        Estufa.Click;
      end;
    {------Lavabo---------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        Lavabo.Click;
      end;
    {------Tasa-----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        Tasa.Click;
      end;
    {------Cama-----------------------------------------------------------------}
      ReadLn(f,aux);
      for i:=1 to aux do
      begin
        ReadLn(f,x1,y1,auxGrd);
        edit1.Text:=intToStr(auxGrd);
        x1:=x1+ejeX;
        y1:=y1+ejeY;
        Cama.Click;
      end;
    {------Fin------------------------------------------------------------------}
    {---Variable de dar click en el image o sale mensaje de dar click--activamos-}
     band:=false;


    CloseFile(f);
  end; //Ejecucion del saveDialog



end;

end.
