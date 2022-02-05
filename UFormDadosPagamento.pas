unit UFormDadosPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFormDadosPagamento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnGravaPgto: TButton;
    ComboBoxTipo: TComboBox;
    EditNome: TEdit;
    EditCPF: TEdit;
    EditAgencia: TEdit;
    EditConta: TEdit;
    ComboBanco: TComboBox;
    qBuscaDadosPgto: TUniQuery;
    Panel1: TPanel;
    Image1: TImage;
    Label8: TLabel;
    qGravaDadosPgto: TUniQuery;
    Label9: TLabel;
    EditChavePix: TEdit;
    LblOrdemPgto: TLabel;
    OpenDialog1: TOpenDialog;
    qInsereAnexo: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure btnGravaPgtoClick(Sender: TObject);
    procedure btnConcluiPagamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDadosPagamento: TFormDadosPagamento;

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
  UFormCruzamentoFipes, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovaAvaliacao, UformNovaObs, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormDataPagamento;

procedure TFormDadosPagamento.btnConcluiPagamentoClick(Sender: TObject);
begin

 FormDataPagamento.Position := poScreenCenter;
 FormDataPagamento.ShowModal;

 if FormDataPagamento.btnConcluirPgto.Tag = 1 then
 Begin
  FormDadosPagamento.Close;
 End;


end;

procedure TFormDadosPagamento.btnGravaPgtoClick(Sender: TObject);
begin

 if ComboBoxTipo.Text = 'Pix' then
 Begin
   if EditCPF.Text <> '' then
   Begin
     if EditChavePix.Text <> '' then
     Begin
       if StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase])) > 0 then
       Begin
         if qBuscaDadosPgto.RecordCount > 0 then
         Begin
           qGravaDadosPgto.SQL.Clear;
           qGravaDadosPgto.SQL.Add('update tbcompras_pagamento_detalhe set tipo=:tipo,');
           qGravaDadosPgto.SQL.Add('valor_pagar=:vlr, valor_desconto=:vlr_desconto, valor_avaliacao=:vlr_avaliado,');
           qGravaDadosPgto.SQL.Add('nome=:nome, cpf=:cpf, banco=:banco, agencia=:agencia, conta=:conta,');
           qGravaDadosPgto.SQL.Add('usuario=:usuario, concluido=0, chave_pix=:chave_pix, data=:dt where id_atendimento=:id');
           qGravaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qGravaDadosPgto.ParamByName('tipo').Text := ComboBoxTipo.Text;
           qGravaDadosPgto.ParamByName('vlr').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_desconto').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_avaliado').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditVlrAvaliacaoPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('nome').Text := EditNome.Text;
           qGravaDadosPgto.ParamByName('cpf').Text := EditCPF.Text;
           qGravaDadosPgto.ParamByName('banco').Text := ComboBanco.Text;
           qGravaDadosPgto.ParamByName('agencia').Text := EditAgencia.Text;
           qGravaDadosPgto.ParamByName('conta').Text := EditConta.Text;
           qGravaDadosPgto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
           qGravaDadosPgto.ParamByName('chave_pix').Text := EditChavePix.Text;
           qGravaDadosPgto.ParamByName('dt').AsDate := NOW;
           qGravaDadosPgto.Execute;

           qBuscaDadosPgto.SQL.Clear;
           qBuscaDadosPgto.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
           qBuscaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qBuscaDadosPgto.Open;

           LblOrdemPgto.Caption := 'Ordem de pagamento nº: '+IntToStr(qBuscaDadosPgto.FieldByName('id').AsInteger);

           MessageDlg('Pagamento criado com sucesso!', mtInformation, [mbok], 0);

           Close;
         End
         Else
         Begin
           qGravaDadosPgto.SQL.Clear;
           qGravaDadosPgto.SQL.Add('insert into tbcompras_pagamento_detalhe(placa, tipo, valor_pagar, valor_desconto,');
           qGravaDadosPgto.SQL.Add('valor_avaliacao, nome, cpf, banco, agencia, conta, usuario, chave_pix, id_atendimento, concluido, data, valor_pago)');
           qGravaDadosPgto.SQL.Add('values (:placa, :tipo, :vlr, :vlr_desconto, :vlr_avaliado, :nome, :cpf, :banco,');
           qGravaDadosPgto.SQL.Add(':agencia, :conta, :usuario, :chave_pix, :id, 0, :dt, 0)');
           qGravaDadosPgto.ParamByName('placa').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
           qGravaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qGravaDadosPgto.ParamByName('tipo').Text := ComboBoxTipo.Text;
           qGravaDadosPgto.ParamByName('vlr').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_desconto').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_avaliado').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditVlrAvaliacaoPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('nome').Text := EditNome.Text;
           qGravaDadosPgto.ParamByName('cpf').Text := EditCPF.Text;
           qGravaDadosPgto.ParamByName('banco').Text := ComboBanco.Text;
           qGravaDadosPgto.ParamByName('agencia').Text := EditAgencia.Text;
           qGravaDadosPgto.ParamByName('conta').Text := EditConta.Text;
           qGravaDadosPgto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
           qGravaDadosPgto.ParamByName('chave_pix').Text := EditChavePix.Text;
           qGravaDadosPgto.ParamByName('dt').AsDate := NOW;
           qGravaDadosPgto.ExecSQL;

           qBuscaDadosPgto.SQL.Clear;
           qBuscaDadosPgto.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
           qBuscaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qBuscaDadosPgto.Open;

           LblOrdemPgto.Caption := 'Ordem de pagamento nº: '+IntToStr(qBuscaDadosPgto.FieldByName('id').AsInteger);

           MessageDlg('Pagamento criado com sucesso!', mtInformation, [mbok], 0);

           Close;
         End;
       End
       Else MessageDlg('Valor inválido', mtError, [mbok] , 0);
     End
     Else MessageDlg('Chave Pix inválida', mtError, [mbok] , 0);
   End
   Else MessageDlg('CPF inválido', mtError, [mbok] , 0);
 End;


 if ComboBoxTipo.Text = 'Transferência' then
 Begin
   if EditCPF.Text <> '' then
   Begin
     if EditConta.Text <> '' then
     Begin
       if StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase])) > 0 then
       Begin
         if qBuscaDadosPgto.RecordCount > 0 then
         Begin
           qGravaDadosPgto.SQL.Clear;
           qGravaDadosPgto.SQL.Add('update tbcompras_pagamento_detalhe set tipo=:tipo,');
           qGravaDadosPgto.SQL.Add('valor_pagar=:vlr, valor_desconto=:vlr_desconto, valor_avaliacao=:vlr_avaliado,');
           qGravaDadosPgto.SQL.Add('nome=:nome, cpf=:cpf, banco=:banco, agencia=:agencia, conta=:conta,');
           qGravaDadosPgto.SQL.Add('usuario=:usuario, concluido=0, chave_pix=:chave_pix, data=:dt where id_atendimento=:id');
           qGravaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qGravaDadosPgto.ParamByName('tipo').Text := ComboBoxTipo.Text;
           qGravaDadosPgto.ParamByName('vlr').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_desconto').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_avaliado').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('nome').Text := EditNome.Text;
           qGravaDadosPgto.ParamByName('cpf').Text := EditCPF.Text;
           qGravaDadosPgto.ParamByName('banco').Text := ComboBanco.Text;
           qGravaDadosPgto.ParamByName('agencia').Text := EditAgencia.Text;
           qGravaDadosPgto.ParamByName('conta').Text := EditConta.Text;
           qGravaDadosPgto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
           qGravaDadosPgto.ParamByName('chave_pix').Text := EditChavePix.Text;
           qGravaDadosPgto.ParamByName('dt').AsDate := NOW;
           qGravaDadosPgto.Execute;

           qBuscaDadosPgto.SQL.Clear;
           qBuscaDadosPgto.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
           qBuscaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qBuscaDadosPgto.Open;

           LblOrdemPgto.Caption := 'Ordem de pagamento nº: '+IntToStr(qBuscaDadosPgto.FieldByName('id').AsInteger);

           MessageDlg('Pagamento criado com sucesso!', mtInformation, [mbok], 0);
         End
         Else
         Begin
           qGravaDadosPgto.SQL.Clear;
           qGravaDadosPgto.SQL.Add('insert into tbcompras_pagamento_detalhe(placa, tipo, valor_pagar, valor_desconto,');
           qGravaDadosPgto.SQL.Add('valor_avaliacao, nome, cpf, banco, agencia, conta, usuario, chave_pix, id_atendimento, data)');
           qGravaDadosPgto.SQL.Add('values (:placa, :tipo, :vlr, :vlr_desconto, :vlr_avaliado, :nome, :cpf, :banco,');
           qGravaDadosPgto.SQL.Add(':agencia, :conta, :usuario, :chave_pix, :id, :dt)');
           qGravaDadosPgto.ParamByName('placa').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
           qGravaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qGravaDadosPgto.ParamByName('tipo').Text := ComboBoxTipo.Text;
           qGravaDadosPgto.ParamByName('vlr').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_desconto').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('vlr_avaliado').AsCurrency := StrToCurr(StringReplace(StringReplace(FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
           qGravaDadosPgto.ParamByName('nome').Text := EditNome.Text;
           qGravaDadosPgto.ParamByName('cpf').Text := EditCPF.Text;
           qGravaDadosPgto.ParamByName('banco').Text := ComboBanco.Text;
           qGravaDadosPgto.ParamByName('agencia').Text := EditAgencia.Text;
           qGravaDadosPgto.ParamByName('conta').Text := EditConta.Text;
           qGravaDadosPgto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
           qGravaDadosPgto.ParamByName('chave_pix').Text := EditChavePix.Text;
           qGravaDadosPgto.ParamByName('dt').AsDate := NOW;
           qGravaDadosPgto.ExecSQL;

           qBuscaDadosPgto.SQL.Clear;
           qBuscaDadosPgto.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
           qBuscaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
           qBuscaDadosPgto.Open;

           LblOrdemPgto.Caption := 'Ordem de pagamento nº: '+IntToStr(qBuscaDadosPgto.FieldByName('id').AsInteger);

           MessageDlg('Pagamento criado com sucesso!', mtInformation, [mbok], 0);
         End;
       End
       Else MessageDlg('Valor inválido', mtError, [mbok] , 0);
     End
     Else MessageDlg('Conta inválida', mtError, [mbok] , 0);
   End
   Else MessageDlg('CPF inválido', mtError, [mbok] , 0);
 End;

 if ComboBoxTipo.Text = '' then
 Begin
  MessageDlg('Tipo de transação inválida', mtError, [mbok] , 0);
  Abort;
 End;

end;

procedure TFormDadosPagamento.FormShow(Sender: TObject);
begin

 qBuscaDadosPgto.SQL.Clear;
 qBuscaDadosPgto.SQL.Add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
 qBuscaDadosPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
 qBuscaDadosPgto.Open;

 if qBuscaDadosPgto.RecordCount > 0 then
 Begin
   EditNome.Text := qBuscaDadosPgto.FieldByName('nome').Text;
   EditCPF.Text  := qBuscaDadosPgto.FieldByName('cpf').Text;
   EditAgencia.Text := qBuscaDadosPgto.FieldByName('agencia').Text;
   EditConta.Text := qBuscaDadosPgto.FieldByName('conta').Text;
   ComboBoxTipo.Text := qBuscaDadosPgto.FieldByName('tipo').Text;
   ComboBanco.Text   := qBuscaDadosPgto.FieldByName('banco').Text;
   EditChavePix.Text := qBuscaDadosPgto.FieldByName('chave_pix').Text;
   //FormDetalhesAtendimento.EditLiqPgto.Text  := CurrToStr(qBuscaDadosPgto.FieldByName('valor_pagar').AsCurrency);

   LblOrdemPgto.Caption := 'Ordem de pagamento nº: '+IntToStr(qBuscaDadosPgto.FieldByName('id').AsInteger);

 End
 Else
 Begin

   LblOrdemPgto.Caption := 'Ordem de pagamento nº:';

   EditNome.Text := '';
   EditCPF.Text  := '';
   EditAgencia.Text := '';
   EditConta.Text := '';
   ComboBoxTipo.Text := '';
   ComboBanco.Text   := '';
   EditChavePix.Text := '';
   ///FormDetalhesAtendimento.EditLiqPgto.Text := '0,00';
 End;

end;

end.
