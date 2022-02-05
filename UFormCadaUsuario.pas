unit UFormCadaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni;

type
  TFormCadastroUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    img_add: TImage;
    img_delete: TImage;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    editIdPerfil: TEdit;
    EditPerfil: TEdit;
    Image1: TImage;
    EditNome: TEdit;
    EditSenha: TEdit;
    EditEmail: TEdit;
    EditTelefone: TEdit;
    Image2: TImage;
    qGravaUsuario: TUniQuery;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    CheckBoxFinanceiro: TCheckBox;
    Label8: TLabel;
    CheckConfiguracoes: TCheckBox;
    procedure Image2Click(Sender: TObject);
    procedure img_addClick(Sender: TObject);
    procedure img_deleteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcedePermissao, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDadosPerfil, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, FMX.UFormGraficosAtendimento, UDMPermissoes,
  UFormAgendamento, UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormCadaNovoUsuMobile,
  UFormCadaUsuariosMobile, UFormCruzamentoFipes, UFormDetalhesAtendimento,
  UFormInformacoes, UFormLiberaPermissao, UFormPesquisaFipe,
  UFormQuitacoesVeiculo, UFormSegIPVALic;

procedure TFormCadastroUsuario.FormShow(Sender: TObject);
begin

 CheckBoxFinanceiro.Checked := false;

end;

procedure TFormCadastroUsuario.Image1Click(Sender: TObject);
begin

 if FormPerfis = nil then
 Begin
   FormPerfis := TFormPerfis.Create(self);
 End;

 FormPerfis.qBuscaPerfis.Refresh;

 FormPerfis.Position := poScreenCenter;
 FormPerfis.ShowModal;

end;

procedure TFormCadastroUsuario.Image2Click(Sender: TObject);
begin

 if EditSenha.PasswordChar = '*' then
 EditSenha.PasswordChar := #0
  Else
 EditSenha.PasswordChar := '*';

end;

procedure TFormCadastroUsuario.img_addClick(Sender: TObject);
Var
 financeiro, config : integer;
begin

 if CheckBoxFinanceiro.Checked = true then
 financeiro := 1
 Else
 financeiro := 0;

 if CheckConfiguracoes.Checked = true then
 config := 1
 Else
 Config := 0;

 if EditNome.Text <> '' then
 Begin
    if EditSenha.Text <> '' then
    Begin
       if EditPerfil.Text <> '' then
       Begin
         qGravaUsuario.SQL.Clear;
         qGravaUsuario.SQL.Add('insert into tbusuarios (nome, senha, id_perfil, nome_perfil, email, telefone, nivel, financeiro, configuracoes)');
         qGravaUsuario.SQL.Add('values (:nome, :senha, :id, :perfil, :email, :fone, :nivel, :financeiro, :config)');
         qGravaUsuario.ParamByName('nome').Text := EditNome.Text;
         qGravaUsuario.ParamByName('senha').Text:= EditSenha.Text;
         qGravaUsuario.ParamByName('id').AsInteger:= StrToInt(editIdPerfil.Text);
         qGravaUsuario.ParamByName('perfil').Text := EditPerfil.Text;
         qGravaUsuario.ParamByName('email').Text := EditEmail.Text;
         qGravaUsuario.ParamByName('fone').Text := EditTelefone.Text;
         if EditPerfil.Text = 'ADMINISTRADOR' then
         qGravaUsuario.ParamByName('nivel').AsInteger := 99
         Else
         qGravaUsuario.ParamByName('nivel').AsInteger := 98;
         qGravaUsuario.ParamByName('financeiro').AsInteger := financeiro;
         qGravaUsuario.ParamByName('config').AsInteger     := config;
         qGravaUsuario.ExecSQL;

         EditNome.Text := '';
         EditSenha.Text := '';
         EditTelefone.Text := '';
         EditEmail.Text := '';
         editIdPerfil.Text := '';
         EditPerfil.Text := '';
         EditNome.SetFocus;

         FormUsuarios.qBuscaUsuarios.Active := false;
         FormUsuarios.qBuscaUsuarios.Active := true;

       End
       Else
       Begin
         MessageDlg('Perfil inválido!', mtInformation, [mbok] , 0);
       End;
    End
    Else
    Begin
      MessageDlg('Senha inválida!', mtInformation, [mbok] , 0);
    End;
 End
 Else
 Begin
    MessageDlg('Usuario inválido!', mtInformation, [mbok] , 0);
 End;

end;

procedure TFormCadastroUsuario.img_deleteClick(Sender: TObject);
begin
         EditNome.Text := '';
         EditSenha.Text := '';
         EditTelefone.Text := '';
         EditEmail.Text := '';
         editIdPerfil.Text := '';
         EditPerfil.Text := '';
         Close;
end;

end.
