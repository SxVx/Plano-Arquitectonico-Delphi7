object PlanoArquitectonico: TPlanoArquitectonico
  Left = 227
  Top = 139
  Width = 1034
  Height = 478
  Caption = 'Plano Arquitectonico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 760
    Top = 0
    Width = 265
    Height = 449
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 56
      Height = 19
      Caption = 'Grados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4metros: TLabel
      Left = 104
      Top = 424
      Width = 94
      Height = 13
      Caption = 'Metros Recorridos :'
    end
    object Metros: TLabel
      Left = 208
      Top = 424
      Width = 3
      Height = 13
    end
    object Muro: TButton
      Left = 24
      Top = 80
      Width = 105
      Height = 25
      Caption = 'Muro'
      TabOrder = 0
      OnClick = MuroClick
    end
    object Ventana: TButton
      Left = 24
      Top = 112
      Width = 105
      Height = 25
      Caption = 'Ventana'
      TabOrder = 1
      OnClick = VentanaClick
    end
    object Mueble: TButton
      Left = 24
      Top = 144
      Width = 105
      Height = 25
      Caption = 'Mueble'
      TabOrder = 2
      OnClick = MuebleClick
    end
    object Mesa: TButton
      Left = 24
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Mesa'
      TabOrder = 3
      OnClick = MesaClick
    end
    object Estufa: TButton
      Left = 24
      Top = 208
      Width = 105
      Height = 25
      Caption = 'Estufa'
      TabOrder = 4
      OnClick = EstufaClick
    end
    object Lavabo: TButton
      Left = 24
      Top = 240
      Width = 105
      Height = 25
      Caption = 'Lavabo'
      TabOrder = 5
      OnClick = LavaboClick
    end
    object Tasa: TButton
      Left = 24
      Top = 280
      Width = 105
      Height = 25
      Caption = 'Tasa'
      TabOrder = 6
      OnClick = TasaClick
    end
    object Cama: TButton
      Left = 24
      Top = 312
      Width = 105
      Height = 25
      Caption = 'Cama'
      TabOrder = 7
      OnClick = CamaClick
    end
    object Cerrar: TButton
      Left = 144
      Top = 312
      Width = 105
      Height = 25
      Caption = 'Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = CerrarClick
    end
    object Edit1: TEdit
      Left = 16
      Top = 48
      Width = 233
      Height = 21
      TabOrder = 9
      Text = '0'
    end
    object AnexarDisenio: TButton
      Left = 144
      Top = 80
      Width = 105
      Height = 25
      Caption = 'AnexarDise'#241'o'
      TabOrder = 10
      OnClick = AnexarDisenioClick
    end
    object AbrirDisenio: TButton
      Left = 144
      Top = 112
      Width = 105
      Height = 25
      Caption = 'AbrirDise'#241'o'
      TabOrder = 11
      OnClick = AbrirDisenioClick
    end
    object SalvarDisenio: TButton
      Left = 144
      Top = 144
      Width = 105
      Height = 25
      Caption = 'SalvarDise'#241'o'
      TabOrder = 12
      OnClick = SalvarDisenioClick
    end
    object Borrar: TButton
      Left = 144
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Borrar'
      TabOrder = 13
      OnClick = BorrarClick
    end
    object Limpiar: TButton
      Left = 144
      Top = 208
      Width = 105
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 14
      OnClick = LimpiarClick
    end
    object Repintar: TButton
      Left = 144
      Top = 240
      Width = 105
      Height = 25
      Caption = 'Repintar'
      TabOrder = 15
      OnClick = RepintarClick
    end
    object Autor: TButton
      Left = 144
      Top = 280
      Width = 105
      Height = 25
      Caption = 'Autor'
      TabOrder = 16
      OnClick = AutorClick
    end
    object ElementosPintados: TButton
      Left = 24
      Top = 344
      Width = 105
      Height = 25
      Caption = 'Elementos Pintados'
      TabOrder = 17
      OnClick = ElementosPintadosClick
    end
    object BorrarCache: TButton
      Left = 144
      Top = 344
      Width = 105
      Height = 25
      Caption = 'BorrarCache'
      TabOrder = 18
      OnClick = BorrarCacheClick
    end
  end
  object scrlbx1: TScrollBox
    Left = 0
    Top = 0
    Width = 753
    Height = 449
    TabOrder = 1
    object img1: TImage
      Left = 0
      Top = 0
      Width = 2000
      Height = 2000
      OnMouseDown = img1MouseDown
      OnMouseUp = img1MouseUp
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 808
    Top = 390
  end
end
