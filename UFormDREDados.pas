unit UFormDREDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Uni, DateUtils;

type
  TFormDREDados = class(TForm)
    Panel3: TPanel;
    Image5: TImage;
    Panel2: TPanel;
    labelRefFipes: TLabel;
    PanelAtualizar: TPanel;
    Panel10: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel8: TPanel;
    Label8: TLabel;
    Panel9: TPanel;
    Label12: TLabel;
    Panel13: TPanel;
    Label16: TLabel;
    Panel14: TPanel;
    Label20: TLabel;
    Panel17: TPanel;
    Label28: TLabel;
    Panel18: TPanel;
    Label32: TLabel;
    Panel19: TPanel;
    Label36: TLabel;
    Panel20: TPanel;
    Label40: TLabel;
    Panel21: TPanel;
    Label44: TLabel;
    Panel22: TPanel;
    Label48: TLabel;
    ScrollBox1: TScrollBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Panel16: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Panel23: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Panel15: TPanel;
    Label26: TLabel;
    Panel24: TPanel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Panel25: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    EditMetaDespTotal: TEdit;
    EditAtualDespTotais: TEdit;
    Panel26: TPanel;
    Label35: TLabel;
    Label37: TLabel;
    EditUnCustoRep: TEdit;
    EditMetaCustoRep: TEdit;
    EditAtualCustoRep: TEdit;
    Panel27: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    EditUnDespAdm: TEdit;
    EditMetaDespAdm: TEdit;
    EditAtualDespAdm: TEdit;
    Panel29: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    EditUnCustoPreparo: TEdit;
    EditMetaCustoPreparo: TEdit;
    EditAtualCustoPrep: TEdit;
    Panel30: TPanel;
    Label43: TLabel;
    Label45: TLabel;
    EditMetaMargemTotal: TEdit;
    EditAtualMargemTotal: TEdit;
    Panel31: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    EditUnOutReceitas: TEdit;
    EditMetaOutRec: TEdit;
    EditAtualOutRec: TEdit;
    Panel32: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    EditUnFei: TEdit;
    EditMetaFei: TEdit;
    EditAtualFei: TEdit;
    Panel33: TPanel;
    Label51: TLabel;
    Label52: TLabel;
    EditUnMargemPVPC: TEdit;
    EditMetaMargemPVPC: TEdit;
    EditAtualMargemPVPC: TEdit;
    Panel34: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    EditUnMargem: TEdit;
    EditMetaMargem: TEdit;
    EditAtualMargemUn: TEdit;
    Panel35: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    EditUnVenda: TEdit;
    EditMetaVenda: TEdit;
    EditAtualVenda: TEdit;
    Panel36: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    EditMetaAmort: TEdit;
    EditAtualAmort: TEdit;
    Panel37: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    EditMetaDistLiquida: TEdit;
    EditAtualDestLiquida: TEdit;
    Panel1: TPanel;
    Label61: TLabel;
    Label62: TLabel;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Panel28: TPanel;
    Panel38: TPanel;
    Label63: TLabel;
    EditProjVenda: TEdit;
    EditProjMargemUn: TEdit;
    EditProjMargemPVPC: TEdit;
    EditProjFei: TEdit;
    EditProjOutRec: TEdit;
    EditProjMgTotal: TEdit;
    EditProjCustPrep: TEdit;
    EditProjDepAdm: TEdit;
    EditProjCustRep: TEdit;
    EditProjDespTotal: TEdit;
    EditProjAmort: TEdit;
    EditProjDistLiq: TEdit;
    procedure FormShow(Sender: TObject);
    procedure PanelAtualizarClick(Sender: TObject);
    procedure Panel28Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure CarregaUnMetasDRE;
    procedure AtualizaDRE;
    procedure FormataCampos;
    procedure LimpaEdits;
    procedure SalvaMetasDRE;
    procedure LimsStringReplaceEdite;
    procedure GravaParametrosUnMetasDRE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDREDados: TFormDREDados;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAguarde,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAtendimentoBeta,
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDivergenciasDados,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFiltrosGestao, UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoDadosSavauto, UFormGestaoTransporte, UFormGestaoVistoria,
  UFormHistFIPE, UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UFormNovaCidadeCusto, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormDREDados.GravaParametrosUnMetasDRE;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''VENDA''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnVenda.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaVenda.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''MARGEM Un''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnMargem.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaMargem.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''MARGEM PV-PC''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnMargemPVPC.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaMargemPVPC.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''F&i''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnFei.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaFei.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''OUTRAS RECEITAS''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnOutReceitas.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaOutRec.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''CUSTO DE PREPARO''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnCustoPreparo.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaCustoPreparo.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''DESP ADMINISTRATIVAS''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnDespAdm.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaDespAdm.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set un=:un, meta=:meta where tipo = ''CUSTO DE REPOSIÇÃO''');
  query.ParamByName('un').AsCurrency := StrToCurr(EditUnCustoRep.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaCustoRep.Text);
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('update tbprojdre set meta=:meta where tipo = ''AMORTIZAÇÕES''');
 // query.ParamByName('un').AsCurrency := StrToCurr(EditMetaAmort.Text);
  query.ParamByName('meta').AsCurrency := StrToCurr(EditMetaAmort.Text);
  query.Execute;

  except
  On E:Exception Do
  Begin
     ShowMessage('Falha ao gravar metas UN: ' + e.Message);
  End;

 end;


End;


procedure TFormDREDados.LimsStringReplaceEdite;
var
  I : Integer;
begin
    EditUnMargem.Text :=   StringReplace( StringReplace( StringReplace(StringReplace( EditUnMargem.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaMargem.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargem.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnMargemPVPC.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnMargemPVPC.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaMargemPVPC.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargemPVPC.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnFei.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnFei.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaFei.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaFei.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnOutReceitas.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnOutReceitas.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaOutRec.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaOutRec.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaMargemTotal.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargemTotal.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaDistLiquida.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDistLiquida.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnCustoPreparo.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnCustoPreparo.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaCustoPreparo.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaCustoPreparo.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnDespAdm.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnDespAdm.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaDespAdm.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDespAdm.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnCustoRep.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnCustoRep.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaCustoRep.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaCustoRep.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaDespTotal.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDespTotal.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    //EditUnAmort.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnAmort.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaAmort.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaAmort.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

end;


procedure TFormDREDados.SalvaMetasDRE;
Begin

 if MessageDlg('Tem certeza que deseja salvar as metas e valores UN digitados na tela?' , mtInformation, [mbno, mbyes], 0) = mrYes then
 Begin

    LimsStringReplaceEdite;

    GravaParametrosUnMetasDRE;

 End;

End;


procedure TFormDREDados.LimpaEdits;
var
  I : Integer;
begin

    EditUnMargem.Text :=   StringReplace( StringReplace( StringReplace(StringReplace( EditUnMargem.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaMargem.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargem.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnMargemPVPC.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnMargemPVPC.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaMargemPVPC.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargemPVPC.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnFei.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnFei.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaFei.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaFei.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnOutReceitas.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnOutReceitas.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaOutRec.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaOutRec.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaMargemTotal.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaMargemTotal.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaDistLiquida.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDistLiquida.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnCustoPreparo.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnCustoPreparo.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaCustoPreparo.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaCustoPreparo.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnDespAdm.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnDespAdm.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaDespAdm.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDespAdm.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditUnCustoRep.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnCustoRep.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaCustoRep.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaCustoRep.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    EditMetaDespTotal.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaDespTotal.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

    //EditUnAmort.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditUnAmort.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);
    EditMetaAmort.Text := StringReplace( StringReplace( StringReplace(StringReplace( EditMetaAmort.Text , 'R$' , '', []), '.', '', []), '.', '', []), '-', '', []);

  EditAtualMargemUn.Text := '';
  EditAtualMargemPVPC.Text := '';
  EditAtualFei.Text := '';
  EditAtualOutRec.Text := '';
  EditAtualMargemTotal.Text := '';
  EditAtualCustoPrep.Text := '';
  EditAtualDespAdm.Text := '';
  EditAtualCustoRep.Text := '';
  EditAtualDespTotais.Text := '';
  EditAtualDestLiquida.Text := '';


  EditProjMargemUn.Text:='';
  EditProjMargemPVPC.Text:='';
  EditProjFei.Text:= '';
  EditProjOutRec.Text:= '';
  EditProjMgTotal.Text := '';
  EditProjDistLiq.Text := '';
  EditProjCustPrep.Text:= '';
  EditProjDepAdm.Text:= '';
  EditProjCustRep.Text:= '';
  EditProjDespTotal.Text := '';
  EditProjAmort.Text:= '';



end;

procedure TFormDREDados.FormataCampos;
Begin

  if StrToInt(EditAtualVenda.Text) < StrToInt(EditMetaVenda.Text) then EditAtualVenda.Font.Color := clred else EditAtualVenda.Font.Color := ClBlue;

  if StrToCurr(EditAtualMargemUn.Text) < StrToCurr(EditMetaMargem.Text) then EditAtualMargemUn.Font.Color := clred else EditAtualMargemUn.Font.Color := ClBlue;

  if StrToCurr(EditAtualMargemPVPC.Text) < StrToCurr(EditMetaMargemPVPC.Text) then EditAtualMargemPVPC.Font.Color := clred else EditAtualMargemPVPC.Font.Color := ClBlue;

  if StrToCurr(EditAtualFei.Text) < StrToCurr(EditMetaFei.Text) then EditAtualFei.Font.Color := clred else EditAtualFei.Font.Color := ClBlue;

  if StrToCurr(EditAtualOutRec.Text) < StrToCurr(EditMetaOutRec.Text) then EditAtualOutRec.Font.Color := clred else EditAtualOutRec.Font.Color := ClBlue;

  if StrToCurr(EditAtualMargemTotal.Text) < StrToCurr(EditMetaMargemTotal.Text) then EditAtualMargemTotal.Font.Color := clred else EditAtualMargemTotal.Font.Color := ClBlue;

  if StrToCurr(EditAtualCustoPrep.Text) > StrToCurr(EditMetaCustoPreparo.Text) then EditAtualCustoPrep.Font.Color := clred else EditAtualCustoPrep.Font.Color := ClBlue;

  if StrToCurr(EditAtualDespAdm.Text) > StrToCurr(EditMetaDespAdm.Text) then EditAtualDespAdm.Font.Color := clred else EditAtualDespAdm.Font.Color := ClBlue;

  if StrToCurr(EditAtualCustoRep.Text) > StrToCurr(EditMetaCustoRep.Text) then EditAtualCustoRep.Font.Color := clred else EditAtualCustoRep.Font.Color := ClBlue;

  if StrToCurr(EditAtualDespTotais.Text) > StrToCurr(EditMetaDespTotal.Text) then EditAtualDespTotais.Font.Color := clred else EditAtualDespTotais.Font.Color := ClBlue;

  if StrToCurr(EditAtualAmort.Text) < StrToCurr(EditMetaAmort.Text) then EditAtualAmort.Font.Color := clred else EditAtualAmort.Font.Color := ClBlue;

  if StrToCurr(EditAtualDestLiquida.Text) < StrToCurr(EditMetaDistLiquida.Text) then EditAtualDestLiquida.Font.Color := clred else EditAtualDestLiquida.Font.Color := ClBlue;

if StrToInt(EditProjVenda.Text) < StrToInt(EditMetaVenda.Text) then EditProjVenda.Font.Color := clred else EditProjVenda.Font.Color := ClBlue;
if StrToCurr(EditProjMargemUn.Text) < StrToCurr(EditMetaMargem.Text) then EditProjMargemUn.Font.Color := clred else EditProjMargemUn.Font.Color := ClBlue;
if StrToCurr(EditProjMargemPVPC.Text) < StrToCurr(EditMetaMargemPVPC.Text) then EditProjMargemPVPC.Font.Color := clred else EditProjMargemPVPC.Font.Color := ClBlue;
if StrToCurr(EditProjFei.Text) < StrToCurr(EditMetaFei.Text) then EditProjFei.Font.Color := clred else EditProjFei.Font.Color := ClBlue;
if StrToCurr(EditProjOutRec.Text) < StrToCurr(EditMetaOutRec.Text) then EditProjOutRec.Font.Color := clred else EditProjOutRec.Font.Color := ClBlue;
if StrToCurr(EditProjMgTotal.Text) < StrToCurr(EditMetaMargemTotal.Text) then EditProjMgTotal.Font.Color := clred else EditProjMgTotal.Font.Color := ClBlue;
if StrToCurr(EditProjCustPrep.Text) < StrToCurr(EditMetaCustoPreparo.Text) then EditProjCustPrep.Font.Color := clred else EditProjCustPrep.Font.Color := ClBlue;
if StrToCurr(EditProjDepAdm.Text) < StrToCurr(EditMetaDespAdm.Text) then EditProjDepAdm.Font.Color := clred else EditProjDepAdm.Font.Color := ClBlue;
if StrToCurr(EditProjCustRep.Text) < StrToCurr(EditMetaCustoRep.Text) then EditProjCustRep.Font.Color := clred else EditProjCustRep.Font.Color := ClBlue;
if StrToCurr(EditProjDespTotal.Text) < StrToCurr(EditMetaDespTotal.Text) then EditProjDespTotal.Font.Color := clred else EditProjDespTotal.Font.Color := ClBlue;
if StrToCurr(EditProjAmort.Text) < StrToCurr(EditMetaAmort.Text) then EditProjAmort.Font.Color := clred else EditProjAmort.Font.Color := ClBlue;
if StrToCurr(EditProjDistLiq.Text) < StrToCurr(EditMetaDistLiquida.Text) then EditProjDistLiq.Font.Color := clred else EditProjDistLiq.Font.Color := ClBlue;

  // formata campos

  EditAtualMargemUn.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualMargemUn.Text));
  EditAtualMargemPVPC.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualMargemPVPC.Text));
  EditAtualFei.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualFei.Text));
  EditAtualOutRec.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualOutRec.Text));
  EditAtualMargemTotal.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualMargemTotal.Text));
  EditAtualCustoPrep.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualCustoPrep.Text));
  EditAtualDespAdm.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualDespAdm.Text));
  EditAtualCustoRep.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualCustoRep.Text));
  EditAtualDespTotais.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualDespTotais.Text));
  EditAtualDestLiquida.Text := FormatFloat('R$ #,.##', StrToCurr(EditAtualDestLiquida.Text));

    // formatação de campos

    EditUnMargem.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnMargem.Text));
    EditMetaMargem.Text:=FormatFloat('R$ #,.##', StrToCurr(EditMetaMargem.Text));
    EditProjMargemUn.Text:=FormatFloat('R$ #,.##', StrToCurr(EditProjMargemUn.Text));

    EditUnMargemPVPC.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnMargemPVPC.Text));
    EditMetaMargemPVPC.Text:= FormatFloat('R$ #,.##', StrToCurr(EditMetaMargemPVPC.Text));
    EditProjMargemPVPC.Text:= FormatFloat('R$ #,.##', StrToCurr(EditProjMargemPVPC.Text));

    EditUnFei.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnFei.Text));
    EditMetaFei.Text:= FormatFloat('R$ #,.##', StrToCurr(EditMetaFei.Text));
    EditProjFei.Text:= FormatFloat('R$ #,.##', StrToCurr(EditProjFei.Text));

    EditUnOutReceitas.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnOutReceitas.Text));
    EditMetaOutRec.Text:=  FormatFloat('R$ #,.##', StrToCurr(EditMetaOutRec.Text));
    EditProjOutRec.Text:=  FormatFloat('R$ #,.##', StrToCurr(EditProjOutRec.Text));

    EditMetaMargemTotal.Text :=  FormatFloat('R$ #,.##', StrToCurr(EditMetaMargemTotal.Text));
    EditProjMgTotal.Text :=  FormatFloat('R$ #,.##', StrToCurr(EditProjMgTotal.Text));

    EditMetaDistLiquida.Text := FormatFloat('R$ #,.##', StrToCurr(EditMetaDistLiquida.Text));
    EditProjDistLiq.Text := FormatFloat('R$ #,.##', StrToCurr(EditProjDistLiq.Text));

    EditUnCustoPreparo.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnCustoPreparo.Text));
    EditMetaCustoPreparo.Text:= FormatFloat('R$ #,.##', StrToCurr(EditMetaCustoPreparo.Text));
    EditProjCustPrep.Text:= FormatFloat('R$ #,.##', StrToCurr(EditProjCustPrep.Text));

    EditUnDespAdm.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnDespAdm.Text));
    EditMetaDespAdm.Text:=FormatFloat('R$ #,.##', StrToCurr(EditMetaDespAdm.Text));
    EditProjDepAdm.Text:=FormatFloat('R$ #,.##', StrToCurr(EditProjDepAdm.Text));

    EditUnCustoRep.Text :=  FormatFloat('R$ #,.##', StrToCurr(EditUnCustoRep.Text));
    EditMetaCustoRep.Text:= FormatFloat('R$ #,.##', StrToCurr(EditMetaCustoRep.Text));
    EditProjCustRep.Text:= FormatFloat('R$ #,.##', StrToCurr(EditProjCustRep.Text));

    EditMetaDespTotal.Text :=  FormatFloat('R$ #,.##', StrToCurr(EditMetaDespTotal.Text));
    EditProjDespTotal.Text :=  FormatFloat('R$ #,.##', StrToCurr(EditProjDespTotal.Text));

    //EditUnAmort.Text := FormatFloat('R$ #,.##', StrToCurr(EditUnAmort.Text));
    EditMetaAmort.Text:=FormatFloat('R$ #,.##', StrToCurr(EditMetaAmort.Text));
    EditProjAmort.Text:=FormatFloat('R$ #,.##', StrToCurr(EditProjAmort.Text));

    // formata proje



End;

procedure TFormDREDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  LimpaEdits;

end;

procedure TFormDREDados.AtualizaDRE;
Var
 query : TUniQuery;
 vnd : integer;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnectionSavanna;

 try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add(' and car_sit in (''Arras'', ''Vendido'', ''Fechamento'')');
  query.Open;

  EditAtualVenda.Text := IntToStr(query.FieldByName('qtd').AsInteger);

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as ''Media Margem''');
  query.SQL.Add('from CadCar');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add(' and car_sit in (''Arras'', ''Vendido'', ''Fechamento'')');
  query.Open;

  EditAtualMargemUn.Text := CurrToStr(query.FieldByName('Media Margem').AsCurrency);

  EditAtualMargemPVPC.Text := CurrToStr( StrToCurr(EditAtualMargemUn.Text) * StrToCurr(EditAtualVenda.Text));

  EditAtualFei.Text := CurrToStr( StrToCurr(StringReplace(StringReplace(EditUnFei.Text, 'R$', '', []),'.','',[])) * StrToCurr(EditAtualVenda.Text));

  EditAtualOutRec.Text := CurrToStr( StrToCurr(StringReplace(StringReplace(EditUnOutReceitas.Text, 'R$', '', []),'.','',[])) * StrToCurr(EditAtualVenda.Text));

  EditAtualMargemTotal.Text := CurrToStr(StrToCurr(EditAtualMargemPVPC.Text) + StrToCurr(EditAtualFei.Text) + StrToCurr(EditAtualOutRec.Text));

  EditAtualCustoPrep.Text  := CurrToStr( StrToCurr(StringReplace(StringReplace(EditUnCustoPreparo.Text, 'R$', '', []),'.','',[])) * StrToCurr(EditAtualVenda.Text));

  query.Connection := DataModuleConexao.UniConnection1;
  query.SQL.Clear;
  query.SQL.Add('select valor from parametrosprojecoes where tipo = ''DESP ADMINISTRATIVAS''');
  query.Open;

  EditAtualDespAdm.Text := CurrToStr(query.FieldByName('valor').AsCurrency);

  EditAtualCustoRep.Text := CurrToStr( StrToCurr(StringReplace(StringReplace(EditUnCustoRep.Text, 'R$', '', []),'.','',[])) * StrToCurr(EditAtualVenda.Text));

  EditAtualDespTotais.Text := CurrToStr( StrToCurr(EditAtualCustoPrep.Text) + StrToCurr(EditAtualDespAdm.Text) + StrToCurr(EditAtualCustoRep.Text));

  EditAtualDestLiquida.Text := CurrToStr( StrToCurr(EditAtualMargemTotal.Text) - StrToCurr(EditAtualDespTotais.Text) - StrToCurr(EditAtualAmort.Text));

  EditProjVenda.Text := CurrToStr(StrToCurr(EditAtualVenda.Text) / dayof(now) * 30);

  EditProjVenda.Text := FormatCurr('#.', StrToCurr(EditProjVenda.Text));

  EditProjMargemUn.Text := CurrToStr((StrToCurr(EditAtualMargemUn.Text) / dayof(now)) * 30);
  EditProjMargemPVPC.Text := CurrToStr(StrToCurr(EditAtualMargemPVPC.Text) / dayof(now) * 30);
  EditProjFei.Text := CurrToStr(StrToCurr(EditAtualFei.Text) / dayof(now) * 30);
  EditProjOutRec.Text := CurrToStr(StrToCurr(EditAtualOutRec.Text) / dayof(now) * 30);
  EditProjMgTotal.Text := CurrToStr(StrToCurr(EditAtualMargemTotal.Text) / dayof(now) * 30);
  EditProjCustPrep.Text := CurrToStr(StrToCurr(EditAtualCustoPrep.Text) / dayof(now) * 30);
  EditProjDepAdm.Text := CurrToStr(StrToCurr(EditAtualDespAdm.Text) / dayof(now) * 30);
  EditProjCustRep.Text := CurrToStr(StrToCurr(EditAtualCustoRep.Text) / dayof(now) * 30);
  EditProjDespTotal.Text := CurrToStr(StrToCurr(EditAtualDespTotais.Text) / dayof(now) * 30);
  EditProjAmort.Text := CurrToStr(StrToCurr(EditAtualAmort.Text) / dayof(now) * 30);
  EditProjDistLiq.Text := CurrToStr(StrToCurr(EditAtualDestLiquida.Text) / dayof(now) * 30);

  EditMetaMargemPVPC.Text := CurrToStr(StrToCurr(EditUnMargemPVPC.Text) * StrToCurr(EditMetaVenda.Text));

  EditMetaMargemTotal.Text := CurrToStr( StrToCurr(EditMetaOutRec.Text) + StrToCurr(EditMetaFei.Text) + StrToCurr(EditMetaMargemPVPC.Text) );

  EditMetaDistLiquida.Text := CurrToStr(StrToCurr(EditMetaMargemTotal.Text) - StrToCurr(EditMetaDespTotal.Text) - StrToCurr(EditMetaAmort.Text))
  //EditMetaMargem.Text := CurrToStr(StrToCurr(EditUnMargem.Text) * StrToCurr(EditMetaVenda.Text));


  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao atualizar DRE! '+ e.Message);

  End;

 end;

End;

procedure TFormDREDados.CarregaUnMetasDRE;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select * from tbprojdre');
  query.Open;

   query.First;

   while not query.eof do
   Begin

    if query.FieldByName('tipo').Text = 'VENDA' then
    Begin
      EditUnVenda.Text := query.FieldByName('un').Text;
      EditMetaVenda.Text:=query.FieldByName('meta').Text;
    End;
    if query.FieldByName('tipo').Text = 'MARGEM Un' then
    Begin
      EditUnMargem.Text := query.FieldByName('un').Text;
      EditMetaMargem.Text:=query.FieldByName('meta').Text;
    End;
    if query.FieldByName('tipo').Text = 'MARGEM PV-PC' then
    Begin
      EditUnMargemPVPC.Text := query.FieldByName('un').Text;
      EditMetaMargemPVPC.Text:= CUrrToStr(StrToCurr(EditMetaMargem.Text) * StrToCurr(EditMetaVenda.Text));
    End;
    if query.FieldByName('tipo').Text = 'F&i' then
    Begin
      EditUnFei.Text := query.FieldByName('un').Text;
      EditMetaFei.Text:= CurrToStr(StrToCurr(EditUnFei.Text) * StrToCurr(EditMetaVenda.Text));
    End;
    if query.FieldByName('tipo').Text = 'OUTRAS RECEITAS' then
    Begin
      EditUnOutReceitas.Text := query.FieldByName('un').Text;
      EditMetaOutRec.Text:=  CurrToStr(StrToCurr(EditUnOutReceitas.Text) * StrToCurr(EditMetaVenda.Text));
    End;

    EditMetaMargemTotal.Text :=  CurrToStr(StrToCurr(EditMetaMargemPVPC.Text) + StrToCurr(EditMetaFei.Text) + StrToCurr(EditMetaOutRec.Text));

    if query.FieldByName('tipo').Text = 'CUSTO DE PREPARO' then
    Begin
      EditUnCustoPreparo.Text := query.FieldByName('un').Text;
      EditMetaCustoPreparo.Text:= CUrrToStr(StrToCurr(EditUnCustoPreparo.Text) * StrToCurr(EditMetaVenda.Text));
    End;
    if query.FieldByName('tipo').Text = 'DESP ADMINISTRATIVAS' then
    Begin
      EditUnDespAdm.Text := query.FieldByName('un').Text;
      EditMetaDespAdm.Text:=query.FieldByName('un').Text;
    End;
    if query.FieldByName('tipo').Text = 'CUSTO DE REPOSIÇÃO' then
    Begin
      EditUnCustoRep.Text :=  CurrToStr((StrToCurr(StringReplace(StringReplace(FormGestaoDadosSavauto.EditMediaIndice.Text, 'R$', '', []),'.','',[])) / 30) * StrToCurr(FormGestaoDadosSavauto.EditQtdEstoqueFixProprio.Text));  //query.FieldByName('un').Text;
      EditMetaCustoRep.Text:= CurrToStr(StrToCurr(EditUnCustoRep.Text) * StrToCurr(EditMetaVenda.Text));
    End;

    EditMetaDespTotal.Text :=  CurrToStr(StrToCurr(EditMetaCustoRep.Text) + StrToCurr(EditMetaDespAdm.Text) + StrToCurr(EditMetaCustoPreparo.Text));

    if query.FieldByName('tipo').Text = 'AMORTIZAÇÕES' then
    Begin
      //EditUnAmort.Text := query.FieldByName('un').Text;
      EditMetaAmort.Text:=query.FieldByName('meta').Text;
      EditAtualAmort.Text := query.FieldByName('meta').Text;
    End;

    EditMetaDistLiquida.Text := CurrToStr(StrToCurr(EditMetaMargemTotal.Text) - StrToCurr(EditMetaDespTotal.Text) - StrToCurr(EditMetaAmort.Text));

    query.Next;

   End;

  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao carregar Un/metas! ' + e.Message);

  End;

 end;

End;

procedure TFormDREDados.FormShow(Sender: TObject);
begin

 CarregaUnMetasDRE;

end;

procedure TFormDREDados.Panel28Click(Sender: TObject);
begin

try

  SalvaMetasDRE;

  CarregaUnMetasDRE;

  MessageDlg('Metas salvadas e carregadas com sucesso! Refaça o carregamento das informações atuais para atualizar o DRE', mtInformation, [mbok] , 0);

 Except
 On E:Exception Do
 Begin
    MessageDlg('Houveram falhas na gravação ou carregamento das UN/Metas. Refaça a operação ou contate o suporte.', mtWarning, [mbok] , 0);
 End;

end;

end;

procedure TFormDREDados.PanelAtualizarClick(Sender: TObject);
begin

 LimpaEdits;

 AtualizaDRE;

 FormataCampos;

end;

end.
