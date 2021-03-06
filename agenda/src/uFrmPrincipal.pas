unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Data.DB, Vcl.Grids, Vcl.DBGrids, uDmDados, Vcl.Mask,
  Vcl.DBCtrls,
  System.Actions, Vcl.ActnList, Vcl.DBActns;

type
  TFrmPrincipal = class(TForm)
    crdPnlPrincipal: TCardPanel;
    pnlRodape: TPanel;
    btnFechar: TButton;
    crdListagem: TCard;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    dbGrdListagem: TDBGrid;
    crdDados: TCard;
    dbGrdContatos: TDBGrid;
    pnlBtnsListagem: TPanel;
    dsPessoaPesq: TDataSource;
    dsPessoaCad: TDataSource;
    lblNOME: TLabel;
    edtNOME: TDBEdit;
    lblAPELIDO: TLabel;
    edtAPELIDO: TDBEdit;
    lblID_CIDADE: TLabel;
    edtID_CIDADE: TDBEdit;
    btnPesquisarCidade: TButton;
    shpCIDADE: TShape;
    lblCIDADE: TDBText;
    lblOBS: TLabel;
    mmoOBS: TDBMemo;
    lblContatos: TLabel;
    dsPessoaContato: TDataSource;
    pnlBtnsDados: TPanel;
    btnListar: TButton;
    acLstAcoes: TActionList;
    ac_pesquisar: TAction;
    ac_fechar: TAction;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    ac_novo: TAction;
    ac_detalhar: TAction;
    ac_excluir: TAction;
    btnGravar: TButton;
    btnCancelar: TButton;
    ac_listar: TAction;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    btnNovoContato: TButton;
    btnAlterarContato: TButton;
    btnExcluirContato: TButton;
    ac_novoContato: TAction;
    ac_alterarContato: TAction;
    ac_excluirContato: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ac_pesquisarExecute(Sender: TObject);
    procedure ac_fecharExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ac_novoExecute(Sender: TObject);
    procedure ac_detalharExecute(Sender: TObject);
    procedure ac_excluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlRodapeClick(Sender: TObject);
    procedure dbGrdListagemDblClick(Sender: TObject);
    procedure DatasetCancel1Execute(Sender: TObject);
    procedure ac_listarExecute(Sender: TObject);
  private
    procedure CarregarConfiguracoes;
    procedure AtivarCard(pCard: TCard);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uConsts;

{$R *.dfm}


procedure TFrmPrincipal.ac_detalharExecute(Sender: TObject);
var
  sMsg: string;
begin
  if DmDados.PossuiRegistro(DmDados.fdqPessoaPesq) then
  begin
    if DmDados.Detalhar(DmDados.fdqPessoaPesqID.AsInteger, sMsg) then
      AtivarCard(crdDados)
    else
      DmDados.ExibirMensagem(Format(MSG_ERRO_DETALHE, ['detalhar o contato', sMsg]), tmErro);
  end;
end;

procedure TFrmPrincipal.ac_excluirExecute(Sender: TObject);
begin
  if DmDados.PossuiRegistro(DmDados.fdqPessoaPesq) then
    DmDados.Excluir(DmDados.fdqPessoaPesqID.AsInteger);
end;

procedure TFrmPrincipal.ac_fecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.ac_listarExecute(Sender: TObject);
begin
  if (DmDados.fdqPessoaCad.State in dsEditModes) or (DmDados.fdqPessoaContatoCad.State in dsEditModes) then
    DmDados.ExibirMensagem('Altera??es pendentes! Grave ou cancele antes de voltar para listagem!')
  else
    AtivarCard(crdListagem);
end;

procedure TFrmPrincipal.ac_novoExecute(Sender: TObject);
begin
  DmDados.Novo;
  AtivarCard(crdDados);
end;

procedure TFrmPrincipal.ac_pesquisarExecute(Sender: TObject);
begin
  DmDados.Pesquisar(edtPesquisar.Text);
end;

procedure TFrmPrincipal.AtivarCard(pCard: TCard);
begin
  crdPnlPrincipal.ActiveCard := pCard;
end;

procedure TFrmPrincipal.CarregarConfiguracoes;
begin
  AtivarCard(crdListagem);
end;

procedure TFrmPrincipal.DatasetCancel1Execute(Sender: TObject);
begin
  if DmDados.fdqPessoaCad.State in [dsInsert] then
    AtivarCard(crdListagem);
  DmDados.fdqPessoaCad.Cancel;
end;

procedure TFrmPrincipal.dbGrdListagemDblClick(Sender: TObject);
begin
  ac_detalhar.Execute;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (not(DmDados.fdqPessoaCad.State in dsEditModes) and not(DmDados.fdqPessoaPesq.State in dsEditModes));
  if not CanClose then
    DmDados.ExibirMensagem('Altera??es pendentes!' + sLineBreak + 'Grave ou cancele antes de fechar a tela.', tmAlerta);
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

procedure TFrmPrincipal.pnlRodapeClick(Sender: TObject);
begin
  DmDados.fdqPessoaContatoCad.Open();
end;

end.
