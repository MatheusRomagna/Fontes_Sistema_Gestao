unit UFormLiberaPermissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni;

type
  TFormLiberaPermissao = class(TForm)
    Label1: TLabel;
    EditPerfil: TEdit;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    CheckBoxAcessar: TCheckBox;
    CheckBoxAlterar: TCheckBox;
    Image2: TImage;
    qInserePermissao: TUniQuery;
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tela : String;
  end;

var
  FormLiberaPermissao: TFormLiberaPermissao;

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
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormSegIPVALic, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;

procedure TFormLiberaPermissao.Image1Click(Sender: TObject);
begin

 if FormPerfis = NIL then
 bEGIN
   FormPerfis := TFormPerfis.Create(SELF);
 end;

 FormPerfis.Position := poScreenCenter;
 FormPerfis.ShowModal;

end;

procedure TFormLiberaPermissao.Image2Click(Sender: TObject);
Var
 Alterar, Acessar : integer;
begin

 if CheckBoxAcessar.Checked = true then
 Acessar := 1
 Else
 Acessar := 0;

 if CheckBoxAlterar.Checked = true then
 Alterar := 1
 Else
 Alterar := 0;

 if EditPerfil.Text <> '' then
 Begin
  qInserePermissao.SQL.Clear;
  qInserePermissao.SQL.Add('delete from tbusuarios_permissoes where NOME_TELA=:tela and ID_USUARIOS=:ID_USU and ID_PERFIL=:ID_PERFIL');
  qInserePermissao.ParamByName('tela').AsString := Tela;
  qInserePermissao.ParamByName('ID_USU').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('ID').AsInteger;
  qInserePermissao.ParamByName('ID_PERFIL').AsInteger := FormPerfis.DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger; // FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
  qInserePermissao.Execute;

  qInserePermissao.SQL.Clear;
  qInserePermissao.SQL.Add('insert tbusuarios_permissoes (ID_USUARIOS, ID_PERFIL, Acesso, Leitura, Alteracao, NOME_TELA)');
  qInserePermissao.SQL.Add('values (:usu, :perfil, :acesso, 1, :altera, :tela)');
  qInserePermissao.ParamByName('usu').AsInteger :=    FormLoginSavauto.qValidaUsuario.FieldByName('ID').AsInteger;
  qInserePermissao.ParamByName('perfil').AsInteger := FormPerfis.DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger; // FormLoginSavauto.qValidaUsuario.FieldByName('ID_PERFIL').AsInteger;
  qInserePermissao.ParamByName('acesso').AsInteger := Acessar;
  qInserePermissao.ParamByName('altera').AsInteger := Alterar;
  qInserePermissao.ParamByName('tela').AsString := Tela;
  qInserePermissao.ExecSQL;

  MessageDlg('Permissao criada', mtInformation, [mbok] , 0);

  CheckBoxAcessar.Checked := false;
  CheckBoxAlterar.Checked := false;
  EditPerfil.Text := '';

  Close;

 End;

end;

end.
