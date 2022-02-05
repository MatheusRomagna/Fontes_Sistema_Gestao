unit UFormAplicaMargem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormAplicaMargem = class(TForm)
    Label1: TLabel;
    EditMargem: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditMargemKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAplicaMargem: TFormAplicaMargem;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormConcFipeModelo,
  UFormExcelCompras, UFormHistFIPE, UFormLoading, UFormNovoProcessamento,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal;

procedure TFormAplicaMargem.EditMargemKeyPress(Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin
   close;
 End;

end;

procedure TFormAplicaMargem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 if EditMargem.Text = '' then
 Begin
   EditMargem.Text := '0,00';
 End;

end;

procedure TFormAplicaMargem.FormShow(Sender: TObject);
begin

 EditMargem.SelText;

end;

end.
