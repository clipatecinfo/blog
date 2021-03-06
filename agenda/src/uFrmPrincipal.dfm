object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Agenda'
  ClientHeight = 472
  ClientWidth = 674
  Color = clWhite
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 680
  Constraints.MinHeight = 500
  Constraints.MinWidth = 680
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object crdPnlPrincipal: TCardPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 431
    Align = alClient
    ActiveCard = crdListagem
    BevelOuter = bvNone
    Caption = 'crdPnlPrincipal'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object crdListagem: TCard
      Left = 0
      Top = 0
      Width = 674
      Height = 431
      Caption = 'crdListagem'
      CardIndex = 0
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 674
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          674
          61)
        object edtPesquisar: TLabeledEdit
          Left = 8
          Top = 25
          Width = 576
          Height = 25
          EditLabel.Width = 128
          EditLabel.Height = 17
          EditLabel.Caption = 'Digite para pesquisar'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Segoe UI Semibold'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          TabOrder = 0
          TextHint = 'Digite o nome ou apelido para pesquisar'
        end
        object btnPesquisar: TButton
          Left = 590
          Top = 23
          Width = 75
          Height = 30
          Action = ac_pesquisar
          Anchors = [akRight, akBottom]
          TabOrder = 1
        end
      end
      object dbGrdListagem: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 64
        Width = 668
        Height = 317
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsPessoaPesq
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbGrdListagemDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome (apelido)'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade-Estado'
            Width = 280
            Visible = True
          end>
      end
      object pnlBtnsListagem: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 387
        Width = 668
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          668
          41)
        object btnNovo: TButton
          Left = 425
          Top = 6
          Width = 75
          Height = 30
          Action = ac_novo
          Anchors = [akRight, akBottom]
          TabOrder = 0
        end
        object btnDetalhar: TButton
          Left = 506
          Top = 6
          Width = 75
          Height = 30
          Action = ac_detalhar
          Anchors = [akRight, akBottom]
          TabOrder = 1
        end
        object btnExcluir: TButton
          Left = 587
          Top = 6
          Width = 75
          Height = 30
          Action = ac_excluir
          Anchors = [akRight, akBottom]
          TabOrder = 2
        end
      end
    end
    object crdDados: TCard
      Left = 0
      Top = 0
      Width = 674
      Height = 431
      Caption = 'crdDados'
      CardIndex = 1
      TabOrder = 1
      DesignSize = (
        674
        431)
      object lblNOME: TLabel
        Left = 8
        Top = 9
        Width = 36
        Height = 17
        Caption = 'Nome'
        FocusControl = edtNOME
      end
      object lblAPELIDO: TLabel
        Left = 414
        Top = 9
        Width = 45
        Height = 17
        Caption = 'Apelido'
        FocusControl = edtAPELIDO
      end
      object lblID_CIDADE: TLabel
        Left = 8
        Top = 63
        Width = 86
        Height = 17
        Caption = 'Cidade-Estado'
        FocusControl = edtID_CIDADE
      end
      object shpCIDADE: TShape
        Left = 110
        Top = 86
        Width = 554
        Height = 25
      end
      object lblCIDADE: TDBText
        Left = 115
        Top = 90
        Width = 544
        Height = 17
        DataField = 'CIDADE'
        DataSource = dsPessoaCad
      end
      object lblOBS: TLabel
        Left = 8
        Top = 117
        Width = 76
        Height = 17
        Caption = 'Observa'#231#245'es'
        FocusControl = mmoOBS
      end
      object lblContatos: TLabel
        Left = 8
        Top = 223
        Width = 52
        Height = 17
        Caption = 'Contatos'
      end
      object dbGrdContatos: TDBGrid
        Left = 8
        Top = 246
        Width = 581
        Height = 135
        BorderStyle = bsNone
        DataSource = dsPessoaContato
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Title.Caption = 'Contato'
            Width = 400
            Visible = True
          end>
      end
      object edtNOME: TDBEdit
        Left = 8
        Top = 32
        Width = 400
        Height = 25
        DataField = 'NOME'
        DataSource = dsPessoaCad
        TabOrder = 1
      end
      object edtAPELIDO: TDBEdit
        Left = 414
        Top = 32
        Width = 250
        Height = 25
        DataField = 'APELIDO'
        DataSource = dsPessoaCad
        TabOrder = 2
      end
      object edtID_CIDADE: TDBEdit
        Left = 8
        Top = 86
        Width = 50
        Height = 25
        DataField = 'ID_CIDADE'
        DataSource = dsPessoaCad
        TabOrder = 3
      end
      object btnPesquisarCidade: TButton
        Left = 64
        Top = 86
        Width = 40
        Height = 25
        Caption = 'btnPesquisarCidade'
        TabOrder = 4
      end
      object mmoOBS: TDBMemo
        Left = 8
        Top = 140
        Width = 656
        Height = 77
        DataField = 'OBS'
        DataSource = dsPessoaCad
        TabOrder = 5
      end
      object pnlBtnsDados: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 387
        Width = 668
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 6
        DesignSize = (
          668
          41)
        object btnListar: TButton
          Left = 425
          Top = 5
          Width = 75
          Height = 30
          Action = ac_listar
          Anchors = [akRight, akBottom]
          TabOrder = 0
        end
        object btnGravar: TButton
          Left = 506
          Top = 5
          Width = 75
          Height = 30
          Action = DatasetPost1
          Anchors = [akRight, akBottom]
          TabOrder = 1
        end
        object btnCancelar: TButton
          Left = 587
          Top = 5
          Width = 75
          Height = 30
          Action = DatasetCancel1
          Anchors = [akRight, akBottom]
          TabOrder = 2
        end
      end
      object btnNovoContato: TButton
        Left = 595
        Top = 246
        Width = 69
        Height = 30
        Action = ac_novoContato
        Anchors = [akRight, akBottom]
        TabOrder = 7
      end
      object btnAlterarContato: TButton
        Left = 595
        Top = 282
        Width = 69
        Height = 30
        Action = ac_alterarContato
        Anchors = [akRight, akBottom]
        TabOrder = 8
      end
      object btnExcluirContato: TButton
        Left = 595
        Top = 318
        Width = 69
        Height = 30
        Action = ac_excluirContato
        Anchors = [akRight, akBottom]
        TabOrder = 9
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 431
    Width = 674
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 1
    OnClick = pnlRodapeClick
    DesignSize = (
      674
      41)
    object btnFechar: TButton
      Left = 590
      Top = 6
      Width = 75
      Height = 30
      Action = ac_fechar
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
  end
  object dsPessoaPesq: TDataSource
    DataSet = DmDados.fdqPessoaPesq
    Left = 80
    Top = 127
  end
  object dsPessoaCad: TDataSource
    DataSet = DmDados.fdqPessoaCad
    Left = 160
    Top = 127
  end
  object dsPessoaContato: TDataSource
    DataSet = DmDados.fdqPessoaContatoCad
    Left = 256
    Top = 128
  end
  object acLstAcoes: TActionList
    Left = 352
    Top = 128
    object ac_pesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = ac_pesquisarExecute
    end
    object ac_fechar: TAction
      Caption = 'Fechar'
      OnExecute = ac_fecharExecute
    end
    object ac_novo: TAction
      Caption = 'ac_novo'
      OnExecute = ac_novoExecute
    end
    object ac_detalhar: TAction
      Caption = 'ac_detalhar'
      OnExecute = ac_detalharExecute
    end
    object ac_excluir: TAction
      Caption = 'ac_excluir'
      OnExecute = ac_excluirExecute
    end
    object ac_listar: TAction
      Caption = 'ac_listar'
      OnExecute = ac_listarExecute
    end
    object DatasetPost1: TDataSetPost
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsPessoaCad
    end
    object DatasetCancel1: TDataSetCancel
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      OnExecute = DatasetCancel1Execute
      DataSource = dsPessoaCad
    end
    object ac_novoContato: TAction
      Caption = 'Novo'
    end
    object ac_alterarContato: TAction
      Caption = 'Alterar'
    end
    object ac_excluirContato: TAction
      Caption = 'Excluir'
    end
  end
end
