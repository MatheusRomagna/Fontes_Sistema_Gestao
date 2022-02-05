unit UFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, uImportExcel, Vcl.Imaging.GIFImg, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.XPMan,
  // ,VCLTee.TeCanvas,
  Loading, Vcl.Menus, ShellAPI;

type
  TFormPrincipal = class(TForm)
    OpenDialogFIPE: TOpenDialog;
    ImageListBotoes: TImageList;
    QueryBuscaFIPE: TUniQuery;
    ImportExcel1: TImportExcel;
    QAbrePlanilha: TUniQuery;
    OpenDialog1: TOpenDialog;
    QLimpaColunas: TUniQuery;
    QAtualizaFIPEveiculos: TUniQuery;
    QBuscaFIPEVeiculo: TUniQuery;
    QBuscaFIPE: TUniQuery;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    QAtuConcFipeModelo: TUniQuery;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Permisses1: TMenuItem;
    qValidaAcesso: TUniQuery;
    Cadastros1: TMenuItem;
    Gesto1: TMenuItem;
    AnalisedeCompras1: TMenuItem;
    Vistorias1: TMenuItem;
    Avaliaes1: TMenuItem;
    Compras1: TMenuItem;
    Atendimentos1: TMenuItem;
    Panel3: TPanel;
    Image5: TImage;
    PanelTopoBotoes: TPanel;
    Panel1: TPanel;
    XPManifest2: TXPManifest;
    Avarias1: TMenuItem;
    Geral1: TMenuItem;
    Fornecedores1: TMenuItem;
    ransportadoras1: TMenuItem;
    Panel2: TPanel;
    Usuarios2: TMenuItem;
    Financeiro1: TMenuItem;
    SistemaGesto1: TMenuItem;
    AppVistoriasAvaliaes1: TMenuItem;
    PerfisdeAcessoSistemaGesto1: TMenuItem;
    FinanceiroAtendimento1: TMenuItem;
    FinanceiroTransporte1: TMenuItem;
    CadastrodeContasFinanceiras1: TMenuItem;
    ransportes1: TMenuItem;
    CidadesxCusto1: TMenuItem;
    panelFinanceiro: TPanel;
    Panel5: TPanel;
    panelTransportes: TPanel;
    Panel6: TPanel;
    panelAnaliseCompras: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    panelFrotista: TPanel;
    Panel8: TPanel;
    panelCompras: TPanel;
    Panel11: TPanel;
    panelAtendimentos: TPanel;
    Panel12: TPanel;
    panelConfigFipes: TPanel;
    Panel13: TPanel;
    Panel4: TPanel;
    PanelGestao: TPanel;
    Panel10: TPanel;
    procedure EditDiretorioTabFIPEClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnProcessaComprasClick(Sender: TObject);
    procedure btnAnaliseComprasClick(Sender: TObject);
    procedure btnVerificaDownClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
    procedure btnGestaoVistoriasClick(Sender: TObject);
    procedure btnAtuVeiculosClick(Sender: TObject);
    procedure img_btn_vistoriasClick(Sender: TObject);
    procedure img_comprasClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure Perfis1Click(Sender: TObject);
    procedure Cadastros1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure img_btn_atendimentoClick(Sender: TObject);
    procedure UsuariosMobile1Click(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnVistoriasClick(Sender: TObject);
    procedure btnAtualizaFipeClick(Sender: TObject);
    procedure btnAvaliacoesClick(Sender: TObject);
    procedure btnAtendimentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure Avarias1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure ransportadoras1Click(Sender: TObject);
    procedure btnTransporteClick(Sender: TObject);
    procedure SistemaGesto1Click(Sender: TObject);
    procedure AppVistoriasAvaliaes1Click(Sender: TObject);
    procedure PerfisdeAcessoSistemaGesto1Click(Sender: TObject);
    procedure FinanceiroTransporte1Click(Sender: TObject);
    procedure CidadesxCusto1Click(Sender: TObject);
    procedure panelFinanceiroClick(Sender: TObject);
    procedure panelFinanceiroMouseLeave(Sender: TObject);
    procedure panelFinanceiroMouseEnter(Sender: TObject);
    procedure panelTransportesClick(Sender: TObject);
    procedure panelAnaliseComprasClick(Sender: TObject);
    procedure panelFrotistaClick(Sender: TObject);
    procedure panelComprasClick(Sender: TObject);
    procedure panelAtendimentosClick(Sender: TObject);
    procedure panelConfigFipesClick(Sender: TObject);
    procedure panelAnaliseComprasMouseEnter(Sender: TObject);
    procedure panelAnaliseComprasMouseLeave(Sender: TObject);
    procedure panelFrotistaMouseEnter(Sender: TObject);
    procedure panelFrotistaMouseLeave(Sender: TObject);
    procedure panelComprasMouseEnter(Sender: TObject);
    procedure panelComprasMouseLeave(Sender: TObject);
    procedure panelAtendimentosMouseEnter(Sender: TObject);
    procedure panelAtendimentosMouseLeave(Sender: TObject);
    procedure panelConfigFipesMouseEnter(Sender: TObject);
    procedure panelConfigFipesMouseLeave(Sender: TObject);
    procedure panelTransportesMouseEnter(Sender: TObject);
    procedure panelTransportesMouseLeave(Sender: TObject);
    procedure PanelGestaoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  procedure CarregaExcelFIPE();
  procedure ImportaFIPE();

  procedure ImportaNewFipe();

  Procedure CarregaExcelSavautoVnd30Dias();
  procedure ImportaVnd30dias();
  Procedure CarregaExcelSavautoEstoque();
  procedure ImportaEstoque();
  Procedure CarregaExcelSavautoVendas();
  procedure ImportaVendas();
    procedure MudaCor(panel: tpanel);
    function GetAveCharSize(Canvas: TCanvas): TPoint;
    function InputSenha(const ACaption, APrompt: string;
      var Value: string): Boolean;


    { Private declarations }
  public
    { Public declarations }
    function InputBoxPass(const ACaption, APrompt, ADefault: string): string;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation



{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormLoading,
  UFormNovoProcessamento, UFormProcPlanAcelero, UFormAtuHistFIPE,
  UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE, UFormProcPlanFinal,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormColunasOcultas, UFormDownloadNovaVersao, UFormAnaliseCompra, UFormImagem,
  UFormImportacoesEfetuadas, UFormPadroesPlanilhas, UFormUltimasAtualizacoes,
  UFormGestaoVistoria, UFormWebBrowse, UDataModuleRESTDWvistoria,
  UDMRestDataWareDB, UFormAvarias, UFormCadVistoriadores, UFormLoadingOpaco,
  UFormNovoVistoriador, UFormVistoriadores, UFormVistoriasDetalhes,
  UforTestesDiversos, UFormAtuTabFIpe, UFormGestaoAvaliacoes, UFormLotesArval,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UnitLogin,
  UDataModuleBancoVistoria, UFormAvaliarAvaliacao, UFormPermissoesCarga,
  UFormLoginSavauto, UFormHistoricoAvaliacoes, UFormPerfis, UFormCadaUsuario,
  UFormConcedePermissao, UFormDadosPerfil, UFormUsuarios, UFormAtendimentos,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormCadaNovoUsuMobile,
  UFormCadaUsuariosMobile, UFormDetalhesAtendimento, UFormPesquisaFipe,
  FMX.UFormGraficosAtendimento, UFormAgendamento, UDMPermissoes,
  UFormAlteraFipeDePaxa, UFormCruzamentoFipes, UFormInformacoes,
  UFormQuitacoesVeiculo, UFormSegIPVALic, UFormDadosPagamento,
  UFormDataPagamento, UFormHistoricoObsAtn, UFormLiberaPermissao,
  UFormLoadingCarregamento, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormPagamentoVeiculo, UFormRefFipes,
  UFormAjusteDadosFipeAvaliacao, UFormExtratoPgtoVeiculos,
  UFormPgtoExtratoVeiculo, UFormGestaoAvarias, UFormListaUsuarios,
  UFormParametros, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraMidiaAnuncio, UFormAlteraPlaca,
  UFormAvariasItens, UFormCriacaoAvaria, UFormFornecedoresFrotista,
  UFormCadastroTransportadoras, UFormFornecedorFrotistaAddEditar,
  UFormCadastroTransportadora, UFormAlteraPermissaoAppTransp,
  UFormNovoUsuarioTransporte, UFormPermissoesUsuarioAppTransporte,
  UFormTransportes, UFormGestaoTransporte, UFormDetalheTransportes,
  UFormFinanceiroTransportes, UFormCidadesCustos, UFormDadosPgtoTransporte,
  UFormListaBancos, UFormPagamentoTransporte, UFormAguarde,
  UFormDetalhesAtendimentoBeta, UFormGestaoDadosSavauto, UFormNovaCidadeCusto,
  UFormPagamentoEmLoteTransportes, UClasseVeiculoAvaliacao,
  UFormDetalhesResumoCompra, UFormDEV, UFormDivergenciasDados, UFormDREDados,
  UFormFiltrosGestao, UFormRelacaoEstoque, UFormTabelaCompra,
  UFormVerCarrosClasse;

function TFormPrincipal.GetAveCharSize(Canvas: TCanvas): TPoint;
 var
   I: Integer;
   Buffer: array[0..51] of Char;
 begin
   for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
   for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
   GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
   Result.X := Result.X div 52;
 end;

 function TFormPrincipal.InputBoxPass(const ACaption, APrompt,
   ADefault: string): string;
 begin
   Result := ADefault;
   InputSenha(ACaption, APrompt, Result);
 end;

 function TFormPrincipal.InputSenha(const ACaption, APrompt: string;
   var Value: string): Boolean;
 var
   Form: TForm;
   Prompt: TLabel;
   Edit: TEdit;
   DialogUnits: TPoint;
   ButtonTop, ButtonWidth, ButtonHeight: Integer;
 begin
   Result := False;
   Form := TForm.Create(Application);
   with Form do
   try
     Canvas.Font := Font;
     DialogUnits := GetAveCharSize(Canvas);
     BorderStyle := bsDialog;
     Caption := ACaption;
     ClientWidth := MulDiv(180, DialogUnits.X, 4);
     ClientHeight := MulDiv(63, DialogUnits.Y, 8);
     Position := poMainformcenter;
     Prompt := TLabel.Create(Form);
     with Prompt do
     begin
       Parent := Form;
       AutoSize := True;
       Left := MulDiv(8, DialogUnits.X, 4);
       Top := MulDiv(8, DialogUnits.Y, 8);
       Caption := APrompt;
     end;
     Edit := TEdit.Create(Form);
     with Edit do
     begin
       Parent := Form;
       Left := Prompt.Left;
       Top := MulDiv(19, DialogUnits.Y, 8);
       Width := MulDiv(164, DialogUnits.X, 4);
       {} MaxLength := 20;
       {} Passwordchar := '*';
       {} Font.Color := clBlue;
       Text := Value;
       SelectAll;
     end;
     ButtonTop := MulDiv(41, DialogUnits.Y, 8);
     ButtonWidth := MulDiv(50, DialogUnits.X, 4);
     ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
     with TButton.Create(Form) do
     begin
       Parent := Form;
       Caption := 'Ok';
       ModalResult := mrOk;
       Default := True;
       SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
     end;
     with TButton.Create(Form) do
     begin
       Parent := Form;
       Caption := 'Cancelar';
       ModalResult := mrCancel;
       Cancel := True;
       SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,ButtonHeight);
     end;
     if ShowModal = mrOk then
     begin
     Value := Edit.Text;
     Result := True;
     end;
   finally
     Form.Free;
   end;
 end;

procedure TFormPrincipal.MudaCor(panel: tpanel);
Begin

  if panel.Color = $000000B0 then
  panel.Color := $007777FF
  Else
  Panel.Color :=$000000B0;


End;

procedure TFormPrincipal.btnAtendimentoClick(Sender: TObject);
begin

 if FormAtendimentos = nil then
 Begin
   FormAtendimentos := TFormAtendimentos.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin

    FormAtendimentos.ComboOperador.Clear;

    // Busca Operadores USUARIO ADM
    FormAtendimentos.qBuscaOperadores.SQL.Clear;
    FormAtendimentos.qBuscaOperadores.sql.Add('select distinct nome from tbUsuarios order by nome');
    FormAtendimentos.qBuscaOperadores.Open;
    FormAtendimentos.qBuscaOperadores.First;
    while not FormAtendimentos.qBuscaOperadores.Eof do
    Begin
      FormAtendimentos.ComboOperador.Items.Add(FormAtendimentos.qBuscaOperadores.FieldByName('nome').AsString);
      FormAtendimentos.qBuscaOperadores.Next;
    End;

    FormAtendimentos.qBuscaAtendimentos.Active := true;
    FormAtendimentos.qBuscaAtendimentos.Open;

    FormAtendimentos.ComboOperador.Enabled := true;
    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtendimentos.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtendimentos.ComboOperador.Clear;

    // uUSUARIO NAO ADM
    FormAtendimentos.ComboOperador.Text := FormLoginSavauto.EditUsuario.Text;
    FormAtendimentos.ComboOperador.Enabled := false;

    FormAtendimentos.qBuscaAtendimentos.Filter := 'usuario='+QuotedStr( UpperCase( FormAtendimentos.ComboOperador.Text) );
    FormAtendimentos.qBuscaAtendimentos.Filtered := true;
    FormAtendimentos.qBuscaAtendimentos.Active := true;

    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.btnAtualizaFipeClick(Sender: TObject);
begin

 if FormAtuTabFIpe = nil then
 Begin
   FormAtuTabFIpe := TFormAtuTabFIpe.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormAtuTabFIpe.Position := poScreenCenter;
  FormAtuTabFIpe.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtuTabFIpe.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtuTabFIpe.Position := poScreenCenter;
      FormAtuTabFIpe.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.btnAtualizarClick(Sender: TObject);
begin

 {if EditDiretorioTabFIPE.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioTabFIPE.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório da FIPE', mtWarning, [mbok], 0);
   End
   Else
   Begin
     FormLoading.LabelStatus.Caption := 'Importando tabele FIPE';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelFIPE;
     Application.ProcessMessages;
     ImportaFIPE;
     FormLoading.Close;
     ShowMessage('Tabela FIPE Importada e atualizada com sucesso');
   End;
 End;
      }

end;

procedure TFormPrincipal.btnAtuVeiculosClick(Sender: TObject);
Var
 CountMAX, CountAtual, I : Integer;
begin
  FormLoading.LabelStatus.Caption := 'Aguarde, aualizando FIPE de Veículos...';
  FormLoading.LabelStatus.Refresh;

  FormLoading.Position := poScreenCenter;
  FormLoading.Show;

  QBuscaFIPEVeiculo.SQL.Clear;
  QBuscaFIPEVeiculo.SQL.Add('select distinct ANO_MOD, COD_FIPE, VLR_FIPE from TBPROCPLANS where ANO_MOD is not null  and ano_mod <> ''''');
  QBuscaFIPEVeiculo.Open;

  I := 0;
  FormLoading.ProgressBar1.Position := i;
  QBuscaFIPEVeiculo.Last;
  CountMAX := QBuscaFIPEVeiculo.RecordCount;
  FormLoading.ProgressBar1.Max := CountMAX;

  QBuscaFIPEVeiculo.First;

  while not QBuscaFIPEVeiculo.Eof do
  Begin

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' as VLR_NEW from TBFIPE');
     QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' > 0');
     QBuscaFIPE.ParamByName('c_fipe').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPEVeiculo.FieldByName('VLR_FIPE').AsCurrency <>  QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency then
     Begin

      QAtualizaFIPEveiculos.SQL.Clear;
      QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set VLR_FIPE = :NEW_FIPE where');
      QAtualizaFIPEveiculos.SQL.Add('COD_FIPE = :FIPE and ANO_MOD = :ANO');
      QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtualizaFIPEveiculos.ParamByName('FIPE').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtualizaFIPEveiculos.ParamByName('ANO').Text :=  QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtualizaFIPEveiculos.Execute;

      QAtuConcFipeModelo.SQL.Clear;
      QAtuConcFipeModelo.SQL.Add('update TBCONCFIPEMODELO set VLR_FIPE=:Vlr where COD_FIPE=:Cod_Fipe and ANO=:ANO');
      QAtuConcFipeModelo.ParamByName('Vlr').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtuConcFipeModelo.ParamByName('Cod_Fipe').Text  := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtuConcFipeModelo.ParamByName('ANO').Text       := QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtuConcFipeModelo.Execute;

     End;

      FormLoading.LabelStatus.Caption := 'Atualizou Veículo FIPE: '+QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;

      Application.ProcessMessages;

      FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;

      QBuscaFIPEVeiculo.Next;

     End;

     FormLoading.LabelStatus.Caption := 'Processo finalizado!';
     ShowMessage('Atualização aplicada com sucesso');

     FormLoading.ProgressBar1.Position := 0;

     FormLoading.Close;
end;

procedure TFormPrincipal.btnAvaliacoesClick(Sender: TObject);
begin

 if FormGestaoAvaliacoes = nil then
 Begin
   FormGestaoAvaliacoes := TFormGestaoAvaliacoes.Create(self);
 End;


 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormGestaoAvaliacoes.WindowState := wsMaximized;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
  FormGestaoAvaliacoes.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoAvaliacoes.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
        FormGestaoAvaliacoes.WindowState := wsMaximized;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
        FormGestaoAvaliacoes.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.btnGestaoVistoriasClick(Sender: TObject);
begin

 FormGestaoVistoria.WindowState := wsMaximized;
 FormGestaoVistoria.ShowModal;

end;

procedure TFormPrincipal.btnVerificaDownClick(Sender: TObject);
begin
 FormDownloadNovaVersao.Position := poScreenCenter;
 FormDownloadNovaVersao.ShowModal;
end;

procedure TFormPrincipal.btnVistoriasClick(Sender: TObject);
begin

 if FormGestaoVistoria = nil then
 Begin
   FormGestaoVistoria := TFormGestaoVistoria.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormGestaoVistoria.WindowState := wsMaximized;
    FormGestaoVistoria.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoVistoria.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormGestaoVistoria.WindowState := wsMaximized;
      FormGestaoVistoria.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin

 { FormLoginSavauto.Position := poScreenCenter;
  FormLoginSavauto.Show;}

end;

procedure TFormPrincipal.btnProcessaComprasClick(Sender: TObject);
begin
 FormAnaliseCompraQuery.WindowState := wsMaximized;
 FormAnaliseCompraQuery.ShowModal;
end;

procedure TFormPrincipal.btnTransporteClick(Sender: TObject);
begin

 if FormGestaoTransporte = nil then
 Begin
   FormGestaoTransporte := TFormGestaoTransporte.Create(self);
 End;

 FormGestaoTransporte.WindowState := wsMaximized;
 FormGestaoTransporte.ShowModal;

end;

procedure TFormPrincipal.Button5Click(Sender: TObject);
begin

 FormAnaliseComprasTabela.ShowModal;

end;

procedure tFormPrincipal.CarregaExcelSavautoVnd30Dias;
Begin

End;

procedure TFormPrincipal.CidadesxCusto1Click(Sender: TObject);
begin

 if FormCidadesCustos = nil then
 Begin
   FormCidadesCustos := tFormCidadesCustos.Create(self);
 End;

 FormCidadesCustos.Position := poScreenCenter;
 FormCidadesCustos.ShowModal;

end;

procedure tFormPrincipal.CarregaExcelSavautoEstoque;
Begin

End;

procedure tFormPrincipal.CarregaExcelSavautoVendas;
Begin

End;

procedure TFormPrincipal.Cadastros1Click(Sender: TObject);
begin

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger < 99 then
 Begin
   MessageDlg('Usuário sem permissão de acesso a esta função!' + #13 + 'Caso precise de acesso, contate um administrador', mtInformation, [mbok] , 0);
   Abort;
 End;


end;

procedure TFormPrincipal.CarregaExcelFIPE;
begin  {
  if FormPrincipal.EditDiretorioTabFIPE.Text <> '' then
  Begin
    ImportExcel1.ExcelFile := FormPrincipal.EditDiretorioTabFIPE.Text;
    Application.ProcessMessages;
    ImportExcel1.ExcelParaStringGrid(FormAtualizaTabelaFipe.StringGridFIPE , FormAtualizaTabelaFipe.ProgressBar1);
    Application.ProcessMessages;
  End }
end;

procedure TFormPrincipal.EditDiretorioTabFIPEClick(Sender: TObject);
begin
   {
 if EditDiretorioTabFIPE.Text = '' then
 Begin
   OpenDialogFIPE.Execute();
   if OpenDialogFIPE.FileName <> '' then
   EditDiretorioTabFIPE.Text := OpenDialogFIPE.FileName;

   QueryBuscaFIPE.SQL.Clear;
   QueryBuscaFIPE.SQL.Add('delete from TBDIRETORIOS where tipo = ''FIPE''');
   QueryBuscaFIPE.Execute;

   QueryBuscaFIPE.SQL.Clear;
   QueryBuscaFIPE.SQL.Add('insert into TBDIRETORIOS (tipo, diretorio) values (''FIPE'', :dir)');
   QueryBuscaFIPE.ParamByName('dir').Text := OpenDialogFIPE.FileName;
   QueryBuscaFIPE.Execute;

 End
 Else
 Begin
  if MessageDlg('Deseja recarregar a planilha FIPE?', mtConfirmation, [ mbno, mbyes] , 0) = mryes then
  Begin
    OpenDialogFIPE.Execute();
    if OpenDialogFIPE.FileName <> '' then
    EditDiretorioTabFIPE.Text := OpenDialogFIPE.FileName;
  End;
 End;
    }
end;

function GetNomeComputador : String;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
var
  lpBuffer : PChar;
  nSize : DWord;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;


procedure TFormPrincipal.FinanceiroTransporte1Click(Sender: TObject);
begin

 if FormFinanceiroTransportes = nil then
 Begin
    FormFinanceiroTransportes := TFormFinanceiroTransportes.Create(self);
 End;

 FormFinanceiroTransportes.qBuscaFinanceiro.Refresh;

 FormFinanceiroTransportes.WindowState := wsMaximized;
 FormFinanceiroTransportes.ShowModal;


end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   if FormColunasOcultas = nil then
   Begin
     FormColunasOcultas := TFormColunasOcultas.Create(self);
   End;

   FormColunasOcultas.QColunas.SQL.Clear;
   FormColunasOcultas.QColunas.SQL.Add('delete from TBCOLUNASOCULTAS where HOSTNAME = :HOST');
   FormColunasOcultas.QColunas.ParamByName('HOST').Text := GetNomeComputador;
   FormColunasOcultas.QColunas.Execute;

   Application.Terminate;

end;

procedure TFormPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = 120) and (Shift = [ssCtrl]) then
  Begin
       if InputBoxPass('Digite a senha de Desenvolvedor','','') = 'an885400!' then
       Begin
         FormDEV.Position := poScreenCenter;
         FormDEV.ShowModal;
       End;
  End;

end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin

   WindowState := wsMaximized;

{   Application.ProcessMessages;

   Sleep(1000);

   Application.ProcessMessages;

   TThread.CreateAnonymousThread(procedure
   Begin
    Sleep(1000);

    Application.ProcessMessages;

    TThread.Synchronize(nil, procedure
    Begin

      FormLoginSavauto.Position := poScreenCenter;
      FormLoginSavauto.Show;

    End);
   end).Start;
 }
end;

procedure TFormPrincipal.Fornecedores1Click(Sender: TObject);
begin

 FormFornecedoresFrotista.qBuscaFornecedores.Close;
 FormFornecedoresFrotista.qBuscaFornecedores.Open;
 FormFornecedoresFrotista.qBuscaFornecedores.Refresh;
 FormFornecedoresFrotista.Position := poScreenCenter;
 FormFornecedoresFrotista.Show;

end;

procedure TFormPrincipal.Geral1Click(Sender: TObject);
begin

 if FormLoginSavauto.qValidaUsuario.FieldByName('configuracoes').AsInteger = 1 then
 Begin
   if FormParametros = nil then
   FormParametros := TFormParametros.Create(self);
   FormParametros.Position := poScreenCenter;
   FormParametros.Show;
 End;


end;

procedure TFormPrincipal.Image2Click(Sender: TObject);
begin

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormAtuTabFIpe.Position := poScreenCenter;
  FormAtuTabFIpe.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtuTabFIpe.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtuTabFIpe.Position := poScreenCenter;
      FormAtuTabFIpe.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.Image3Click(Sender: TObject);
begin


{ FormDownloadNovaVersao.Position := poScreenCenter;
 FormDownloadNovaVersao.ShowModal; }

 if MessageDlg('Será aberto o site de download da versão dektop, com isso o sistema será finalizado. Basta baixar a versão desktop e substituir por esta.', mtInformation, [mbno, mbyes], 0) = mrYes then
 Begin

 ShellExecute(Handle,
               'open',
               'https://savautovistoria.net/',
               nil,
               nil,
               SW_SHOWMAXIMIZED);

   Application.Terminate;
 End
 Else
 Begin
   Abort;
 End;

end;

procedure TFormPrincipal.Image4Click(Sender: TObject);
Begin

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormGestaoAvaliacoes.WindowState := wsMaximized;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
  FormGestaoAvaliacoes.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoAvaliacoes.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
        FormGestaoAvaliacoes.WindowState := wsMaximized;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
        FormGestaoAvaliacoes.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.img_btn_atendimentoClick(Sender: TObject);
begin

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin

    FormAtendimentos.ComboOperador.Clear;

    // Busca Operadores USUARIO ADM
    FormAtendimentos.qBuscaOperadores.SQL.Clear;
    FormAtendimentos.qBuscaOperadores.sql.Add('select distinct nome from tbUsuarios order by nome');
    FormAtendimentos.qBuscaOperadores.Open;
    FormAtendimentos.qBuscaOperadores.First;
    while not FormAtendimentos.qBuscaOperadores.Eof do
    Begin
      FormAtendimentos.ComboOperador.Items.Add(FormAtendimentos.qBuscaOperadores.FieldByName('nome').AsString);
      FormAtendimentos.qBuscaOperadores.Next;
    End;

    FormAtendimentos.qBuscaAtendimentos.Active := true;
    FormAtendimentos.qBuscaAtendimentos.Open;

    FormAtendimentos.ComboOperador.Enabled := true;
    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtendimentos.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtendimentos.ComboOperador.Clear;

    // uUSUARIO NAO ADM
    FormAtendimentos.ComboOperador.Text := FormLoginSavauto.EditUsuario.Text;
    FormAtendimentos.ComboOperador.Enabled := false;

    FormAtendimentos.qBuscaAtendimentos.Filter := 'usuario='+QuotedStr( UpperCase( FormAtendimentos.ComboOperador.Text) );
    FormAtendimentos.qBuscaAtendimentos.Filtered := true;
    FormAtendimentos.qBuscaAtendimentos.Active := true;

    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.img_btn_vistoriasClick(Sender: TObject);
begin

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormGestaoVistoria.WindowState := wsMaximized;
    FormGestaoVistoria.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoVistoria.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormGestaoVistoria.WindowState := wsMaximized;
      FormGestaoVistoria.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.img_comprasClick(Sender: TObject);
begin

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormAnaliseCompraQuery.WindowState := wsMaximized;
    FormAnaliseCompraQuery.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAnaliseCompraQuery.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
     FormAnaliseCompraQuery.WindowState := wsMaximized;
     FormAnaliseCompraQuery.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.ImportaEstoque;
Var
  I : integer;
  statusBar : integer;
 Begin


    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from IMPORTASAVANNAESTOQUE');
    DataModuleConexao.QInsereExcelFIPE.Execute;


 Try
  for I := 0 to FormAtualizaTabelaFipe.StringGridFipe.RowCount do
  Begin

  {if I = 0 then
  Continue;}

  if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into IMPORTASAVANNAESTOQUE');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('qtd,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('fipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MODELO, ano)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':qtd,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':fipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo, :ano)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('qtd').AsInteger := StrToInt(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]);
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('fipe').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
    DataModuleConexao.QInsereExcelFIPE.ParamByName('ano').AsString := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando Estoque Savauto '+FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];

    Application.ProcessMessages;

  End;
 Finally

 End;

end;

procedure TFormPrincipal.ImportaFIPE;
Var
  I : integer;
  statusBar, MAX : integer;
  FIPE, ANO : String;
  VLR_FIPE : Currency;
 Begin


    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from TBFIPE');
    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.ProgressBar1.Position := 0;

    MAX := FormAtualizaTabelaFipe.StringGridFIPE.RowCount;

    FormLoading.ProgressBar1.Max := MAX;


 Try
  for I := 0 to Pred(FormAtualizaTabelaFipe.StringGridFipe.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into TBFIPE');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('COD_FIPE,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MARCA,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MODELO,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('COMB,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1985,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1986,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1987,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1988,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1989,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1990,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1991,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1992,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1993,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1994,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1995,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1996,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1997,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1998,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1999,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2000,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2001,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2002,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2003,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2004,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2005,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2006,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2007,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2008,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2009,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2010,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2011,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2012,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2013,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2014,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2015,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2016,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2017,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2018,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2019,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2020,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO0KM,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2021)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':codfipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':marca,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':comb,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1985,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1986,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1987,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1988,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1989,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1990,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1991,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1992,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1993,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1994,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1995,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1996,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1997,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1998,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1999,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2000,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2001,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2002,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2003,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2004,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2005,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2006,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2007,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2008,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2009,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2010,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2011,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2012,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2013,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2014,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2015,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2016,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2017,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2018,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2019,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2020,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':zerocaemi,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2021)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('codfipe').AsString := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('marca').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('comb').AsString    := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    if not FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := 0;

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando tabela FIPE '+FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I]+' Marca: '+FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];

    FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;

    Application.ProcessMessages;

  End;
 Finally

 End;

{  FormLoading.LabelStatus.Caption := 'Aguarde, aualizando FIPE de Veículos...';
  FormLoading.LabelStatus.Refresh;

  QBuscaFIPEVeiculo.SQL.Clear;
  QBuscaFIPEVeiculo.SQL.Add('select ANO_MOD, COD_FIPE, VLR_FIPE from TBPROCPLANS');
  QBuscaFIPEVeiculo.Open;

  QBuscaFIPEVeiculo.First;

  while not QBuscaFIPEVeiculo.Eof do
  Begin

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' as VLR_NEW from TBFIPE');
     QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' > 0');
     QBuscaFIPE.ParamByName('c_fipe').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
     QBuscaFIPE.Open;

      QAtualizaFIPEveiculos.SQL.Clear;
      QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set VLR_FIPE = :NEW_FIPE where');
      QAtualizaFIPEveiculos.SQL.Add('COD_FIPE = :FIPE and ANO_MOD = :ANO');
      QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtualizaFIPEveiculos.ParamByName('FIPE').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtualizaFIPEveiculos.ParamByName('ANO').Text :=  QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtualizaFIPEveiculos.Execute;

      FormLoading.LabelStatus.Caption := 'Atualizou Veículo FIPE: '+QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;

      Application.ProcessMessages;

      QBuscaFIPEVeiculo.Next;
     End;
      }
  ShowMessage('Atualização aplicada com sucesso');
  FormLoading.Close;
  {
  if MessageDlg('Deseja atualizar a FIPE nos veículos já lançados agora?', mtInformation, [mbno, mbyes] , 0) = mrYes then
  Begin
    btnAtuVeiculos.Click;
  End;
   }
end;


procedure TFormPrincipal.ImportaNewFipe;
Var
  I : integer;
  statusBar : integer;
 Begin


    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from TBNEWFIPE');
    DataModuleConexao.QInsereExcelFIPE.Execute;


 Try
  for I := 0 to Pred(FormAtualizaTabelaFipe.StringGridFipe.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into TBNEWFIPE');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('COD_FIPE,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MARCA,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MODELO,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('vlr)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':codfipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':marca,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':ano,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':vlr)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('codfipe').AsString := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('marca').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('comb').AsString    := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    if not FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := 0;

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando tabela FIPE '+FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I]+' Marca: '+FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];

    Application.ProcessMessages;

  End;
 Finally

 End;

end;

procedure TFormPrincipal.ImportaVendas;
Var
  I : integer;
  statusBar : integer;
 Begin


    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from IMPORTASAVANNAULTIMASVENDAS');
    DataModuleConexao.QInsereExcelFIPE.Execute;


 Try
  for I := 0 to Pred(FormAtualizaTabelaFipe.StringGridFipe.RowCount) do
  Begin

  {if I = 0 then
  Continue;}

  if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into IMPORTASAVANNAULTIMASVENDAS');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('valor,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('data,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('modelo, ano, fipe)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':valor,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':data,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo, :ano, :fipe)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('valor').AsCurrency := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]);
    DataModuleConexao.QInsereExcelFIPE.ParamByName('Data').Text := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('fipe').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
    //DataModuleConexao.QInsereExcelFIPE.ParamByName('placa').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I];
    DataModuleConexao.QInsereExcelFIPE.ParamByName('ano').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando Estoque Savauto '+FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I];

    Application.ProcessMessages;

  End;
 Finally

 End;

end;

procedure TFormPrincipal.ImportaVnd30dias;
Var
  I : integer;
  statusBar : integer;
 Begin


    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from IMPORTASAVANNAVENDA30DIAS');
    DataModuleConexao.QInsereExcelFIPE.Execute;


 Try
  for I := 0 to FormAtualizaTabelaFipe.StringGridFipe.RowCount -1 do
  Begin

  {if I = 0 then
  Continue; }

  {if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;}

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into IMPORTASAVANNAVENDA30DIAS ');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('qtd,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('fipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('modelo, ano)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':qtd,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':fipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo, :ano)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('qtd').AsInteger := StrToInt(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]);
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('fipe').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
    DataModuleConexao.QInsereExcelFIPE.ParamByName('ano').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando Estoque Savauto '+FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];

    Application.ProcessMessages;

  End;
 Finally

 End;

end;

procedure TFormPrincipal.panelAnaliseComprasClick(Sender: TObject);
begin

 if FormAnaliseCompraQuery = nil then
 Begin
   FormAnaliseCompraQuery := TFormAnaliseCompraQuery.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormAnaliseCompraQuery.WindowState := wsMaximized;
    FormAnaliseCompraQuery.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAnaliseCompraQuery.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
     FormAnaliseCompraQuery.WindowState := wsMaximized;
     FormAnaliseCompraQuery.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.panelAnaliseComprasMouseEnter(Sender: TObject);
begin

 MudaCor( panelAnaliseCompras );

end;

procedure TFormPrincipal.panelAnaliseComprasMouseLeave(Sender: TObject);
begin

 MudaCor( panelAnaliseCompras );

end;

procedure TFormPrincipal.panelAtendimentosClick(Sender: TObject);
begin

 if FormAtendimentos = nil then
 Begin
   FormAtendimentos := TFormAtendimentos.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin

    FormAtendimentos.ComboOperador.Clear;

    // Busca Operadores USUARIO ADM
    FormAtendimentos.qBuscaOperadores.SQL.Clear;
    FormAtendimentos.qBuscaOperadores.sql.Add('select distinct nome from tbUsuarios order by nome');
    FormAtendimentos.qBuscaOperadores.Open;
    FormAtendimentos.qBuscaOperadores.First;
    while not FormAtendimentos.qBuscaOperadores.Eof do
    Begin
      FormAtendimentos.ComboOperador.Items.Add(FormAtendimentos.qBuscaOperadores.FieldByName('nome').AsString);
      FormAtendimentos.qBuscaOperadores.Next;
    End;

    //FormAtendimentos.qBuscaAtendimentos.Active := true;
    //FormAtendimentos.qBuscaAtendimentos.Open;

    FormAtendimentos.ComboOperador.Enabled := true;
    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtendimentos.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtendimentos.ComboOperador.Clear;

    // uUSUARIO NAO ADM
    FormAtendimentos.ComboOperador.Text := FormLoginSavauto.EditUsuario.Text;
    FormAtendimentos.ComboOperador.Enabled := false;

    FormAtendimentos.qBuscaAtendimentos.Filter := 'usuario='+QuotedStr( UpperCase( FormAtendimentos.ComboOperador.Text) );
    FormAtendimentos.qBuscaAtendimentos.Filtered := true;
    FormAtendimentos.qBuscaAtendimentos.Close;
    //FormAtendimentos.qBuscaAtendimentos.Active := true;

    FormAtendimentos.WindowState := wsMaximized;
    FormAtendimentos.ShowModal;

    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.panelAtendimentosMouseEnter(Sender: TObject);
begin

  MudaCor( panelAtendimentos );

end;

procedure TFormPrincipal.panelAtendimentosMouseLeave(Sender: TObject);
begin

  MudaCor( panelAtendimentos );

end;

procedure TFormPrincipal.panelComprasClick(Sender: TObject);
begin

 if FormGestaoAvaliacoes = nil then
 Begin
   FormGestaoAvaliacoes := TFormGestaoAvaliacoes.Create(self);
 End;


 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormGestaoAvaliacoes.WindowState := wsMaximized;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
  DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
  FormGestaoAvaliacoes.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoAvaliacoes.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
        FormGestaoAvaliacoes.WindowState := wsMaximized;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
        DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
        FormGestaoAvaliacoes.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.panelComprasMouseEnter(Sender: TObject);
begin

  MudaCor( panelCompras );

end;

procedure TFormPrincipal.panelComprasMouseLeave(Sender: TObject);
begin

  MudaCor( panelCompras );

end;

procedure TFormPrincipal.panelConfigFipesClick(Sender: TObject);
begin

 if FormAtuTabFIpe = nil then
 Begin
   FormAtuTabFIpe := TFormAtuTabFIpe.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
  FormAtuTabFIpe.Position := poScreenCenter;
  FormAtuTabFIpe.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAtuTabFIpe.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormAtuTabFIpe.Position := poScreenCenter;
      FormAtuTabFIpe.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.panelConfigFipesMouseEnter(Sender: TObject);
begin

   MudaCor( panelConfigFipes );

end;

procedure TFormPrincipal.panelConfigFipesMouseLeave(Sender: TObject);
begin

   MudaCor( panelConfigFipes );

end;

procedure TFormPrincipal.panelFinanceiroClick(Sender: TObject);
begin


 if FormMenuFinanceiro = nil then
 Begin
   FormMenuFinanceiro := TFormMenuFinanceiro.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('financeiro').AsInteger = 1 then
 Begin

  FormMenuFinanceiro.Position := poScreenCenter;
  FormMenuFinanceiro.ShowModal;

 End
 Else
 Begin

  MessageDlg('Usuário sem permissão financeiro para acesso!', mtWarning, [mbok] , 0);

 End;

end;

procedure TFormPrincipal.panelFinanceiroMouseEnter(Sender: TObject);
begin

 MudaCor(panelFinanceiro);

end;

procedure TFormPrincipal.panelFinanceiroMouseLeave(Sender: TObject);
begin

 MudaCor(panelFinanceiro);

end;

procedure TFormPrincipal.panelFrotistaClick(Sender: TObject);
begin

 if FormGestaoVistoria = nil then
 Begin
   FormGestaoVistoria := TFormGestaoVistoria.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormGestaoVistoria.WindowState := wsMaximized;

    DataModuleBancoVistoria.qConsultaFotos.Close;

    FormGestaoVistoria.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormGestaoVistoria.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
      FormGestaoVistoria.WindowState := wsMaximized;

      DataModuleBancoVistoria.qConsultaFotos.Close;

      FormGestaoVistoria.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;
end;

procedure TFormPrincipal.panelFrotistaMouseEnter(Sender: TObject);
begin

 MudaCor( panelFrotista );

end;

procedure TFormPrincipal.panelFrotistaMouseLeave(Sender: TObject);
begin
 MudaCor( panelFrotista );
end;

procedure TFormPrincipal.PanelGestaoClick(Sender: TObject);
begin

 try

  if InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End;

  if DataModuleConexao.UniConnectionSavanna.Connected = false then
  Begin
     DataModuleConexao.UniConnectionSavanna.Connected := true;
     //ShowMessage('Conectado com sucesso!');
  End;

     if FormGestaoDadosSavauto = nil then
     Begin
        FormGestaoDadosSavauto := TFormGestaoDadosSavauto.Create(self);
     End;

        FormGestaoDadosSavauto.WindowState := wsMaximized;
        FormGestaoDadosSavauto.ShowModal;

  Except
  On E:Exception Do
    Begin
      ShowMessage('Falha ao conectar banco de dados SQL Server, verifique os dados no servidor ou parâmentros de conexão!');
    End;
 end;

end;

procedure TFormPrincipal.panelTransportesClick(Sender: TObject);
begin

 if FormGestaoTransporte = nil then
 Begin
   FormGestaoTransporte := TFormGestaoTransporte.Create(self);
 End;

 FormGestaoTransporte.WindowState := wsMaximized;
 FormGestaoTransporte.ShowModal;
end;

procedure TFormPrincipal.panelTransportesMouseEnter(Sender: TObject);
begin

 MudaCor( panelTransportes );

end;

procedure TFormPrincipal.panelTransportesMouseLeave(Sender: TObject);
begin

 MudaCor( panelTransportes );

end;

procedure TFormPrincipal.Perfis1Click(Sender: TObject);
begin

 FormDadosPerfil.Position := poScreenCenter;
 FormDadosPerfil.ShowModal;

end;

procedure TFormPrincipal.PerfisdeAcessoSistemaGesto1Click(Sender: TObject);
begin
 if FormDadosPerfil = NIL then
 Begin
   FormDadosPerfil := tFormDadosPerfil.Create(self);
 End;
 FormDadosPerfil.Position := poScreenCenter;
 FormDadosPerfil.ShowModal;
end;

procedure TFormPrincipal.Permisses1Click(Sender: TObject);
begin
  FormPermissoesCarga.Show;
end;

procedure TFormPrincipal.ransportadoras1Click(Sender: TObject);
begin

 if FormCadastroTransportadoras = nil then
 Begin
   FormCadastroTransportadoras := TFormCadastroTransportadoras.Create(self);
 End;

 FormCadastroTransportadoras.qBuscaTransportadoras.Close;
 FormCadastroTransportadoras.qBuscaTransportadoras.Open;
 FormCadastroTransportadoras.qBuscaTransportadoras.Refresh;
 FormCadastroTransportadoras.Position := poScreenCenter;
 FormCadastroTransportadoras.Show;

end;

procedure TFormPrincipal.SistemaGesto1Click(Sender: TObject);
begin

 if FormUsuarios = nil then
 Begin
   FormUsuarios := TFormUsuarios.Create(self);
 End;

 FormUsuarios.Position := poScreenCenter;
 FormUsuarios.ShowModal;

end;

procedure TFormPrincipal.Usuarios1Click(Sender: TObject);
begin

 if FormUsuarios = nil then
 Begin
   FormUsuarios := TFormUsuarios.Create(self);
 End;

 FormUsuarios.Position := poScreenCenter;
 FormUsuarios.ShowModal;

end;

procedure TFormPrincipal.UsuariosMobile1Click(Sender: TObject);
begin

  if FormCadaUsuariosMobile = nil then
  Begin
     FormCadaUsuariosMobile := TFormCadaUsuariosMobile.Create(self);
  End;


  FormCadaUsuariosMobile.Position := poScreenCenter;
  FormCadaUsuariosMobile.ShowModal;

end;

procedure TFormPrincipal.btnComprasClick(Sender: TObject);
begin

 if FormAnaliseCompraQuery = nil then
 Begin
   FormAnaliseCompraQuery := TFormAnaliseCompraQuery.Create(self);
 End;

 if UpperCase( FormLoginSavauto.EditUsuario.Text ) = 'ADMINISTRADOR' then
 Begin
    FormAnaliseCompraQuery.WindowState := wsMaximized;
    FormAnaliseCompraQuery.ShowModal;
 End
 Else
 Begin

 // Valida Permissoes
 DMPermissoes.qValidaPermissao.SQL.Clear;
 DMPermissoes.qValidaPermissao.SQL.Add('select NOME_TELA, Acesso, Leitura, Alteracao from tbusuarios_permissoes');
 DMPermissoes.qValidaPermissao.SQL.Add('where ID_PERFIL = :ID');
 DMPermissoes.qValidaPermissao.SQL.Add('and NOME_TELA=:TELA');
 DMPermissoes.qValidaPermissao.ParamByName('ID').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
 DMPermissoes.qValidaPermissao.ParamByName('TELA').AsString := FormAnaliseCompraQuery.Name;
 DMPermissoes.qValidaPermissao.Open;

 if DMPermissoes.qValidaPermissao.IsEmpty then
 Begin
   MessageDlg('Permissao de usuario/tela não configurada ainda, contate o adm', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
    if DMPermissoes.qValidaPermissao.FieldByName('Acesso').AsInteger = 1 then
    Begin
     FormAnaliseCompraQuery.WindowState := wsMaximized;
     FormAnaliseCompraQuery.ShowModal;
    End
    Else
    Begin
      MessageDlg('Você não tem permissão de acesso a tela, contate o Adm', mtWarning, [mbok] , 0);
      Abort;
    End;
 End;
 End;

end;

procedure TFormPrincipal.btnFinanceiroClick(Sender: TObject);
begin

 if FormMenuFinanceiro = nil then
 Begin
   FormMenuFinanceiro := TFormMenuFinanceiro.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('financeiro').AsInteger = 1 then
 Begin

  FormMenuFinanceiro.Position := poScreenCenter;
  FormMenuFinanceiro.ShowModal;

 End
 Else
 Begin

  MessageDlg('Usuário sem permissão financeiro para acesso!', mtWarning, [mbok] , 0);

 End;

end;

procedure TFormPrincipal.AppVistoriasAvaliaes1Click(Sender: TObject);
begin
  if FormCadaUsuariosMobile = nil then
  Begin
     FormCadaUsuariosMobile := TFormCadaUsuariosMobile.Create(self);
  End;


  FormCadaUsuariosMobile.Position := poScreenCenter;
  FormCadaUsuariosMobile.ShowModal;
end;

procedure TFormPrincipal.Avarias1Click(Sender: TObject);
begin

 if FormGestaoAvarias = nil then
 Begin
   FormGestaoAvarias := TFormGestaoAvarias.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin
   FormGestaoAvarias.Position := poScreenCenter;
   FormGestaoAvarias.ShowModal;
 End
 Else
 Begin
   MessageDlg('Usuário sem permissão para acesso.', mtWarning, [mbok] , 0);
 End;

end;

procedure TFormPrincipal.btnAnaliseComprasClick(Sender: TObject);
begin

 FormAnaliseCompraQuery.WindowState := wsMaximized;
 FormAnaliseCompraQuery.ShowModal;

end;

end.
