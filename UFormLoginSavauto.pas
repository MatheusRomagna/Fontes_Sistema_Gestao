unit UFormLoginSavauto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.XPMan, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, MemDS, DBAccess, Uni, Vcl.Buttons, Winapi.ShellAPI;

type
  TFormLoginSavauto = class(TForm)
    XPManifest1: TXPManifest;
    PanelCentro: TPanel;
    EditUsuario: TEdit;
    PanelUsuario: TPanel;
    PanelSenha: TPanel;
    EditSenha: TEdit;
    qValidaUsuario: TUniQuery;
    qBuscaPermissoes: TUniQuery;
    qAtualizaDadosLogin: TUniQuery;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    XPManifest2: TXPManifest;
    qVerificaAtualizacao: TUniQuery;
    lblVersao: TLabel;
    rctAcessar: TPanel;
    rctFinalizar: TPanel;
    procedure FormShow(Sender: TObject);
    procedure imgLogarClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EditUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnAcessarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rctAcessarMouseEnter(Sender: TObject);
    procedure rctAcessarMouseLeave(Sender: TObject);
    procedure rctFinalizarMouseEnter(Sender: TObject);
    procedure rctFinalizarMouseLeave(Sender: TObject);
    procedure rctAcessarClick(Sender: TObject);
    procedure rctFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormLoginSavauto: TFormLoginSavauto;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao,
  UDataModuleRESTDWvistoria, UDMRestDataWareDB, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPermissoesCarga, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento,
  UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormConcedePermissao, UFormCruzamentoFipes,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormHistoricoAvaliacoes,
  UFormInformacoes, UFormPerfis, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormUsuarios, UFormAjusteDadosFipeAvaliacao,
  UFormDadosPagamento, UFormDataPagamento, UFormExtratoPgtoVeiculos,
  UFormHistoricoObsAtn, UFormLiberaPermissao, UFormLoadingCarregamento,
  UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs, UFormPagamentoVeiculo,
  UFormPgtoExtratoVeiculo, UFormRefFipes;


Function NomeMaquinaPC: String;
var
  lpBuffer : Array[0..20] of Char;
  nSize : dWord;
  mRet : boolean;
  erro: dWord;
begin
  nSize :=120;
  mRet:= GetComputerName(lpBuffer,nSize);
  if mRet then
    Result:= lpBuffer
  else begin
    erro:= GetLastError();
    MessageDlg('Ocorreu o erro ' + IntToStr(erro) + ' ao procurar o nome do computador.',
               mtError, [mbOk], 0);
    Result:= '';
  end;
end;

procedure TFormLoginSavauto.BitBtn1Click(Sender: TObject);
begin

 Application.Terminate;

end;

procedure TFormLoginSavauto.btnAcessarClick(Sender: TObject);
Var
 HOST : string;
begin

 HOST := NomeMaquinaPC;

 qValidaUsuario.SQL.Clear;
 qValidaUsuario.SQL.Add('select count(*) ValidaUsuario from tbusuarios where nome = :usuario');
 qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
 qValidaUsuario.Open;

  if qValidaUsuario.FieldByName('ValidaUsuario').AsInteger = 0 then
  Begin
    MessageDlg('Usuário inválido!', mtWarning, [mbok] , 0);
    EditUsuario.SelectAll;
    Abort;
  End
  Else
  Begin
    qValidaUsuario.SQL.Clear;
    qValidaUsuario.SQL.Add('select senha, nivel, ID_PERFIL, NOME_PERFIL, ID, financeiro, configuracoes from tbusuarios where nome = :usuario');
    qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
    qValidaUsuario.Open;

     if qValidaUsuario.FieldByName('senha').Text <> EditSenha.Text then
      Begin
         MessageDlg('Senha inválida!', mtWarning, [mbok] , 0);
         EditSenha.SelectAll;
         Abort;
      End
      Else
        Begin

          qAtualizaDadosLogin.SQL.Clear;
          qAtualizaDadosLogin.SQL.Add('update tbusuarios set hostname = :host, dt_login = :dt where upper(nome)=:login');
          qAtualizaDadosLogin.ParamByName('host').AsString := HOST;
          qAtualizaDadosLogin.ParamByName('dt').AsDateTime := NOW;
          qAtualizaDadosLogin.ParamByName('login').AsString := UpperCase(EditUsuario.Text);
          qAtualizaDadosLogin.Execute;

          qBuscaPermissoes.SQL.Clear;
          qBuscaPermissoes.SQL.Add('select * from tbusuarios_permissoes where id_perfil = :id_perfil');
          qBuscaPermissoes.ParamByName('id_perfil').AsInteger := qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
          qBuscaPermissoes.Open;

          {if UpperCase( EditUsuario.Text ) = 'RAONI' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'AUGUSTO' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if EditUsuario.Text = 'MATHEUS' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'ADMINISTRADOR' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;}
          Close;
        End;
     Close;
  End;

end;

procedure TFormLoginSavauto.EditSenhaKeyPress(Sender: TObject; var Key: Char);
Var
 HOST : string;
begin

 if key = #13 then

begin

 HOST := NomeMaquinaPC;

 qValidaUsuario.SQL.Clear;
 qValidaUsuario.SQL.Add('select count(*) ValidaUsuario from tbusuarios where nome = :usuario');
 qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
 qValidaUsuario.Open;

  if qValidaUsuario.FieldByName('ValidaUsuario').AsInteger = 0 then
  Begin
    MessageDlg('Usuário inválido!', mtWarning, [mbok] , 0);
    EditUsuario.SelectAll;
    Abort;
  End
  Else
  Begin
    qValidaUsuario.SQL.Clear;
    qValidaUsuario.SQL.Add('select senha, nivel, ID_PERFIL, NOME_PERFIL, ID, financeiro from tbusuarios where nome = :usuario');
    qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
    qValidaUsuario.Open;

     if qValidaUsuario.FieldByName('senha').Text <> EditSenha.Text then
      Begin
         MessageDlg('Senha inválida!', mtWarning, [mbok] , 0);
         EditSenha.SelectAll;
         Abort;
      End
      Else
        Begin

          if qValidaUsuario.FieldByName('ID_PERFIL').IsNull then
          Begin
             ShowMessage('Usuário sem perfil configurado, contate um administrador!');
             Abort;
          End;

          qAtualizaDadosLogin.SQL.Clear;
          qAtualizaDadosLogin.SQL.Add('update tbusuarios set hostname = :host, dt_login = :dt where upper(nome)=:login');
          qAtualizaDadosLogin.ParamByName('host').AsString := HOST;
          qAtualizaDadosLogin.ParamByName('dt').AsDateTime := NOW;
          qAtualizaDadosLogin.ParamByName('login').AsString := UpperCase(EditUsuario.Text);
          qAtualizaDadosLogin.Execute;

          qBuscaPermissoes.SQL.Clear;
          qBuscaPermissoes.SQL.Add('select * from tbusuarios_permissoes where id_perfil = :id_perfil');
          qBuscaPermissoes.ParamByName('id_perfil').AsInteger := qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
          qBuscaPermissoes.Open;

          {if UpperCase( EditUsuario.Text ) = 'RAONI' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'AUGUSTO' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if EditUsuario.Text = 'MATHEUS' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'ADMINISTRADOR' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;   }

          FormPrincipal.WindowState := wsMaximized;
          FormPrincipal.Show;
        End;

  End;

 End;

end;

procedure TFormLoginSavauto.EditUsuarioKeyPress(Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin
    EditSenha.SetFocus;
 End;

end;

procedure TFormLoginSavauto.FormShow(Sender: TObject);
begin

 qValidaUsuario.SQL.Clear;
 qValidaUsuario.SQL.Add('select nome, senha from tbusuarios where HOSTNAME = :HOST');
 qValidaUsuario.ParamByName('HOST').AsString := NomeMaquinaPC;
 qValidaUsuario.Open;

 if qValidaUsuario.FieldByName('nome').Text <> '' then
 Begin
    EditUsuario.Text := qValidaUsuario.FieldByName('nome').Text;
    EditSenha.Text   := qValidaUsuario.FieldByName('senha').Text;
    EditSenha.SetFocus;
 End;

  qVerificaAtualizacao.SQL.Clear;
  qVerificaAtualizacao.SQL.Add('select versao, url from tbconfig');
  //qVerificaAtualizacao.ParamByName('versao').Text := lblVersao.Caption;
  qVerificaAtualizacao.Open;

  if lblVersao.Caption <> qVerificaAtualizacao.FieldByName('versao').Text then
  Begin
    if MessageDlg('Foi encontrada uma nova versão para download, deseja baixa-la?', mtInformation, [mbno, mbyes] , 0) = mrYes then
    Begin
        ShellExecute(Handle, 'open', pchar(qVerificaAtualizacao.FieldByName('url').AsString), '', '', 1);
    End;
  End;

end;

procedure TFormLoginSavauto.imgLogarClick(Sender: TObject);
Var
 HOST : string;
begin

 HOST := NomeMaquinaPC;

 qValidaUsuario.SQL.Clear;
 qValidaUsuario.SQL.Add('select count(*) ValidaUsuario from tbusuarios where nome = :usuario');
 qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
 qValidaUsuario.Open;

  if qValidaUsuario.FieldByName('ValidaUsuario').AsInteger = 0 then
  Begin
    MessageDlg('Usuário inválido!', mtWarning, [mbok] , 0);
    EditUsuario.SelectAll;
    Abort;
  End
  Else
  Begin
    qValidaUsuario.SQL.Clear;
    qValidaUsuario.SQL.Add('select senha, nivel, ID_PERFIL, NOME_PERFIL, ID, financeiro from tbusuarios where nome = :usuario');
    qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
    qValidaUsuario.Open;

     if qValidaUsuario.FieldByName('senha').Text <> EditSenha.Text then
      Begin
         MessageDlg('Senha inválida!', mtWarning, [mbok] , 0);
         EditSenha.SelectAll;
         Abort;
      End
      Else
        Begin

          if qValidaUsuario.FieldByName('ID_PERFIL').IsNull then
          Begin
             ShowMessage('Usuário sem perfil configurado, contate um administrador!');
             Abort;
          End;

          qAtualizaDadosLogin.SQL.Clear;
          qAtualizaDadosLogin.SQL.Add('update tbusuarios set hostname = :host, dt_login = :dt where upper(nome)=:login');
          qAtualizaDadosLogin.ParamByName('host').AsString := HOST;
          qAtualizaDadosLogin.ParamByName('dt').AsDateTime := NOW;
          qAtualizaDadosLogin.ParamByName('login').AsString := UpperCase(EditUsuario.Text);
          qAtualizaDadosLogin.Execute;

          qBuscaPermissoes.SQL.Clear;
          qBuscaPermissoes.SQL.Add('select * from tbusuarios_permissoes where id_perfil = :id_perfil');
          qBuscaPermissoes.ParamByName('id_perfil').AsInteger := qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
          qBuscaPermissoes.Open;

       {   if UpperCase( EditUsuario.Text ) = 'RAONI' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'AUGUSTO' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if EditUsuario.Text = 'MATHEUS' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;

          if UpperCase( EditUsuario.Text ) = 'ADMINISTRADOR' then
          Begin
            FormPrincipal.btnAtendimento.Visible := true;
          End;}

          if FormLoginSavauto.qValidaUsuario.FieldByName('financeiro').AsInteger = 1 then
          //FormPrincipal.PanelGraficoOrdemPgto.Visible := true
          Else
          //FormPrincipal.PanelGraficoOrdemPgto.Visible := false;

          FormPrincipal.WindowState := wsMaximized;
          FormPrincipal.Visible := true;
        End;

  End;

end;

procedure TFormLoginSavauto.rctAcessarClick(Sender: TObject);
Var
 HOST : string;
 query : TUniQuery;
begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 HOST := NomeMaquinaPC;

 qValidaUsuario.SQL.Clear;
 qValidaUsuario.SQL.Add('select count(*) ValidaUsuario from tbusuarios where nome = :usuario');
 qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
 qValidaUsuario.Open;

  if qValidaUsuario.FieldByName('ValidaUsuario').AsInteger = 0 then
  Begin
    MessageDlg('Usuário inválido!', mtWarning, [mbok] , 0);
    EditUsuario.SelectAll;
    Abort;
  End
  Else
  Begin
    qValidaUsuario.SQL.Clear;
    qValidaUsuario.SQL.Add('select senha, nivel, ID_PERFIL, NOME_PERFIL, ID, financeiro, configuracoes from tbusuarios where nome = :usuario');
    qValidaUsuario.ParamByName('usuario').Text := EditUsuario.Text;
    qValidaUsuario.Open;

     if qValidaUsuario.FieldByName('senha').Text <> EditSenha.Text then
      Begin
         MessageDlg('Senha inválida!', mtWarning, [mbok] , 0);
         EditSenha.SelectAll;
         Abort;
      End
      Else
        Begin

          qAtualizaDadosLogin.SQL.Clear;
          qAtualizaDadosLogin.SQL.Add('update tbusuarios set hostname = :host, dt_login = :dt where upper(nome)=:login');
          qAtualizaDadosLogin.ParamByName('host').AsString := HOST;
          qAtualizaDadosLogin.ParamByName('dt').AsDateTime := NOW;
          qAtualizaDadosLogin.ParamByName('login').AsString := UpperCase(EditUsuario.Text);
          qAtualizaDadosLogin.Execute;

          qBuscaPermissoes.SQL.Clear;
          qBuscaPermissoes.SQL.Add('select * from tbusuarios_permissoes where id_perfil = :id_perfil');
          qBuscaPermissoes.ParamByName('id_perfil').AsInteger := qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
          qBuscaPermissoes.Open;

          query.SQL.Clear;
          query.SQL.Add('update tbusuarios set versao_sistema =:versao where nome=:nome and senha=:senha');
          query.ParamByName('versao').Text := lblVersao.Caption;
          query.ParamByName('nome').Text   := EditUsuario.Text;
          query.ParamByName('senha').Text  := EditSenha.Text;
          query.Execute;

          Close;
        End;
     Close;
  End;

end;

procedure TFormLoginSavauto.rctAcessarMouseEnter(Sender: TObject);
begin

 rctAcessar.Color := $007777FF;

end;

procedure TFormLoginSavauto.rctAcessarMouseLeave(Sender: TObject);
begin

  rctAcessar.Color := $000000B0;

end;

procedure TFormLoginSavauto.rctFinalizarClick(Sender: TObject);
begin

 Application.Terminate;

end;

procedure TFormLoginSavauto.rctFinalizarMouseEnter(Sender: TObject);
begin

 rctFinalizar.Color := $007777FF;

end;

procedure TFormLoginSavauto.rctFinalizarMouseLeave(Sender: TObject);
begin

  rctFinalizar.Color := $000000B0;

end;

end.
