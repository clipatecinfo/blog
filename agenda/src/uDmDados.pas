unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TipoMSG = (tmErro, tmAlerta, tmInformacao, tmConfirmacao);

  TFDQuery = class(FireDAC.Comp.Client.TFDQuery)
  private
    FSQLPadrao: string;
  public
    property SQLPadrao: string read FSQLPadrao write FSQLPadrao;
  end;

  TDmDados = class(TDataModule)
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    fdConexao: TFDConnection;
    fdqCidadePesq: TFDQuery;
    fdqPessoaPesq: TFDQuery;
    fdqCidadePesqID: TIntegerField;
    fdqCidadePesqUF: TStringField;
    fdqCidadePesqDESCRICAO: TStringField;
    fdqPessoaCad: TFDQuery;
    fdqPessoaCadID: TIntegerField;
    fdqPessoaCadID_CIDADE: TIntegerField;
    fdqPessoaCadNOME: TStringField;
    fdqPessoaCadAPELIDO: TStringField;
    fdqPessoaCadOBS: TMemoField;
    fdqPessoaCadCIDADE: TStringField;
    fdqPessoaContatoCad: TFDQuery;
    fdqPessoaContatoCadID: TIntegerField;
    fdqPessoaContatoCadID_PESSOA: TIntegerField;
    fdqPessoaContatoCadDESCRICAO: TStringField;
    fdqPessoaContatoCadCONTATO: TStringField;
    dsPessoa: TDataSource;
    fdqPessoaPesqID: TIntegerField;
    fdqPessoaPesqNOME: TStringField;
    fdqPessoaPesqCIDADE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqPessoaPesqAfterOpen(DataSet: TDataSet);
    procedure fdqPessoaPesqAfterClose(DataSet: TDataSet);
  private

  public
    function ExibirMensagem(const AMsg: string; ATipo: TipoMSG = tmInformacao): Integer;
    function PossuiRegistro(AFDQuery: TFDQuery): Boolean;
    procedure Pesquisar(const ANome: string);
    procedure Novo;
    function Detalhar(const AID: Integer; out AMsg: string): Boolean;
    procedure Excluir(const AID: Integer);
  end;

var
  DmDados: TDmDados;

implementation

uses
  Vcl.Dialogs, System.UITypes, uConsts;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmDados }

procedure TDmDados.DataModuleCreate(Sender: TObject);
begin
  fdqPessoaPesq.SQLPadrao := fdqPessoaPesq.SQL.Text;
end;

function TDmDados.Detalhar(const AID: Integer; out AMsg: string): Boolean;
begin
  try
    fdqPessoaCad.Close;
    fdqPessoaCad.ParamByName('ID').AsInteger := AID;
    fdqPessoaCad.Open();
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      AMsg := E.Message;
    end;
  end;
end;

procedure TDmDados.Excluir(const AID: Integer);
var
  sMsg: string;
begin
  if ExibirMensagem('Deseja realmente excluir o contato?', tmConfirmacao) = mrYes then
  begin
    if Detalhar(AID, sMsg) then
    begin
      try
        fdqPessoaCad.Delete;
      except
        on E: Exception do
          ExibirMensagem(Format(MSG_ERRO_DETALHE, ['excluir o contato', E.Message]), tmErro);
      end;
    end
    else
      ExibirMensagem(Format(MSG_ERRO_DETALHE, ['indentificar o contato', sMsg]), tmErro);
  end;
end;

function TDmDados.ExibirMensagem(const AMsg: string; ATipo: TipoMSG): Integer;

begin
  case ATipo of
    tmErro:
      Result := MessageDlg(AMsg, mtError, [mbOK], 0, mbOK);
    tmAlerta:
      Result := MessageDlg(AMsg, mtWarning, [mbOK], 0, mbOK);
    tmInformacao:
      Result := MessageDlg(AMsg, mtInformation, [mbOK], 0, mbOK);
    tmConfirmacao:
      Result := MessageDlg(AMsg, mtConfirmation, [mbYes, mbNo], 0, mbNo);
  else
    Result := MessageDlg(AMsg, mtCustom, [mbOK], 0, mbOK);
  end;
end;

procedure TDmDados.fdqPessoaPesqAfterClose(DataSet: TDataSet);
begin
  fdqPessoaContatoCad.Close;
end;

procedure TDmDados.fdqPessoaPesqAfterOpen(DataSet: TDataSet);
begin
  fdqPessoaContatoCad.Open();
end;

procedure TDmDados.Novo;
begin
  try
    fdqPessoaCad.Open();
    fdqPessoaCad.Append;
  except
    on E: Exception do
    begin
      ExibirMensagem(Format(MSG_ERRO_DETALHE, ['iniciar um novo cadastro', E.Message]), tmErro);
      Abort;
    end;
  end;
end;

procedure TDmDados.Pesquisar(const ANome: string);
begin
  try
    fdqPessoaPesq.Close;
    fdqPessoaPesq.SQL.Clear;
    fdqPessoaPesq.SQL.Add(fdqPessoaPesq.SQLPadrao);
    if not ANome.IsEmpty then
    begin
      fdqPessoaPesq.SQL.Add('where ((P.NOME || '' '' || P.APELIDO) like(''%'' || :NOME || ''%''))');
      fdqPessoaPesq.ParamByName('NOME').AsString := ANome;
    end;
    fdqPessoaPesq.Open();
  except
    on E: Exception do
      ExibirMensagem(Format(MSG_ERRO_DETALHE, ['realizar a consulta', E.Message]), tmErro);
  end;
end;

function TDmDados.PossuiRegistro(AFDQuery: TFDQuery): Boolean;
begin
  Result := ((AFDQuery.Active) and (AFDQuery.RecordCount > 0));
end;

end.
