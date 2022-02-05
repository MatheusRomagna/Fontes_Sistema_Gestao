unit UFormConsutaPlacaAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormConsultaPlacaAvaliacao = class(TForm)
    Label1: TLabel;
    EditConsultaPlacaAval: TEdit;
    procedure EditConsultaPlacaAvalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaPlacaAvaliacao: TFormConsultaPlacaAvaliacao;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLotesArval, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UDataModuleBancoVistoria, UFormAvaliarAvaliacao,
  UFormDetalhesAvaliacao, UFormLoginSavauto, UFormPermissoesCarga, UnitLogin;

procedure TFormConsultaPlacaAvaliacao.EditConsultaPlacaAvalKeyPress(
  Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin
  DataModuleBancoVistoria.qBuscaAvaliacoes.Filtered := false;

  DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Clear;
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('Select id, data_avaliacao, placa, ano, modelo, nome_cliente,');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('telefone, tipo, portas, km, cor, opcionais, total_avarias,');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('avaliacao, vlr_fipe, cod_fipe, usuario, obs  From tbavaliacoes');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('where placa=:placa');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('order by data_avaliacao  desc');
  DataModuleBancoVistoria.qBuscaAvaliacoes.ParamByName('placa').Text := EditConsultaPlacaAval.Text;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Open;

  if DataModuleBancoVistoria.qBuscaAvaliacoes.RecordCount > 0 then
  Begin
   Close;
  End
  Else
  Begin
     if MessageDlg('A pesquisa não encontrou nenhum veículo.' +#13+
                   'Deseja carregar todas as placas?', mtInformation, [mbno, mbyes], 0  ) = mrYes
                   Then
                   Begin
                      DataModuleBancoVistoria.qBuscaAvaliacoes.Filtered := false;

                      DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
                      DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Clear;
                      DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('Select id, data_avaliacao, placa, ano, modelo, nome_cliente,');
                      DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('telefone, tipo, portas, km, cor, opcionais, total_avarias,');
                      DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('avaliacao, vlr_fipe, cod_fipe, usuario, obs  From tbavaliacoes');
                      DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('order by data_avaliacao  desc');
                      DataModuleBancoVistoria.qBuscaAvaliacoes.Open;

                      Close;
                   End;
  End;

 End;

end;

procedure TFormConsultaPlacaAvaliacao.FormShow(Sender: TObject);
begin

 EditConsultaPlacaAval.SelectAll;

end;

end.
