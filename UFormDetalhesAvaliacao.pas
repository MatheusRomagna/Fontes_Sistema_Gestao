unit UFormDetalhesAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, Vcl.Imaging.jpeg, IdHTTP, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Winapi.ShellAPI,
  FMX.Types, FMX.Graphics, Vcl.Imaging.pngimage, Vcl.Menus, Uni, Vcl.ExtDlgs,
  MemDS, DBAccess;

type
  TFormDetalhesAvaliacao = class(TForm)
    PanelFotos: TPanel;
    PanelTopo: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditPlaca: TEdit;
    EditAno: TEdit;
    EditModelo: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditCliente: TEdit;
    EditTelefone: TEdit;
    EditTipo: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditKM: TEdit;
    EditCor: TEdit;
    EditOpcionais: TEdit;
    EditPortas: TEdit;
    EditTotalAvarias: TEdit;
    EditCodFipe: TEdit;
    EditVlrFipe: TEdit;
    img_foto_avaliacao: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label14: TLabel;
    EditVlrAvaliado: TEdit;
    btnHistAvaliacoes: TButton;
    Label15: TLabel;
    MemoObs: TMemo;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    btnAvaliarVeiculo: TBitBtn;
    btnVoltarFoto: TBitBtn;
    btnAvancarFoto: TBitBtn;
    MainMenu1: TMainMenu;
    AlterardadosdaFipe1: TMenuItem;
    btnCarregaFoto: TBitBtn;
    Timer1: TTimer;
    Button1: TButton;
    Label16: TLabel;
    EditCategoria: TEdit;
    SavePictureDialog1: TSavePictureDialog;
    QFotosAvaliacoes: TUniQuery;
    btnClassificacao: TButton;
    Label17: TLabel;
    EditIPVA: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFotoAnteriorClick(Sender: TObject);
    procedure btnProximaFotoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnAvaliarClick(Sender: TObject);
    procedure btnHistAvaliacoesClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure btnAvaliarVeiculoClick(Sender: TObject);
    procedure btnVoltarFotoClick(Sender: TObject);
    procedure btnAvancarFotoClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure AlterardadosdaFipe1Click(Sender: TObject);
    procedure btnCarregaFotoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnClassificacaoClick(Sender: TObject);
  private
    procedure GeraClassificacaoVeiculo(placa, avaria, ano, fipe: string;
      vlr_fipe, km: currency);
    procedure ConsultaClasseVeiculo(placa, avaria, ano, fipe: string; vlr_fipe,
      km: currency);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalhesAvaliacao: TFormDetalhesAvaliacao;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormVistoriadores, UFormVistoriasDetalhes,
  UFormWebBrowse, UforTestesDiversos, UDataModuleBancoVistoria, UnitLogin,
  UFormAvaliarAvaliacao, UFormHistoricoAvaliacoes, UFormLoginSavauto,
  UFormPermissoesCarga, FMX.UFormGraficosAtendimento, UDMPermissoes,
  UFormAgendamento, UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormCadaNovoUsuMobile,
  UFormCadaUsuario, UFormCadaUsuariosMobile, UFormConcedePermissao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormHistoricoObsAtn,
  UFormInformacoes, UFormLiberaPermissao, UFormLoadingCarregamento,
  UFormNovaAvaliacao, UformNovaObs, UFormPerfis, UFormPesquisaFipe,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic, UFormUsuarios,
  UFormAjusteDadosFipeAvaliacao, UFormExtratoPgtoVeiculos, UFormMenuFinanceiro,
  UFormPagamentoVeiculo, UFormPgtoExtratoVeiculo, UFormAguarde,
  UClasseVeiculoAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAvariasItens,
  UFormCadastroTransportadora, UFormCadastroTransportadoras, UFormCidadesCustos,
  UFormCriacaoAvaria, UFormDadosPgtoTransporte, UFormDetalhesAtendimentoBeta,
  UFormDetalheTransportes, UFormDivergenciasDados, UFormDREDados,
  UFormFiltrosGestao, UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvarias, UFormGestaoDadosSavauto,
  UFormGestaoTransporte, UFormListaBancos, UFormListaUsuarios,
  UFormNovaCidadeCusto, UFormNovoUsuarioTransporte,
  UFormPagamentoEmLoteTransportes, UFormPagamentoTransporte, UFormParametros,
  UFormPermissoesUsuarioAppTransporte, UFormRelacaoEstoque, UFormTabelaCompra,
  UFormVerCarrosClasse;

procedure TFormDetalhesAvaliacao.GeraClassificacaoVeiculo(placa, avaria, ano, fipe : string; vlr_fipe, km : currency);
var

 querySavanna, query : TUniQuery;
 vendidos, EmEstoque, mercado, margem : currency;
 dias : integer;
 ClasseMercado, ClasseFipe, ClasseKM : string;

Begin

 querySavanna := TUniQuery.Create(self);
 querySavanna.Connection := DataModuleConexao.UniConnectionSavanna;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select qtd_d_vendida from tbParamMercadoCompra limit 1');
  query.Open;

  dias := query.FieldByName('qtd_d_vendida').AsInteger;

  querySavanna.SQL.Clear;
  querySavanna.SQL.Add('select COUNT(*) as qtd from CadCar where ');
  querySavanna.SQL.Add('SUBSTRING( Car_CodFIPE, 1, 8 ) = :codfipe ');
  querySavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  querySavanna.SQL.Add('and Car_Sit in (''Vendido'', ''Finalizado'', ''Arras'') ');
  querySavanna.SQL.Add('and Car_DtVenda >= GETDATE()-:dias and Car_DtVenda <= GETDATE() ');
  querySavanna.ParamByName('codfipe').Text := fipe;
  querySavanna.ParamByName('ano').Text := ano;
  querySavanna.ParamByName('dias').AsInteger := dias;
  querySavanna.Open;

  vendidos := querySavanna.FieldByName('qtd').AsCurrency;

  querySavanna.SQL.Clear;
  querySavanna.SQL.Add('select COUNT(*) as qtd from CadCar where ');
  querySavanna.SQL.Add('SUBSTRING( Car_CodFIPE, 1, 8 ) = :codfipe ');
  querySavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  querySavanna.SQL.Add('and Car_Sit in (''Ag Transporte'', ''Em venda'', ''Em Venda'', ''Preparando'') ');
  //querySavanna.SQL.Add('and Car_DtVenda >= GETDATE()- :dias and Car_DtVenda <= GETDATE() ');
  querySavanna.ParamByName('codfipe').Text := fipe;
  querySavanna.ParamByName('ano').Text := ano;
  //querySavanna.ParamByName('dias').AsInteger := dias;
  querySavanna.Open;

  EmEstoque :=  querySavanna.FieldByName('qtd').AsCurrency;

  if EmEstoque = 0 then
  mercado := 0
  ELse
  mercado := EmEstoque /  vendidos;

  //ShowMessage('Vendidos: '+ CurrToStr(vendidos) +  ' Em Estoque:' + CurrToStr(EmEstoque) + ' Mercado: ' + CurrToStr(mercado) );

  query.SQL.Clear;
  query.SQL.Add(' select * from tbParamMercadoCompra where :mercado between valor_de and valor_ate');
  query.ParamByName('mercado').AsCurrency := mercado;
  query.Open;

  //ShowMessage('Classe Mercado: ' + query.FieldByName('classe').Text);

  ClasseMercado :=  query.FieldByName('classe').Text;

  query.SQL.Clear;
  query.sql.Add(' select * from tbparamvalorcompra where :valor between valor_de and valor_ate');
  query.ParamByName('valor').AsCurrency := vlr_fipe;
  query.Open;

  //ShowMessage('Classe Fipe: ' + query.FieldByName('classe').Text);

  ClasseFipe := query.FieldByName('classe').Text;

  query.SQL.Clear;
  query.sql.Add(' select * from tbparamkmcompra where :valor between valor_de and valor_ate');
  query.ParamByName('valor').AsCurrency := km;
  query.Open;

  //ShowMessage('Classe KM: ' + query.FieldByName('classe').Text);

  ClasseKM := query.FieldByName('classe').Text;

  query.SQL.Clear;
  query.SQL.Add('select * from tbparamvalorescompras where');
  query.SQL.Add(' classe_valor=:classe_fipe and ');
  query.SQL.Add(' classe_avaria=:classe_avaria and');
  query.SQL.Add(' classe_mercado=:classe_mercado and');
  query.SQL.Add(' classe_KM=:classe_KM');
  query.ParamByName('classe_fipe').Text := ClasseFipe;
  if (avaria = 'A') or (avaria = 'B') then
  query.ParamByName('classe_avaria').Text := 'A/B';
  query.ParamByName('classe_mercado').Text := ClasseMercado;
  query.ParamByName('classe_KM').Text := ClasseKM;
  query.Open;

{  if (avaria = 'C') or (avaria = 'D') then
  Begin
    MessageDlg('Veículo classificado com Categoria '+avaria+', o mesmo não é possível gerar classes de compras. ', mtInformation, [mbok] , 0);
    FormAguarde.Close;

    Abort;
  End
  Else
  Begin  }

   margem := query.FieldByName('valor_margem').AsCurrency;

   if margem = Null then
   Margem := 0;

   query.SQL.Clear;
   query.SQL.Add('delete from tbclasseveiculos where placa=:placa');
   query.ParamByName('placa').Text := placa;
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('insert into tbclasseveiculos (id_veiculo, placa, data, classe_valor, classe_avaria, classe_mercado, classe_KM, valor_margem)');
   query.SQL.Add('values (:id, :placa, :data, :cl_valor, :cl_avaria, :cl_mercado, :cl_km, :margem)');
   query.ParamByName('id').AsInteger := 0;
   query.ParamByName('placa').Text := placa;
   query.ParamByName('data').AsDateTime := NOW;
   query.ParamByName('cl_valor').Text := ClasseFipe;
   query.ParamByName('cl_avaria').Text := avaria;
   query.ParamByName('cl_mercado').Text := ClasseMercado;
   query.ParamByName('cl_km').Text := ClasseKM;
   query.ParamByName('margem').AsCurrency := Margem;
   query.ExecSQL;

   //query.ApplyUpdates;

  //End;

  ClasseVeiculoAvaliacao.EditFipe.Text := CurrToStr(vlr_fipe);
  ClasseVeiculoAvaliacao.EditAvaria.Text := avaria;
  ClasseVeiculoAvaliacao.EditMercado.Text := CurrToStr(mercado);
  ClasseVeiculoAvaliacao.EditKM.Text := CurrToStr(km);
  ClasseVeiculoAvaliacao.lblStatusDias.Caption := 'Veículo calculado sobre a base de ' + IntToStr(dias);
  ClasseVeiculoAvaliacao.EditEmEstoque.Text := CurrToStr(EmEstoque);
  ClasseVeiculoAvaliacao.EditVendidos.Text := CurrToStr(vendidos);

  if ClasseVeiculoAvaliacao = nil then
  Begin
    ClasseVeiculoAvaliacao := TClasseVeiculoAvaliacao.Create(self);
  End;

  ClasseVeiculoAvaliacao.QBuscaClasse.Filter := 'placa=' + QuotedStr( placa );
  ClasseVeiculoAvaliacao.QBuscaClasse.Filtered := true;
  ClasseVeiculoAvaliacao.QBuscaClasse.Close;
  ClasseVeiculoAvaliacao.QBuscaClasse.Open;

  ClasseVeiculoAvaliacao.Position := poScreenCenter;

  FormAguarde.Close;

  ClasseVeiculoAvaliacao.ShowModal;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao criar registro de Classificação! ' + e.Message);
  End;

 end;

End;

procedure TFormDetalhesAvaliacao.ConsultaClasseVeiculo(placa, avaria, ano, fipe : string; vlr_fipe, km : currency);
var

 querySavanna, query : TUniQuery;

begin

 querySavanna := TUniQuery.Create(self);
 querySavanna.Connection := DataModuleConexao.UniConnectionSavanna;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 if FormAguarde = nil then
 Begin
   FormAguarde := TFormAguarde.Create(self);
 End;

  FormAguarde.Label1.Caption := 'Consultando Classificação...';
  FormAguarde.Position := poScreenCenter;
  FormAguarde.Show;
  Application.ProcessMessages;

  query.SQL.Clear;
  query.SQL.Add('select * from tbClasseVeiculos where placa=:placa');
  query.ParamByName('placa').Text := placa;
  query.Open;

   if query.RecordCount > 0 then
   Begin

      query.SQL.Clear;
      query.SQL.Add('delete from tbClasseVeiculos where placa=:placa');
      query.ParamByName('placa').Text := placa;
      query.Execute;


   End;

      FormAguarde.Label1.Caption := 'Criando classificação...';
      Application.ProcessMessages;
      sleep(1000);

      GeraClassificacaoVeiculo(placa, avaria, ano, fipe, vlr_fipe, km );


End;

procedure TFormDetalhesAvaliacao.AlterardadosdaFipe1Click(Sender: TObject);
begin

 if FormAjusteDadosFipeAvaliacao = nil then
 Begin
   FormAjusteDadosFipeAvaliacao := TFormAjusteDadosFipeAvaliacao.Create(self);
 End;

 if FormLoginSavauto.qValidaUsuario.FieldByName('nivel').AsInteger = 99 then
 Begin
   FormAjusteDadosFipeAvaliacao.EditAno.Text := EditAno.Text;
   FormAjusteDadosFipeAvaliacao.EditModelo.Text := EditModelo.Text;
   FormAjusteDadosFipeAvaliacao.EditCodFipe.Text := EditCodFipe.Text;
   FormAjusteDadosFipeAvaliacao.EditVlrFipe.Text := EditVlrFipe.Text;

   FormAjusteDadosFipeAvaliacao.Position := poScreenCenter;
   FormAjusteDadosFipeAvaliacao.ShowModal;
 End
 Else
 Begin
   MessageDlg('Usuário sem permissão para alterar os dados', mtWarning, [mbok] , 0);
   Abort;
 End;

end;

procedure TFormDetalhesAvaliacao.btnAvaliarClick(Sender: TObject);
begin

 FormAvaliarAvaliacao.Position := poScreenCenter;
 FormAvaliarAvaliacao.ShowModal;

end;

procedure TFormDetalhesAvaliacao.btnAvaliarVeiculoClick(Sender: TObject);
begin


 if FormAvaliarAvaliacao = nil then
 Begin
   FormAvaliarAvaliacao := TFormAvaliarAvaliacao.Create(self);
 End;


   FormAvaliarAvaliacao.Position := poScreenCenter;
   FormAvaliarAvaliacao.ShowModal;
end;

procedure TFormDetalhesAvaliacao.btnAvancarFotoClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin

   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.Show;

   Application.ProcessMessages;

   Sleep(250);

   try

     if QFotosAvaliacoes.Eof then
     Begin
       FormAguarde.Close;
       MessageDlg('Ultima foto carregada! ', mtWarning, [mbok ] , 0);
       Abort;
     End
     Else
     Begin

      QFotosAvaliacoes.Next;
      img_foto_avaliacao.Picture.Assign( QFotosAvaliacoes.FieldByName('Foto') );
      FormAguarde.Close;

     End;
   Except
   On E:Exception Do
   Begin
     FormAguarde.Close;
     MessageDlg('Falha ao carregar lista de fotos!', mtWarning, [mbok] , 0);
   End;

   end;

end;

procedure TFormDetalhesAvaliacao.btnCarregaFotoClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
 query : Tuniquery;
Begin

   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.Show;

   Application.ProcessMessages;

   Sleep(250);

   try

     QFotosAvaliacoes.SQL.Clear;
     QFotosAvaliacoes.SQL.Add('select * from tbFotosAvaliacoes where id_avaliacao=:id and placa=:placa');
     QFotosAvaliacoes.ParamByName('id').AsInteger := Tag;
     QFotosAvaliacoes.ParamByName('placa').Text   := EditPlaca.Text;
     QFotosAvaliacoes.Open;

     FormAguarde.Close;

     if  QFotosAvaliacoes.RecordCount <= 0 then
     Begin
       ShowMessage('Não há fotos para carregar para esta placa!');
       Abort;
     End;

     QFotosAvaliacoes.First;

    // CreateDir('C:\Sistema Savauto\avaliacoes\fotos\'+EditPlaca.Text);

     img_foto_avaliacao.Picture.Assign( QFotosAvaliacoes.FieldByName('Foto') );
       //img_foto_avaliacao.Picture.SaveToFile('C:\Sistema Savauto\avaliacoes\fotos\' + EditPlaca.Text + '\' + IntToStr(query.FieldByName('id_avaliacao').AsInteger) + '_' + '.jpg' );

    //ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath('C:\Sistema Savauto\avaliacoes\fotos\' + EditPlaca.Text + '\')),nil,nil,SW_SHOWNORMAL);

    // QFotosAvaliacoes.DisposeOf;

    except
       On E:exception do
       Begin
          ShowMessage('Falha ao carregar foto! Refaça a operação! '+e.Message);
       End;
   end;
End;


procedure TFormDetalhesAvaliacao.btnClassificacaoClick(Sender: TObject);
Begin

 ConsultaClasseVeiculo( EditPlaca.Text, EditCategoria.Text, EditAno.Text, EditCodFipe.Text, StrToCurr(StringReplace( StringReplace( EditVlrFipe.Text, 'R$', '', []), '.' ,'', [])), StrToCurr(EditKM.Text) );

end;

{Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin
//

 if FormLoadingOpaco = nil then
 Begin
  FormLoadingOpaco := TFormLoadingOpaco.Create(self);
 End;

 FormLoadingOpaco.WindowState := wsMaximized;
 FormLoadingOpaco.Label1.Caption := 'Aguarde...Carregando Fotos...';
 FormLoadingOpaco.Show;

 TThread.CreateAnonymousThread(procedure
 Begin
   Sleep(1000);
     DataModuleBancoVistoria.qConsultaFotos.SQL.Clear;
     DataModuleBancoVistoria.qConsultaFotos.SQL.Add('select id, placa, Foto from tbFotosAvaliacoes');
     DataModuleBancoVistoria.qConsultaFotos.SQL.Add('where placa=:placa and id_avaliacao=:id');
     DataModuleBancoVistoria.qConsultaFotos.ParamByName('placa').Text := EditPlaca.Text;
     DataModuleBancoVistoria.qConsultaFotos.ParamByName('id').AsInteger := FormGestaoAvaliacoes.DataSource1.DataSet.FieldByName('id').AsInteger;
     DataModuleBancoVistoria.qConsultaFotos.Open;

   TThread.Synchronize(nil, procedure
   Begin
     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin

     DataModuleBancoVistoria.qConsultaFotos.First;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         img_foto_avaliacao.Picture.LoadFromStream( BlobStream );

         FormLoadingOpaco.Close;

     End
     Else
     Begin
        FormLoadingOpaco.Close;
        ShowMessage('Nenhuma foto encontrada no servidor de fotos.');
     End;
   End);

 End).Start;

end;
}
procedure TFormDetalhesAvaliacao.btnFotoAnteriorClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin
         DataModuleBancoVistoria.qConsultaFotos.Prior;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         img_foto_avaliacao.Picture.LoadFromStream( BlobStream );

     End;

end;

procedure TFormDetalhesAvaliacao.btnHistAvaliacoesClick(Sender: TObject);
begin

 if FormHistoricoAvaliacoes = nil then
 Begin
   FormHistoricoAvaliacoes := TFormHistoricoAvaliacoes.Create(self);
 End;


 FormHistoricoAvaliacoes.qBuscaHistoricoAval.SQL.Clear;
 FormHistoricoAvaliacoes.qBuscaHistoricoAval.SQL.Add('select * from tbavaliacoes where placa=:placa');
 FormHistoricoAvaliacoes.qBuscaHistoricoAval.ParamByName('placa').Text := EditPlaca.Text;
 FormHistoricoAvaliacoes.qBuscaHistoricoAval.Open;

 if FormHistoricoAvaliacoes.qBuscaHistoricoAval.RecordCount > 1 then
 Begin
   FormHistoricoAvaliacoes.Position := poScreenCenter;
   FormHistoricoAvaliacoes.ShowModal;
 End
 Else
 Begin
   MessageDlg('Não há avaliações anteriores registradas para a placa '+EditPlaca.Text, mtInformation, [mbok] , 0);
   Abort;
 End;

end;

procedure TFormDetalhesAvaliacao.btnProximaFotoClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin
         DataModuleBancoVistoria.qConsultaFotos.Next;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         img_foto_avaliacao.Picture.LoadFromStream( BlobStream );

     End;

end;

procedure TFormDetalhesAvaliacao.btnVoltarFotoClick(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin

   if FormAguarde = nil then
   Begin
     FormAguarde := TFormAguarde.Create(self);
   End;

   FormAguarde.Position := poScreenCenter;
   FormAguarde.Show;

   Application.ProcessMessages;

   Sleep(250);

   Try

     if QFotosAvaliacoes.RecordCount > 0 then
     Begin

      QFotosAvaliacoes.Prior;
      img_foto_avaliacao.Picture.Assign( QFotosAvaliacoes.FieldByName('Foto') );

      FormAguarde.Close;

     End;
   Except
   On E:Exception Do
   Begin
      FormAguarde.Close;
      MessageDlg('Falha ao carregar lista de fotos! ', mtWarning, [mbok] , 0);
   End;

   End;


end;

procedure TFormDetalhesAvaliacao.Button1Click(Sender: TObject);
var F:Tform;
MSG: Tlabel;
Borda: TShape;
begin

F:=  TForm.Create(Application);
F.BorderStyle:= bsNone;
F.Position:= poDesktopCenter;
F.Width:= 500;
F.Height:= 200; //até aqui criamos o form
f.Color := clBlue;

Borda:= TShape.Create(Application);
Borda.Parent:= F;
Borda.Align:= alClient; // uma borda envolta do form

MSG:=  TLabel.Create(Application);
MSG.Parent:=F;
MSG.Transparent:= true;
MSG.AutoSize:= true;
MSG.Width:= 200;
Msg.Caption:='Aguarde' + #13 + 'Consultando Foto';
Msg.Align := alClient;
Msg.Font.Size := 24;
MSG.Alignment:= taCenter;//label com a mensagem "Aguarde"

F.Show;

F.Update;

Sleep(5000);

//Aqui você coloca os procedimentos desejados

F.Free; //E finalmente libera a janela
end;
procedure TFormDetalhesAvaliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 img_foto_avaliacao.Picture.Bitmap := nil;

end;

procedure TFormDetalhesAvaliacao.FormShow(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


 EditPlaca.Alignment    := taCenter;
 EditAno.Alignment      := taCenter;
 EditTelefone.Alignment := taCenter;
 EditModelo.Alignment   := taCenter;
 EditCliente.Alignment  := taCenter;
 EditTipo.Alignment     := taCenter;
 EditKM.Alignment       := taCenter;
 EditCor.Alignment      := taCenter;
 EditOpcionais.Alignment:= taCenter;
 EditPortas.Alignment   := taCenter;
 EditTotalAvarias.Alignment := taCenter;
 EditCodFipe.Alignment  := taCenter;
 EditVlrFipe.Alignment  := taCenter;

 DBGrid1.Height := EditVlrFipe.Top - 5;

 if EditVlrFipe.Text <> '' then
 EditVlrFipe.Text := 'R$ ' + FormatFloat('###,###,##0.00', StrToCurr(EditVlrFipe.Text));

 if EditVlrAvaliado.Text <> '' then
 EditVlrAvaliado.Text := 'R$ ' + FormatFloat('###,###,##0.00', StrToCurr(EditVlrAvaliado.Text));

 if EditTotalAvarias.Text <> '' then
 EditTotalAvarias.Text := 'R$ ' + FormatFloat('###,###,##0.00', StrToCurr(EditTotalAvarias.Text));

end;

procedure TFormDetalhesAvaliacao.Image1Click(Sender: TObject);
begin

 if FormAvarias = nil then
 Begin
   FormAvarias := TFormAvarias.Create(self);
 End;

   FormAvarias.Position := poScreenCenter;

   FormAvarias.qBuscaAvarias.sql.Clear;
   FormAvarias.qBuscaAvarias.sql.Add('select * from tbavaliacoesReparos where placa = :placa and id_vistoria = :id');
   FormAvarias.qBuscaAvarias.ParamByName('placa').Text := EditPlaca.Text;
   FormAvarias.qBuscaAvarias.ParamByName('id').AsInteger := FormGestaoAvaliacoes.DataSource1.DataSet.FieldByName('id').AsInteger;
   FormAvarias.qBuscaAvarias.Open;

   FormAvarias.ShowModal;

end;

procedure TFormDetalhesAvaliacao.Image2Click(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin
         DataModuleBancoVistoria.qConsultaFotos.Next;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         img_foto_avaliacao.Picture.LoadFromStream( BlobStream );

     End;

end;
procedure TFormDetalhesAvaliacao.Image3Click(Sender: TObject);
Var
 BlobStream : TStream;
 SaveParam : TBitmapCodecSaveParams;
Begin


     if DataModuleBancoVistoria.qConsultaFotos.RecordCount > 0 then
     Begin
         DataModuleBancoVistoria.qConsultaFotos.Prior;

         BlobStream := DataModuleBancoVistoria.qConsultaFotos.CreateBlobStream(
                       DataModuleBancoVistoria.qConsultaFotos.FieldByName('Foto') , TBlobStreamMode.bmRead
                       );


         img_foto_avaliacao.Picture.LoadFromStream( BlobStream );

     End;

end;
procedure TFormDetalhesAvaliacao.Image5Click(Sender: TObject);
Var
 VlrFipe1, VlrFipe2, VlrFipe3, VlrFipe4 : Currency;
begin

 if FormRefFipes = nil then
 Begin
   FormRefFipes := TFormRefFipes.Create(self);
 End;

 FormRefFipes.DBGrid2.Columns[1].Title.Caption := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref1').Text;
 FormRefFipes.DBGrid2.Columns[2].Title.Caption := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref2').Text;
 FormRefFipes.DBGrid2.Columns[3].Title.Caption := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref3').Text;
 FormRefFipes.DBGrid2.Columns[4].Title.Caption := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('principal').Text;

 FormRefFipes.qBuscaVlrs.sql.clear;
 FormRefFipes.qBuscaVlrs.sql.add('select "'+'ANO'+EditAno.Text+'"  as Fipe from tbfipe where cod_fipe=:codfipe and ref=:ref');
 FormRefFipes.qBuscaVlrs.parambyname('codfipe').Text := EditCodFipe.Text;
 FormRefFipes.qBuscaVlrs.parambyname('ref').text     := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref1').Text;
 FormRefFipes.qBuscaVlrs.Open;

 VlrFipe1 := FormRefFipes.qBuscaVlrs.FieldByName('Fipe').AsCurrency;

 FormRefFipes.qBuscaVlrs.sql.clear;
 FormRefFipes.qBuscaVlrs.sql.add('select "'+'ANO'+EditAno.Text+'"  as Fipe from tbfipe where cod_fipe=:codfipe and ref=:ref');
 FormRefFipes.qBuscaVlrs.parambyname('codfipe').Text := EditCodFipe.Text;
 FormRefFipes.qBuscaVlrs.parambyname('ref').text     := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref2').Text;
 FormRefFipes.qBuscaVlrs.Open;

 VlrFipe2 := FormRefFipes.qBuscaVlrs.FieldByName('Fipe').AsCurrency;

 FormRefFipes.qBuscaVlrs.sql.clear;
 FormRefFipes.qBuscaVlrs.sql.add('select "'+'ANO'+EditAno.Text+'"  as Fipe from tbfipe where cod_fipe=:codfipe and ref=:ref');
 FormRefFipes.qBuscaVlrs.parambyname('codfipe').Text := EditCodFipe.Text;
 FormRefFipes.qBuscaVlrs.parambyname('ref').text     := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('ref3').Text;
 FormRefFipes.qBuscaVlrs.Open;

 VlrFipe3 := FormRefFipes.qBuscaVlrs.FieldByName('Fipe').AsCurrency;

 FormRefFipes.qBuscaVlrs.sql.clear;
 FormRefFipes.qBuscaVlrs.sql.add('select "'+'ANO'+EditAno.Text+'"  as Fipe from tbfipe where cod_fipe=:codfipe and ref=:ref');
 FormRefFipes.qBuscaVlrs.parambyname('codfipe').Text := EditCodFipe.Text;
 FormRefFipes.qBuscaVlrs.parambyname('ref').text     := FormRefFipes.DBGrid1.DataSource.DataSet.FieldByName('principal').Text;
 FormRefFipes.qBuscaVlrs.Open;

 VlrFipe4 := FormRefFipes.qBuscaVlrs.FieldByName('Fipe').AsCurrency;

 FormRefFipes.qBuscaVlrs.sql.clear;
 FormRefFipes.qBuscaVlrs.sql.add('update tbvlrfipesref set fipe1=:vlr1, fipe2=:vlr2, fipe3=:vlr3, fipePrincipal=:vlr4');
 FormRefFipes.qBuscaVlrs.ParamByName('vlr1').asCurrency := VlrFipe1;
 FormRefFipes.qBuscaVlrs.ParamByName('vlr2').asCurrency := VlrFipe2;
 FormRefFipes.qBuscaVlrs.ParamByName('vlr3').asCurrency := VlrFipe3;
 FormRefFipes.qBuscaVlrs.ParamByName('vlr4').asCurrency := VlrFipe4;
 FormRefFipes.qBuscaVlrs.Execute;

 FormRefFipes.QAtuVlr.Refresh;

 FormRefFipes.GroupBox1.Visible := true;

 FormRefFipes.Position := poScreenCenter;
 FormRefFipes.ShowModal;

end;

procedure TFormDetalhesAvaliacao.SpeedButton1Click(Sender: TObject);
begin

   FormAvarias.Position := poScreenCenter;

   FormAvarias.qBuscaAvarias.sql.Clear;
   FormAvarias.qBuscaAvarias.sql.Add('select * from tbavaliacoesReparos where placa = :placa and id_vistoria = :id');
   FormAvarias.qBuscaAvarias.ParamByName('placa').Text := EditPlaca.Text;
   FormAvarias.qBuscaAvarias.ParamByName('id').AsInteger := FormGestaoAvaliacoes.DataSource1.DataSet.FieldByName('id').AsInteger;
   FormAvarias.qBuscaAvarias.Open;

   FormAvarias.ShowModal;

end;

procedure TFormDetalhesAvaliacao.Timer1Timer(Sender: TObject);
begin

 ShowMessage('Passou 5s');

end;

end.
