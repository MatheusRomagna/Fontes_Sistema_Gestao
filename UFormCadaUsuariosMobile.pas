unit UFormCadaUsuariosMobile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TFormCadaUsuariosMobile = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    img_add: TImage;
    img_edit: TImage;
    img_delete: TImage;
    DataSource1: TDataSource;
    Image2: TImage;
    lblVersaoAtual: TLabel;
    ImageList1: TImageList;
    procedure img_addClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure img_deleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadaUsuariosMobile: TFormCadaUsuariosMobile;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaUsuario, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcedePermissao, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormCadaNovoUsuMobile;

procedure TFormCadaUsuariosMobile.DBGrid1DblClick(Sender: TObject);
begin

 if DBGrid1.DataSource.DataSet.RecordCount > 0 then
 Begin
   DataModuleBancoVistoria.qBuscaUsuarios.Refresh;
   DataModuleBancoVistoria.qBuscaUsuarios.Edit;

   FormCadaNovoUsuMobile.EditUsuario.Text := DataModuleBancoVistoria.qBuscaUsuariosnome.Text;
   FormCadaNovoUsuMobile.EditSenha.Text   := DataModuleBancoVistoria.qBuscaUsuariossenha.Text;
   FormCadaNovoUsuMobile.EditEmail.Text   := DataModuleBancoVistoria.qBuscaUsuariosemail.Text;

   if DataModuleBancoVistoria.qBuscaUsuariosnivel.Text = '98' then
   begin
    FormCadaNovoUsuMobile.ComboPerfil.Text := 'Vistoriador';
   end;
   if DataModuleBancoVistoria.qBuscaUsuariosnivel.Text = '97' then
   begin
    FormCadaNovoUsuMobile.ComboPerfil.Text := 'Avaliador';
   end;
   if DataModuleBancoVistoria.qBuscaUsuariosnivel.Text = '99' then
   begin
    FormCadaNovoUsuMobile.ComboPerfil.Text := 'Administrador';
   end;

   FormCadaNovoUsuMobile.img_edit.Visible := true;
   FormCadaNovoUsuMobile.img_add.Visible := false;

   FormCadaNovoUsuMobile.Position := poScreenCenter;
   FormCadaNovoUsuMobile.ShowModal;

 End;

end;

procedure TFormCadaUsuariosMobile.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  nIndiceImagem: byte;
begin

  if Column.Field.FieldName = 'check_versao' then
  begin
    DBGrid1.Canvas.FillRect(Rect);

    if Column.Field.AsString = '0' then
    Begin
      nIndiceImagem := 0;
      Dbgrid1.Canvas.Brush.Color:= clYellow;
    End
    else
    Begin
      nIndiceImagem := 1;
      Dbgrid1.Canvas.Brush.Color:= clGreen;
    End;

    // desenha a imagem conforme a condição acima
    ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 24, Rect.Top + 1, nIndiceImagem);
  end;
end;

procedure TFormCadaUsuariosMobile.FormShow(Sender: TObject);
begin

 DataModuleBancoVistoria.qAjustaUsuarios.SQL.Clear;
 DataModuleBancoVistoria.qAjustaUsuarios.SQL.Add('select versaoapp from tbconfig where tipo = ''mobile''');
 DataModuleBancoVistoria.qAjustaUsuarios.Open;

 lblVersaoAtual.Caption := 'Versão atual:'+DataModuleBancoVistoria.qAjustaUsuarios.FieldByName('versaoapp').Text;

end;

procedure TFormCadaUsuariosMobile.Image2Click(Sender: TObject);
begin

  DataModuleBancoVistoria.qBuscaUsuarios.Refresh;

end;

procedure TFormCadaUsuariosMobile.img_addClick(Sender: TObject);
begin

  if FormCadaNovoUsuMobile = nil then
  Begin
     FormCadaNovoUsuMobile := TFormCadaNovoUsuMobile.Create(self);
  End;

  FormCadaNovoUsuMobile.Position := poScreenCenter;
  FormCadaNovoUsuMobile.ShowModal;

end;

procedure TFormCadaUsuariosMobile.img_deleteClick(Sender: TObject);
begin

  if MessageDlg('Deseja deletar o usuario:' + #13 +
                DBGrid1.DataSource.DataSet.FieldByName('nome').Text, mtInformation, [mbno, mbyes] , 0) = mrYes then
                Begin

                 DataModuleBancoVistoria.qAjustaUsuarios.sql.clear;
                 DataModuleBancoVistoria.qAjustaUsuarios.sql.add('delete from tbusuarios where id = :id');
                 DataModuleBancoVistoria.qAjustaUsuarios.paramByName('id').asinteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
                 DataModuleBancoVistoria.qAjustaUsuarios.Execute;

                 DataModuleBancoVistoria.qBuscaUsuarios.Refresh;

                End;

end;

end.
