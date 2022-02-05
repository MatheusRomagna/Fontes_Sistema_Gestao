unit UFormAtuHistFIPE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormAtualizaHistoricoFIPE = class(TForm)
    Panel1: TPanel;
    LblModeloBanco: TLabel;
    LblModeloFIPE: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    EditPesqDescFIPE: TEdit;
    DataSource1: TDataSource;
    QBuscaAutoFIPE: TUniQuery;
    Button1: TButton;
    QAtualizaFipe: TUniQuery;
    procedure EditPesqDescFIPEKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAtualizaHistoricoFIPE: TFormAtualizaHistoricoFIPE;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormConcFipeModelo,
  UFormExcelCompras, UFormHistFIPE, UFormLoading, UFormNovoProcessamento,
  UFormPrincipal, UFormProcPlanAcelero;

procedure TFormAtualizaHistoricoFIPE.Button1Click(Sender: TObject);
begin

 QAtualizaFipe.SQL.Clear;
 QAtualizaFipe.SQL.Add('update TBCONCFIPEMODELO set VLR_FIPE=:VLR, MODELO_FIPE=:MODELO, COD_FIPE=:FIPE where ');
 QAtualizaFipe.SQL.Add('MODELO=:MOD_OLD and COD_FIPE=:FIPE_OLD');
 QAtualizaFipe.ParamByName('VLR').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
 QAtualizaFipe.ParamByName('MODELO').Text    := DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text;
 QAtualizaFipe.ParamByName('FIPE').Text      := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
 QAtualizaFipe.ParamByName('MOD_OLD').Text   := LblModeloBanco.Caption;
 QAtualizaFipe.ParamByName('FIPE_OLD').Text  := FormHistFIPE.DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
 QAtualizaFipe.Execute;

 ShowMessage('FIPE atualizada');

 FormHistFIPE.EditDescBanco.Text := '';
 FormHistFIPE.EditDescModeloFIPE.Text := '';

 FormHistFIPE.EditPesqDesc.SetFocus();

 Close;

end;

procedure TFormAtualizaHistoricoFIPE.EditPesqDescFIPEKeyPress(Sender: TObject;
  var Key: Char);
  var
   query : TUniQuery;
begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 query.SQL.Clear;
 query.SQL.Add('select principal from tbfiperef');
 query.Open;

 if key = #13 then
 Begin

  QBuscaAutoFIPE.SQL.Clear;
  QBuscaAutoFIPE.SQL.Add('select UPPER(modelo) as MODELO, valor as FIPE,');
  QBuscaAutoFIPE.SQL.Add('cod_fipe from TBNEWFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditPesqDescFIPE.Text)+'%')+' and');
  QBuscaAutoFIPE.SQL.Add(' ano=:ano and ref=:ref order by marca, modelo');
  QBuscaAutoFIPE.ParamByName('ref').Text := query.FieldByName('principal').Text;
  QBuscaAutoFIPE.ParamByName('ano').text := FormConciliacaoFipeModelo.EditAnoFIPE.Text;
  QBuscaAutoFIPE.Open;

  DBGrid1.Columns[0].Width := 300;
  DBGrid1.Columns[1].Width := 300;

 End;

end;

procedure TFormAtualizaHistoricoFIPE.FormShow(Sender: TObject);
begin

 EditPesqDescFIPE.Text := FormConciliacaoFipeModelo.EditModeloFIPE.Text;

 EditPesqDescFIPE.SelectAll;

end;

end.
