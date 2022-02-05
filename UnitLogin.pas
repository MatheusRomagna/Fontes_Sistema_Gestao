unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Ani,
  REST.Types, REST.Client, REST.Authenticator.Basic, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, FMX.TabControl, System.Math.Vectors,
  FMX.Controls3D, FMX.Layers3D, System.Actions, FMX.ActnList,
  FMX.MediaLibrary.Actions, FMX.StdActns, System.NetEncoding, soap.EncdDecd;

type
  TFormLogin = class(TForm)
    TabControl1: TTabControl;
    Tab_login: TTabItem;
    Tab_NovaConta: TTabItem;
    Tab_ResetConta: TTabItem;
    HTTPBasicAuthenticator: THTTPBasicAuthenticator;
    img_loading: TImage;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Image1: TImage;
    EdtUsuario: TEdit;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Image2: TImage;
    EdtSenha: TEdit;
    rectBotao: TRectangle;
    Label1: TLabel;
    Layout4: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    FloatAnimation1: TFloatAnimation;
    RequestLogin: TRESTRequest;
    RESTClient: TRESTClient;
    StyleBook1: TStyleBook;
    Label4: TLabel;
    Layout3D1: TLayout3D;
    Layout5: TLayout;
    rect_novousuario: TRectangle;
    rect_novasenha: TRectangle;
    EdtNovoUsuario: TEdit;
    EdtNovaSenha: TEdit;
    rect_CriaNovaConta: TRectangle;
    Label5: TLabel;
    c_foto: TCircle;
    Label6: TLabel;
    Label7: TLabel;
    ActionList1: TActionList;
    ActionLogin: TChangeTabAction;
    ActionNovoLogin: TChangeTabAction;
    TabFoto: TTabItem;
    Layout6: TLayout;
    lblCancelar: TLabel;
    imgFoto: TImage;
    imgLib: TImage;
    ActionFoto: TChangeTabAction;
    ActionCamera: TTakePhotoFromCameraAction;
    ActionLibrary: TTakePhotoFromLibraryAction;
    RequestConta: TRESTRequest;
    procedure FormCreate(Sender: TObject);
    procedure rectBotaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rectBotaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rectBotaoClick(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure ActionLibraryDidFinishTaking(Image: TBitmap);
    procedure ActionCameraDidFinishTaking(Image: TBitmap);
    procedure rect_CriaNovaContaClick(Sender: TObject);
  private
    { Private declarations }
    procedure ErroPermissao(Sender: TObject);
    function Base64FromBitmap(Bitmap: TBitmap): string;
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormImagem, UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos;


procedure processalogin;
Var
 JSONOBJ : TJSONObject;
 json, sucesso, erro, cod_usuario : string;
Begin

  FormLogin.FloatAnimation2.Stop;
  FormLogin.FloatAnimation3.Stop;

  if FormLogin.RequestLogin.Response.JSONValue = nil then
    Begin
       FormLogin.img_loading.Visible := false;
       FormLogin.Layout1.Visible := true;
       FormLogin.TabControl1.Visible := true;
       FormLogin.Layout1.Opacity := 1;
       ShowMessage('Erro ao validar login, JSON inválido');
       exit;
    End;


    try

    json := FormLogin.RequestLogin.Response.JSONValue.ToString;
    JSONOBJ := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

    sucesso := JSONOBJ.GetValue('sucesso').Value;
    erro := JSONOBJ.GetValue('erro').Value;
    cod_usuario := JSONOBJ.GetValue('codusuario').Value;

    if sucesso <> 'S' then
    Begin
       FormLogin.img_loading.Visible := false;
       FormLogin.Layout1.Visible := true;
       FormLogin.TabControl1.Visible := true;
       FormLogin.Layout1.Opacity := 1;
       ShowMessage(erro);
       exit;

    End
    Else
    Begin
      ShowMessage('Usuário validado com sucesso! Usuario Cód : ' + cod_usuario);

      FormLogin.img_loading.Visible := false;
      FormLogin.Layout1.Visible := true;
      FormLogin.TabControl1.Visible := true;
      FormLogin.Layout1.Opacity := 1;
      // abre tela etc...

    End;

    finally
       JSONOBJ.DisposeOf;
    end;

End;

procedure processaConta;
Var
 JSONOBJ : TJSONObject;
 json, sucesso, erro, cod_usuario : string;
Begin

  FormLogin.FloatAnimation2.Stop;
  FormLogin.FloatAnimation3.Stop;

  if FormLogin.RequestLogin.Response.JSONValue = nil then
    Begin
       FormLogin.img_loading.Visible := false;
       FormLogin.Layout1.Visible := true;
       FormLogin.TabControl1.Visible := true;
       FormLogin.Layout1.Opacity := 1;
       ShowMessage('Erro ao criar login, JSON inválido');
       exit;
    End;


    try

    json := FormLogin.RequestConta.Response.JSONValue.ToString;
    JSONOBJ := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

    sucesso := JSONOBJ.GetValue('sucesso').Value;
    erro := JSONOBJ.GetValue('erro').Value;
    cod_usuario := JSONOBJ.GetValue('codusuario').Value;

    if sucesso <> 'S' then
    Begin
       FormLogin.img_loading.Visible := false;
       FormLogin.Layout1.Visible := true;
       FormLogin.TabControl1.Visible := true;
       FormLogin.Layout1.Opacity := 1;
       ShowMessage(erro);
       exit;

    End
    Else
    Begin
      ShowMessage('Usuário criado com sucesso! Usuario Cód : ' + cod_usuario);

      FormLogin.img_loading.Visible := false;
      FormLogin.Layout1.Visible := true;
      FormLogin.TabControl1.Visible := true;
      FormLogin.Layout1.Opacity := 1;
      // abre tela etc...

    End;

    finally
       JSONOBJ.DisposeOf;
    end;

End;

procedure processaloginerro(sender: TObject);
Begin

 if Assigned(Sender) and (sender is Exception) then

 FormLogin.img_loading.Visible := false;
 FormLogin.Layout1.Visible := true;
 FormLogin.TabControl1.Visible := true;
 FormLogin.Layout1.Opacity := 1;

  ShowMessage(Exception(Sender).Message);

End;

procedure TFormLogin.ActionCameraDidFinishTaking(Image: TBitmap);
begin
   c_foto.Fill.Bitmap.Bitmap := Image;
   ActionNovoLogin.Execute;
end;

procedure TFormLogin.ActionLibraryDidFinishTaking(Image: TBitmap);
begin
   c_foto.Fill.Bitmap.Bitmap := Image;
   ActionNovoLogin.Execute;
end;


 function TFormLogin.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Encoding := TBase64Encoding.create(0);
      Encoding.Encode(Input, Output);
      Result := Output.DataString;
    finally
      Encoding.Free;
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TFormLogin.FloatAnimation1Finish(Sender: TObject);
Var
   foto64 : string;
begin

  Layout1.Visible := false;

  img_loading.Visible := true;

  FloatAnimation2.Start;

  FloatAnimation3.Start;



end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin

 {IFDEF MSWINDOWS}

   EdtUsuario.Margins.Top := 10;
   EdtSenha.Margins.Top := 10;

 {ENDIF}

 TabControl1.ActiveTab := Tab_login;

end;

procedure TFormLogin.ErroPermissao(Sender: TObject);
Begin
   ShowMessage('Voce nao possui permissao');
End;

procedure TFormLogin.Label2Click(Sender: TObject);
begin

 ActionNovoLogin.Execute;

end;

procedure TFormLogin.Label6Click(Sender: TObject);
begin

   ActionLogin.Execute;

end;

procedure TFormLogin.Label7Click(Sender: TObject);
begin
   ActionFoto.Execute;
end;

procedure TFormLogin.rectBotaoClick(Sender: TObject);
begin

 FloatAnimation1.Start;



end;

procedure TFormLogin.rectBotaoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin

 TRectangle(Sender).Opacity := 0.8;

end;

procedure TFormLogin.rectBotaoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(Sender).Opacity := 1;
end;

function Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TFormLogin.rect_CriaNovaContaClick(Sender: TObject);
Var
 Foto64 : string;
begin

 FloatAnimation1.TagString := 'NOVA-CONTA';
 FloatAnimation1.Start;

end;

end.
