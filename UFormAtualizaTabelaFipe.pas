unit UFormAtualizaTabelaFipe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls;

type
  TFormAtualizaTabelaFipe = class(TForm)
    StringGridFIPE: TStringGrid;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAtualizaTabelaFipe: TFormAtualizaTabelaFipe;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormPrincipal;

end.
