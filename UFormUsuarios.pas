unit UFormUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormUsuarios = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    img_add: TImage;
    img_edit: TImage;
    img_delete: TImage;
    DBGrid1: TDBGrid;
    DataSourceUsuarios: TDataSource;
    qBuscaUsuarios: TUniQuery;
    qBuscaUsuariosID: TIntegerField;
    qBuscaUsuariosNOME: TStringField;
    qBuscaUsuariosSENHA: TStringField;
    qBuscaUsuariosHOSTNAME: TStringField;
    qBuscaUsuariosDT_LOGIN: TDateField;
    qBuscaUsuariosID_PERFIL: TIntegerField;
    qBuscaUsuariosNOME_PERFIL: TStringField;
    qBuscaUsuariosEMAIL: TStringField;
    qBuscaUsuariosTELEFONE: TStringField;
    qBuscaUsuariosNIVEL: TIntegerField;
    Image1: TImage;
    Panel2: TPanel;
    procedure img_addClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

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
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormCadaUsuario;

procedure TFormUsuarios.img_addClick(Sender: TObject);
begin

 if FormCadastroUsuario = nil then
 Begin
   FormCadastroUsuario := TFormCadastroUsuario.Create(self);
 End;

 FormCadastroUsuario.Position := poScreenCenter;
 FormCadastroUsuario.ShowModal;

end;

end.
