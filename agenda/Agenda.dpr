program Agenda;

uses
  Vcl.Forms,
  uFrmPrincipal in 'src\uFrmPrincipal.pas' {FrmPrincipal},
  uDmDados in 'src\uDmDados.pas' {DmDados: TDataModule},
  uConsts in 'src\uConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
