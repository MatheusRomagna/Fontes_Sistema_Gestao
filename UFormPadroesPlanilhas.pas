unit UFormPadroesPlanilhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdHTTP, Data.DB, MemDS, DBAccess, Uni,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormPadroesPlanilhas = class(TForm)
    Image1: TImage;
    IdFTP1: TIdFTP;
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaFotos: TUniQuery;
    qBuscaFotosid: TIntegerField;
    qBuscaFotosnome: TStringField;
    qBuscaFotosimagem: TBlobField;
    qBuscaFotosdata: TDateTimeField;
    qBuscaFotosusuario: TStringField;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    qInsereFoto: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadroesPlanilhas: TFormPadroesPlanilhas;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormHistFIPE, UFormLoading, UFormNovoProcessamento,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal, UFormImagem,
  FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UFormAgendamento, UFormAnaliseCompra, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormConcedePermissao,
  UFormConsutaPlacaAvaliacao, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormGestaoAvaliacoes, UFormGestaoVistoria,
  UFormHistoricoAvaliacoes, UFormImportacoesEfetuadas, UFormInformacoes,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormNovoVistoriador,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormPadroesPlanilhas.Button1Click(Sender: TObject);
Var
 ImgSalvar : TMemoryStream;
begin

 TUniQuery.Create(qInsereFoto);

 MessageDlg('Voce esta selecionando a empresa '+DBGrid1.DataSource.DataSet.FieldByName('nome').Text+' para atualizar a foto', mtInformation, [mbok] , 0);

 if OpenDialog1.Execute() then
 Begin

 if OpenDialog1.FileName <> '' then
 Begin
      QInsereFoto.SQL.Clear;
      QInsereFoto.SQL.Add('update tbPadroesImportacoes set imagem=:foto ,data=:Dt, usuario=:usuario where nome=:nome');
      QInsereFoto.ParamByName('Dt').AsDateTime := NOW;
      QInsereFoto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
      qInsereFoto.ParamByName('nome').Text := DBGrid1.DataSource.DataSet.FieldByName('nome').Text;

      Image1.Picture.LoadFromFile(OpenDialog1.FileName);

      QInsereFoto.ParamByName('Foto').LoadFromFile(OpenDialog1.FileName, ftBlob); // LoadFromStream( ImgSalvar, ftBlob);
      QInsereFoto.Execute;

      ShowMessage('Foto atualizada com sucesso!');

      qInsereFoto.Free;
 End
 Else
 Begin
    ShowMessage('Nenhum foto selecionada');
    Abort;
 End;


 End;

end;

procedure RefreshImage(Field : TField; Img : TImage);
var
  vJpeg   : TPngImage;
  vStream : TMemoryStream;
begin
  { Verifica se o campo esta vázio. }
  if not Field.IsNull then
  begin

    { Cria objeto do tipo TJPEG, e objeto do tipo MemoryStream}
    vJpeg   := TPngImage.Create;
    vStream := TMemoryStream.Create;

    { Trata o campo como do tipo BLOB e salva o seu conteudo na memória. }
    TBlobField(Field).SaveToStream(vStream);

    { Ajusta a posicao inicial de leitura da memória }
    vStream.Position := 0;

    { Carrega da memoria os dados, para uma estrutura do tipo TJPEG
      (A partir da posicao 0)}
    vJpeg.LoadFromStream(vStream);

    { Exibe o jpg no Timage. }
    Img.Picture.Assign(vJpeg);

    { Libera a memoria utilizada pelos componentes de conversão }
    vJpeg.Free;
    vStream.Free;
  end;
end;

procedure TFormPadroesPlanilhas.DBGrid1DblClick(Sender: TObject);
Begin

 if not DBGrid1.DataSource.DataSet.FieldByName('imagem').IsNull then
 Begin

 RefreshImage(DBGrid1.DataSource.DataSet.FieldByName('imagem'), Image1);

 End
 Else
 Begin
    ShowMessage('Não há imagem para este fornecedor');
    Abort;
 End;

end;

procedure TFormPadroesPlanilhas.FormShow(Sender: TObject);
Var
 FileStatus: Boolean;
 FileSize: Int64;
  strm:Tmemorystream;
  img : TJPEGImage;
  Diretorio : String;
begin
  {
    IdFTP1.Disconnect;

    IdFTP1.Host :=     'savautovistoria.net';
    IdFTP1.Username := 'u672302580.compras';
    IdFTP1.Password := 'Sav@049509';

    IdFTP1.Passive := True;

    IdFTP1.Connect;

 if IdFTP1.Connected = true then
 Begin

   IdFTP1.ChangeDir('/'+'ExemploPlanImport');
   //idFTP1.List(ListBox1.Items, '*.png', false);
 End
 Else
 Begin
   ShowMessage('Verifique a conexão com o FTP de fotos');
 End;
  }
end;


procedure TFormPadroesPlanilhas.ListBox1Click(Sender: TObject);
var
  PNG: TPngImage;
  Strm: TMemoryStream;
 Arquivo : String;
begin

 //Arquivo := ListBox1.Items[ListBox1.ItemIndex];

 //ShowMessage('/QWD9988/'+Arquivo);
 {
  Screen.Cursor := crHourGlass;
  PNG := TPngImage.Create;
  Strm := TMemoryStream.Create;
  try
    IdHTTP1.Get('http://savautovistoria.net/Compras/ExemploPlanImport'+'/'+Arquivo, Strm);
    if (Strm.Size > 0) then
    begin
      Strm.Position := 0;
      PNG.LoadFromStream(Strm);
      Image1.Picture.Assign(PNG);
    end;
  finally
    Strm.Free;
    PNG.Free;
    Screen.Cursor := crDefault;
  end;
  }
// ImageSeleciona.Picture.LoadFromFile(StreamToImage(strm, ImageSeleciona));

end;

end.
