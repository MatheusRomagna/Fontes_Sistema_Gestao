unit UFormGestaoAvaliacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.XPMan, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData, uRESTDWPoolerDB,
  Vcl.StdCtrls, Vcl.Menus;

type
  TFormGestaoAvaliacoes = class(TForm)
    PanelTopo: TPanel;
    PanelCentral: TPanel;
    DBGrid1: TDBGrid;
    XPManifest1: TXPManifest;
    DataSource1: TDataSource;
    Label2: TLabel;
    ComboAvaliadores: TComboBox;
    Label3: TLabel;
    EditModeloVeiculo: TEdit;
    Label4: TLabel;
    EditCliente: TEdit;
    Label5: TLabel;
    EditTelefoneCliente: TEdit;
    Label6: TLabel;
    ComboTipo: TComboBox;
    img_Consulta: TImage;
    Label7: TLabel;
    EditPlaca: TEdit;
    Image1: TImage;
    MainMenu1: TMainMenu;
    ConfigurarPermisses1: TMenuItem;
    Panel1: TPanel;
    btnExcluirAval: TPanel;
    procedure img_consulta_avaliacaoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_ConsultaClick(Sender: TObject);
    procedure ConfigurarPermisses1Click(Sender: TObject);
    procedure btnExcluirAvalMouseEnter(Sender: TObject);
    procedure btnExcluirAvalMouseLeave(Sender: TObject);
    procedure btnExcluirAvalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGestaoAvaliacoes: TFormGestaoAvaliacoes;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormLoadingOpaco, UFormLotesArval, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao,
  UnitLogin, UDataModuleBancoVistoria, FMX.UFormGraficosAtendimento,
  UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAvaliarAvaliacao, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormConcedePermissao, UFormCruzamentoFipes,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormHistoricoAvaliacoes,
  UFormInformacoes, UFormLiberaPermissao, UFormLoginSavauto, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormUsuarios;

procedure TFormGestaoAvaliacoes.btnExcluirAvalClick(Sender: TObject);
var
 query : TUniQuery;
begin


  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin

     if MessageDlg('Deseja mesmo excluir o veículo de placa ' + DBGrid1.DataSource.DataSet.FieldByName('placa').Text, mtInformation, [mbno, mbyes] , 0) = mrYes then
     Begin

        query := TUniQuery.Create(self);
        query.Connection := DataModuleBancoVistoria.UniConnection1;

        try

          query.SQL.Clear;
          query.SQL.Add('delete from tbavaliacoes where id=:id');
          query.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
          query.Execute;

          DataModuleBancoVistoria.qBuscaAvaliacoes.Refresh;

          ShowMessage('Exclusão efetuada com sucesso!');

         Except
         On E:Exception Do
         Begin
           ShowMessage('Falha ao excluir! ' + e.Message);
         End;

        end;

     End;

  End;

end;

procedure TFormGestaoAvaliacoes.btnExcluirAvalMouseEnter(Sender: TObject);
begin

 if btnExcluirAval.Color = clRed then
 btnExcluirAval.Color := $008080FF
 Else
 btnExcluirAval.Color := ClRed;

end;

procedure TFormGestaoAvaliacoes.btnExcluirAvalMouseLeave(Sender: TObject);
begin

 if btnExcluirAval.Color = clRed then
 btnExcluirAval.Color := $008080FF
 Else
 btnExcluirAval.Color := ClRed;

end;

procedure TFormGestaoAvaliacoes.ConfigurarPermisses1Click(Sender: TObject);
begin

 if UpperCase(FormLoginSavauto.EditUsuario.Text) <> 'ADMINISTRADOR' then
 Begin
    MessageDlg('Usuário sem permissao', mtError, [mbok] , 0);
    Abort;
 End
 Else
 Begin

   if FormLiberaPermissao = nil then
   Begin
     FormLiberaPermissao := tFormLiberaPermissao.Create(self);
   End;

   FormLiberaPermissao.Tela := name;
   FormLiberaPermissao.Position := poScreenCenter;
   FormLiberaPermissao.ShowModal;
 End;

end;

procedure TFormGestaoAvaliacoes.DBGrid1DblClick(Sender: TObject);
begin

 if FormDetalhesAvaliacao = nil then
 Begin
   FormDetalhesAvaliacao := TFormDetalhesAvaliacao.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger <> 99 then
 BEgin
   FormDetalhesAvaliacao.btnAvaliarVeiculo.Enabled := false;
 End;

 FormDetalhesAvaliacao.EditPlaca.Text := DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
 FormDetalhesAvaliacao.EditAno.Text   := DBGrid1.DataSource.DataSet.FieldByName('ano').Text;
 FormDetalhesAvaliacao.EditModelo.Text:= DBGrid1.DataSource.DataSet.FieldByName('modelo').Text;
 FormDetalhesAvaliacao.EditCliente.Text := DBGrid1.DataSource.DataSet.FieldByName('nome_cliente').Text;
 FormDetalhesAvaliacao.EditTelefone.Text := DBGrid1.DataSource.DataSet.FieldByName('telefone').Text;
 FormDetalhesAvaliacao.EditTipo.Text := DBGrid1.DataSource.DataSet.FieldByName('tipo').Text;
 FormDetalhesAvaliacao.EditKM.Text := DBGrid1.DataSource.DataSet.FieldByName('km').Text;
 FormDetalhesAvaliacao.EditCor.Text := DBGrid1.DataSource.DataSet.FieldByName('cor').Text;
 FormDetalhesAvaliacao.EditOpcionais.Text := DBGrid1.DataSource.DataSet.FieldByName('opcionais').Text;
 FormDetalhesAvaliacao.EditPortas.Text := DBGrid1.DataSource.DataSet.FieldByName('portas').Text;
 FormDetalhesAvaliacao.EditTotalAvarias.Text := DBGrid1.DataSource.DataSet.FieldByName('total_avarias').Text;
 FormDetalhesAvaliacao.EditCodFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
 FormDetalhesAvaliacao.EditVlrFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('vlr_fipe').Text;
 FormDetalhesAvaliacao.EditVlrAvaliado.Text := DBGrid1.DataSource.DataSet.FieldByName('avaliacao').Text;
 FormDetalhesAvaliacao.EditCategoria.Text := DBGrid1.DataSource.DataSet.FieldByName('categoria').Text;
 FormDetalhesAvaliacao.EditIPVA.text      := DBGrid1.DataSource.DataSet.FieldByName('ipva').Text;

 FormDetalhesAvaliacao.Tag := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;

 FormDetalhesAvaliacao.WindowState := wsMaximized;
 FormDetalhesAvaliacao.ShowModal;

end;

procedure TFormGestaoAvaliacoes.FormShow(Sender: TObject);
begin
  DataModuleBancoVistoria.qBuscaAvaliacoes.Close;
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Clear;
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('Select id, data_avaliacao, placa, ano, modelo, nome_cliente,');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('telefone, tipo, portas, km, cor, opcionais, total_avarias,');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('avaliacao, vlr_fipe, cod_fipe, usuario, obs, categoria, ipva  From tbavaliacoes');
  DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('order by data_avaliacao desc limit 20');
  DataModuleBancoVistoria.qBuscaAvaliacoes.Open;
end;

procedure TFormGestaoAvaliacoes.img_ConsultaClick(Sender: TObject);
begin

 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Clear;
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('Select id, data_avaliacao, placa, ano, modelo, nome_cliente,');
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('telefone, tipo, portas, km, cor, opcionais, total_avarias,');
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('avaliacao, vlr_fipe, cod_fipe, usuario, obs, categoria, ipva  From tbavaliacoes');
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('where upper(USUARIO) like'+QuotedStr('%'+ComboAvaliadores.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('AND upper(PLACA) like'+QuotedStr('%'+EditPlaca.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('and upper(modelo) like '+QuotedStr('%'+EditModeloVeiculo.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('and upper(nome_cliente) like '+QuotedStr('%'+EditCliente.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('and telefone like '+QuotedStr('%'+EditTelefoneCliente.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('and tipo like '+QuotedStr('%'+ComboTipo.Text+'%'));
 DataModuleBancoVistoria.qBuscaAvaliacoes.SQL.Add('order by data_avaliacao  desc');
 DataModuleBancoVistoria.qBuscaAvaliacoes.Open;

end;

procedure TFormGestaoAvaliacoes.img_consulta_avaliacaoClick(Sender: TObject);
begin

  FormConsultaPlacaAvaliacao.Position := poScreenCenter;
  FormConsultaPlacaAvaliacao.ShowModal;

end;

end.
