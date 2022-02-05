unit UFormAlteraPlaca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormAlteraPlaca = class(TForm)
    EditPlacaCliente: TEdit;
    Label1: TLabel;
    btnAlterar: TBitBtn;
    QAltera: TUniQuery;
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteraPlaca: TFormAlteraPlaca;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtendimentos;

procedure TFormAlteraPlaca.btnAlterarClick(Sender: TObject);
begin

 if EditPlacaCliente.Text <> '' then
 Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set placa=:placa where id = :id');
   QAltera.ParamByName('placa').Text := EditPlacaCliente.Text;
   QAltera.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditPlacaCliente.Text := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );

   Close;
 End;

end;

end.
