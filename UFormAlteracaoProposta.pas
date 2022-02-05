unit UFormAlteracaoProposta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormAlteracaoProposta = class(TForm)
    EditProposta: TEdit;
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
  FormAlteracaoProposta: TFormAlteracaoProposta;

implementation

{$R *.dfm}

uses UFormAtendimentos, UDataModuleConexao;

procedure TFormAlteracaoProposta.btnAlterarClick(Sender: TObject);
begin
  if StrToCurr(EditProposta.Text) > 0 then
  Begin

   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set proposta=:vlr where id = :id');
   QAltera.ParamByName('vlr').AsCurrency  := StrToCurr(EditProposta.Text);
   QAltera.ParamByName('id').AsInteger   := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditProposta.Text := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );

   Close;
  End;
end;

end.
