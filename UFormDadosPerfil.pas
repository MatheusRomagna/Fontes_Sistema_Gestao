unit UFormDadosPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormDadosPerfil = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNovoPerfil: TEdit;
    img_valida_perfil: TImage;
    img_cancela: TImage;
    Panel2: TPanel;
    Label2: TLabel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaPerfil: TUniQuery;
    qBuscaPerfilID: TIntegerField;
    qBuscaPerfilNOME: TStringField;
    qValida: TUniQuery;
    qDeletaPerfil: TUniQuery;
    procedure img_valida_perfilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_cancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_PERFIL : Integer;
  end;

var
  FormDadosPerfil: TFormDadosPerfil;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormConcedePermissao;

procedure TFormDadosPerfil.FormShow(Sender: TObject);
begin

 EditNovoPerfil.Text := '';

end;

procedure TFormDadosPerfil.img_cancelaClick(Sender: TObject);
begin

 EditNovoPerfil.Text := '';

 if MessageDlg('Deseja mesmo deletar o perfil '+ DBGrid1.DataSource.DataSet.FieldByName('nome').Text + ' ?',
 mtWarning, [mbno, mbyes] , 0) = mrYes then
 Begin

  qDeletaPerfil.SQL.Clear;
  qDeletaPerfil.SQL.Add('delete from tbusuarios_perfil where id = :id');
  qDeletaPerfil.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
  qDeletaPerfil.Execute;

  qBuscaPerfil.Refresh;

 End;

end;

procedure TFormDadosPerfil.img_valida_perfilClick(Sender: TObject);
begin

  if EditNovoPerfil.Text <> '' then
  Begin

   qValida.SQL.Clear;
   qValida.SQL.Add('select * from tbusuarios_perfil where nome = :perfil');
   qValida.ParamByName('perfil').Text := EditNovoPerfil.Text;
   qValida.Open;

   if qValida.RecordCount > 0 then
   Begin
      MessageDlg('Perfil já existente!', mtWarning, [mbok] , 0);
      Abort;
   End
   Else
   Begin
     qValida.SQL.Clear;
     qValida.SQL.Add('insert into tbusuarios_perfil (nome) vaLues (:perfil)');
     qValida.ParamByName('perfil').Text := EditNovoPerfil.Text;
     qValida.ExecSQL;

     qBuscaPerfil.Refresh;

     MessageDlg('Perfil criado, faça a vinculação das permissões agora', mtInformation, [mbok] , 0);

  End;
  End;

end;

end.
