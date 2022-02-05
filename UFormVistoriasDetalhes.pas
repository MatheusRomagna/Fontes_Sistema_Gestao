unit UFormVistoriasDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Loading, IdHTTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP,
  //Jpeg,
  Vcl.ComCtrls, Vcl.Buttons, Winapi.ShellAPI,
  FMX.Types, FMX.Graphics,

  //FMX.StdActns, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, System.Types, System.UITypes, System.Actions, FMX.ActnList,


  Data.DB, System.IOUtils, MemDS, DBAccess, Uni, UniProvider, MySQLUniProvider, FMX.MultiResBitmap,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, frxClass;

type
  TFormVistoriaDetalhes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditPlaca: TEdit;
    Label2: TLabel;
    EditAno: TEdit;
    Label3: TLabel;
    MemoModelo: TMemo;
    Label4: TLabel;
    EditPortas: TEdit;
    Label5: TLabel;
    EditKM: TEdit;
    Label6: TLabel;
    EditCor: TEdit;
    Label7: TLabel;
    EditOpcionais: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    EditCodFipe: TEdit;
    Label9: TLabel;
    EditVlrFipe: TEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    EditCategoria: TEdit;
    Label11: TLabel;
    EditTotalAvaria: TEdit;
    PanelPrincipal: TPanel;
    PanelBotton: TPanel;
    Origem: TImage;
    IdFTP1: TIdFTP;
    IdHTTP1: TIdHTTP;
    btnAplicaZoom: TButton;
    Button1: TButton;
    Label12: TLabel;
    EditVistoriador: TEdit;
    BtnNext: TButton;
    btnPrior: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaDadosVistoria: TUniQuery;
    qBuscaDadosVistoriaid: TIntegerField;
    qBuscaDadosVistoriaid_fornecedor: TIntegerField;
    qBuscaDadosVistoriafornecedor: TStringField;
    qBuscaDadosVistoriaplaca: TStringField;
    qBuscaDadosVistoriaano: TStringField;
    qBuscaDadosVistoriaano_modelo: TStringField;
    qBuscaDadosVistoriamodelo: TStringField;
    qBuscaDadosVistoriaportas: TIntegerField;
    qBuscaDadosVistoriaKM: TFloatField;
    qBuscaDadosVistoriatipo_motor: TStringField;
    qBuscaDadosVistoriacor: TStringField;
    qBuscaDadosVistoriaopcionais: TStringField;
    qBuscaDadosVistoriaid_usuario: TIntegerField;
    qBuscaDadosVistoriausuario: TStringField;
    qBuscaDadosVistoriaid_empresa: TIntegerField;
    qBuscaDadosVistoriaempresa: TStringField;
    qBuscaDadosVistoriacnpj_emp: TStringField;
    qBuscaDadosVistoriacod_fipe: TStringField;
    qBuscaDadosVistoriavlr_fipe: TFloatField;
    qBuscaDadosVistoriavlr_tot_avaria: TFloatField;
    qBuscaDadosVistoriaCategoria: TStringField;
    qBuscaDadosVistoriaDataVistoria: TDateTimeField;
    qBuscaDadosVistoriavistoria_dt_envio: TDateTimeField;
    qBuscaDadosVistoriavistoria_dt_finalizado: TDateTimeField;
    qBuscaDadosVistoriaEnvio: TIntegerField;
    qBuscaDadosVistoriaDt_Termino: TDateTimeField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    img_avarias: TImage;
    Label13: TLabel;
    MemoOBS: TMemo;
    qBuscaDadosVistoriaobs: TStringField;
    LinkControlToField13: TLinkControlToField;
    btnCarregaFotos: TBitBtn;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField14: TLinkControlToField;
    procedure FormShow(Sender: TObject);
    procedure btnAplicaZoomClick(Sender: TObject);
    procedure btnVisualizaAvariasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_avariasClick(Sender: TObject);
    procedure btnCarregaFotosClick(Sender: TObject);
  private
   //FImage: TJPEGImage;
  public
    { Public declarations }
    Zoom : Boolean;
    SizeZoom : integer;
  end;

var
  FormVistoriaDetalhes: TFormVistoriaDetalhes;

implementation

{$R *.dfm}

uses UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormVistoriadores, UFormWebBrowse,
  UFormLoadingOpaco, UforTestesDiversos, UFormAvarias, UDataModuleBancoVistoria,
  UFormAtuTabFIpe, UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao,
  UFormGestaoAvaliacoes, UFormLotesArval, UnitLogin, UFormAvaliarAvaliacao,
  UFormHistoricoAvaliacoes, UFormLoginSavauto, UFormPermissoesCarga,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPlaca, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAvariasItens, UFormCadaNovoUsuMobile,
  UFormCadaUsuario, UFormCadaUsuariosMobile, UFormConcedePermissao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormExtratoPgtoVeiculos, UFormGestaoAvarias, UFormHistoricoObsAtn,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios,
  UFormLoadingCarregamento, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPesquisaFipe, UFormPgtoExtratoVeiculo, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUsuarios, UFormAguarde;


procedure TFormVistoriaDetalhes.btnAplicaZoomClick(Sender: TObject);
Begin

  Origem.AutoSize := false;
  Origem.Stretch := true;
  Origem.Width := 2 * Origem.Width;
  Origem.Height := 2 * Origem.Height;

end;

procedure TFormVistoriaDetalhes.btnVisualizaAvariasClick(Sender: TObject);
begin

 FormAvarias.Position := poScreenCenter;

   FormAvarias.qBuscaAvarias.sql.Clear;
   FormAvarias.qBuscaAvarias.sql.Add('select * from tbVistoriaReparos where placa = :placa');
   FormAvarias.qBuscaAvarias.ParamByName('placa').Text := EditPlaca.Text;
   FormAvarias.qBuscaAvarias.Open;
   FormAvarias.qBuscaAvarias.Active := true;

 FormAvarias.ShowModal;

end;

procedure TFormVistoriaDetalhes.Button1Click(Sender: TObject);
begin

  Origem.AutoSize := true;
  Origem.Stretch := false;

end;

procedure TFormVistoriaDetalhes.btnCarregaFotosClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin

 if FormAguarde = nil then
 Begin
   FormAguarde := TFormAguarde.Create(self);
 End;

 FormAguarde.Position := poScreenCenter;
 FormAguarde.TransparentColor := true;
 FormAguarde.Show;

 Application.ProcessMessages;
 Sleep(250);

 try
     if DataModuleBancoVistoria = nil then
     Begin
       DataModuleBancoVistoria := TDataModuleBancoVistoria.Create(self);
     End;

     DataModuleBancoVistoria.qConsultaFotos.SQL.Clear;
     DataModuleBancoVistoria.qConsultaFotos.SQL.Add('select id, placa, Foto, id_vistoria from tbFotosVistoria where id_vistoria=:id and placa=:placa');
     DataModuleBancoVistoria.qConsultaFotos.ParamByName('id').AsInteger := Tag;
     DataModuleBancoVistoria.qConsultaFotos.ParamByName('placa').Text :=   EditPlaca.Text;
     DataModuleBancoVistoria.qConsultaFotos.Open;

     FormAguarde.Close;

     if DataModuleBancoVistoria.qConsultaFotos.RecordCount <= 0 then
     Begin
       FormAguarde.Close;

       MessageDlg('Nenhum foto a listar! ', mtInformation, [mbok] , 0);
     End;

 Except
 On E:Exception Do
   Begin
     FormAguarde.Close;
     MessageDlg('Falha ao carregar foto! ' + E.Message, mtWarning, [mbok] , 0);
   End;
 end;



End;

procedure TFormVistoriaDetalhes.BtnNextClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin

 if DataModuleBancoVistoria.qConsultaFotos.RecordCount <= 0 then
 Begin
   MessageDlg('Nenhum foto carregada! ', mtWarning, [mbok] , 0);
 End
 Else
 Begin

   if DataModuleBancoVistoria.qConsultaFotos.Eof then
   Begin
    MessageDlg('Ultima foto já carregada!' , mtInformation, [mbok ] ,0);
    Abort;
   End;

   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.TransparentColor := true;
   FormAguarde.Show;

   Application.ProcessMessages;
   Sleep(250);

   try
     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin

      DataModuleBancoVistoria.qConsultaFotos.Next;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         Origem.Picture.LoadFromStream( BlobStream );

         FormAguarde.Close;
     End;
  Except
   On E:Exception Do
   Begin
      FormAguarde.Close;
      MessageDlg('Falha ao carregar foto! ' + e.Message, mtWarning, [mbok] , 0);
   End;

   end;

 End;


end;

procedure TFormVistoriaDetalhes.btnPriorClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.TransparentColor := true;
   FormAguarde.Show;

   Application.ProcessMessages;
   Sleep(250);

   try


     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin
         DataModuleBancoVistoria.qConsultaFotos.Prior;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         Origem.Picture.LoadFromStream( BlobStream );

         FormAguarde.Close;

     End;
   Except
   On E:Exception Do
   Begin
      FormAguarde.Close;
      MessageDlg('Falha ao carregar foto!' + E.Message, mtWarning, [mbok] , 0);
   End;

   end;

end;

procedure TFormVistoriaDetalhes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Origem.Picture.Bitmap.Assign(nil);

end;

procedure TFormVistoriaDetalhes.FormShow(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin

  Zoom := false;
  SizeZoom := 0;

  DataModuleBancoVistoria.qConsultaFotos.Close;

 //ListBoxFotos.Height := EditVlrFipe.Top - 5;
 Panel2.Height := GroupBox2.top -5;
{
 DataModuleBancoVistoria.qConsultaFotos.SQL.Clear;
 DataModuleBancoVistoria.qConsultaFotos.SQL.Add('select id, placa, Foto from tbFotosVistoria where id_vistoria=:id');
 //DataModuleBancoVistoria.qConsultaFotos.ParamByName('placa').Text := EditPlaca.Text;
 DataModuleBancoVistoria.qConsultaFotos.ParamByName('id').AsInteger := FormGestaoVistoria.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
 DataModuleBancoVistoria.qConsultaFotos.Open;

     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin

         DataModuleBancoVistoria.qConsultaFotos.First;

      {   BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );

         //Origem.Picture.LoadFromFile(DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto').AsString);
         Origem.Picture.LoadFromStream( BlobStream );   }
 {
     End;
  }

end;

procedure TFormVistoriaDetalhes.img_avariasClick(Sender: TObject);
begin

 if FormAvarias = nil then
 Begin
   FormAvarias := TFormAvarias.Create(self);
 End;

 FormAvarias.Position := poScreenCenter;

   FormAvarias.qBuscaAvarias.sql.Clear;
   FormAvarias.qBuscaAvarias.sql.Add('select * from tbVistoriaReparos where placa = :placa');
   FormAvarias.qBuscaAvarias.ParamByName('placa').Text := EditPlaca.Text;
   FormAvarias.qBuscaAvarias.Open;
   FormAvarias.qBuscaAvarias.Active := true;

 FormAvarias.ShowModal;

end;

end.
