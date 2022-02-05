unit UFormHistFIPE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, MemDS, DBAccess, Uni, Vcl.StdCtrls;

type
  TFormHistFIPE = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    QBuscaFIPES: TUniQuery;
    EditDescBanco: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditDescModeloFIPE: TEdit;
    Label3: TLabel;
    EditVLRfipe: TEdit;
    BtnAtualizar: TButton;
    Panel2: TPanel;
    Label4: TLabel;
    EditPesqDesc: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EditPesqDescKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistFIPE: TFormHistFIPE;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormConcFipeModelo,
  UFormExcelCompras, UFormLoading, UFormNovoProcessamento, UFormPrincipal,
  UFormProcPlanAcelero, UFormAtuHistFIPE, UFormProcPlanFinal;

procedure TFormHistFIPE.DBGrid1DblClick(Sender: TObject);
begin

  EditDescModeloFIPE.Text := DBGrid1.DataSource.DataSet.FieldByName('MODELO_FIPE').Text;
  EditDescBanco.Text := DBGrid1.DataSource.DataSet.FieldByName('MODELO_PLANILHA').Text;
  EditVLRfipe.Text := CurrToStr(DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency);
  DBGrid1.Enabled := false;
  Panel1.Enabled := true;

  FormAtualizaHistoricoFIPE.Position := poScreenCenter;
  FormAtualizaHistoricoFIPE.LblModeloBanco.Caption := EditDescBanco.Text;
  FormAtualizaHistoricoFIPE.LblModeloFIPE.Caption := EditDescModeloFIPE.Text;
  FormAtualizaHistoricoFIPE.ShowModal;

  DBGrid1.Enabled := true;

end;

procedure TFormHistFIPE.EditPesqDescKeyPress(Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin

 QBuscaFIPES.SQL.Clear;
 QBuscaFIPES.SQL.Add('select ID, MODELO as "MODELO_PLANILHA", MODELO_FIPE, COD_FIPE,');
 QBuscaFIPES.SQL.Add('VLR_FIPE from TBCONCFIPEMODELO WHERE FORNECEDOR=:FOR');
 QBuscaFIPES.SQL.Add('and MODELO like '+QuotedStr('%'+EditPesqDesc.Text+'%')+'  order by ID desc');
 QBuscaFIPES.ParamByName('FOR').Text := FormConciliacaoFipeModelo.lblFornecedor.Caption;
 QBuscaFIPES.Open;

 DBGrid1.Columns[0].Width := 70;
 DBGrid1.Columns[1].Width := 400;
 DBGrid1.Columns[2].Width := 400;
 DBGrid1.Columns[3].Width := 80;
 DBGrid1.Columns[4].Width := 80;

 End;

end;

procedure TFormHistFIPE.FormShow(Sender: TObject);
begin

 QBuscaFIPES.SQL.Clear;
 QBuscaFIPES.SQL.Add('select ID, MODELO as "MODELO_PLANILHA", MODELO_FIPE, COD_FIPE,');
 QBuscaFIPES.SQL.Add('VLR_FIPE from TBCONCFIPEMODELO WHERE FORNECEDOR=:FOR');
 QBuscaFIPES.SQL.Add('and UPPER(modelo) like '+QuotedStr('%'+UpperCase(FormConciliacaoFipeModelo.EditModeloFIPE.Text)+'%'));
 QBuscaFIPES.SQL.Add('and ano = '+FormConciliacaoFipeModelo.EditAnoFIPE.Text);
 QBuscaFIPES.SQL.Add('order by ID desc');
 QBuscaFIPES.ParamByName('FOR').Text := FormConciliacaoFipeModelo.lblFornecedor.Caption;
 QBuscaFIPES.Open;

 DBGrid1.Columns[0].Width := 70;
 DBGrid1.Columns[1].Width := 400;
 DBGrid1.Columns[2].Width := 400;
 DBGrid1.Columns[3].Width := 80;
 DBGrid1.Columns[4].Width := 80;

 WindowState := wsMaximized;

end;

end.
