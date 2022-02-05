unit UFormProcPlanAcelero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids;

type
  TFormProcPlanAcelero = class(TForm)
    StringGridAcelero: TStringGrid;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProcPlanAcelero: TFormProcPlanAcelero;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormLoading,
  UFormNovoProcessamento, UFormPrincipal;

end.
