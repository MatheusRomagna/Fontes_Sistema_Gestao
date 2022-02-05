unit UFormCadaNovoUsuMobile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFormCadaNovoUsuMobile = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    img_add: TImage;
    Label2: TLabel;
    EditUsuario: TEdit;
    Label3: TLabel;
    EditSenha: TEdit;
    Label4: TLabel;
    ComboPerfil: TComboBox;
    Label5: TLabel;
    EditEmail: TEdit;
    img_edit: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_addClick(Sender: TObject);
    procedure img_editClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadaNovoUsuMobile: TFormCadaNovoUsuMobile;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaUsuario,
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
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormCadaNovoUsuMobile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 EditUsuario.Text := '';
 EditSenha.Text := '';
 ComboPerfil.Text := '';
 EditEmail.Text := '';

end;

procedure TFormCadaNovoUsuMobile.img_addClick(Sender: TObject);
begin

 if EditUsuario.Text <> '' then
 Begin

 DataModuleBancoVistoria.qValidaUsuario.Sql.Clear;
 DataModuleBancoVistoria.qValidaUsuario.sql.add('select * from tbusuarios where nome=:nome');
 DataModuleBancoVistoria.qValidaUsuario.ParamByName('nome').text := EditUsuario.Text;
 DataModuleBancoVistoria.qValidaUsuario.Open;

 if DataModuleBancoVistoria.qValidaUsuario.RecordCount > 0 then
 Begin
   ShowMessage('Usuário já cadastrado');
   Abort;
 End;

    if EditSenha.Text <> '' then
    Begin
       if ComboPerfil.Text <> '' then
       Begin
         DataModuleBancoVistoria.qCadaNovoUsuario.sql.Clear;
         DataModuleBancoVistoria.qCadaNovoUsuario.sql.add('insert into tbusuarios (nome, senha, nivel, email)');
         DataModuleBancoVistoria.qCadaNovoUsuario.sql.add('vaLues (:nome, :senha, :nivel, :email)');
         DataModuleBancoVistoria.qCadaNovoUsuario.paramByName('nome').text := UpperCase(EditUsuario.Text);
         DataModuleBancoVistoria.qCadaNovoUsuario.paramByName('senha').Text := EditSenha.Text;
         DataModuleBancoVistoria.qCadaNovoUsuario.paramByName('email').Text := EditEmail.Text;
         if ComboPerfil.Text = 'Vistoriador' then
         Begin
           DataModuleBancoVistoria.qcadaNovoUsuario.paramByName('nivel').asInteger := 98;
         End;
         if ComboPerfil.Text = 'Avaliador' then
         Begin
          DataModuleBancoVistoria.qcadaNovoUsuario.paramByName('nivel').asInteger := 97;
         End;
         if ComboPerfil.Text = 'Administrador' then
         Begin
          DataModuleBancoVistoria.qcadaNovoUsuario.paramByName('nivel').asInteger := 99;
         End;
         DataModuleBancoVistoria.qcadaNovoUsuario.ExecSQL;

         DataModuleBancoVistoria.qBuscaUsuarios.Refresh;

         close;

       End
       Else
       ShowMessage('Perfil inválido!');
    End
    Else
    ShowMessage('Senha inválida!');
 End
 Else
 ShowMessage('Usuário inválido!');


end;

procedure TFormCadaNovoUsuMobile.img_editClick(Sender: TObject);
begin

   DataModuleBancoVistoria.qAlteraUsuarios.SQL.Clear;
   DataModuleBancoVistoria.qAlteraUsuarios.SQL.Add('update tbusuarios set nome=:nome, senha=:senha, email=:email where id=:id');
   DataModuleBancoVistoria.qAlteraUsuarios.ParamByName('nome').Text := EditUsuario.Text;
   DataModuleBancoVistoria.qAlteraUsuarios.ParamByName('senha').Text:= EditSenha.Text;
   DataModuleBancoVistoria.qAlteraUsuarios.ParamByName('email').Text:= EditEmail.Text;
   DataModuleBancoVistoria.qAlteraUsuarios.ParamByName('id').AsInteger := FormCadaUsuariosMobile.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
   DataModuleBancoVistoria.qAlteraUsuarios.Execute;

   DataModuleBancoVistoria.qBuscaUsuarios.Refresh;

   FormCadaNovoUsuMobile.img_edit.Visible := false;
   FormCadaNovoUsuMobile.img_add.Visible := true;

   Close;

end;

end.
