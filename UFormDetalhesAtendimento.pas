unit UFormDetalhesAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, MemDS, DBAccess, Uni, Vcl.WinXCalendars,
  Vcl.Grids, Vcl.DBGrids, DateUtils, Vcl.Buttons, dxGDIPlusClasses;

type
  TFormDetalhesAtendimento = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Tab_documentacao: TTabSheet;
    Tab_verific_cadastral: TTabSheet;
    tab_agenda_vistoria: TTabSheet;
    Tab_pagamento: TTabSheet;
    Panel2: TPanel;
    ProgressBar: TProgressBar;
    lblStatusChamado: TLabel;
    Tab_cancelado: TTabSheet;
    Memo1: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    EditStatusChamado: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ImageVoltarDoc: TImage;
    Image5: TImage;
    Image6: TImage;
    img_concluir_pgto: TImage;
    Image9: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Label2: TLabel;
    ComboTipoDocumentos: TComboBox;
    Label3: TLabel;
    ComboDutBranco: TComboBox;
    Label4: TLabel;
    ComboDutNomeClie: TComboBox;
    Label5: TLabel;
    ComboValidDescTransf: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    ComboProcuracao: TComboBox;
    Label8: TLabel;
    ComboValidDescIPVA: TComboBox;
    Label9: TLabel;
    ComboArFunc: TComboBox;
    Label10: TLabel;
    ComboMotorCond: TComboBox;
    Label11: TLabel;
    ComboAvarias: TComboBox;
    ComboRecibo: TComboBox;
    qAtualizaStatus: TUniQuery;
    qCarregaInformacoes: TUniQuery;
    qCarregaDados: TUniQuery;
    qValidaDados: TUniQuery;
    btnSalvaEdicaoDocumentos: TPanel;
    Label12: TLabel;
    ComboLeilao: TComboBox;
    Label13: TLabel;
    ComboDivProprietario: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    ComboJusTrabalho: TComboBox;
    Label16: TLabel;
    ComboConsultaEstadual: TComboBox;
    Label17: TLabel;
    ComboConsultaFederal: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    EditTotalMultas: TEdit;
    Image1: TImage;
    Label20: TLabel;
    EditTotalIPVASegLic: TEdit;
    Image2: TImage;
    Label21: TLabel;
    EditTotalQuitacao: TEdit;
    Image3: TImage;
    Label22: TLabel;
    EditTransferencia: TEdit;
    Label23: TLabel;
    EditSegDUT: TEdit;
    btnSalvaEdicaoVerificacao: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DSAgenda: TDataSource;
    qBuscaAgendamento: TUniQuery;
    qBuscaAgendamentoid: TIntegerField;
    qBuscaAgendamentoid_atendimento: TIntegerField;
    qBuscaAgendamentodescricao: TStringField;
    qBuscaAgendamentodata: TDateTimeField;
    qBuscaAgendamentovistoriador: TStringField;
    qBuscaAgendamentoplaca: TStringField;
    qBuscaAgendamentocliente: TStringField;
    qBuscaAgendamentotelefone: TStringField;
    qBuscaAgendamentoendereco: TStringField;
    qBuscaAgendamentocidade: TStringField;
    qBuscaAgendamentoUF: TStringField;
    qBuscaAgendamentoobs: TStringField;
    qBuscaAgendamentousuario: TStringField;
    qBuscaAgendamentostatus: TStringField;
    qBuscaAgendamentoconcluido: TIntegerField;
    qDeletaAgendamento: TUniQuery;
    lblStatusPagamento: TLabel;
    Panel10: TPanel;
    Label24: TLabel;
    EditUsurioConcPgto: TEdit;
    qConcluiPagamento: TUniQuery;
    qConcluiAgendamento: TUniQuery;
    lblStatusAgendamento: TLabel;
    qValidaPgto: TUniQuery;
    Image15: TImage;
    Image16: TImage;
    qValidaDado: TUniQuery;
    BalloonHint1: TBalloonHint;
    qBuscaMultas: TUniQuery;
    Image17: TImage;
    PanelTopoStatusPgto: TPanel;
    Image18: TImage;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ComboBoxDetran: TComboBox;
    ComboBoxDER: TComboBox;
    ComboBoxPRF: TComboBox;
    Panel11: TPanel;
    img_busca_obs: TImage;
    MemoObsAtendimento: TMemo;
    qBuscaObsAtn: TUniQuery;
    qAvaliaVeiculo: TUniQuery;
    DateTimeAgendamento: TDateTimePicker;
    Label28: TLabel;
    Panel12: TPanel;
    lblStatusAvaliacao: TLabel;
    EditAvaliacaoAgendamento: TEdit;
    Label29: TLabel;
    ComboBoxAvaliadores: TComboBox;
    img_send_avaliador: TImage;
    img_add_agn: TImage;
    img_del_agn: TImage;
    qEnviaNotif: TUniQuery;
    img_verifica_avaliacao: TImage;
    qVerificaAgendamento: TUniQuery;
    qAtualizaValorAvaliacao: TUniQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    EditVlrMultasPgto: TEdit;
    Label32: TLabel;
    EditVlrDocsPgto: TEdit;
    Label33: TLabel;
    EditVlrQuitacaoPgto: TEdit;
    GroupBox3: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    EditVlrFipePgto: TEdit;
    EditVlrPropostaPgto: TEdit;
    EditVlrAvaliacaoPgto: TEdit;
    Label37: TLabel;
    EditVlrTransPgto: TEdit;
    Label38: TLabel;
    EditVlrDutPgto: TEdit;
    GroupBox4: TGroupBox;
    Label39: TLabel;
    EditLiqPgto: TEdit;
    Label40: TLabel;
    Button1: TButton;
    Label41: TLabel;
    EditTotalDescontos: TEdit;
    qCancelaAtn: TUniQuery;
    btnReabrirAtn: TBitBtn;
    qReabre: TUniQuery;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label45: TLabel;
    DateTimePicker1: TDateTimePicker;
    checkSdata: TCheckBox;
    Label46: TLabel;
    EditCliente: TEdit;
    Label47: TLabel;
    EditTelefone: TEdit;
    Label48: TLabel;
    EditEndereco: TEdit;
    Label49: TLabel;
    EditCidade: TEdit;
    Label50: TLabel;
    EditUF: TEdit;
    QInsereAgendamento: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure img_concluir_pgtoClick(Sender: TObject);
    procedure ComboTipoDocumentosSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImageVoltarDocClick(Sender: TObject);
    procedure btnSalvaEdicaoDocumentosClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure btnSalvaEdicaoVerificacaoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CalendarView1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure img_add_agnClick(Sender: TObject);
    procedure img_del_agnClick(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure img_busca_obsClick(Sender: TObject);
    procedure EditAvaliacaoAgendamentoEnter(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure DateTimeAgendamentoChange(Sender: TObject);
    procedure DateTimeAgendamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimeAgendamentoClick(Sender: TObject);
    procedure img_send_avaliadorClick(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure btnReabrirAtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure img_verifica_avaliacaoClick(Sender: TObject);
  private
    procedure CarregaPgto(id_atendimento: integer);
    procedure GravaMultasAtendimento(id_atendimento: integer);
    procedure AtualizaMultasValores(id_atendimento: integer);
    procedure VerificaCarCod(placa: string);
    procedure CarregaAtendimento(id: integer);
    procedure CarregaAgDocumento(id: integer);
    procedure CarregaAgendamento(id: integer);
    procedure CarregaVerificacao(id: integer);
    procedure CarregaPagamento(id: integer);
    procedure CarregaCancelamento(id: integer);
    procedure verificapgto(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalhesAtendimento: TFormDetalhesAtendimento;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormCadaUsuario, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormAtendimentoMultasVeiculo,
  UFormAgendamento, UFormCadaNovoUsuMobile, UFormCadaUsuariosMobile,
  FMX.UFormGraficosAtendimento, UFormSegIPVALic, UFormQuitacoesVeiculo,
  UFormInformacoes, UDMPermissoes, UFormAlteraFipeDePaxa, UFormCruzamentoFipes,
  UFormHistoricoObsAtn, UFormLiberaPermissao, UFormRefFipes,
  UFormLoadingCarregamento, UFormNovaAvaliacao, UformNovaObs,
  UFormDadosPagamento, UFormDataPagamento, UFormParametros, UFormAguarde,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAvariasItens,
  UFormCadastroTransportadora, UFormCadastroTransportadoras, UFormCidadesCustos,
  UFormCriacaoAvaria, UFormDadosPgtoTransporte, UFormDetalhesAtendimentoBeta,
  UFormDetalheTransportes, UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvarias, UFormGestaoTransporte, UFormListaBancos,
  UFormListaUsuarios, UFormMenuFinanceiro, UFormNovaCidadeCusto,
  UFormNovoUsuarioTransporte, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo,
  UFormPermissoesUsuarioAppTransporte, UFormPgtoExtratoVeiculo;

procedure TFormDetalhesAtendimento.verificapgto( id : integer );
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
  query.ParamByName('id').AsInteger := id;
  query.Open;

  if query.RecordCount >= 0 then
  Begin
   MessageDlg('Pagamento já solicitado ao financeiro, solicite a exclusão dele para que você possa gerar um novo! ', mtWarning, [mbok] , 0);
   Abort;
  End;

  Except
  On E:Exception Do
  Begin
     ShowMessage('Falha ao consultar! ' + e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaCancelamento(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  // validar

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao carregar status Aguardando Documento! '+ e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaPagamento(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

   CarregaPgto( id );

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao carregar status Aguardando Pagamento! '+ e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaVerificacao(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

     query.SQL.Clear;
     query.SQL.Add('select * from tbcompras_doc_leilao where id_atendimento = :id');
     query.ParamByName('id').AsInteger := id;
     query.Open;

     if query.RecordCount > 0 then
     Begin

         ComboLeilao.Text          := query.FieldByName('leilao').Text;
         ComboDivProprietario.Text := query.FieldByName('dividas_proprietario').Text;
         ComboJusTrabalho.Text     := query.FieldByName('cpf_just_trabalho').Text;
         ComboConsultaEstadual.Text:= query.FieldByName('cpf_just_estadual').Text;
         ComboConsultaFederal.Text := query.FieldByName('cpf_just_federal').Text;

         CarregaPgto( id );

         ComboBoxDetran.Text       := query.FieldByName('DETRAN').Text;
         ComboBoxDER.Text          := query.FieldByName('DER').Text;
         ComboBoxPRF.Text          := query.FieldByName('PRF').Text;

         if ComboTipoDocumentos.Text = 'Com Transferência' then
         Begin
             if FormParametros.UniTableParametros.Active = false then
             FormParametros.UniTableParametros.Active := True;

             EditTransferencia.Text := CurrToStr(FormParametros.UniTableParametrosvlrTransf.AsCurrency);
             EditTransferencia.Enabled := false;
         End;

       End
       Else
       Begin
         ComboLeilao.Text          := '0,00';
         ComboDivProprietario.Text := '0,00';
         ComboJusTrabalho.Text     := '0,00';
         ComboConsultaEstadual.Text:= '0,00';
         ComboConsultaFederal.Text := '0,00';
         EditTotalMultas.Text      := '0,00';
         EditTotalIPVASegLic.Text  := '0,00';
         EditTotalQuitacao.Text    := '0,00';
         EditTransferencia.Text    := '0,00';
         EditSegDUT.Text           := '0,00';
         ComboBoxDetran.Text       := '0,00';
         ComboBoxDER.Text          := '0,00';
         ComboBoxPRF.Text          := '0,00';

         if ComboTipoDocumentos.Text = 'Com Transferência' then
         Begin
             if FormParametros.UniTableParametros.Active = false then
             FormParametros.UniTableParametros.Active := True;

           EditTransferencia.Text := floatToStrF(FormParametros.UniTableParametrosvlrTransf.AsCurrency, ffCurrency,10,2);
           EditTransferencia.Enabled := false;
         End;
       End;


  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao carregar status Aguardando Verificação! '+ e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaAgendamento(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

    query.SQL.Clear;
    query.SQL.Add('select * from tbcompras_agendamento WHERE id_atendimento=:id');
    query.ParamByName('id').AsInteger := id;
    query.Open;

    if query.RecordCount > 0 then
    Begin

      DateTimePicker1.DateTime := query.FieldByName('data').AsDateTime;
      EditCliente.Text         := query.FieldByName('cliente').Text;
      EditTelefone.Text        := query.FieldByName('telefone').Text;
      EditCidade.Text          := query.FieldByName('cidade').Text;
      EditEndereco.Text        := query.FieldByName('endereco').Text;
      EditUF.Text              := query.FieldByName('uf').Text;
      ComboBoxAvaliadores.Text := query.FieldByName('vistoriador').Text;

      lblStatusAgendamento.Caption := 'Agendado para: ' + DateTimeToStr( query.FieldByName('data').AsDateTime ) + #13 +
      'Vistoriador: ' + query.FieldByName('vistoriador').Text;

    End
    Else
    Begin
      DateTimePicker1.DateTime := NOW;
      EditCliente.Text         := '';
      EditTelefone.Text        := '';
      EditCidade.Text          := '';
      EditEndereco.Text        := '';
      EditUF.Text              := '';
      ComboBoxAvaliadores.Text := '';

      lblStatusAgendamento.Caption := 'Sem Agendamento';

    End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao carregar status Aguardando Agendamento! '+ e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaAgDocumento(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

   query.SQL.Clear;
   query.SQL.Add('select * from tbcompras_doc where id_atendimento = :id');
   query.ParamByName('id').AsInteger := id;
   query.Open;

   if query.RecordCount > 0 then
   Begin

     ComboTipoDocumentos.Text := query.FieldByName('tipo').Text;
     ComboDutBranco.Text      := query.FieldByName('dut_em_branco').Text;
     ComboDutNomeClie.Text    := query.FieldByName('dut_nome_cliente').Text;
     ComboValidDescTransf.Text:= query.FieldByName('valida_desc_transf').Text;
     ComboValidDescIPVA.Text  := query.FieldByName('valida_desc_ipva').Text;
     ComboProcuracao.Text     := query.FieldByName('procuracao').Text;
     ComboRecibo.Text         := query.FieldByName('recibo').Text;
     ComboArFunc.Text         := query.FieldByName('ar_funcionando').Text;
     ComboMotorCond.Text      := query.FieldByName('motor_em_condicoes').Text;
     ComboAvarias.Text        := query.FieldByName('avarias').Text;

      if ComboTipoDocumentos.Text = 'Com Transferência' then
       Begin
         ComboProcuracao.Enabled := false;
         ComboRecibo.Enabled := true;
         ComboValidDescIPVA.Enabled := true;
         ComboValidDescTransf.Enabled := true;

         if FormParametros.UniTableParametros.Active = false then
         FormParametros.UniTableParametros.Active := True;

         EditTransferencia.Text := CurrToStr(FormParametros.UniTableParametrosvlrTransf.AsCurrency);
         EditTransferencia.Enabled := FALSE;
       End
       Else
       Begin
        ComboValidDescIPVA.Enabled := false;
        ComboValidDescTransf.Enabled := false;
        ComboProcuracao.Enabled := true;
        ComboRecibo.Enabled := true;
       End;
   End
   Else
   Begin
     ComboTipoDocumentos.Text := '';
     ComboDutBranco.Text      := '';
     ComboDutNomeClie.Text    := '';
     ComboValidDescTransf.Text:= '';
     ComboValidDescIPVA.Text  := '';
     ComboProcuracao.Text     := '';
     ComboRecibo.Text         := '';
     ComboArFunc.Text         := '';
     ComboMotorCond.Text      := '';
     ComboAvarias.Text        := '';

     EditTransferencia.Text := '0,00';
   End;


  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao carregar status Aguardando Documento! '+ e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.CarregaAtendimento(id : integer);
Begin

 CarregaAgDocumento(id);

 CarregaAgendamento(id);

 CarregaVerificacao(id);

 CarregaPagamento(id);

 CarregaCancelamento(id);

End;

procedure TFormDetalhesAtendimento.VerificaCarCod(placa :string);
var
 query : TUniQuery;
 inicio, letra, fim, new_placa: string;
Begin

 // IQP5207
 inicio := Copy( placa, 1, 4 );
 letra  := Copy( placa, 5, 1);
 fim    := Copy( placa , 6, 2);

 if letra = '0' then
 letra := 'A';
 if letra = '1' then
 letra := 'B';
 if letra = '2' then
 letra := 'C';
 if letra = '3' then
 letra := 'D';
 if letra = '4' then
 letra := 'E';
 if letra = '5' then
 letra := 'F';
 if letra = '6' then
 letra := 'G';
 if letra = '7' then
 letra := 'H';
 if letra = '8' then
 letra := 'I';
 if letra = '9' then
 letra := 'J';

 new_placa := inicio+letra+fim;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnectionSavanna;

 try

  query.SQL.Clear;
  query.SQL.Add('select Car_Cod from CadCar where Car_placa = :placa');
  query.ParamByName('placa').Text := placa;
  query.Open;

  if query.FieldByName('Car_Cod').AsInteger <= 0 then
  Begin

    query.SQL.Clear;
    query.SQL.Add('select Car_Cod from CadCar where Car_placa = :placa');
    query.ParamByName('placa').Text := new_placa;
    query.Open;

    if query.FieldByName('Car_cod').AsInteger <= 0 then
    Begin

    MessageDlg(' O veículo precisa ser cadastrado antes de concluir para pagamento! ', mtWarning, [mbok] ,0);

    End
    eLSE
    begin
     if FormDadosPagamento = nil then
     Begin
       FormDadosPagamento := TFormDadosPagamento.Create(self);
     End;

       FormDadosPagamento.Position := poScreenCenter;
       FormDadosPagamento.ShowModal;
    end;
  End
  Else
  Begin
     if FormDadosPagamento = nil then
     Begin
       FormDadosPagamento := TFormDadosPagamento.Create(self);
     End;

       FormDadosPagamento.Position := poScreenCenter;
       FormDadosPagamento.ShowModal;
  End;

  Except
  On E:Exception Do
  Begin
     ShowMessage('Fallha ao pesquisar placa: ' + e.Message);
  End;

 end;

End;

procedure TFormDetalhesAtendimento.AtualizaMultasValores(id_atendimento: integer);
Begin


  qValidaDado.SQL.Clear;
  qValidaDado.SQL.Add('select count(*) existe from tbcompras_doc_leilao where id_atendimento = :id');
  qValidaDado.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  qValidaDado.Open;

   qAtualizaStatus.SQL.Clear;
   qAtualizaStatus.SQL.Add('update tbcompras_doc_leilao set leilao=:leilao, dividas_proprietario=:d_proprietario');
   qAtualizaStatus.SQL.Add(',cpf_just_trabalho=:cpf_trab,');
   qAtualizaStatus.SQL.Add('cpf_just_estadual=:cpf_estadual, cpf_just_federal=:cpf_federal,');
   qAtualizaStatus.SQL.Add('total_multas=:total_multas, total_ipva_seg_lic=:total_ipva,');
   qAtualizaStatus.SQL.Add('quitacao=:quitacao, transferencia=:transf, 2_via_dut=:via_dut,');
   qAtualizaStatus.SQL.Add('DETRAN=:detran, DER=:DER, PRF=:PRF where id_atendimento=:id');
   qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qAtualizaStatus.ParamByName('leilao').Text := ComboLeilao.Text;
   qAtualizaStatus.ParamByName('d_proprietario').Text := ComboDivProprietario.Text;
   qAtualizaStatus.ParamByName('cpf_trab').Text := ComboJusTrabalho.Text;
   qAtualizaStatus.ParamByName('cpf_estadual').Text := ComboConsultaEstadual.Text;
   qAtualizaStatus.ParamByName('cpf_federal').Text := ComboConsultaFederal.Text;
   qAtualizaStatus.ParamByName('total_multas').AsCurrency := StrToCurr(StringReplace( StringReplace( EditTotalMultas.Text, 'R$', '', [rfReplaceAll]), '.' ,'', [rfReplaceAll]));
   qAtualizaStatus.ParamByName('total_ipva').AsCurrency := StrToCurr(StringReplace( StringReplace( EditTotalIPVASegLic.Text, 'R$', '', [rfReplaceAll]), '.' ,'', [rfReplaceAll]));
   qAtualizaStatus.ParamByName('quitacao').AsCurrency := StrToCurr(StringReplace( StringReplace( EditTotalQuitacao.Text, 'R$', '', [rfReplaceAll]), '.' ,'', [rfReplaceAll]));
   qAtualizaStatus.ParamByName('transf').AsCurrency := StrToCurr(StringReplace(StringReplace(EditTransferencia.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
   qAtualizaStatus.ParamByName('via_dut').AsCurrency := StrToCurr(StringReplace( StringReplace( EditSegDUT.Text, 'R$', '', [rfReplaceAll]), '.' ,'', [rfReplaceAll]));
   qAtualizaStatus.ParamByName('DETRAN').Text := ComboBoxDetran.Text;
   qAtualizaStatus.ParamByName('DER').Text := ComboBoxDER.Text;
   qAtualizaStatus.ParamByName('PRF').Text := ComboBoxPRF.Text;
   qAtualizaStatus.Execute;

   qAtualizaStatus.sql.Clear;
   qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set verificacao = 1 where id_atendimento = :ID');
   qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qAtualizaStatus.Execute;

End;
procedure TFormDetalhesAtendimento.GravaMultasAtendimento(id_atendimento: integer);
Begin

   if EditTotalMultas.Text = '' then
   EditTotalMultas.Text := '0,00';
   if EditTotalIPVASegLic.Text = '' then
   EditTotalIPVASegLic.Text := '0,00';
   if EditTotalQuitacao.Text = '' then
   EditTotalQuitacao.Text := '0,00';
   if EditTransferencia.Text = '' then
   EditTransferencia.Text := '0,00';
   if EditSegDUT.Text = '' then
   EditSegDUT.Text := '0,00';

   EditTotalMultas.Text := StringReplace( StringReplace(EditTotalMultas.Text, '.', '', [rfReplaceAll]),'R$', '', [rfReplaceAll]);
   EditTotalIPVASegLic.Text :=  StringReplace(StringReplace(EditTotalIPVASegLic.Text, '.', '', [rfReplaceAll]),'R$', '', [rfReplaceAll]);
   EditTotalQuitacao.Text :=  StringReplace(StringReplace(EditTotalQuitacao.Text, '.', '', [rfReplaceAll]),'R$', '', [rfReplaceAll]);
   EditTransferencia.Text :=  StringReplace(StringReplace(EditTransferencia.Text, '.', '', [rfReplaceAll]),'R$', '', [rfReplaceAll]);
   EditSegDUT.Text :=  StringReplace(StringReplace(EditSegDUT.Text, '.', '', [rfReplaceAll]),'R$', '', [rfReplaceAll]);

  qValidaDado.SQL.Clear;
  qValidaDado.SQL.Add('select count(*) existe from tbcompras_doc_leilao where id_atendimento = :id');
  qValidaDado.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  qValidaDado.Open;

    if qValidaDado.FieldByName('existe').AsInteger >= 1 then
    Begin

     if ComboLeilao.Text <> '' then
      Begin
         if ComboDivProprietario.Text <> '' then
        Begin
           if ComboJusTrabalho.Text <> '' then
           Begin
            if ComboConsultaEstadual.Text <> '' then
              Begin
                 if ComboConsultaFederal.Text <> '' then
                Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_doc_leilao set leilao=:leilao, dividas_proprietario=:d_proprietario');
                         qAtualizaStatus.SQL.Add(',cpf_just_trabalho=:cpf_trab,');
                         qAtualizaStatus.SQL.Add('cpf_just_estadual=:cpf_estadual, cpf_just_federal=:cpf_federal,');
                         qAtualizaStatus.SQL.Add('total_multas=:total_multas, total_ipva_seg_lic=:total_ipva,');
                         qAtualizaStatus.SQL.Add('quitacao=:quitacao, transferencia=:transf, 2_via_dut=:via_dut,');
                         qAtualizaStatus.SQL.Add('DETRAN=:detran, DER=:DER, PRF=:PRF where id_atendimento=:id');
                         qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                         qAtualizaStatus.ParamByName('leilao').Text := ComboLeilao.Text;
                         qAtualizaStatus.ParamByName('d_proprietario').Text := ComboDivProprietario.Text;
                         qAtualizaStatus.ParamByName('cpf_trab').Text := ComboJusTrabalho.Text;
                         qAtualizaStatus.ParamByName('cpf_estadual').Text := ComboConsultaEstadual.Text;
                         qAtualizaStatus.ParamByName('cpf_federal').Text := ComboConsultaFederal.Text;
                         qAtualizaStatus.ParamByName('total_multas').AsCurrency := StrToCurr( StringReplace( EditTotalMultas.Text, 'R$', '', [rfReplaceAll]));
                         qAtualizaStatus.ParamByName('total_ipva').AsCurrency := StrToCurr(EditTotalIPVASegLic.Text);
                         qAtualizaStatus.ParamByName('quitacao').AsCurrency := StrToCurr(EditTotalQuitacao.Text);
                         qAtualizaStatus.ParamByName('transf').AsCurrency := StrToCurr(StringReplace(StringReplace(EditTransferencia.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
                         qAtualizaStatus.ParamByName('via_dut').AsCurrency := StrToCurr(EditSegDUT.Text);
                         qAtualizaStatus.ParamByName('DETRAN').Text := ComboBoxDetran.Text;
                         qAtualizaStatus.ParamByName('DER').Text := ComboBoxDER.Text;
                         qAtualizaStatus.ParamByName('PRF').Text := ComboBoxPRF.Text;
                         qAtualizaStatus.Execute;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set verificacao = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                         qAtualizaStatus.Execute;

                         FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

                         ShowMessage('Chamado atualizado com sucesso!');

                         //PageControl1.ActivePage := tab_agenda_vistoria;


                         {PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := false;
                         PageControl1.Pages[2].Enabled := true;
                         PageControl1.Pages[3].Enabled := false;}

                End
                Else
                 MessageDlg('campo CONSULTA FEDERAL inválido', mtError, [mbok] , 0);
                Abort;
               End
                Else
                MessageDlg('campo CONSULTA ESTADUAL inválido', mtError, [mbok] , 0);
                Abort;

            End
             Else
               MessageDlg('campo CONSULTA JUSTIÇA DO TRABALHO inválido', mtError, [mbok] , 0);
               Abort;
        End
         Else
         MessageDlg('campo CONSULTA DIVIDAS DO PROPRIETARIO inválido', mtError, [mbok] , 0);
         Abort;

      End
      Else
       MessageDlg('campo CONSULTA LEILAO DO PROPRIETARIO inválido', mtError, [mbok] , 0);
       Abort;
    End
    Else
    Begin
     if ComboLeilao.Text <> '' then
      Begin
         if ComboDivProprietario.Text <> '' then
        Begin
           if ComboJusTrabalho.Text <> '' then
           Begin
            if ComboConsultaEstadual.Text <> '' then
              Begin
                 if ComboConsultaFederal.Text <> '' then
                Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('insert into tbcompras_doc_leilao (id_atendimento, leilao, dividas_proprietario, cpf_just_trabalho,');
                         qAtualizaStatus.SQL.Add('cpf_just_estadual, cpf_just_federal, total_multas, total_ipva_seg_lic, quitacao,');
                         qAtualizaStatus.SQL.Add('transferencia, 2_via_dut, DETRAN, DER, PRF)');
                         qAtualizaStatus.SQL.Add('values (:id, :leilao, :d_proprietario, :cpf_trab, :cpf_estadual, :cpf_federal, :total_multas, :total_ipva, :quitacao,');
                         qAtualizaStatus.SQL.Add(':transf, :via_dut, :DETRAN, :DER, :PRF)');
                         qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                         qAtualizaStatus.ParamByName('leilao').Text := ComboLeilao.Text;
                         qAtualizaStatus.ParamByName('d_proprietario').Text := ComboDivProprietario.Text;
                         qAtualizaStatus.ParamByName('cpf_trab').Text := ComboJusTrabalho.Text;
                         qAtualizaStatus.ParamByName('cpf_estadual').Text := ComboConsultaEstadual.Text;
                         qAtualizaStatus.ParamByName('cpf_federal').Text := ComboConsultaFederal.Text;
                         qAtualizaStatus.ParamByName('total_multas').AsCurrency := StrToCurr(EditTotalMultas.Text);
                         qAtualizaStatus.ParamByName('total_ipva').AsCurrency := StrToCurr(EditTotalIPVASegLic.Text);
                         qAtualizaStatus.ParamByName('quitacao').AsCurrency := StrToCurr(EditTotalQuitacao.Text);
                         qAtualizaStatus.ParamByName('transf').AsCurrency := StrToCurr(StringReplace(StringReplace(EditTransferencia.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]));
                         qAtualizaStatus.ParamByName('via_dut').AsCurrency := StrToCurr(EditSegDUT.Text);
                         qAtualizaStatus.ParamByName('DETRAN').Text := ComboBoxDetran.Text;
                         qAtualizaStatus.ParamByName('DER').Text := ComboBoxDER.Text;
                         qAtualizaStatus.ParamByName('PRF').Text := ComboBoxPRF.Text;
                         qAtualizaStatus.ExecSQL;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set verificacao = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                         qAtualizaStatus.Execute;

                         FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

                         ShowMessage('Chamado atualizado com sucesso!');

                         {PageControl1.ActivePage := tab_agenda_vistoria;
                         PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := false;
                         PageControl1.Pages[2].Enabled := true;
                         PageControl1.Pages[3].Enabled := false;}

                End
                Else
                 MessageDlg('campo CONSULTA FEDERAL inválido', mtError, [mbok] , 0);
                Abort;
               End
                Else
                MessageDlg('campo CONSULTA ESTADUAL inválido', mtError, [mbok] , 0);
                Abort;

            End
             Else
               MessageDlg('campo CONSULTA JUSTIÇA DO TRABALHO inválido', mtError, [mbok] , 0);
               Abort;
        End
         Else
         MessageDlg('campo CONSULTA DIVIDAS DO PROPRIETARIO inválido', mtError, [mbok] , 0);
         Abort;

      End
      Else
       MessageDlg('campo CONSULTA LEILAO DO PROPRIETARIO inválido', mtError, [mbok] , 0);
       Abort;
    End;

End;

procedure TFormDetalhesAtendimento.CarregaPgto(id_atendimento: integer);
Begin

   FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;
   FormSeguroIPVALic.qBuscaDocs.Active := false;
   FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

   qValidaPgto.SQL.Clear;
   qValidaPgto.SQL.Add('select * from tbcompras_doc_leilao where id_atendimento = :id');
   qValidaPgto.ParamByName('id').AsInteger := id_atendimento;
   qValidaPgto.Open;

   if qValidaPgto.RecordCount > 0 then
   Begin

     EditVlrMultasPgto.Text   := floatToStrF(qValidaPgto.FieldByName('total_multas').AsCurrency, ffCurrency,10,2);
     EditTotalMultas.Text     := floatToStrF(qValidaPgto.FieldByName('total_multas').AsCurrency, ffCurrency,10,2);

     EditVlrDocsPgto.Text     := floatToStrF(qValidaPgto.FieldByName('total_ipva_seg_lic').AsCurrency, ffCurrency,10,2);
     EditTotalIPVASegLic.Text := floatToStrF(qValidaPgto.FieldByName('total_ipva_seg_lic').AsCurrency, ffCurrency,10,2);

     EditVlrQuitacaoPgto.Text := floatToStrF(qValidaPgto.FieldByName('quitacao').AsCurrency,  ffCurrency,10,2);
     EditTotalQuitacao.Text   := floatToStrF(qValidaPgto.FieldByName('quitacao').AsCurrency,  ffCurrency,10,2);

     EditVlrTransPgto.Text    := floatToStrF(qValidaPgto.FieldByName('transferencia').AsCurrency,  ffCurrency,10,2);
     EditTransferencia.Text   := floatToStrF(qValidaPgto.FieldByName('transferencia').AsCurrency,  ffCurrency,10,2);

     EditVlrDutPgto.Text      := floatToStrF(qValidaPgto.FieldByName('2_via_dut').AsCurrency,  ffCurrency,10,2);
     EditSegDUT.Text          := floatToStrF(qValidaPgto.FieldByName('2_via_dut').AsCurrency,  ffCurrency,10,2);

     EditTotalDescontos.Text  := floatToStrF(qValidaPgto.FieldByName('total_multas').AsCurrency+
                                             qValidaPgto.FieldByName('total_ipva_seg_lic').AsCurrency+
                                             qValidaPgto.FieldByName('quitacao').AsCurrency+
                                             qValidaPgto.FieldByName('transferencia').AsCurrency+
                                             qValidaPgto.FieldByName('2_via_dut').AsCurrency,  ffCurrency,10,2);
   End;


   qValidaPgto.SQL.Clear;
   qValidaPgto.SQL.Add('select * from tbcompras_atendimento where id = :id');
   qValidaPgto.ParamByName('id').AsInteger := id_atendimento;
   qValidaPgto.Open;

   if qValidaPgto.RecordCount > 0 then
   Begin
     EditVlrFipePgto.Text     := floatToStrF(qValidaPgto.FieldByName('fipe').AsCurrency,  ffCurrency,10,2);

     EditVlrPropostaPgto.Text := floatToStrF(qValidaPgto.FieldByName('proposta').AsCurrency,  ffCurrency,10,2);

     EditVlrAvaliacaoPgto.Text := floatToStrF(qValidaPgto.FieldByName('VlrAvaliacao').AsCurrency,  ffCurrency,10,2);
   End;

    EditLiqPgto.Text :=
    CurrToStrF(
    StrToCurr(StringReplace(StringReplace(EditVlrAvaliacaoPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]))
     -
    StrToCurr(StringReplace(StringReplace(EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]))
    ,  ffCurrency,2);


End;

procedure TFormDetalhesAtendimento.btnReabrirAtnClick(Sender: TObject);
begin

 if MessageDlg('Deseja realmente reabrir este atendimento?', mtInformation, [mbno, mbyes] , 0) = mrYes then
 Begin
   qReabre.SQL.Clear;
   qReabre.SQL.Add('update tbcompras_atendimento set situacao = ult_sit where id = :id');
   qReabre.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qReabre.Execute;

   ShowMessage('O chamado foi reaberto, a tela será finalizada para processamento');

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   Close;
 End;

end;

procedure TFormDetalhesAtendimento.btnSalvaEdicaoDocumentosClick(
  Sender: TObject);
Var
 ID : Integer;
begin

  ID := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;

     if ComboTipoDocumentos.Text <>  '' then
     Begin
        if ComboTipoDocumentos.Text = 'Com Transferência' then
        Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboValidDescIPVA.Text <> '' then
               Begin
                 if ComboValidDescTransf.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_doc set tipo = :tipo, dut_em_branco = :dt_b,');
                         qAtualizaStatus.SQL.Add('dut_nome_cliente = :dt_c, valida_desc_transf = :v_transf,');
                         qAtualizaStatus.SQL.Add('valida_desc_ipva = :v_ipva, procuracao = :procuracao,');
                         qAtualizaStatus.SQL.Add('recibo = :recibo, ar_funcionando = :ar, motor_em_condicoes=:motor,');
                         qAtualizaStatus.SQL.Add(' avarias = :avarias where id_atendimento = :id');
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                         qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                         qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                         qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                         qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                         qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                         qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                         qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                         qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                         qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                         qAtualizaStatus.Execute;

                         btnSalvaEdicaoDocumentos.Visible := false;

                         PageControl1.ActivePage := tab_agenda_vistoria;

                         PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := true;
                         PageControl1.Pages[2].Enabled := false;
                         PageControl1.Pages[3].Enabled := false;

                          ComboTipoDocumentos.Enabled := false;
                          ComboDutBranco.Enabled := false;
                          ComboDutNomeClie.Enabled := false;
                          ComboValidDescTransf.Enabled := false;
                          ComboProcuracao.Enabled := false;
                          ComboValidDescIPVA.Enabled := false;
                          ComboArFunc.Enabled := false;
                          ComboMotorCond.Enabled := false;
                          ComboAvarias.Enabled := false;
                          ComboRecibo.Enabled := false;

                         ShowMessage('Chamado atualizado com sucesso!');

                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo VALIDAR DESCONTO TRANSFERENCIA em branco', mtError, [mbok] , 0);
                   //ComboValidDescTransf.SetFocus;
               End
                Else
                 MessageDlg('Campo VALIDAR DESCONTO IPVA em branco', mtError, [mbok] , 0);
                 //ComboValidDescIPVA.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;
        End
         Else
         Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboProcuracao.Text <> '' then
               Begin
                 if ComboRecibo.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_doc set tipo = :tipo, dut_em_branco = :dt_b,');
                         qAtualizaStatus.SQL.Add('dut_nome_cliente = :dt_c, valida_desc_transf = :v_transf,');
                         qAtualizaStatus.SQL.Add('valida_desc_ipva = :v_ipva, procuracao = :procuracao,');
                         qAtualizaStatus.SQL.Add('recibo = :recibo, ar_funcionando = :ar, motor_em_condicoes=:motor,');
                         qAtualizaStatus.SQL.Add(' avarias = :avarias where id_atendimento = :id');
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                         qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                         qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                         qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                         qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                         qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                         qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                         qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                         qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                         qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                         qAtualizaStatus.Execute;

                         btnSalvaEdicaoDocumentos.Visible := false;

                         PageControl1.ActivePage := tab_agenda_vistoria;

                         PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := true;
                         PageControl1.Pages[2].Enabled := false;
                         PageControl1.Pages[3].Enabled := false;

                          ComboTipoDocumentos.Enabled := false;
                          ComboDutBranco.Enabled := false;
                          ComboDutNomeClie.Enabled := false;
                          ComboValidDescTransf.Enabled := false;
                          ComboProcuracao.Enabled := false;
                          ComboValidDescIPVA.Enabled := false;
                          ComboArFunc.Enabled := false;
                          ComboMotorCond.Enabled := false;
                          ComboAvarias.Enabled := false;
                          ComboRecibo.Enabled := false;

                         ShowMessage('Chamado atualizado com sucesso!');

                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo RECIBO em branco', mtError, [mbok] , 0);
                   //ComboRecibo.SetFocus;
               End
                Else
                 MessageDlg('Campo PROCURAÇÃO em branco', mtError, [mbok] , 0);
                 //ComboProcuracao.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;

         End
     End
      Else
       MessageDlg('Campo TIPO em branco', mtError, [mbok] , 0);
       //ComboTipoDocumentos.SetFocus;

   End;

procedure TFormDetalhesAtendimento.btnSalvaEdicaoVerificacaoClick(
  Sender: TObject);
begin


  if ComboLeilao.Text <> '' then
  Begin
     if ComboDivProprietario.Text <> '' then
     Begin
        if ComboJusTrabalho.Text <> '' then
        Begin
           if ComboConsultaEstadual.Text <> '' then
           Begin
              if ComboConsultaFederal.Text <> '' then
              Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_doc_leilao set leilao=:leilao, dividas_proprietario=:d_proprietario');
                         qAtualizaStatus.SQL.Add(',cpf_just_trabalho=:cpf_trab,');
                         qAtualizaStatus.SQL.Add('cpf_just_estadual=:cpf_estadual, cpf_just_federal=:cpf_federal,');
                         qAtualizaStatus.SQL.Add('total_multas=:total_multas, total_ipva_seg_lic=:total_ipva,');
                         qAtualizaStatus.SQL.Add('quitacao=:quitacao, transferencia=:transf, 2_via_dut=:via_dut where id_atendimento=:id');
                         qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
                         qAtualizaStatus.ParamByName('leilao').Text := ComboLeilao.Text;
                         qAtualizaStatus.ParamByName('d_proprietario').Text := ComboDivProprietario.Text;
                         qAtualizaStatus.ParamByName('cpf_trab').Text := ComboJusTrabalho.Text;
                         qAtualizaStatus.ParamByName('cpf_estadual').Text := ComboConsultaEstadual.Text;
                         qAtualizaStatus.ParamByName('cpf_federal').Text := ComboConsultaFederal.Text;
                         qAtualizaStatus.ParamByName('total_multas').AsCurrency := StrToCurr(EditTotalMultas.Text);
                         qAtualizaStatus.ParamByName('total_ipva').AsCurrency := StrToCurr(EditTotalIPVASegLic.Text);
                         qAtualizaStatus.ParamByName('quitacao').AsCurrency := StrToCurr(EditTotalQuitacao.Text);
                         qAtualizaStatus.ParamByName('transf').AsCurrency := StrToCurr(EditTransferencia.Text);
                         qAtualizaStatus.ParamByName('via_dut').AsCurrency := StrToCurr(EditSegDUT.Text);
                         qAtualizaStatus.Execute;

                         {ComboLeilao.Enabled := false;
                         ComboDivProprietario.Enabled := false;
                         ComboJusTrabalho.Enabled := false;
                         ComboConsultaFederal.Enabled := false;
                         ComboConsultaEstadual.Enabled := false;
                         EditTransferencia.Enabled := false;
                         EditSegDUT.Enabled := false;}

                         ImageVoltarDoc.Visible := true;
                         btnSalvaEdicaoVerificacao.Visible := false;

                         ShowMessage('Chamado atualizado com sucesso!');

              End
              Else
               MessageDlg('campo CONSULTA FEDERAL inválido', mtError, [mbok] , 0);
               Abort;
           End
           Else
               MessageDlg('campo CONSULTA ESTADUAL inválido', mtError, [mbok] , 0);
               Abort;

        End
           Else
               MessageDlg('campo CONSULTA JUSTIÇA DO TRABALHO inválido', mtError, [mbok] , 0);
               Abort;
     End
           Else
               MessageDlg('campo CONSULTA DIVIDAS DO PROPRIETARIO inválido', mtError, [mbok] , 0);
               Abort;

  End
           Else
               MessageDlg('campo CONSULTA LEILAO DO PROPRIETARIO inválido', mtError, [mbok] , 0);
               Abort;

end;

procedure TFormDetalhesAtendimento.Button1Click(Sender: TObject);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.add('select * from tbcompras_pagamento_detalhe where id_atendimento = :id');
  query.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  query.Open;

  if query.RecordCount > 0 then
  Begin
   MessageDlg('Pagamento já solicitado ao financeiro, solicite a exclusão dele para que você possa gerar um novo! ', mtWarning, [mbok] , 0);
   Abort;
  End
  Else
  Begin
     VerificaCarCod( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text );
  End;

     // verifica se foi lançado um registro no tbcompras_pagamento_detalhe
     //verificapgto( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger );

     // verifica se carro esta no Anestor Legado
    // VerificaCarCod( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text );


end;

procedure TFormDetalhesAtendimento.Button2Click(Sender: TObject);
begin

 if FormAtendimentoMultasVeiculo = nil then
 Begin
   FormAtendimentoMultasVeiculo := TFormAtendimentoMultasVeiculo.Create(self);
 End;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Filter := 'id_atendimento='+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormAtendimentoMultasVeiculo.qBuscaMultas.Filtered := true;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Active := true;

 FormAtendimentoMultasVeiculo.Position := poScreenCenter;
 FormAtendimentoMultasVeiculo.ShowModal;


end;

procedure TFormDetalhesAtendimento.Button3Click(Sender: TObject);
begin
 if FormSeguroIPVALic = nil then
 Begin
   FormSeguroIPVALic := TFormSeguroIPVALic.Create(self);
 End;

 FormSeguroIPVALic.qBuscaDocs.Active := false;

 FormSeguroIPVALic.qBuscaDocs.Filter := 'id_atendimento='+QuotedStr(IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormSeguroIPVALic.qBuscaDocs.Filtered := true;

 FormSeguroIPVALic.qBuscaDocs.Active := true;

 FormSeguroIPVALic.Position := poScreenCenter;
 FormSeguroIPVALic.ShowModal;

end;

procedure TFormDetalhesAtendimento.Button4Click(Sender: TObject);
begin
 if FormQuitacoesVeiculo = nil then
 Begin
   FormQuitacoesVeiculo := TFormQuitacoesVeiculo.Create(self);
 End;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Filter := 'id_atendimento='+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormQuitacoesVeiculo.qBuscaQuitacoes.Filtered := true;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Active := true;

 FormQuitacoesVeiculo.Position := poScreenCenter;
 FormQuitacoesVeiculo.ShowModal;
end;

procedure TFormDetalhesAtendimento.CalendarView1Click(Sender: TObject);
begin

 qBuscaAgendamento.Active := FALSE;

 qBuscaAgendamento.SQL.Clear;
 qBuscaAgendamento.SQL.Add('select * from tbcompras_agendamento where cast(data as date) = :dt');
 qBuscaAgendamento.ParamByName('dt').AsDate := DateTimeAgendamento.Date;
 qBuscaAgendamento.Open;

end;

procedure TFormDetalhesAtendimento.ComboTipoDocumentosSelect(Sender: TObject);
begin

 if ComboTipoDocumentos.Text = 'Com Transferência' then
 Begin
   ComboProcuracao.Text := '';
   ComboProcuracao.Enabled := false;

   ComboRecibo.Text := '';
   ComboRecibo.Enabled := true;

   ComboValidDescTransf.Text := '';
   ComboValidDescIPVA.Text := '';
   ComboValidDescIPVA.Enabled := true;
   ComboValidDescTransf.Enabled := true;
 End
 Else
 Begin
   ComboValidDescTransf.Text := '';
   ComboValidDescIPVA.Text := '';
   ComboValidDescIPVA.Enabled := false;
   ComboValidDescTransf.Enabled := false;

   ComboProcuracao.Text := '';
   ComboProcuracao.Enabled := true;

   ComboRecibo.Text := '';
   ComboRecibo.Enabled := true;
 End;


end;

procedure TFormDetalhesAtendimento.DateTimeAgendamentoChange(Sender: TObject);
begin
 qBuscaAgendamento.Open;
 qBuscaAgendamento.Filter := 'Data ='+QuotedStr(DateToStr(DateTimeAgendamento.Date));
 qBuscaAgendamento.Filtered := true;

end;

procedure TFormDetalhesAtendimento.DateTimeAgendamentoClick(Sender: TObject);
begin
 qBuscaAgendamento.Open;
 qBuscaAgendamento.Filter := 'Data ='+QuotedStr(DateToStr(DateTimeAgendamento.Date));
 qBuscaAgendamento.Filtered := true;

end;

procedure TFormDetalhesAtendimento.DateTimeAgendamentoKeyPress(Sender: TObject;
  var Key: Char);
begin

 qBuscaAgendamento.Filter := 'Data ='+QuotedStr(DateToStr(DateTimeAgendamento.Date));
 qBuscaAgendamento.Filtered := true;

end;

procedure TFormDetalhesAtendimento.DBGrid1DblClick(Sender: TObject);
begin

 if FormAgendamentoViita = nil then
 Begin

   FormAgendamentoViita := TFormAgendamentoViita.Create(self);

 End;

{ FormAgendamentoViita.EditPlaca.Text := DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
 FormAgendamentoViita.EditCliente.Text := DBGrid1.DataSource.DataSet.FieldByName('cliente').Text;
 FormAgendamentoViita.EditTelefone.Text:= DBGrid1.DataSource.DataSet.FieldByName('telefone').Text;
 FormAgendamentoViita.EditEndereco.Text:= DBGrid1.DataSource.DataSet.FieldByName('endereco').Text;
 FormAgendamentoViita.EditCidade.Text  := DBGrid1.DataSource.DataSet.FieldByName('cidade').Text;
 FormAgendamentoViita.EditUF.Text      := DBGrid1.DataSource.DataSet.FieldByName('uf').Text;
 FormAgendamentoViita.MemoObs.Text     := DBGrid1.DataSource.DataSet.FieldByName('obs').Text;
 FormAgendamentoViita.EditVistoriador.Text := DBGrid1.DataSource.DataSet.FieldByName('vistoriador').Text;
 FormAgendamentoViita.DateVisita.Date  := DBGrid1.DataSource.DataSet.FieldByName('data').AsDateTime;   }

 FormAgendamentoViita.img_salva_edit.Visible := true;
 FormAgendamentoViita.img_salvar.Visible := False;

 FormAgendamentoViita.Position := poScreenCenter;
 FormAgendamentoViita.ShowModal;

end;

procedure TFormDetalhesAtendimento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


{  If DBGrid1.DataSource.DataSet.FieldByName('status').Text = 'pendente' then // condição
  Begin
    //DBGridAtendimentos.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada
    DBGrid1.Canvas.Brush.Color := clYellow;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
  End;

  If DBGrid1.DataSource.DataSet.FieldByName('status').Text = 'concluido' then // condição
  Begin
    //DBGridAtendimentos.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada
    DBGrid1.Canvas.Brush.Color := clGreen;
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
  End;

  If DBGrid1.DataSource.DataSet.FieldByName('status').Text = 'cancelado' then // condição
  Begin
    //DBGridAtendimentos.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada
    DBGrid1.Canvas.Brush.Color := clRed;
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
  End;
   }
end;

procedure TFormDetalhesAtendimento.EditAvaliacaoAgendamentoEnter(
  Sender: TObject);
begin

 EditAvaliacaoAgendamento.SelectAll;

end;

procedure TFormDetalhesAtendimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if btnSalvaEdicaoDocumentos.Visible = true then
  Begin

   MessageDlg('Você possuí pendencias a finalizar.', mtWarning, [mbok] , 0);
   PageControl1.ActivePage := Tab_documentacao;
   Abort;
  End;

  if btnSalvaEdicaoVerificacao.Visible = true then
  Begin
   MessageDlg('Você possuí pendencias a finalizar.', mtWarning, [mbok] , 0);
   PageControl1.ActivePage := Tab_verific_cadastral;
   Abort;
  End

  Else
  Begin

  // limpa campos
    ComboTipoDocumentos.Enabled := true;
    ComboDutBranco.Enabled := true;
    ComboDutNomeClie.Enabled := true;
    ComboValidDescTransf.Enabled := true;
    ComboProcuracao.Enabled := true;
    ComboValidDescIPVA.Enabled := true;
    ComboArFunc.Enabled := true;
    ComboMotorCond.Enabled := true;
    ComboAvarias.Enabled := true;
    ComboRecibo.Enabled := true;

    ComboTipoDocumentos.Text := '';
    ComboDutBranco.Text := '';
    ComboDutNomeClie.Text := '';
    ComboValidDescTransf.Text := '';
    ComboProcuracao.Text := '';
    ComboValidDescIPVA.Text := '';
    ComboArFunc.Text := '';
    ComboMotorCond.Text := '';
    ComboAvarias.Text := '';
    ComboRecibo.Text := '';

    ComboLeilao.Text := '';
    ComboLeilao.Enabled := true;

    ComboDivProprietario.Text := '';
    ComboDivProprietario.Enabled := true;

    ComboJusTrabalho.Text := '';
    ComboJusTrabalho.Enabled := true;

    ComboConsultaEstadual.Text := '';
    ComboConsultaEstadual.Enabled := true;

    ComboConsultaFederal.Text := '';
    ComboConsultaFederal.Enabled := true;

    EditTotalMultas.Text := '0,00';
    EditTotalIPVASegLic.Text := '0,00';
    EditTotalQuitacao.Text := '0,00';

    EditTransferencia.Text := '0,00';
    EditTransferencia.Enabled := true;

    EditSegDUT.Text := '0,00';
    EditSegDUT.Enabled := true;

  End;
end;

procedure TFormDetalhesAtendimento.FormShow(Sender: TObject);
begin

 DateTimePicker1.Date := NOW;
 EditCliente.Text := FormAtendimentos.qBuscaAtendimentosnome.Text;
 EditTelefone.Text:= FormAtendimentos.qBuscaAtendimentostelefone.Text;

 if FormParametros = nil then
 Begin
   FormParametros := TFormParametros.Create(self);
 End;

 if FormAtendimentoMultasVeiculo = nil then
 Begin
    FormAtendimentoMultasVeiculo := TFormAtendimentoMultasVeiculo.Create(self);
 End;

 if FormSeguroIPVALic = nil then
 Begin
   FormSeguroIPVALic := TFormSeguroIPVALic.Create(self);
 End;

 if FormQuitacoesVeiculo = nil then
 Begin
   FormQuitacoesVeiculo := TFormQuitacoesVeiculo.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin
   btnReabrirAtn.Visible := true;
 End
 Else
 Begin
   btnReabrirAtn.Visible := false;
 End;

 ComboBoxAvaliadores.Items.Clear;

 DataModuleBancoVistoria.qBuscaUsuarios.Refresh;

 DataModuleBancoVistoria.qBuscaUsuarios.First;
 while not DataModuleBancoVistoria.qBuscaUsuarios.Eof do
 Begin
   ComboBoxAvaliadores.Items.Add(DataModuleBancoVistoria.qBuscaUsuarios.FieldByName('nome').Text);
   DataModuleBancoVistoria.qBuscaUsuarios.Next;
 End;


  // função nova de carregamento 20/01/2022
 CarregaAtendimento( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger );

  qBuscaObsAtn.SQL.Clear;
  qBuscaObsAtn.SQL.Add('select * from tbatendimento_obs where id_atendimento = :id order by id desc  limit 1');
  qBuscaObsAtn.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
  qBuscaObsAtn.Open;

  if qBuscaObsAtn.RecordCount > 0 then
  Begin
    MemoObsAtendimento.Text := qBuscaObsAtn.FieldByName('obs').Text;
    MemoObsAtendimento.Enabled := false;
  End;

end;

procedure TFormDetalhesAtendimento.Image11Click(Sender: TObject);
Var
 ID : Integer;
begin

  ID := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;

 if EditStatusChamado.Text <> 'Aguardando Documentos' then
 Begin
    MessageDlg('Etapa não pode ser concluída, pois atendimento não encontra-se Aguardando Documentos.', mtError, [mbok] , 0);
 End
 Else
 Begin
// aguardando agendamento


  qValidaDado.SQL.Clear;
  qValidaDado.SQL.Add('select count(*) existe from tbcompras_doc where id_atendimento = :id');
  qValidaDado.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  qValidaDado.Open;

    if qValidaDado.FieldByName('existe').AsInteger >= 1 then
    Begin

 Begin
    if MessageDlg('Deseja concluir esta etapa?'+#13+
                  'O atendimento passará de: ' + #13 + EditStatusChamado.Text + ' para ' + 'Aguardando Verificação',
                  mtInformation, [mbno, mbyes] , 0 ) = mrYes then
   Begin

     if ComboTipoDocumentos.Text <>  '' then
     Begin
        if ComboTipoDocumentos.Text = 'Com Transferência' then
        Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboValidDescIPVA.Text <> '' then
               Begin
                 if ComboValidDescTransf.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin
                         // Processo para inserir C/ Transf  >>> Aguardando Verificação

                         // Processos para inserir S transf  >>> Aguardando Verificação
                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 25 where id_atendimento = :id');
                         qAtualizaStatus.ParamByName('status').Text  := 'Aguardando Verificação';
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         ProgressBar.Position := 25;
                         lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 25 %';
                         EditStatusChamado.Text := 'Aguardando Agendamento';

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
                         qAtualizaStatus.ParamByName('status').Text := 'Aguardando Agendamento';
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         PageControl1.ActivePage := tab_agenda_vistoria;

                         FormAtendimentos.qBuscaAtendimentos.Refresh;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         //ShowMessage('Chamado atualizado com sucesso!');

                         PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := true;
                         PageControl1.ActivePage := tab_agenda_vistoria;

                         FormAtendimentos.AtualizaChamado(ID);

                         FormAtendimentos.qBuscaAtendimentos.Refresh;

                         Close;

                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo VALIDAR DESCONTO TRANSFERENCIA em branco', mtError, [mbok] , 0);
                   //ComboValidDescTransf.SetFocus;
               End
                Else
                 MessageDlg('Campo VALIDAR DESCONTO IPVA em branco', mtError, [mbok] , 0);
                 //ComboValidDescIPVA.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;
        End
         Else
         Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboProcuracao.Text <> '' then
               Begin
                 if ComboRecibo.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin

                        // Processos para inserir S transf  >>> Aguardando Verificação
                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 25 where id_atendimento = :id');
                         qAtualizaStatus.ParamByName('status').Text  := 'Aguardando Agendamento';
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         ProgressBar.Position := 25;
                         EditStatusChamado.Text := 'Aguardando Verificação';

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
                         qAtualizaStatus.ParamByName('status').Text := 'Aguardando Agendamento';
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         PageControl1.ActivePage := tab_agenda_vistoria;

                         FormAtendimentos.qBuscaAtendimentos.Refresh;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;


                         PageControl1.Pages[0].Enabled := false;
                         PageControl1.Pages[1].Enabled := true;
                         PageControl1.ActivePage := tab_agenda_vistoria;

                         FormAtendimentos.qBuscaAtendimentos.Refresh;

                         FormAtendimentos.AtualizaChamado(ID);

                         ShowMessage('Chamado atualizado com sucesso!');

                         Close;

                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo RECIBO em branco', mtError, [mbok] , 0);
                   //ComboRecibo.SetFocus;
               End
                Else
                 MessageDlg('Campo PROCURAÇÃO em branco', mtError, [mbok] , 0);
                 //ComboProcuracao.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;

         End
     End
      Else
       MessageDlg('Campo TIPO em branco', mtError, [mbok] , 0);
       //ComboTipoDocumentos.SetFocus;

   End;
 End;
    End;
 End;
end;

procedure TFormDetalhesAtendimento.Image12Click(Sender: TObject);
begin

 if EditStatusChamado.Text <> 'Aguardando Verificação' then
 Begin
    MessageDlg('Etapa não pode ser concluída, pois atendimento não encontra-se Aguardando Verificação.', mtError, [mbok] , 0);
 End
 Else
 Begin

   if StrToCurr(EditAvaliacaoAgendamento.Text) > 0 then
   Begin

       //Efetua o processo de envio para pgto
       if MessageDlg('Deseja concluir esta etapa e enviar o atendimento para Aguardando Pagamento?', mtInformation, [mbno, mbyes] , 0) = mryes then
       Begin
         qConcluiAgendamento.SQL.Clear;
         qConcluiAgendamento.SQL.Add('insert into tbcompras_pagamento (id_atendimento, usuario, valor, valor_pgto, data_env) ');
         qConcluiAgendamento.SQL.Add('values (:id, :usuario, 0,0, :dt)');
         qConcluiAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qConcluiAgendamento.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
         qConcluiAgendamento.ParamByName('dt').AsDateTime := NOW;
         qConcluiAgendamento.ExecSQL;

          // Processos para inserir S transf  >>> Aguardando Verificação
          qAtualizaStatus.SQL.Clear;
          qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 75 where id_atendimento = :id');
          qAtualizaStatus.ParamByName('status').Text  := 'Aguardando Pagamento';
          qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
          qAtualizaStatus.Execute;

          ProgressBar.Position := 75;
          lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 75 %';
          EditStatusChamado.Text := 'Aguardando Pagamento';

          qAtualizaStatus.sql.Clear;
          qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
          qAtualizaStatus.ParamByName('status').Text := 'Aguardando Pagamento';
          qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
          qAtualizaStatus.Execute;

          qAtualizaStatus.sql.Clear;
          qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set agendamento = 1 where id_atendimento = :ID');
          qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
          qAtualizaStatus.Execute;
          // 27/05/2021 21:21 ajustado para ir pagamento = 1
          qAtualizaStatus.sql.Clear;
          qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set pagamento = 1 where id_atendimento = :ID');
          qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
          qAtualizaStatus.Execute;

           PageControl1.Pages[0].Enabled := false;
           PageControl1.Pages[1].Enabled := false;
           PageControl1.Pages[2].Enabled := false;
           PageControl1.Pages[3].Enabled := true;

          PageControl1.ActivePage := Tab_pagamento;

          EditUsurioConcPgto.Text := '';

          lblStatusPagamento.Caption := 'Pagamento Pendente';
          PanelTopoStatusPgto.Color := clred;
          lblStatusPagamento.Font.Color := clWhite;

          FormAtendimentos.qBuscaAtendimentos.Refresh;

          FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

          CarregaPgto(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

          AtualizaMultasValores(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

           FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;
           FormSeguroIPVALic.qBuscaDocs.Active := false;
           FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

          ShowMessage('Chamado atualizado com sucesso!');

          Close;
       End;

      End
      Else
      Begin
        MessageDlg('O Veículo não possuí avaliação! Apenas após ser avaliado o veículo poderá passar para proxima etapa', mtWarning, [mbok] , 0);
        Abort;
      End;

 End;

end;

procedure TFormDetalhesAtendimento.Image13Click(Sender: TObject);
begin

 if FormAtendimentos = nil then
 Begin
   FormAtendimentos := TFormAtendimentos.Create(self);
 End;
 {
 qVerificaAgendamento.SQL.Clear;
 qVerificaAgendamento.SQL.Add('select * from tbcompras_agendamento where id_atendimento=:id');
 qVerificaAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
 qVerificaAgendamento.Open;
 }
 if StrToCurr(EditAvaliacaoAgendamento.Text) > 0 then
 Begin
   qVerificaAgendamento.SQL.Clear;
   qVerificaAgendamento.SQL.Add('select * from tbcompras_atendimento where id = :id and VlrAvaliacao > 0');
   qVerificaAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qVerificaAgendamento.Open;

   if qVerificaAgendamento.RecordCount > 0 then
   Begin

     if MessageDlg('Deseja concluir a etapa de agendamento?', mtInformation, [mbno, mbyes] , 0) = mrYes then
     Begin
       qAtualizaStatus.SQL.Clear;
       qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 50 where id_atendimento = :id');
       qAtualizaStatus.ParamByName('status').Text  := 'Aguardando Verificação';
       qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
       qAtualizaStatus.Execute;

       ProgressBar.Position := 50;
       lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 50 %';
       EditStatusChamado.Text := 'Aguardando Verificação';

       qAtualizaStatus.sql.Clear;
       qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
       qAtualizaStatus.ParamByName('status').Text := 'Aguardando Verificação';
       qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
       qAtualizaStatus.Execute;

       PageControl1.ActivePage := Tab_verific_cadastral;

       FormAtendimentos.qBuscaAtendimentos.Refresh;

       qAtualizaStatus.sql.Clear;
       qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set agendamento = 1 where id_atendimento = :ID');
       qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
       qAtualizaStatus.Execute;

       //ShowMessage('Chamado atualizado com sucesso!');

       PageControl1.Pages[1].Enabled := false;
       PageControl1.Pages[2].Enabled := true;

       FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

       FormAtendimentos.qBuscaAtendimentos.Refresh;

       ShowMessage('Etapa concluída!');

       Close;
     End;

   End
   Else
   Begin
     MessageDlg('Veículo ainda não avaliado', mtWarning, [mbok] , 0);
     Abort;
   End;
 End
 Else
 Begin
     MessageDlg('Atendimento não possui agendamento ainda', mtWarning, [mbok] , 0);
     Abort;
 End;

end;

procedure TFormDetalhesAtendimento.img_del_agnClick(Sender: TObject);
begin

 {if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
 Begin

   if MessageDlg('Deseja retirar do agendamento o registro selecionado?', mtInformation, [mbno, mbyes] , 0) = mrYes then
   Begin
    qDeletaAgendamento.SQL.Clear;
    qDeletaAgendamento.SQL.Add('delete from tbcompras_agendamento where id = :id');
    qDeletaAgendamento.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    qDeletaAgendamento.Execute;

    qBuscaAgendamento.Refresh;
   End;

 End;
  }
end;

procedure TFormDetalhesAtendimento.img_send_avaliadorClick(Sender: TObject);
begin

 if FormAgendamentoViita = nil then
 Begin
   FormAgendamentoViita := tFormAgendamentoViita.Create(self);
 End;

 if ComboBoxAvaliadores.Text <> '' then
 Begin
   FormAgendamentoViita.qInsereAgendamento.SQL.Clear;
   FormAgendamentoViita.qInsereAgendamento.SQL.Add('insert into tbcompras_agendamento (id_atendimento, descricao, vistoriador, placa, cliente,');
   FormAgendamentoViita.qInsereAgendamento.SQL.Add('telefone, endereco, cidade, uf, obs, usuario, status, concluido)');
   FormAgendamentoViita.qInsereAgendamento.SQL.Add('values (:id, :desc, :vistoriador, :placa, :cliente, :fone, :end, :cid, :uf, :obs, :usu,');
   FormAgendamentoViita.qInsereAgendamento.SQL.Add(':status, 0)');
   FormAgendamentoViita.qInsereAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('desc').Text := 'ATN PLACA: '+FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text+' | VISTORIADOR: '+ComboBoxAvaliadores.Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('vistoriador').Text := ComboBoxAvaliadores.Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('placa').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('cliente').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('nome').Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('fone').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('telefone').Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('end').Text := '';
   FormAgendamentoViita.qInsereAgendamento.ParamByName('cid').Text := '';
   FormAgendamentoViita.qInsereAgendamento.ParamByName('uf').Text := '';
   FormAgendamentoViita.qInsereAgendamento.ParamByName('obs').Text := 'Agendar vistoria do veículo com o cliente';
   FormAgendamentoViita.qInsereAgendamento.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
   FormAgendamentoViita.qInsereAgendamento.ParamByName('status').Text := 'pendente';
   FormAgendamentoViita.qInsereAgendamento.ExecSQL;

   FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ 'Pendente' + #13 +
                                                                 'Vistoriador: '+ComboBoxAvaliadores.Text;
   FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clGreen;

   qEnviaNotif.SQL.Clear;
   qEnviaNotif.SQL.Add('insert into tbnotificacoes (data, usuario_remetente, usuario_destinatario, obs, lido, titulo, PLACA)');
   qEnviaNotif.SQL.Add('values (:dt, :remetente, :destinatario, :obs, 0, :tit, :placa)');
   qEnviaNotif.ParamByName('dt').AsDate         := NOW;
   qEnviaNotif.ParamByName('remetente').Text    := FormLoginSavauto.EditUsuario.Text;
   qEnviaNotif.ParamByName('destinatario').Text := ComboBoxAvaliadores.Text;
   qEnviaNotif.ParamByName('obs').Text          := 'Agendar vistoria com o cliente, verifique suas notificações na tela principal do App para mais detalhes';
   qEnviaNotif.ParamByName('tit').Text          := 'Agendamento';
   qEnviaNotif.ParamByName('placa').Text        := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text;
   qEnviaNotif.ExecSQL;

   qBuscaAgendamento.Close;
   qBuscaAgendamento.Open;
   qBuscaAgendamento.Filter := 'PLACA='+QuotedStr(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text);
   qBuscaAgendamento.Filtered := true;

   MessageDlg('Agendamento criado para o vistoriador', mtInformation, [mbok] , 0);
 End;

end;

procedure TFormDetalhesAtendimento.img_verifica_avaliacaoClick(Sender: TObject);
begin

    DataModuleBancoVistoria.qVerificaAvaliacoes.SQL.Clear;
    DataModuleBancoVistoria.qVerificaAvaliacoes.SQL.Add('select * from tbavaliacoes where placa=:pl and avaliacao > 0');
    DataModuleBancoVistoria.qVerificaAvaliacoes.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
    DataModuleBancoVistoria.qVerificaAvaliacoes.Open;

    if DataModuleBancoVistoria.qVerificaAvaliacoes.RecordCount > 0 then
    Begin
     if MessageDlg('Veículo avaliado pelo time de gestão, com a avaliação: ' + #13 +
                   'R$: '+ CurrToStr(DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency) + #13 +
                   'Deseja assumir esta avaliação do veículo?' , mtInformation, [mbno, mbyes] , 0 ) = mrYes then
     Begin
     qAtualizaValorAvaliacao.SQL.Clear;
     qAtualizaValorAvaliacao.SQL.Add('update tbcompras_atendimento set ID_AVALIACAO=:id, VlrAvaliacao=:Vlr where placa=:pl');
     qAtualizaValorAvaliacao.ParamByName('id').AsInteger :=   DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('id').AsInteger;
     qAtualizaValorAvaliacao.ParamByName('Vlr').AsCurrency := DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency;
     qAtualizaValorAvaliacao.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
     qAtualizaValorAvaliacao.Execute;

     qAtualizaValorAvaliacao.SQL.Clear;
     qAtualizaValorAvaliacao.SQL.Add('update tbcompras_agendamento set status=:sts, concluido = 1 where placa=:pl');
     qAtualizaValorAvaliacao.ParamByName('sts').Text := 'concluido';
     qAtualizaValorAvaliacao.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
     qAtualizaValorAvaliacao.Execute;

     EditAvaliacaoAgendamento.Enabled := false;

     //qBuscaAgendamento.Refresh;

     EditAvaliacaoAgendamento.Text := CurrToStr(DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency);

     FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

     Image13Click(sender);
     End;
    End
    Else
    Begin
     MessageDlg('Placa ainda não avaliada', mtWarning, [mbok], 0);
    End;

end;

procedure TFormDetalhesAtendimento.Label30Click(Sender: TObject);
begin

    DataModuleBancoVistoria.qVerificaAvaliacoes.SQL.Clear;
    DataModuleBancoVistoria.qVerificaAvaliacoes.SQL.Add('select * from tbavaliacoes where placa=:pl and avaliacao > 0');
    DataModuleBancoVistoria.qVerificaAvaliacoes.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
    DataModuleBancoVistoria.qVerificaAvaliacoes.Open;

    if DataModuleBancoVistoria.qVerificaAvaliacoes.RecordCount > 0 then
    Begin
     if MessageDlg('Veículo avaliado pelo time de gestão, com a avaliação: ' + #13 +
                   'R$: '+ CurrToStr(DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency) + #13 +
                   'Deseja assumir esta avaliação do veículo?' , mtInformation, [mbno, mbyes] , 0 ) = mrYes then
     Begin
     qAtualizaValorAvaliacao.SQL.Clear;
     qAtualizaValorAvaliacao.SQL.Add('update tbcompras_atendimento set ID_AVALIACAO=:id, VlrAvaliacao=:Vlr where placa=:pl');
     qAtualizaValorAvaliacao.ParamByName('id').AsInteger :=   DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('id').AsInteger;
     qAtualizaValorAvaliacao.ParamByName('Vlr').AsCurrency := DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency;
     qAtualizaValorAvaliacao.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
     qAtualizaValorAvaliacao.Execute;

     qAtualizaValorAvaliacao.SQL.Clear;
     qAtualizaValorAvaliacao.SQL.Add('update tbcompras_agendamento set status=:sts, concluido = 1 where placa=:pl');
     qAtualizaValorAvaliacao.ParamByName('sts').Text := 'concluido';
     qAtualizaValorAvaliacao.ParamByName('pl').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
     qAtualizaValorAvaliacao.Execute;

     EditAvaliacaoAgendamento.Enabled := false;

     //qBuscaAgendamento.Refresh;

     EditAvaliacaoAgendamento.Text := CurrToStr(DataModuleBancoVistoria.qVerificaAvaliacoes.FieldByName('avaliacao').AsCurrency);

     FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

     Image13Click(sender);
     End;
    End
    Else
    Begin
     MessageDlg('Placa ainda não avaliada', mtWarning, [mbok], 0);
    End;

end;

procedure TFormDetalhesAtendimento.Image15Click(Sender: TObject);
Var
 ID : Integer;
begin

  ID := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;

 if EditStatusChamado.Text <> 'Aguardando Documentos' then
 Begin
    MessageDlg('Etapa não pode ser concluída, pois atendimento não encontra-se Aguardando Documentos.', mtError, [mbok] , 0);
 End
 Else
 Begin
    if MessageDlg('Deseja salvar os dados?',
                  mtInformation, [mbno, mbyes] , 0 ) = mrYes then
   Begin

     if ComboTipoDocumentos.Text <>  '' then
     Begin
        if ComboTipoDocumentos.Text = 'Com Transferência' then
        Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboValidDescIPVA.Text <> '' then
               Begin
                 if ComboValidDescTransf.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin

                         qValidaDado.SQL.Clear;
                         qValidaDado.SQL.Add('select count(*) existe from tbcompras_doc where id_atendimento=:id');
                         qValidaDado.ParamByName('id').AsInteger := ID;
                         qValidaDado.Open;

                         if qValidaDado.FieldByName('existe').AsInteger >= 1 then
                         Begin

                          qAtualizaStatus.SQL.Clear;
                          qAtualizaStatus.SQL.Add('update tbcompras_doc set ');
                          qAtualizaStatus.SQL.Add('tipo=:tipo,');
                          qAtualizaStatus.SQL.Add('dut_em_branco=:dt_b,');
                          qAtualizaStatus.SQL.Add('dut_nome_cliente=:dt_c,');
                          qAtualizaStatus.SQL.Add('valida_desc_transf=:v_transf,');
                          qAtualizaStatus.SQL.Add('valida_desc_ipva=:v_ipva,');
                          qAtualizaStatus.SQL.Add('procuracao=:procuracao,');
                          qAtualizaStatus.SQL.Add('recibo=:recibo,');
                          qAtualizaStatus.SQL.Add('ar_funcionando=:ar,');
                          qAtualizaStatus.SQL.Add('motor_em_condicoes=:motor,');
                          qAtualizaStatus.SQL.Add('avarias=:avarias');
                          qAtualizaStatus.SQL.Add('where id_atendimento=:id');
                          qAtualizaStatus.ParamByName('id').AsInteger := ID;
                          qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                          qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                          qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                          qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                          qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                          qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                          qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                          qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                          qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                          qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                          qAtualizaStatus.Execute;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         FormAtendimentos.AtualizaChamado(ID);

                         ShowMessage('Chamado atualizado com sucesso!');

                         End
                         ELse
                         Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('insert into tbcompras_doc (id_atendimento, tipo, dut_em_branco, dut_nome_cliente,');
                         qAtualizaStatus.SQL.Add('valida_desc_transf, valida_desc_ipva, procuracao, recibo, ar_funcionando,');
                         qAtualizaStatus.SQL.Add('motor_em_condicoes, avarias)');
                         qAtualizaStatus.SQL.Add('values (:id, :tipo, :dt_b, :dt_c, :v_transf, :v_ipva, :procuracao, :recibo, :ar,');
                         qAtualizaStatus.SQL.Add(':motor, :avarias)');
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                         qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                         qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                         qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                         qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                         qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                         qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                         qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                         qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                         qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                         qAtualizaStatus.ExecSQL;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         if FormParametros.UniTableParametros.Active = false then
                         FormParametros.UniTableParametros.Active := True;

                         EditTransferencia.Text := CurrToStr(FormParametros.UniTableParametrosvlrTransf.AsCurrency);
                         EditTransferencia.Enabled := false;

                         ShowMessage('Chamado atualizado com sucesso!');

                        End
                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo VALIDAR DESCONTO TRANSFERENCIA em branco', mtError, [mbok] , 0);
                   //ComboValidDescTransf.SetFocus;
               End
                Else
                 MessageDlg('Campo VALIDAR DESCONTO IPVA em branco', mtError, [mbok] , 0);
                 //ComboValidDescIPVA.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;
        End
         Else
         Begin
           if ComboDutBranco.Text <> '' then
           Begin
             if ComboDutNomeClie.Text <> '' then
             Begin
               if ComboProcuracao.Text <> '' then
               Begin
                 if ComboRecibo.Text <> '' then
                 Begin
                   if ComboArFunc.Text <> '' then
                   Begin
                     if ComboMotorCond.Text <> '' then
                     Begin
                       if ComboAvarias.Text <> '' then
                       Begin

                         qValidaDado.SQL.Clear;
                         qValidaDado.SQL.Add('select count(*) existe from tbcompras_doc where id_atendimento=:id');
                         qValidaDado.ParamByName('id').AsInteger := ID;
                         qValidaDado.Open;

                         if qValidaDado.FieldByName('existe').AsInteger >= 1 then
                         Begin

                          qAtualizaStatus.SQL.Clear;
                          qAtualizaStatus.SQL.Add('update tbcompras_doc set ');
                          qAtualizaStatus.SQL.Add('tipo=:tipo,');
                          qAtualizaStatus.SQL.Add('dut_em_branco=:dt_b,');
                          qAtualizaStatus.SQL.Add('dut_nome_cliente=:dt_c,');
                          qAtualizaStatus.SQL.Add('valida_desc_transf=:v_transf,');
                          qAtualizaStatus.SQL.Add('valida_desc_ipva=:v_ipva,');
                          qAtualizaStatus.SQL.Add('procuracao=:procuracao,');
                          qAtualizaStatus.SQL.Add('recibo=:recibo,');
                          qAtualizaStatus.SQL.Add('ar_funcionando=:ar,');
                          qAtualizaStatus.SQL.Add('motor_em_condicoes=:motor,');
                          qAtualizaStatus.SQL.Add('avarias=:avarias');
                          qAtualizaStatus.SQL.Add('where id_atendimento=:id');
                          qAtualizaStatus.ParamByName('id').AsInteger := ID;
                          qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                          qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                          qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                          qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                          qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                          qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                          qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                          qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                          qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                          qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                          qAtualizaStatus.Execute;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         FormAtendimentos.AtualizaChamado(ID);

                         ShowMessage('Chamado atualizado com sucesso!');

                         End
                         ELse
                         Begin

                         qAtualizaStatus.SQL.Clear;
                         qAtualizaStatus.SQL.Add('insert into tbcompras_doc (id_atendimento, tipo, dut_em_branco, dut_nome_cliente,');
                         qAtualizaStatus.SQL.Add('valida_desc_transf, valida_desc_ipva, procuracao, recibo, ar_funcionando,');
                         qAtualizaStatus.SQL.Add('motor_em_condicoes, avarias)');
                         qAtualizaStatus.SQL.Add('values (:id, :tipo, :dt_b, :dt_c, :v_transf, :v_ipva, :procuracao, :recibo, :ar,');
                         qAtualizaStatus.SQL.Add(':motor, :avarias)');
                         qAtualizaStatus.ParamByName('id').AsInteger := ID;
                         qAtualizaStatus.ParamByName('tipo').Text := ComboTipoDocumentos.Text;
                         qAtualizaStatus.ParamByName('dt_b').Text := ComboDutBranco.Text;
                         qAtualizaStatus.ParamByName('dt_c').Text := ComboDutNomeClie.Text;
                         qAtualizaStatus.ParamByName('v_transf').Text := ComboValidDescTransf.Text;
                         qAtualizaStatus.ParamByName('v_ipva').Text := ComboValidDescIPVA.Text;
                         qAtualizaStatus.ParamByName('procuracao').Text := ComboProcuracao.Text;
                         qAtualizaStatus.ParamByName('recibo').Text := ComboRecibo.Text;
                         qAtualizaStatus.ParamByName('ar').Text := ComboArFunc.Text;
                         qAtualizaStatus.ParamByName('motor').Text := ComboMotorCond.Text;
                         qAtualizaStatus.ParamByName('avarias').Text := ComboAvarias.Text;
                         qAtualizaStatus.ExecSQL;

                         qAtualizaStatus.sql.Clear;
                         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set documentos = 1 where id_atendimento = :ID');
                         qAtualizaStatus.ParamByName('ID').AsInteger := ID;
                         qAtualizaStatus.Execute;

                         FormAtendimentos.AtualizaChamado(ID);

                         ShowMessage('Chamado atualizado com sucesso!');
                        End
                       End
                       Else
                        MessageDlg('Campo AVARIAS em branco', mtError, [mbok] , 0);
                        //ComboAvarias.SetFocus;
                     End
                     Else
                      MessageDlg('Campo CONDIÇÕES DO MOTOR em branco', mtError, [mbok] , 0);
                      //ComboMotorCond.SetFocus;
                   End
                    Else
                     MessageDlg('Campo AR CONDICIONADO em branco', mtError, [mbok] , 0);
                     //ComboArFunc.SetFocus;
                 End
                  Else
                   MessageDlg('Campo RECIBO em branco', mtError, [mbok] , 0);
                   //ComboRecibo.SetFocus;
               End
                Else
                 MessageDlg('Campo PROCURAÇÃO em branco', mtError, [mbok] , 0);
                 //ComboProcuracao.SetFocus;
             End
              Else
               MessageDlg('Campo DUT EM NOME DO CLIENTE em branco', mtError, [mbok] , 0);
               //ComboDutNomeClie.SetFocus;
           End
            Else
             MessageDlg('Campo DUT EM BRANCO em branco', mtError, [mbok] , 0);
             //ComboDutBranco.SetFocus;

         End
     End
      Else
       MessageDlg('Campo TIPO em branco', mtError, [mbok] , 0);
       //ComboTipoDocumentos.SetFocus;

   End;
 End;
end;

procedure TFormDetalhesAtendimento.Image16Click(Sender: TObject);
begin

   GravaMultasAtendimento(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

end;

procedure TFormDetalhesAtendimento.Image17Click(Sender: TObject);
begin

 FormInformacoes.Position := poScreenCenter;
 FormInformacoes.ShowModal;

end;

procedure TFormDetalhesAtendimento.Image18Click(Sender: TObject);
begin

  FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

   CarregaPgto( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger );

   FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;
   FormSeguroIPVALic.qBuscaDocs.Active := false;
   FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

end;

procedure TFormDetalhesAtendimento.Image19Click(Sender: TObject);
begin

  if StrToCurr(EditAvaliacaoAgendamento.Text) > 0 then
  Begin

    qAvaliaVeiculo.SQL.Clear;
    qAvaliaVeiculo.SQL.Add('update tbcompras_atendimento set VlrAvaliacao=:vl where id=:id');
    qAvaliaVeiculo.ParamByName('vl').AsCurrency := StrToCurr(EditAvaliacaoAgendamento.Text);
    qAvaliaVeiculo.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
    qAvaliaVeiculo.Execute;

    lblStatusAvaliacao.Caption := 'Veículo Avaliado';
    lblStatusAvaliacao.Refresh;

    MessageDlg('Veículo avaliado com sucesso!', mtInformation, [mbok] , 0);

  End;

end;

procedure TFormDetalhesAtendimento.Image1Click(Sender: TObject);
begin

 if FormAtendimentoMultasVeiculo = nil then
 Begin
   FormAtendimentoMultasVeiculo := TFormAtendimentoMultasVeiculo.Create(self);
 End;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Filter := 'id_atendimento='+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormAtendimentoMultasVeiculo.qBuscaMultas.Filtered := true;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Active := true;

 FormAtendimentoMultasVeiculo.Position := poScreenCenter;
 FormAtendimentoMultasVeiculo.ShowModal;

end;

procedure TFormDetalhesAtendimento.Image2Click(Sender: TObject);
begin

 if FormSeguroIPVALic = nil then
 Begin
   FormSeguroIPVALic := TFormSeguroIPVALic.Create(self);
 End;

 FormSeguroIPVALic.qBuscaDocs.Active := false;

 FormSeguroIPVALic.qBuscaDocs.Filter := 'id_atendimento = '+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormSeguroIPVALic.qBuscaDocs.Filtered := true;

 FormSeguroIPVALic.qBuscaDocs.Active := true;

 FormSeguroIPVALic.Position := poScreenCenter;
 FormSeguroIPVALic.ShowModal;

end;

procedure TFormDetalhesAtendimento.Image3Click(Sender: TObject);
begin

 if FormQuitacoesVeiculo = nil then
 Begin
   FormQuitacoesVeiculo := TFormQuitacoesVeiculo.Create(self);
 End;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Filter := 'id_atendimento='+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormQuitacoesVeiculo.qBuscaQuitacoes.Filtered := true;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Active := true;

 FormQuitacoesVeiculo.Position := poScreenCenter;
 FormQuitacoesVeiculo.ShowModal;

end;

procedure TFormDetalhesAtendimento.img_add_agnClick(Sender: TObject);
var
 Hoje: TDate;
begin

 if ComboBoxAvaliadores.Text = '' then
 Begin
   MessageDlg('Selecione um avaliador', mtError, [mbok] , 0);
   Abort;
 End;

 Hoje := NOW;

 if FormAgendamentoViita = nil then
 Begin
   FormAgendamentoViita := TFormAgendamentoViita.Create(self);
 End;

 qValidaPgto.SQL.Clear;
 qValidaPgto.SQL.Add('select count(*) as existe from tbcompras_agendamento where id_atendimento = :id');
 qValidaPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
 qValidaPgto.Open;

 if qValidaPgto.FieldByName('existe').AsInteger >= 1 then
 Begin

  qValidaPgto.SQL.Clear;
  qValidaPgto.SQL.Add('select * from tbcompras_agendamento where id_atendimento = :id');
  qValidaPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  qValidaPgto.Open;

  MessageDlg('Agendamento já feito para o cliente na data : '+ DateToStr(qValidaPgto.FieldByName('data').AsDateTime)+
             ' para o vistoriador: '+qValidaPgto.FieldByName('vistoriador').Text, mtInformation, [mbok] , 0);

             Abort;

 End
 Else
 Begin

 if EditEndereco.Text <> '' then
 Begin
  if EditCidade.Text <> '' then
   Begin
      if EditUF.Text <> '' then
       Begin

         Var data: TDateTime;

         data := DateTimePicker1.Date;

         qInsereAgendamento.SQL.Clear;
         qInsereAgendamento.SQL.Add('insert into tbcompras_agendamento (id_atendimento, descricao, data, vistoriador, placa, cliente,');
         qInsereAgendamento.SQL.Add('telefone, endereco, cidade, uf, obs, usuario, status, concluido)');
         qInsereAgendamento.SQL.Add('values (:id, :desc, :dt, :vistoriador, :placa, :cliente, :fone, :end, :cid, :uf, :obs, :usu,');
         qInsereAgendamento.SQL.Add(':status, 0)');
         qInsereAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qInsereAgendamento.ParamByName('desc').Text := 'ATN PLACA: '+ FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text +' | VISTORIADOR:'+ComboBoxAvaliadores.Text;
         if checkSdata.Checked = true then
         qInsereAgendamento.ParamByName('dt').Value := Null
         Else
         qInsereAgendamento.ParamByName('dt').AsDateTime := data;
         qInsereAgendamento.ParamByName('vistoriador').Text := ComboBoxAvaliadores.Text;
         qInsereAgendamento.ParamByName('placa').Text := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
         qInsereAgendamento.ParamByName('cliente').Text := EditCliente.Text;
         qInsereAgendamento.ParamByName('fone').Text := EditTelefone.Text;
         qInsereAgendamento.ParamByName('end').Text := EditEndereco.Text;
         qInsereAgendamento.ParamByName('cid').Text := EditCidade.Text;
         qInsereAgendamento.ParamByName('uf').Text := EditUF.Text;
         qInsereAgendamento.ParamByName('obs').Text := InputBox('Insira uma OBS caso necessário', '','');
         qInsereAgendamento.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
         qInsereAgendamento.ParamByName('status').Text := 'pendente';
         qInsereAgendamento.ExecSQL;

         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ DateToStr(data) + #13 +
                                                                 'Vistoriador: '+ ComboBoxAvaliadores.Text;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clGreen;

         FormDetalhesAtendimento.qEnviaNotif.SQL.Clear;
         FormDetalhesAtendimento.qEnviaNotif.SQL.Add('insert into tbnotificacoes (data, usuario_remetente, usuario_destinatario, obs, lido, titulo, PLACA)');
         FormDetalhesAtendimento.qEnviaNotif.SQL.Add('values (:dt, :remetente, :destinatario, :obs, 0, :tit, :placa)');
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('dt').AsDate         := NOW;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('remetente').Text    := FormLoginSavauto.EditUsuario.Text;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('destinatario').Text := ComboBoxAvaliadores.Text;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('obs').Text          := 'Agendar vistoria com o cliente, verifique suas notificações na tela principal do App para mais detalhes';
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('tit').Text          := 'Agendamento';
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('placa').Text        := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text;
         FormDetalhesAtendimento.qEnviaNotif.ExecSQL;

         FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

         MessageDlg('Foi gerada uma notificação para o usuário ' + ComboBoxAvaliadores.Text+ ' automática ', mtInformation, [mbok] , 0);

         EditEndereco.Text := '';
         EditCidade.Text := '';
         EditUF.Text := '';

         ComboBoxAvaliadores.Text := '';

         Close;

       End;
   End;
 End;

 End;
end;

procedure TFormDetalhesAtendimento.ImageVoltarDocClick(Sender: TObject);
begin
 if EditStatusChamado.Text = 'Concluido' then
 Begin

   MessageDlg('O chamado já foi concluído e o pagamento efetuado, contate o adm para analisar o caso.', mtInformation, [mbok] , 0);
   Abort;

 End
 Else
 Begin

     FormDetalhesAtendimento.qValidaPgto.SQL.Clear;
     FormDetalhesAtendimento.qValidaPgto.SQL.Add('select count(*) existe from tbcompras_agendamento where id_atendimento=:id');
     FormDetalhesAtendimento.qValidaPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
     FormDetalhesAtendimento.qValidaPgto.Open;

     if FormDetalhesAtendimento.qValidaPgto.FieldByName('existe').AsInteger >=1 then
     Begin
       FormDetalhesAtendimento.qValidaPgto.SQL.Clear;
       FormDetalhesAtendimento.qValidaPgto.SQL.Add('select * from tbcompras_agendamento where id_atendimento=:id');
       FormDetalhesAtendimento.qValidaPgto.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
       FormDetalhesAtendimento.qValidaPgto.Open;

       if FormDetalhesAtendimento.qValidaPgto.FieldByName('data').AsDateTime <> StrToDate('30/12/1899') then
       Begin

         FormDetalhesAtendimento.DateTimeAgendamento.Date := FormDetalhesAtendimento.qValidaPgto.FieldByName('data').AsDateTime;

         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ DateToStr( FormDetalhesAtendimento.qValidaPgto.FieldByName('data').AsDateTime ) + #13 +
                                                                   'Vistoriador: '+FormDetalhesAtendimento.qValidaPgto.FieldByName('vistoriador').Text;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clGreen;

       End
       Else
       Begin

         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ 'Aguardando vistoriador' + #13 +
                                                                   'Vistoriador: '+FormDetalhesAtendimento.qValidaPgto.FieldByName('vistoriador').Text;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clRed;
       End;
       //FormDetalhesAtendimento.CalendarView1.OnClick(sender);

       EditStatusChamado.Text := 'Aguardando Agendamento';

     End;

     PageControl1.Pages[0].Enabled := false;
     PageControl1.Pages[1].Enabled := false;
     PageControl1.Pages[2].Enabled := true;
     PageControl1.Pages[3].Enabled := false;

     Close;

 End;

end;

procedure TFormDetalhesAtendimento.img_busca_obsClick(Sender: TObject);
begin

 if FormHistoricoObsAtn = nil then
 Begin
   FormHistoricoObsAtn := TFormHistoricoObsAtn.Create(self);
 End;


 FormHistoricoObsAtn.qBuscaAtendimento.Filter := 'id_atendimento='+QuotedStr(IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
 FormHistoricoObsAtn.qBuscaAtendimento.Filtered := true;

 FormHistoricoObsAtn.Position := poScreenCenter;
 FormHistoricoObsAtn.ShowModal;

end;

procedure TFormDetalhesAtendimento.Image5Click(Sender: TObject);
begin
 qValidaDados.SQL.Clear;
 qValidaDados.SQL.Add('select documentos from tbcompras_hist_status_atendimento where id_atendimento=:ID');
 qValidaDados.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
 qValidaDados.Open;

 if qValidaDados.FieldByName('documentos').AsInteger = 1 then
 Begin

   if MessageDlg('Deseja mesmo reabrir o lançamento de Documentações do Atendimento?' + #13 +
   '*** Uma vez aberto, os campos serão liberados para edição, e só poderá proceder salvando a tela ***', mtInformation, [mbno, mbyes] , 0) = mryes
   Then
   Begin
   // Reabre tela de lançamento dos documentos
   // Bolar algo para dizer que esta editando
   // e nao deixar sair da tela de documentos sem salvar (botao??)

    btnSalvaEdicaoDocumentos.Visible := true;

   ComboTipoDocumentos.Enabled := true;
   ComboDutBranco.Enabled := true;
   ComboDutNomeClie.Enabled := true;
   ComboValidDescTransf.Enabled := true;
   ComboProcuracao.Enabled := true;
   ComboValidDescIPVA.Enabled := true;
   ComboArFunc.Enabled := true;
   ComboMotorCond.Enabled := true;
   ComboAvarias.Enabled := true;
   ComboRecibo.Enabled := true;

   PageControl1.ActivePage := Tab_documentacao;

                         PageControl1.Pages[0].Enabled := TRUE;
                         PageControl1.Pages[1].Enabled := false;
                         PageControl1.Pages[2].Enabled := false;
                         PageControl1.Pages[3].Enabled := false;


                         Close;
   End;

 End
 Else
 Begin

  MessageDlg('Chamado não possuí histórico de inicialização dos documentos ou não possuí documentos lançados.', mtWarning, [mbok] , 0);

 End;

end;

procedure TFormDetalhesAtendimento.Image6Click(Sender: TObject);
begin

   qValidaDados.SQL.Clear;
   qValidaDados.SQL.Add('select verificacao from tbcompras_hist_status_atendimento where id_atendimento=:ID');
   qValidaDados.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qValidaDados.Open;

 if qValidaDados.FieldByName('verificacao').AsInteger = 1 then
 Begin

   if MessageDlg('Deseja mesmo reabrir o lançamento de Documentações do Atendimento?' + #13 +
   '*** Uma vez aberto, os campos serão liberados para edição, e só poderá proceder salvando a tela ***', mtInformation, [mbno, mbyes] , 0) = mryes
   Then
   Begin

     ImageVoltarDoc.Visible := false;

     ComboLeilao.Enabled := true;
     ComboDivProprietario.Enabled := true;
     ComboJusTrabalho.Enabled := true;
     ComboConsultaFederal.Enabled := true;
     ComboConsultaEstadual.Enabled := true;
     EditTransferencia.Enabled := true;
     EditSegDUT.Enabled := true;

    qAtualizaStatus.SQL.Clear;
    qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 50 where id_atendimento = :id');
    qAtualizaStatus.ParamByName('status').Text  := 'Aguardando Verificação';
    qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
    qAtualizaStatus.Execute;

    ProgressBar.Position := 50;
    lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 50 %';
    EditStatusChamado.Text := 'Aguardando Verificação';

    qAtualizaStatus.sql.Clear;
    qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
    qAtualizaStatus.ParamByName('status').Text := 'Aguardando Verificação';
    qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
    qAtualizaStatus.Execute;

    FormAtendimentos.qBuscaAtendimentos.Refresh;

     PageControl1.ActivePage := Tab_verific_cadastral;

     PageControl1.Pages[0].Enabled := false;
     PageControl1.Pages[1].Enabled := FALSE;
     PageControl1.Pages[2].Enabled := TRUE;
     PageControl1.Pages[3].Enabled := false;

   CarregaPgto( FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger );

   FormAtendimentoMultasVeiculo.qBuscaMultas.Active := false;
   FormSeguroIPVALic.qBuscaDocs.Active := false;
   FormQuitacoesVeiculo.qBuscaQuitacoes.Active := false;

   Close;

   End;

 End
 Else
 Begin

  MessageDlg('Chamado não possuí histórico de inicialização de verificacao ou não possuí verificacao lançados.', mtWarning, [mbok] , 0);

 End;

end;

procedure TFormDetalhesAtendimento.Image9Click(Sender: TObject);
begin

 if Memo1.Text <> '' then
 Begin

   qCancelaAtn.SQL.Clear;
   qCancelaAtn.SQL.Add('update tbcompras_atendimento set Ult_sit = situacao, situacao=:sts, obs=:motivo, usuario=:usuario where id=:id');
   qCancelaAtn.ParamByName('sts').Text := 'Cancelado';
   qCancelaAtn.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
   qCancelaAtn.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qCancelaAtn.ParamByName('motivo').Text := Memo1.Text;
   qCancelaAtn.Execute;

   qCancelaAtn.SQL.Clear;
   qCancelaAtn.SQL.Add('update tbcompras_hist_status_atendimento set cancelado=1 where id_atendimento=:id');
   qCancelaAtn.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qCancelaAtn.Execute;

   qCancelaAtn.SQL.Clear;
   qCancelaAtn.SQL.Add('update tbcompras_status_atendimento set status_nome=:sts, valor = 0 where id_atendimento=:id');
   qCancelaAtn.ParamByName('sts').Text := 'Cancelado';
   qCancelaAtn.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qCancelaAtn.Execute;

   lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 0%';

   PageControl1.Pages[0].Enabled := false;
   PageControl1.Pages[1].Enabled := false;
   PageControl1.Pages[2].Enabled := false;
   PageControl1.Pages[3].Enabled := false;
   PageControl1.Pages[4].Enabled := true;

   ProgressBar.Position := 0;

   FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   Close;

 End
 Else
 BEgin
   MessageDlg('Favor preencher os dados do motivo da desistência do cliente!', mtWarning, [mbok] , 0);
 End;

end;

procedure TFormDetalhesAtendimento.img_concluir_pgtoClick(Sender: TObject);
begin

 if EditStatusChamado.Text = 'Concluido' then
 Begin
   MessageDlg('O chamado já foi concluído e o pagamento efetuado, contate o adm para analisar o caso.', mtInformation, [mbok] , 0);
   Abort;
 End
 Else

 if EditStatusChamado.Text <> 'Aguardando Pagamento' then
 Begin
    MessageDlg('Etapa não pode ser concluída, pois atendimento não encontra-se Aguardando Pagamento.', mtError, [mbok] , 0);
    Abort;
 End
 Else
 Begin

   qConcluiPagamento.SQL.Clear;
   qConcluiPagamento.SQL.Add('update tbcompras_pagamento set data_pgto = :Dt_pgto, valor_pgto=:vlr, usuario_pgto=:usu, obs=:obs where id_atendimento=:id');
   qConcluiPagamento.ParamByName('Dt_pgto').AsDateTime := NOW;
   qConcluiPagamento.ParamByName('vlr').AsCurrency := 1;
   qConcluiPagamento.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
   qConcluiPagamento.ParamByName('obs').Text := '';
   qConcluiPagamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qConcluiPagamento.Execute;

   PanelTopoStatusPgto.Color := clGreen;
   lblStatusPagamento.Caption := 'PAGAMENTO EFETUADO';
   lblStatusPagamento.Font.Color := clWhite;
   FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 100 %';
   ProgressBar.Position := 100;

   EditUsurioConcPgto.Text := FormLoginSavauto.EditUsuario.Text;

   FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

   MessageDlg('Pagamento efetuado com sucesso!', mtInformation, [mbok] , 0);

   // Processos para inserir S transf  >>> Aguardando Verificação
   qAtualizaStatus.SQL.Clear;
   qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 100 where id_atendimento = :id');
   qAtualizaStatus.ParamByName('status').Text  := 'Concluido';
   qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qAtualizaStatus.Execute;

   ProgressBar.Position := 100;
   EditStatusChamado.Text := 'Concluido';

   qAtualizaStatus.sql.Clear;
   qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
   qAtualizaStatus.ParamByName('status').Text := 'Concluido';
   qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qAtualizaStatus.Execute;

   qAtualizaStatus.sql.Clear;
   qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set pagamento = 1 where id_atendimento = :ID');
   qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qAtualizaStatus.Execute;

   PageControl1.ActivePage := Tab_pagamento;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   Close;

 End;


end;

end.
