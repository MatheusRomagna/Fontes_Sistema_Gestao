unit UFormDataPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  MemDS, DBAccess, Uni;

type
  TFormDataPagamento = class(TForm)
    Label1: TLabel;
    DatePgto: TDateTimePicker;
    HoraPgto: TDateTimePicker;
    btnConcluirPgto: TButton;
    btnCancelar: TButton;
    qConcluiPgto: TUniQuery;
    qValida: TUniQuery;
    Label2: TLabel;
    EditVlrPgto: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConcluirPgtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDataPagamento: TFormDataPagamento;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovaAvaliacao, UformNovaObs, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormPagamentoVeiculo;

procedure TFormDataPagamento.btnCancelarClick(Sender: TObject);
begin

  btnConcluirPgto.Tag := 0;
  close;

end;

procedure TFormDataPagamento.btnConcluirPgtoClick(Sender: TObject);
begin


 if StrToCurr(EditVlrPgto.Text) <= FormPagamentoVeiculo.qPgtosvalor.AsCurrency then
 Begin


  if MessageDlg('Concluir o seguinte pagamento?' + #13 +
                'Valor: R$ ' + EditVlrPgto.Text + #13 +
                'Data: ' + DateToStr(DatePgto.Date) + #13 +
                'Hora: ' + TimeToStr(HoraPgto.Time) , mtInformation, [mbno, mbyes] , 0) = mrYes
                Then
                Begin

                  qConcluiPgto.SQL.Clear;
                  qConcluiPgto.SQL.Add('update tbcompras_pagamento_detalhe set');
                  qConcluiPgto.SQL.Add('data_pgto = :dt,');
                  qConcluiPgto.SQL.Add('concluido = 1 where id_atendimento=:id');
                  qConcluiPgto.ParamByName('dt').AsDateTime := DatePgto.Date + HoraPgto.Time;
                  qConcluiPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                  qConcluiPgto.Execute;

                  qConcluiPgto.SQL.Clear;
                  qConcluiPgto.SQL.Add('update tbcompras_pagamento set');
                  qConcluiPgto.SQL.Add('valor_pgto = :vlr,');
                  qConcluiPgto.SQL.Add('data_pgto=:dt,');
                  qConcluiPgto.SQL.Add('usuario_pgto=:usu where id_atendimento=:id');
                  qConcluiPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                  qConcluiPgto.ParamByName('vlr').AsCurrency := StrToCurr(EditVlrPgto.Text);
                  qConcluiPgto.ParamByName('dt').AsDateTime := DatePgto.Date + HoraPgto.Time;
                  qConcluiPgto.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
                  qConcluiPgto.Execute;

                  MessageDlg('Pagamento concluído com sucesso!', mtInformation, [mbok] , 0);

                  if MessageDlg('Deseja concluir o atendimento?', mtInformation, [mbno, mbyes] , 0) = mrYes then
                  Begin

                    FormAtendimentos.DBGridAtendimentosDblClick(Sender);

                  End;

                  FormPagamentoVeiculo.qPgtos.Refresh;

                  Close;

                End;
 End
end;

procedure TFormDataPagamento.FormShow(Sender: TObject);
Var
 ID : integer;
begin

 ID := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;

 qValida.SQL.Clear;
 qValida.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
 qValida.ParamByName('id').AsInteger := ID;
 qValida.Open;

 if qValida.RecordCount > 0 then
 Begin
   qValida.SQL.Clear;
   qValida.SQL.Add('select * from tbcompras_pagamento_anexo where id_atendimento=:id');
   qValida.ParamByName('id').AsInteger := ID;
   qValida.Open;

    if qValida.RecordCount > 0 then
    Begin
       // Processo de conclusao pgto
       btnConcluirPgto.Enabled := true;
       DatePgto.Enabled := true;
       HoraPgto.Enabled := true;
    End
    Else
    Begin
      if MessageDlg('Não foi encontrado anexo de comprovante, deseja assim mesmo concluir o pgto?', mtInformation, [mbno, mbyes] , 0) = mrYes then
      Begin
        // concluir pagaento sem anexo
       btnConcluirPgto.Enabled := true;
       DatePgto.Enabled := true;
       HoraPgto.Enabled := true;
      End
      Else
      Begin
       btnConcluirPgto.Enabled := false;
       DatePgto.Enabled := false;
       HoraPgto.Enabled := false;
       Abort;
      End;
    End;

 End
 Else
 Begin
   MessageDlg('Não há lançamento de previsão de pagamento', mtWarning, [mbok] , 0);
   btnConcluirPgto.Enabled := false;
   DatePgto.Enabled := false;
   HoraPgto.Enabled := false;
 End;

end;

end.
