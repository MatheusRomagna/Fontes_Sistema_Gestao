unit UFormAtendimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni, DateUtils, ComObj,
  frxClass, frxDBSet, frxExportPDF, frxExportMail, frxExportXLS,
  frxExportBaseDialog, frxExportCSV, Vcl.Menus;

type
  TFormAtendimentos = class(TForm)
    Panel1: TPanel;
    DateTimePickerInicial: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label3: TLabel;
    ComboOperador: TComboBox;
    Label4: TLabel;
    EditPlaca: TEdit;
    Label5: TLabel;
    EditModelo: TEdit;
    Label6: TLabel;
    ComboSituacao: TComboBox;
    Panel2: TPanel;
    img_criar: TImage;
    DBGridAtendimentos: TDBGrid;
    img_pesquisar: TImage;
    qBuscaOperadores: TUniQuery;
    qBuscaAtendimentos: TUniQuery;
    DataSourceAtendimentos: TDataSource;
    qBuscaAtendimentosid: TIntegerField;
    qBuscaAtendimentosnome: TStringField;
    qBuscaAtendimentostelefone: TStringField;
    qBuscaAtendimentosplaca: TStringField;
    qBuscaAtendimentosmodelo: TStringField;
    qBuscaAtendimentosmidia: TStringField;
    qBuscaAtendimentoscod_anuncio: TStringField;
    qBuscaAtendimentosano_modelo: TStringField;
    qBuscaAtendimentosfipe: TFloatField;
    qBuscaAtendimentoscod_fipe: TStringField;
    qBuscaAtendimentosproposta: TFloatField;
    qBuscaAtendimentossituacao: TStringField;
    qBuscaAtendimentosusuario: TStringField;
    qBuscaAtendimentoscod_usuario: TIntegerField;
    qBuscaAtendimentosQtdDias: TIntegerField;
    Image1: TImage;
    qBuscaAtendimentosData: TDateTimeField;
    CheckDatas: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Image3: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    frxCSVExport1: TfrxCSVExport;
    frxXLSExport1: TfrxXLSExport;
    frxMailExport1: TfrxMailExport;
    frxPDFExport1: TfrxPDFExport;
    frxReportAtendimentos: TfrxReport;
    frxDBDatasetAtendimento: TfrxDBDataset;
    MainMenu1: TMainMenu;
    ConfigurarPermisses1: TMenuItem;
    qBuscaAtendimentosVlrAvaliacao: TFloatField;
    qInsereAvaliacaoAgendamento: TUniQuery;
    PopupMenu1: TPopupMenu;
    TrocarUsuario: TMenuItem;
    qVerificaDadosPgto: TUniQuery;
    qBuscaAtendimentosobs: TStringField;
    Alterar1: TMenuItem;
    MidiaAnuncio1: TMenuItem;
    DadosdoCliente1: TMenuItem;
    Placa1: TMenuItem;
    Veculo1: TMenuItem;
    PropostaR1: TMenuItem;
    Label1: TLabel;
    EditDiasSemAcao: TEdit;
    qAtualizaStatus: TUniQuery;
    qBuscaAtendimentosdt_alteracao: TDateTimeField;
    Label2: TLabel;
    EditIDAtnd: TEdit;
    procedure img_criarClick(Sender: TObject);
    procedure DBGridAtendimentosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure DBGridAtendimentosDblClick(Sender: TObject);
    procedure img_pesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ConfigurarPermisses1Click(Sender: TObject);
    procedure PopupMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure TrocarUsuarioClick(Sender: TObject);
    procedure MidiaAnuncio1Click(Sender: TObject);
    procedure DadosdoCliente1Click(Sender: TObject);
    procedure Placa1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure PropostaR1Click(Sender: TObject);
    procedure ComboOperadorSelect(Sender: TObject);
    procedure EditIDAtndEnter(Sender: TObject);
  private

    //procedure AtualizaChamado;
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaChamado(id: integer);
  end;

var
  FormAtendimentos: TFormAtendimentos;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaUsuario, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcedePermissao, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDadosPerfil, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormAtendimentoNovo, UFormDetalhesAtendimento,
  UFormPesquisaFipe, FMX.UFormGraficosAtendimento, UDMPermissoes,
  UFormAgendamento, UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo,
  UFormCadaNovoUsuMobile, UFormCadaUsuariosMobile, UFormCruzamentoFipes,
  UFormInformacoes, UFormLiberaPermissao, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormHistoricoObsAtn, UFormLoadingCarregamento,
  UFormNovaAvaliacao, UformNovaObs, UFormRefFipes, UFormDadosPagamento,
  UFormDataPagamento, UFormPagamentoVeiculo, UFormAjusteDadosFipeAvaliacao,
  UFormExtratoPgtoVeiculos, UFormListaUsuarios, UFormMenuFinanceiro,
  UFormPgtoExtratoVeiculo, UFormAlteraMidiaAnuncio, UFormAlteraDadosCliente,
  UFormAlteraPlaca, UFormAlteracaoVeiculo, UFormAlteracaoProposta, UFormAguarde,
  UFormAlteraPermissaoAppTransp, UFormAvariasItens, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCidadesCustos, UFormCriacaoAvaria,
  UFormDadosPgtoTransporte, UFormDetalhesAtendimentoBeta,
  UFormDetalheTransportes, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvarias, UFormGestaoTransporte, UFormListaBancos,
  UFormNovaCidadeCusto, UFormNovoUsuarioTransporte,
  UFormPagamentoEmLoteTransportes, UFormPagamentoTransporte, UFormParametros,
  UFormPermissoesUsuarioAppTransporte;

procedure TFormAtendimentos.Button1Click(Sender: TObject);
begin

 FormDetalhesAtendimento.Show;

end;

procedure TFormAtendimentos.AtualizaChamado(id: integer);
Begin

   DataModuleConexao.qAtualizaChamado.SQL.Clear;
   DataModuleConexao.qAtualizaChamado.SQL.Add('update tbcompras_atendimento set dt_alteracao=:dt where id=:id');
   DataModuleConexao.qAtualizaChamado.ParamByName('id').AsInteger := id;
   DataModuleConexao.qAtualizaChamado.ParamByName('dt').AsDateTime := NOW;
   DataModuleConexao.qAtualizaChamado.Execute;

End;

procedure TFormAtendimentos.ComboOperadorSelect(Sender: TObject);
begin
    qBuscaAtendimentos.SQL.Clear;
    qBuscaAtendimentos.SQL.Add('select id, nome, telefone, placa, modelo, midia, cod_anuncio, ano_modelo,');
    qBuscaAtendimentos.SQL.Add('fipe, cod_fipe, proposta, situacao, usuario, cod_usuario,');
    qBuscaAtendimentos.SQL.Add('QtdDias, Data, VlrAvaliacao, obs, dt_alteracao from tbcompras_atendimento');
    qBuscaAtendimentos.SQL.Add('where 1 = 1');
    if ComboOperador.Text <> '' then
    qBuscaAtendimentos.SQL.Add('and upper(usuario) = '+QuotedStr( UpperCase(ComboOperador.Text) ));
    if ComboSituacao.Text <> '' then
    qBuscaAtendimentos.SQL.Add('and situacao = '+QuotedStr(ComboSituacao.Text));
    if EditPlaca.Text <> '' then
    qBuscaAtendimentos.SQL.Add('AND placa = '+QuotedStr(EditPlaca.Text));
    if EditModelo.Text <> '' then
    qBuscaAtendimentos.SQL.Add('AND modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
    if CheckDatas.Checked = true then
    qBuscaAtendimentos.SQL.Add('AND Data >='+QuotedStr(DateToStr(DateTimePickerInicial.DateTime))+' and Data<= '+QuotedStr(DateToStr(DateTimePickerFinal.DateTime+1)));
    qBuscaAtendimentos.SQL.Add('ORDER BY ID DESC');
    qBuscaAtendimentos.Open;
end;

procedure TFormAtendimentos.ConfigurarPermisses1Click(Sender: TObject);
begin

 if UpperCase(FormLoginSavauto.EditUsuario.Text) <> 'ADMINISTRADOR' then
 Begin
    MessageDlg('Usuário sem permissao', mtError, [mbok] , 0);
    Abort;
 End
 Else
 Begin
   if FormLiberaPermissao = nil then
   FormLiberaPermissao := TFormLiberaPermissao.Create(self);
   FormLiberaPermissao.Tela := name;
   FormLiberaPermissao.Position := poScreenCenter;
   FormLiberaPermissao.ShowModal;
 End;

end;

procedure TFormAtendimentos.DadosdoCliente1Click(Sender: TObject);
begin

 if FormAlteraDadosCliente = nil then
 Begin
   FormAlteraDadosCliente := TFormAlteraDadosCliente.Create(self);
 End;

   FormAlteraDadosCliente.Position := poScreenCenter;
   FormAlteraDadosCliente.Show;

end;

procedure TFormAtendimentos.DBGridAtendimentosDblClick(Sender: TObject);
begin

  FormDetalhesAtendimentoBeta.EditPlaca.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text;
  FormDetalhesAtendimentoBeta.EditModelo.Text:= DBGridAtendimentos.DataSource.DataSet.FieldByName('modelo').Text;
  FormDetalhesAtendimentoBeta.EditAno.Text   := DBGridAtendimentos.DataSource.DataSet.FieldByName('ano_modelo').Text;
  FormDetalhesAtendimentoBeta.EditCliente.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('nome').Text;
  FormDetalhesAtendimentoBeta.EditTelefone.Text:= DBGridAtendimentos.DataSource.DataSet.FieldByName('telefone').Text;
  FormDetalhesAtendimentoBeta.EditVlrFipe.text := FormatFloat('R$ #,.##', StrToCurr(DBGridAtendimentos.DataSource.DataSet.FieldByName('fipe').Text));

 if FormDetalhesAtendimento = nil then
 Begin
   FormDetalhesAtendimento := TFormDetalhesAtendimento.Create(self);
 End;

  // Recebimentos de valores gerais

 FormDetalhesAtendimento.EditAvaliacaoAgendamento.Text := CurrToStr(DBGridAtendimentos.DataSource.DataSet.FieldByName('VlrAvaliacao').AsCurrency);

 if DBGridAtendimentos.DataSource.DataSet.FieldByName('VlrAvaliacao').AsCurrency > 0 then
 Begin
   FormDetalhesAtendimento.lblStatusAvaliacao.Caption := 'Veículo Avaliado';
 End;

 if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Documentos' then
 Begin
     FormDetalhesAtendimento.ProgressBar.Position := 0;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este Atendimento encontra-se com o progresso de 0 %';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_documentacao;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_documentacao;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := true;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;
     {FormDetalhesAtendimento.PageControl1.Pages[0].TabVisible := true;
     FormDetalhesAtendimento.PageControl1.Pages[1].TabVisible := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].TabVisible := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].TabVisible := false;}
 End;

   if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Verificação' then
   Begin
     FormDetalhesAtendimento.ProgressBar.Position := 25;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 25 %';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_verific_cadastral;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_verific_cadastral;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := true;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;
   End;

   if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Agendamento' then
   Begin
     FormDetalhesAtendimento.ProgressBar.Position := 50;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 50 %';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.tab_agenda_vistoria;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.tab_agenda_vistoria;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := true;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;

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
         FormDetalhesAtendimento.qBuscaAgendamento.Open;
         FormDetalhesAtendimento.qBuscaAgendamento.Filter := 'placa='+QuotedStr(DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text);
         FormDetalhesAtendimento.qBuscaAgendamento.Filtered := true;
       End
       Else
       Begin
         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ 'Enviado ao vistoriador, aguardando vistoria' + #13 +
                                                                  'Vistoriador: '+FormDetalhesAtendimento.qValidaPgto.FieldByName('vistoriador').Text;

         FormDetalhesAtendimento.qBuscaAgendamento.Open;
         FormDetalhesAtendimento.qBuscaAgendamento.Filter := 'placa='+QuotedStr(DBGridAtendimentos.DataSource.DataSet.FieldByName('placa').Text);
         FormDetalhesAtendimento.qBuscaAgendamento.Filtered := true;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clRed;
       End;


       //FormDetalhesAtendimento.CalendarView1.OnClick(sender);

     End
     Else
     Begin

       FormDetalhesAtendimento.qBuscaAgendamento.Active := false;
       FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Sem agendamento';
       FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clRed;

     End;

   End;

   if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Pagamento' then
   Begin
     FormDetalhesAtendimento.ProgressBar.Position := 75;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 75 %';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_pagamento;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_pagamento;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := true;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;
   End;

   if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Concluido' then
   Begin
     FormDetalhesAtendimento.ProgressBar.Position := 100;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se com o progresso de 100 %';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_pagamento;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_pagamento;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := true;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;
   End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Cancelado' then
   Begin
     FormDetalhesAtendimento.ProgressBar.Position := 0;
     FormDetalhesAtendimento.lblStatusChamado.Caption := 'Este chamado encontra-se Cancelado';
     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_cancelado;
     FormDetalhesAtendimento.EditStatusChamado.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text;
     FormDetalhesAtendimento.Tab_verific_cadastral.Brush.Color := clRed;

     FormDetalhesAtendimento.Memo1.Text := DBGridAtendimentos.DataSource.DataSet.FieldByName('obs').Text;

     FormDetalhesAtendimento.PageControl1.ActivePage := FormDetalhesAtendimento.Tab_cancelado;
     FormDetalhesAtendimento.PageControl1.Pages[0].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[1].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[2].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[3].Enabled := false;
     FormDetalhesAtendimento.PageControl1.Pages[4].Enabled := true;
   End;

   FormDetalhesAtendimento.Position := poScreenCenter;
   FormDetalhesAtendimento.Show;

 End;


procedure TFormAtendimentos.DBGridAtendimentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Documentos' then // condição
  Begin
    //DBGridAtendimentos.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := clYellow;
    DBGridAtendimentos.Canvas.Font.Color:= clBlack;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Verificação' then
  Begin
    //DBGridAtendimentos.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := clAqua;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Agendamento' then
  Begin
    DBGridAtendimentos.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := $009E741D;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Pagamento' then
  Begin
    DBGridAtendimentos.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := $00459A43;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Concluido' then
  Begin
    DBGridAtendimentos.Canvas.Font.Color:= clBlack; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := clLime;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Desistência' then
  Begin
    DBGridAtendimentos.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := clBlack;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

  if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Cancelado' then
  Begin
    DBGridAtendimentos.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
    DBGridAtendimentos.Canvas.Brush.Color := clRed;
    DBGridAtendimentos.DefaultDrawDataCell(Rect, DBGridAtendimentos.columns[datacol].field, State);
  End;

end;

procedure TFormAtendimentos.EditIDAtndEnter(Sender: TObject);
begin

 CheckDatas.Checked := false;
 ComboOperador.Text := '';
 ComboSituacao.Text := '';
 EditPlaca.Text     := '';
 EditModelo.Text    := '';
 EditDiasSemAcao.Text := '';

end;

procedure TFormAtendimentos.FormShow(Sender: TObject);
Var
 Hoje, Inicio : TDate;
 Dia, Mes, Ano : String;
begin

 Mes := IntToStr( MonthOf(NOW) );
 Ano := IntToStr( YearOf(NOW)  );

 if StrToInt(mes) < StrToInt('10') then
 Mes := '0' + Mes;

 Inicio := StrToDate('01'+'/'+Mes+'/'+Ano);

 DateTimePickerInicial.Date := Inicio;
 DateTimePickerFinal.Date := NOW;

 CheckDatas.Checked := true;

 DateTimePickerFinal.Date := DateTimePickerFinal.Date +1;

 img_pesquisar.OnClick(sender);

end;

procedure TFormAtendimentos.Image1Click(Sender: TObject);
begin


 if MessageDlg('Este procedimento atualizará os dados dos atendimentos na tela e ajustará algum atendimento incompleto. Deseja iniciar a atualização?', mtInformation, [mbno, mbyes] , 0) = mrYes then
 Begin
   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.Show;

   Sleep(500);

   Application.ProcessMessages;

   qBuscaAtendimentos.Filtered := false;
   qBuscaAtendimentos.Filter := 'situacao not in (''Concluido'', ''Cancelado'') and usuario like '+QuotedStr('%' + ComboOperador.Text + '%')+'';
   qBuscaAtendimentos.Filtered := true;
   qBuscaAtendimentos.Refresh;

   EditPlaca.Text := '';
   EditModelo.Text := '';
   //ComboOperador.Text := '';
   ComboSituacao.Text := '';

   DBGridAtendimentos.DataSource.DataSet.First;

   while not DBGridAtendimentos.DataSource.DataSet.Eof do
   Begin

    if DBGridAtendimentos.DataSource.DataSet.FieldByName('situacao').Text = 'Aguardando Pagamento' then
    Begin
       qVerificaDadosPgto.SQL.Clear;
       qVerificaDadosPgto.SQL.Add('select * from tbcompras_pagamento where id_atendimento=:id and valor_pgto = valor');
       qVerificaDadosPgto.ParamByName('id').AsInteger := DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
       qVerificaDadosPgto.Open;

       if qVerificaDadosPgto.RecordCount >= 1 then
       Begin
         qAtualizaStatus.SQL.Clear;
         qAtualizaStatus.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 100 where id_atendimento = :id');
         qAtualizaStatus.ParamByName('status').Text  := 'Concluido';
         qAtualizaStatus.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qAtualizaStatus.Execute;

         qAtualizaStatus.sql.Clear;
         qAtualizaStatus.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
         qAtualizaStatus.ParamByName('status').Text := 'Concluido';
         qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qAtualizaStatus.Execute;

         qAtualizaStatus.sql.Clear;
         qAtualizaStatus.SQL.Add('update tbcompras_hist_status_atendimento set pagamento = 1 where id_atendimento = :ID');
         qAtualizaStatus.ParamByName('ID').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qAtualizaStatus.Execute;

         qBuscaAtendimentos.Refresh;

       End;
    End;
      DBGridAtendimentos.DataSource.DataSet.Next;
   End;


   DBGridAtendimentos.DataSource.DataSet.First;

   FormAguarde.Close;

   ShowMessage('Atualização concluída com sucesso!');


 End;

end;

procedure TFormAtendimentos.Image2Click(Sender: TObject);
var
objExcel,Sheet,Chart,s : Variant;
cTitulo : string;
i : integer;
begin

 if MessageDlg('A exportação será aplicada apenas para as informações na tela, deseja prosseguir?', mtWarning, [mbno, mbyes] , 0) = mrYes  then
 Begin

  DBGridAtendimentos.DataSource.DataSet.First;

// Cria uma instancia para utilizar o Excel
  cTitulo := 'Atendimento de Compra';
  objExcel := CreateOleObject('Excel.Application');
  //objExcel.Visible := True;
  objExcel.Caption := cTitulo;

  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

  Sheet.cells[1,1] := 'ID';
  Sheet.cells[1,2] := 'NOME';
  Sheet.cells[1,3] := 'TELEFONE';
  Sheet.cells[1,4] := 'PLACA';
  Sheet.cells[1,5] := 'MODELO';
  Sheet.cells[1,6] := 'SITUACAO';
  Sheet.cells[1,7] := 'QTD DIAS EM ABERTO';
  Sheet.cells[1,8] := 'MIDIA';
  Sheet.cells[1,9] := 'CODIGO ANUNCIO';
  Sheet.cells[1,10] := 'ANO MODELO';
  Sheet.cells[1,11] := 'VLR FIPE';
  Sheet.cells[1,12] := 'CODIGO FIPE';
  Sheet.cells[1,13] := 'PROPOSTA';
  Sheet.cells[1,14] := 'USUARIO';
  Sheet.cells[1,15] := 'DATA';

  FormLoading.LabelStatus.Caption := 'Gerando Planilha, aguarde...';
  FormLoading.Position := poScreenCenter;
  FormLoading.Show;
  Application.ProcessMessages;

  i := 2;

  while not DBGridAtendimentos.DataSource.DataSet.Eof do
  Begin

  Sheet.cells[i,1] := DBGridAtendimentos.DataSource.DataSet.FieldByName('ID').AsInteger;
  Sheet.cells[i,2] := DBGridAtendimentos.DataSource.DataSet.FieldByName('NOME').Text;
  Sheet.cells[i,3] := DBGridAtendimentos.DataSource.DataSet.FieldByName('TELEFONE').Text;
  Sheet.cells[i,4] := DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text;
  Sheet.cells[i,5] := DBGridAtendimentos.DataSource.DataSet.FieldByName('MODELO').Text;
  Sheet.cells[i,6] := DBGridAtendimentos.DataSource.DataSet.FieldByName('SITUACAO').Text;
  Sheet.cells[i,7] := DBGridAtendimentos.DataSource.DataSet.FieldByName('QtdDias').AsInteger;
  Sheet.cells[i,8] := DBGridAtendimentos.DataSource.DataSet.FieldByName('MIDIA').Text;
  Sheet.cells[i,9] := DBGridAtendimentos.DataSource.DataSet.FieldByName('COD_ANUNCIO').Text;
  Sheet.cells[i,10] := DBGridAtendimentos.DataSource.DataSet.FieldByName('ANO_MODELO').Text;
  Sheet.cells[i,11] := DBGridAtendimentos.DataSource.DataSet.FieldByName('FIPE').AsCurrency;
  Sheet.cells[i,12] := DBGridAtendimentos.DataSource.DataSet.FieldByName('COD_FIPE').Text;
  Sheet.cells[i,13] := DBGridAtendimentos.DataSource.DataSet.FieldByName('PROPOSTA').AsCurrency;
  Sheet.cells[i,14] := DBGridAtendimentos.DataSource.DataSet.FieldByName('USUARIO').TEXT;
  Sheet.cells[i,15] := DBGridAtendimentos.DataSource.DataSet.FieldByName('DATA').AsDateTime;

  DBGridAtendimentos.DataSource.DataSet.Next;

  Application.ProcessMessages;

   Sheet.columns.autofit;

   I := I+1;

  end;

  FormLoading.Close;

  objExcel.Visible := True;
 End;
end;

procedure TFormAtendimentos.Image3Click(Sender: TObject);
begin

 frxReportAtendimentos.ShowReport(true);

end;

procedure TFormAtendimentos.img_criarClick(Sender: TObject);
begin

 if FormAtendimentoNovo = nil then
 Begin
   FormAtendimentoNovo := TFormAtendimentoNovo.Create(self);
 End;

 FormAtendimentoNovo.Position := poScreenCenter;

 FormAtendimentoNovo.Height := 237;

 FormAtendimentoNovo.Panel2.Visible := false;

 FormAtendimentoNovo.ShowModal;

end;

procedure TFormAtendimentos.img_pesquisarClick(Sender: TObject);
var

 data_corte : Tdate;

begin

    if EditDiasSemAcao.Text <> '' then
    Begin
      data_corte := NOW - StrToInt(EditDiasSemAcao.Text);
    End;

    //ShowMessage(DateToStr(data_corte));

    qBuscaAtendimentos.SQL.Clear;
    qBuscaAtendimentos.SQL.Add('select id, nome, telefone, placa, modelo, midia, cod_anuncio, ano_modelo,');
    qBuscaAtendimentos.SQL.Add('fipe, cod_fipe, proposta, situacao, usuario, cod_usuario,');
    qBuscaAtendimentos.SQL.Add('QtdDias, Data, VlrAvaliacao, obs, dt_alteracao from tbcompras_atendimento');
    qBuscaAtendimentos.SQL.Add('where 1 = 1');
    if ComboOperador.Text <> '' then
    qBuscaAtendimentos.SQL.Add('and upper(usuario) = '+QuotedStr( UpperCase(ComboOperador.Text) ));
    if ComboSituacao.Text <> '' then
    qBuscaAtendimentos.SQL.Add('and situacao = '+QuotedStr(ComboSituacao.Text));
    if EditPlaca.Text <> '' then
    qBuscaAtendimentos.SQL.Add('AND placa = '+QuotedStr(EditPlaca.Text));
    if EditModelo.Text <> '' then
    qBuscaAtendimentos.SQL.Add('AND modelo like '+QuotedStr('%'+EditModelo.Text+'%'));

    if CheckDatas.Checked = true then
    Begin
     qBuscaAtendimentos.SQL.Add('AND Data >=:dt_ini and Data<=:dt_fim');
     qBuscaAtendimentos.ParamByName('dt_ini').AsDate :=  DateTimePickerInicial.Date;
     qBuscaAtendimentos.ParamByName('dt_fim').AsDate :=  DateTimePickerFinal.Date;
    End;

    if EditDiasSemAcao.Text <> '' then
    Begin
     qBuscaAtendimentos.SQL.Add('and cast(dt_alteracao as date) <=:dt_corte and situacao not in ( ''Concluido'' , ''Cancelado'' )');
     qBuscaAtendimentos.ParamByName('dt_corte').AsDate := data_corte;
    End;

    if EditIDAtnd.Text <> '' then
    begin
      qBuscaAtendimentos.SQL.Add('and id = :id');
      qBuscaAtendimentos.ParamByName('id').AsInteger := StrToInt(EditIDAtnd.Text);
    end;


    qBuscaAtendimentos.SQL.Add('ORDER BY ID DESC');
    qBuscaAtendimentos.Open;

    {

    qBuscaAtendimentos.Filter := 'upper(usuario) like '+QuotedStr( UpperCase('%'+ ComboOperador.Text +'%'))+
                                 'AND situacao like '+QuotedStr('%'+ComboSituacao.Text+'%')+
                                 'AND placa like '+QuotedStr('%'+EditPlaca.Text+'%')+
                                 'AND modelo like '+QuotedStr('%'+EditModelo.Text+'%');
    qBuscaAtendimentos.Filtered := true;

   if CheckDatas.Checked = true then
   Begin
    qBuscaAtendimentos.Filter := 'upper(usuario) like '+QuotedStr( UpperCase('%'+ ComboOperador.Text +'%'))+
                                 'AND situacao like '+QuotedStr('%'+ComboSituacao.Text+'%')+
                                 'AND placa like '+QuotedStr('%'+EditPlaca.Text+'%')+
                                 'AND modelo like '+QuotedStr('%'+EditModelo.Text+'%')+
                                 'AND Data >='+QuotedStr(DateToStr(DateTimePickerInicial.DateTime))+' and Data<= '+QuotedStr(DateToStr(DateTimePickerFinal.DateTime+1));
     qBuscaAtendimentos.Filtered := true;
   End;

{
 if EditPlaca.Text <> '' then
 Begin
    qBuscaAtendimentos.Filter := 'placa='+QuotedStr(EditPlaca.Text);
    qBuscaAtendimentos.Filtered := true;
 End;

 if EditModelo.Text <> '' then
 Begin
    qBuscaAtendimentos.Filter := 'modelo like '+QuotedStr('%'+EditModelo.Text+'%');
    qBuscaAtendimentos.Filtered := true;
 End;

 if CheckDatas.Checked = true then
 Begin
   qBuscaAtendimentos.Filter := 'Data >='+QuotedStr(DateToStr(DateTimePickerInicial.DateTime))+' and Data<= '+QuotedStr(DateToStr(DateTimePickerFinal.DateTime+1));
   qBuscaAtendimentos.Filtered := true;
 End;
}
end;

procedure TFormAtendimentos.MidiaAnuncio1Click(Sender: TObject);
begin

 if FormAlteraMidiaAnuncio = nil then
 Begin
   FormAlteraMidiaAnuncio := TFormAlteraMidiaAnuncio.Create(self);
 End;

 FormAlteraMidiaAnuncio.Position := poScreenCenter;
 FormAlteraMidiaAnuncio.Show;

end;

procedure TFormAtendimentos.Placa1Click(Sender: TObject);
begin
 if FormAlteraPlaca = nil then
 Begin
   FormAlteraPlaca := TFormAlteraPlaca.Create(self);
 End;

   FormAlteraPlaca.Position := poScreenCenter;
   FormAlteraPlaca.Show;
end;

procedure TFormAtendimentos.PopupMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin
   PopupMenu1.Items[0].Enabled := true;
 End;
end;

procedure TFormAtendimentos.PropostaR1Click(Sender: TObject);
begin
 if FormAlteracaoProposta = nil then
 Begin
   FormAlteracaoProposta := TFormAlteracaoProposta.Create(self);
 End;

 FormAlteracaoProposta.Position := poScreenCenter;
 FormAlteracaoProposta.ShowModal;
end;

procedure TFormAtendimentos.TrocarUsuarioClick(Sender: TObject);
begin

 if FormListaUsuarios = nil then
 Begin
   FormListaUsuarios := TFormListaUsuarios.Create(self);
 End;

 FormListaUsuarios.Position := poScreenCenter;
 FormListaUsuarios.ShowModal;

end;

procedure TFormAtendimentos.Veculo1Click(Sender: TObject);
begin

 if FormAlteracaoVeiculo = nil then
 Begin
   FormAlteracaoVeiculo := TFormAlteracaoVeiculo.Create(self);
 End;

 FormAlteracaoVeiculo.Position := poScreenCenter;
 FormAlteracaoVeiculo.ShowModal;


end;

end.
