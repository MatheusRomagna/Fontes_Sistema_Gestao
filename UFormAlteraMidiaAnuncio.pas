unit UFormAlteraMidiaAnuncio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormAlteraMidiaAnuncio = class(TForm)
    Label1: TLabel;
    ComboBoxNovaMidia: TComboBox;
    Label2: TLabel;
    EditNovoCodAnuncio: TEdit;
    btnAlterar: TBitBtn;
    QAltera: TUniQuery;
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteraMidiaAnuncio: TFormAlteraMidiaAnuncio;

implementation

{$R *.dfm}

uses UFormAtendimentos, UDataModuleConexao;

procedure TFormAlteraMidiaAnuncio.btnAlterarClick(Sender: TObject);
begin

 if ComboBoxNovaMidia.Text <> '' then
 Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set midia=:novamidia where id = :id');
   QAltera.ParamByName('novamidia').Text := ComboBoxNovaMidia.Text;
   QAltera.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   ComboBoxNovaMidia.Text := '';

   ComboBoxNovaMidia.ItemIndex := -1;

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );
 End;

 if EditNovoCodAnuncio.Text <> '' then
 Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set cod_anuncio=:cod where id = :id');
   QAltera.ParamByName('cod').Text := EditNovoCodAnuncio.Text;
   QAltera.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditNovoCodAnuncio.Text := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );
 End;

 Close;

end;

end.
