unit UFormAlteraDadosCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFormAlteraDadosCliente = class(TForm)
    EditNomeCliente: TEdit;
    EditTelefone: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnAlterar: TBitBtn;
    QAltera: TUniQuery;
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteraDadosCliente: TFormAlteraDadosCliente;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtendimentos;

procedure TFormAlteraDadosCliente.btnAlterarClick(Sender: TObject);
begin


 if EditNomeCliente.Text <> '' then
 Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set nome=:nome where id = :id');
   QAltera.ParamByName('nome').Text := EditNomeCliente.Text;
   QAltera.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditNomeCliente.Text := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );
 End;

 if EditTelefone.Text <> '(  )      -    ' then
 Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set telefone=:tel where id = :id');
   QAltera.ParamByName('tel').Text := EditTelefone.Text;
   QAltera.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditTelefone.Text := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );
 End;

 Close;

end;

end.
