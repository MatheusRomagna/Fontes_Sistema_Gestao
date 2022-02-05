unit UFormAnaliseComprasTabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, UniProvider,
  MySQLUniProvider;

type
  TFormAnaliseComprasTabela = class(TForm)
    TbPlanCompras: TUniTable;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    TbPlanComprasID: TIntegerField;
    TbPlanComprasMODELO: TStringField;
    TbPlanComprasKM: TFloatField;
    TbPlanComprasANO: TStringField;
    TbPlanComprasANO_MOD: TStringField;
    TbPlanComprasCOR: TStringField;
    TbPlanComprasVLR_MIN: TFloatField;
    TbPlanComprasVLR_MIN_FIPE: TFloatField;
    TbPlanComprasVLR_MIN_DOIS: TFloatField;
    TbPlanComprasCOMPRA_JA: TFloatField;
    TbPlanComprasVLR_FIPE: TFloatField;
    TbPlanComprasVLR_MERC_UM: TFloatField;
    TbPlanComprasVLR_MERC_DOIS: TFloatField;
    TbPlanComprasVENDA_TRINTA_DIAS: TFloatField;
    TbPlanComprasESTOQUE: TFloatField;
    TbPlanComprasVLR_ULT_VENDA: TFloatField;
    TbPlanComprasDT_ULT_VENDA: TDateField;
    TbPlanComprasATACADO_VAREJO: TStringField;
    TbPlanComprasATAC_VAREJ: TStringField;
    TbPlanComprasCATEGORIA: TStringField;
    TbPlanComprasG_ZERO: TFloatField;
    TbPlanComprasMG: TFloatField;
    TbPlanComprasAVARIA: TFloatField;
    TbPlanComprasRESULTADO: TFloatField;
    TbPlanComprasMIN_RESULTADO: TFloatField;
    TbPlanComprasLANCE: TFloatField;
    TbPlanComprasLANCE_FIPE: TFloatField;
    TbPlanComprasCOMPRA: TFloatField;
    TbPlanComprasSN: TStringField;
    TbPlanComprasDT_PGTO: TDateField;
    TbPlanComprasQTD: TIntegerField;
    TbPlanComprasFORNECEDOR: TStringField;
    TbPlanComprasID_PLAN_FOR: TIntegerField;
    TbPlanComprasPLACA: TStringField;
    TbPlanComprasLICITACAO: TStringField;
    TbPlanComprasLOTE: TStringField;
    TbPlanComprasCOD_FIPE: TStringField;
    EditModelo: TEdit;
    EditFornecedor: TEdit;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnaliseComprasTabela: TFormAnaliseComprasTabela;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE, UFormLoading,
  UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero;

procedure TFormAnaliseComprasTabela.Button1Click(Sender: TObject);
begin

 TbPlanCompras.Refresh;

end;

procedure TFormAnaliseComprasTabela.Button2Click(Sender: TObject);
begin
 TbPlanCompras.Filtered := false;
 TbPlanCompras.Filter := 'FORNECEDOR = ' + QuotedStr('%'+ UpperCase(EditFornecedor.Text) +'%');
 TbPlanCompras.Filtered := true;
end;

procedure TFormAnaliseComprasTabela.Button3Click(Sender: TObject);
begin

 DBGrid1.DataSource.DataSet.Filtered := false;

  if EditFornecedor.Text <> '' then
   DBGrid1.DataSource.DataSet.Filter := 'FORNECEDOR = '+QuotedStr(EditFornecedor.Text);
  if EditModelo.Text <> '' then
   DBGrid1.DataSource.DataSet.Filter := 'MODELO like ' + QuotedStr('%'+ UpperCase(EditModelo.Text) +'%');

 DBGrid1.DataSource.DataSet.Filtered := true;

end;

procedure TFormAnaliseComprasTabela.DBGrid1TitleClick(Column: TColumn);
begin

 TbPlanCompras.IndexFieldNames := DBGrid1.Columns.Grid.SelectedField.FieldName;

end;

procedure TFormAnaliseComprasTabela.FormShow(Sender: TObject);
begin

 TbPlanCompras.Refresh;

end;

end.
