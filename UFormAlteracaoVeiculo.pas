unit UFormAlteracaoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  MemDS, DBAccess, Uni, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormAlteracaoVeiculo = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditAnoModelo: TEdit;
    EditModelo: TEdit;
    Panel2: TPanel;
    qBuscaFipe: TUniQuery;
    QAltera: TUniQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure EditModeloKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteracaoVeiculo: TFormAlteracaoVeiculo;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtendimentos;

procedure TFormAlteracaoVeiculo.btnAlterarClick(Sender: TObject);
begin

  if DBGrid1.DataSource.DataSet.RecordCount > 0 then
  Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set ano_modelo=:ano, fipe=:vlr, cod_fipe=:cod, modelo=:modelo where id = :id');
   QAltera.ParamByName('ano').Text       := EditAnoModelo.Text;
   QAltera.ParamByName('vlr').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('FIPE').AsCurrency;
   QAltera.ParamByName('cod').Text       := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
   QAltera.ParamByName('modelo').Text    := DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text;
   QAltera.ParamByName('id').AsInteger   := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditAnoModelo.Text := '';
   EditModelo.Text    := '';

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );

   Close;
  End;

end;

procedure TFormAlteracaoVeiculo.Button1Click(Sender: TObject);
begin

  if DBGrid1.DataSource.DataSet.RecordCount > 0 then
  Begin
   QAltera.SQL.Clear;
   QAltera.SQL.Add('update tbcompras_atendimento set ano_modelo=:ano, fipe=:vlr, cod_fipe=:cod, modelo=:modelo where id = :id');
   QAltera.ParamByName('ano').Text       := EditAnoModelo.Text;
   QAltera.ParamByName('vlr').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('FIPE').AsCurrency;
   QAltera.ParamByName('cod').Text       := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
   QAltera.ParamByName('modelo').Text    := DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text;
   QAltera.ParamByName('id').AsInteger   := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
   QAltera.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   EditAnoModelo.Text := '';
   EditModelo.Text    := '';
   qBuscaFipe.Close;

   MessageDlg('Alteração bem sucedida', mtInformation, [mbok] , 0 );

   Close;
  End;
end;

procedure TFormAlteracaoVeiculo.EditModeloKeyPress(Sender: TObject;
  var Key: Char);
var
 QBuscaRefFipe : TUniQuery;
begin

  if key = #13 then
  Begin

   QBuscaRefFipe := TUniQuery.Create(Self);

   QBuscaRefFipe.Connection := DataModuleConexao.UniConnection1;

   QBuscaRefFipe.SQL.Clear;
   QBuscaRefFipe.SQL.Add('select principal from tbfiperef');
   QBuscaRefFipe.Open;

    if EditModelo.Text <> '' then
    Begin

       qBuscaFipe.SQL.Clear;
       qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditAnoModelo.Text+'" as FIPE');
       qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModelo.Text)+'%')+' and');
       qBuscaFipe.SQL.Add(' "'+'ANO'+EditAnoModelo.Text+'" > 0 and REF=:Ref order by marca, modelo');
       qBuscaFipe.ParamByName('Ref').Text := QBuscaRefFipe.FieldByName('principal').Text;
       qBuscaFipe.Open;

       DBGrid1.Columns[0].Width := 100;
       DBGrid1.Columns[1].Width := 350;
       DBGrid1.Columns[2].Width := 150;

       TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';

    End;
   End;

end;

end.
