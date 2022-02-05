unit UFormConcedePermissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFormConcedePermissao = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    img_add: TImage;
    img_delete: TImage;
    Label2: TLabel;
    Label3: TLabel;
    ComboAcessa: TComboBox;
    ComboAltera: TComboBox;
    procedure img_addClick(Sender: TObject);
    procedure img_deleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConcedePermissao: TFormConcedePermissao;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormConcedePermissao.FormShow(Sender: TObject);
begin

 ComboAcessa.Text := '';
 ComboAltera.Text := '';

end;

procedure TFormConcedePermissao.img_addClick(Sender: TObject);
begin

 if ComboAcessa.Text <> '' then
 Begin
   if ComboAltera.Text <> '' then
   Begin
      Close;
   End
   Else
   Begin
     ShowMessage('Permissão de alteração inválida');
     Abort;
   End;
 End
 Else
 Begin
    ShowMessage('Permissão de Acesso inválida');
    Abort;
 End;

end;

procedure TFormConcedePermissao.img_deleteClick(Sender: TObject);
begin

 ComboAcessa.Text := '';
 ComboAltera.Text := '';

 Close;

end;

end.
