unit UFormAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, MemDS, DBAccess, Uni, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormAgendamentoViita = class(TForm)
    Panel2: TPanel;
    lblStatusChamado: TLabel;
    Image1: TImage;
    Panel9: TPanel;
    img_salvar: TImage;
    Image14: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DateVisita: TDateTimePicker;
    EditPlaca: TEdit;
    EditCliente: TEdit;
    EditTelefone: TEdit;
    EditEndereco: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    MemoObs: TMemo;
    qInsereAgendamento: TUniQuery;
    EditVistoriador: TEdit;
    img_salva_edit: TImage;
    chkDtAgnd: TCheckBox;
    procedure img_salvarClick(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure img_salva_editClick(Sender: TObject);
    procedure chkDtAgndClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgendamentoViita: TFormAgendamentoViita;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAjusteDadosFipeAvaliacao,
  UFormAlteraFipeDePaxa, UFormAvariasItens, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDataPagamento,
  UFormExtratoPgtoVeiculos, UFormGestaoAvarias, UFormHistoricoObsAtn,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios,
  UFormLoadingCarregamento, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormPagamentoVeiculo, UFormPgtoExtratoVeiculo,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic;

procedure TFormAgendamentoViita.chkDtAgndClick(Sender: TObject);
begin

 if chkDtAgnd.Checked = false then
 Begin
   DateVisita.Enabled := true;
 End
 Else
 Begin
   DateVisita.Enabled := false;
 End;

end;

procedure TFormAgendamentoViita.Image14Click(Sender: TObject);
begin

 Close;

end;

procedure TFormAgendamentoViita.img_salvarClick(Sender: TObject);
begin

 if EditEndereco.Text <> '' then
 Begin
  if EditCidade.Text <> '' then
   Begin
      if EditUF.Text <> '' then
       Begin

         qInsereAgendamento.SQL.Clear;
         qInsereAgendamento.SQL.Add('insert into tbcompras_agendamento (id_atendimento, descricao, data, vistoriador, placa, cliente,');
         qInsereAgendamento.SQL.Add('telefone, endereco, cidade, uf, obs, usuario, status, concluido)');
         qInsereAgendamento.SQL.Add('values (:id, :desc, :dt, :vistoriador, :placa, :cliente, :fone, :end, :cid, :uf, :obs, :usu,');
         qInsereAgendamento.SQL.Add(':status, 0)');
         qInsereAgendamento.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
         qInsereAgendamento.ParamByName('desc').Text := 'ATN PLACA: '+EditPlaca.Text+' | VISTORIADOR:'+EditVistoriador.Text;
         if chkDtAgnd.Checked = true then
         qInsereAgendamento.ParamByName('dt').Value := Null
         Else
         qInsereAgendamento.ParamByName('dt').AsDate := DateVisita.Date;
         qInsereAgendamento.ParamByName('vistoriador').Text := EditVistoriador.Text;
         qInsereAgendamento.ParamByName('placa').Text := EditPlaca.Text;
         qInsereAgendamento.ParamByName('cliente').Text := EditCliente.Text;
         qInsereAgendamento.ParamByName('fone').Text := EditTelefone.Text;
         qInsereAgendamento.ParamByName('end').Text := EditEndereco.Text;
         qInsereAgendamento.ParamByName('cid').Text := EditCidade.Text;
         qInsereAgendamento.ParamByName('uf').Text := EditUF.Text;
         qInsereAgendamento.ParamByName('obs').Text := MemoObs.Text;
         qInsereAgendamento.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
         qInsereAgendamento.ParamByName('status').Text := 'pendente';
         qInsereAgendamento.ExecSQL;

         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ DateToStr(DateVisita.Date) + #13 +
                                                                 'Vistoriador: '+EditVistoriador.Text;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clGreen;

         FormDetalhesAtendimento.qEnviaNotif.SQL.Clear;
         FormDetalhesAtendimento.qEnviaNotif.SQL.Add('insert into tbnotificacoes (data, usuario_remetente, usuario_destinatario, obs, lido, titulo, PLACA)');
         FormDetalhesAtendimento.qEnviaNotif.SQL.Add('values (:dt, :remetente, :destinatario, :obs, 0, :tit, :placa)');
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('dt').AsDate         := NOW;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('remetente').Text    := FormLoginSavauto.EditUsuario.Text;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('destinatario').Text := EditVistoriador.Text;
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('obs').Text          := 'Agendar vistoria com o cliente, verifique suas notificações na tela principal do App para mais detalhes';
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('tit').Text          := 'Agendamento';
         FormDetalhesAtendimento.qEnviaNotif.ParamByName('placa').Text        := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('PLACA').Text;
         FormDetalhesAtendimento.qEnviaNotif.ExecSQL;

         FormAtendimentos.AtualizaChamado(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

         MessageDlg('Foi gerada uma notificação para o usuário ' + EditVistoriador.Text+ ' automática', mtInformation, [mbok] , 0);

         EditEndereco.Text := '';
         EditCidade.Text := '';
         EditUF.Text := '';
         MemoObs.Text := '';
         EditVistoriador.Text := '';

         Close;

       End;
   End;
 End;

end;

procedure TFormAgendamentoViita.img_salva_editClick(Sender: TObject);
begin

 if EditEndereco.Text <> '' then
 Begin
  if EditCidade.Text <> '' then
   Begin
      if EditUF.Text <> '' then
       Begin

        { qInsereAgendamento.SQL.Clear;
         qInsereAgendamento.SQL.Add('update tbcompras_agendamento set data=:dt,');
         qInsereAgendamento.SQL.Add('telefone=:fone, endereco=:end, cidade=:cid, uf=:uf, obs=:obs where id=:id');
         qInsereAgendamento.ParamByName('id').AsInteger := FormDetalhesAtendimento.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
         qInsereAgendamento.ParamByName('dt').AsDate := DateVisita.Date;
         qInsereAgendamento.ParamByName('fone').Text := EditTelefone.Text;
         qInsereAgendamento.ParamByName('end').Text := EditEndereco.Text;
         qInsereAgendamento.ParamByName('cid').Text := EditCidade.Text;
         qInsereAgendamento.ParamByName('uf').Text := EditUF.Text;
         qInsereAgendamento.ParamByName('obs').Text := MemoObs.Text;
         qInsereAgendamento.Execute;   }

         FormDetalhesAtendimento.qBuscaAgendamento.Refresh;

         EditEndereco.Text := '';
         EditCidade.Text := '';
         EditUF.Text := '';
         MemoObs.Text := '';
         EditVistoriador.Text := '';

         FormDetalhesAtendimento.lblStatusAgendamento.Caption := 'Agendamento para: '+ DateToStr(DateVisita.Date) + #13 +
                                                                 'Vistoriador: '+EditVistoriador.Text;
         FormDetalhesAtendimento.lblStatusAgendamento.Font.Color := clGreen;

         EditEndereco.Text := '';
         EditCidade.Text := '';
         EditUF.Text := '';
         MemoObs.Text := '';
         EditVistoriador.Text := '';

         Close;

       End;
   End;
 End;

 FormAgendamentoViita.img_salva_edit.Visible := false;
 FormAgendamentoViita.img_salvar.Visible := True;

end;

end.
