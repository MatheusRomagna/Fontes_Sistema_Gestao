unit UFormConcFipeModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.Buttons;

type
  TFormConciliacaoFipeModelo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lblModeloPlan: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    EditAnoFIPE: TEdit;
    EditModeloFIPE: TEdit;
    DSFIPE: TDataSource;
    QBuscaFIPE: TUniQuery;
    btnConfFIPE: TBitBtn;
    QConfirmaFIPE: TUniQuery;
    lblFornecedor: TLabel;
    btnFipeAnterior: TSpeedButton;
    Button1: TButton;
    QBuscaFIPEMODELO: TStringField;
    QBuscaFIPEvalor: TFloatField;
    QBuscaFIPEcod_fipe: TStringField;
    QBuscaFIPEref: TStringField;
    procedure EditAnoFIPEKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloFIPEKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfFIPEClick(Sender: TObject);
    procedure QBuscaFIPEAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnFipeAnteriorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    REF : String;
    { Public declarations }
  end;

var
  FormConciliacaoFipeModelo: TFormConciliacaoFipeModelo;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormLoading,
  UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero,
  UFormExcelCompras, UFormHistFIPE, UFormAtuHistFIPE;

procedure TFormConciliacaoFipeModelo.btnConfFIPEClick(Sender: TObject);
begin

 if QBuscaFIPE.Active = false then
 Begin
   ShowMessage('Pesquisa não iniciada');
   Abort;
 End;


 {ShowMessage('Planilha: '+lblModeloPlan.Caption+#13+
             'Selecionado FIPE:'+DBGrid1.DataSource.DataSet.FieldByName('modelo').Text); }

 QConfirmaFIPE.SQL.Clear;
 QConfirmaFIPE.SQL.Add('insert into TBCONCFIPEMODELO (cod_fipe, modelo, data, vlr_fipe, fornecedor, modelo_fipe, ano, REF_FIPE)');
 QConfirmaFIPE.sql.Add('values (:cod, :mod, :dt, :vlr, :for, :mod_fipe, :ano, :REF)');
 QConfirmaFIPE.ParamByName('cod').Text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
 QConfirmaFIPE.ParamByName('mod').Text := lblModeloPlan.Caption;
 QConfirmaFIPE.ParamByName('dt').AsDate := NOW;
 QConfirmaFIPE.ParamByName('vlr').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
 QConfirmaFIPE.ParamByName('for').Text := lblFornecedor.Caption;
 QConfirmaFIPE.ParamByName('mod_fipe').Text := DBGrid1.DataSource.DataSet.FieldByName('modelo').Text;
 QConfirmaFIPE.ParamByName('ano').Text := EditAnoFIPE.Text;
 QConfirmaFIPE.ParamByName('REF').Text := REF;
 QConfirmaFIPE.Execute;

 EditAnoFIPE.Text := '';
 EditModeloFIPE.Text := '';

 Close;

end;

procedure TFormConciliacaoFipeModelo.btnFipeAnteriorClick(Sender: TObject);
begin

 FormHistFIPE.Position := poScreenCenter;
 FormHistFIPE.ShowModal;

end;

procedure TFormConciliacaoFipeModelo.Button1Click(Sender: TObject);
begin
if EditModeloFIPE.Text <> '' then
   Begin

     DataModuleConexao.qBuscaRefFipe.SQL.Clear;
     DataModuleConexao.qBuscaRefFipe.SQL.Add('select principal from tbfiperef');
     DataModuleConexao.qBuscaRefFipe.Open;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select upper(modelo) as MODELO, valor, cod_fipe, ref  from tbnewfipe where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFIPE.Text)+'%')+' and');
     QBuscaFIPE.SQL.Add('ano=:ano AND ref=:ref order by marca, modelo');
     QBuscaFIPE.ParamByName('ano').Text := EditAnoFIPE.Text;
     QBuscaFIPE.ParamByName('ref').text := REF;
     QBuscaFIPE.Open;

     DBGrid1.Columns[0].Width := 400;
     DBGrid1.Columns[1].Width := 200;
     DBGrid1.Columns[2].Width := 200;

   End;
end;

procedure TFormConciliacaoFipeModelo.EditAnoFIPEKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   if EditModeloFIPE.Text <> '' then
   Begin

     DataModuleConexao.qBuscaRefFipe.SQL.Clear;
     DataModuleConexao.qBuscaRefFipe.SQL.Add('select principal from tbfiperef');
     DataModuleConexao.qBuscaRefFipe.Open;

     REF := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select upper(modelo) as MODELO, valor, cod_fipe, ref  from tbnewfipe where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFIPE.Text)+'%')+' and');
     QBuscaFIPE.SQL.Add('ano=:ano AND ref=:ref order by marca, modelo');
     QBuscaFIPE.ParamByName('ano').Text := EditAnoFIPE.Text;
     QBuscaFIPE.ParamByName('ref').text := REF;
     QBuscaFIPE.Open;


     DBGrid1.Columns[0].Width := 400;
     DBGrid1.Columns[1].Width := 200;
     DBGrid1.Columns[2].Width := 200;
   End;
 End;

end;

procedure TFormConciliacaoFipeModelo.EditModeloFIPEKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
 Begin
   if EditModeloFIPE.Text <> '' then
   Begin

     DataModuleConexao.qBuscaRefFipe.SQL.Clear;
     DataModuleConexao.qBuscaRefFipe.SQL.Add('select principal from tbfiperef');
     DataModuleConexao.qBuscaRefFipe.Open;

     REF := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select upper(modelo) as MODELO, valor, cod_fipe, ref  from tbnewfipe where');
     QBuscaFIPE.SQL.Add('UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFIPE.Text)+'%')+' and');
     QBuscaFIPE.SQL.Add('ano=:ano AND ref=:ref order by marca, modelo');
     QBuscaFIPE.ParamByName('ano').Text := EditAnoFIPE.Text;
     QBuscaFIPE.ParamByName('ref').text := REF;
     QBuscaFIPE.Open;

     QBuscaFIPE.Refresh;

     DBGrid1.Columns[0].Width := 400;
     DBGrid1.Columns[1].Width := 200;
     DBGrid1.Columns[2].Width := 200;

   End;
 End;
end;

procedure TFormConciliacaoFipeModelo.FormShow(Sender: TObject);
begin

 EditModeloFIPE.SetFocus();

 QBuscaFIPE.Active := false;

 //EditModeloFIPE.OnKeyPress();

end;

procedure TFormConciliacaoFipeModelo.QBuscaFIPEAfterOpen(DataSet: TDataSet);
begin
   TFloatField(QBuscaFIPE.FieldByName('valor')).DisplayFormat := 'R$ #,##0.00';
end;

end.
