unit UFormNovoVistoriador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  uRESTDWPoolerDB;

type
  TFormNovoVistoriador = class(TForm)
    Label1: TLabel;
    EditNomeVistoriador: TEdit;
    Label2: TLabel;
    EditSenhaVistoriador: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    EditEmail: TEdit;
    btnGravarUsuario: TSpeedButton;
    QInsereVistoriador: TRESTDWClientSQL;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarUsuarioClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNovoVistoriador: TFormNovoVistoriador;

implementation

{$R *.dfm}

uses UDataModuleConexao, UDataModuleRESTDWvistoria, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormNovoProcessamento,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormWebBrowse;

procedure TFormNovoVistoriador.btnGravarUsuarioClick(Sender: TObject);
begin

  if EditNomeVistoriador.Text <> '' then
  Begin
    if EditSenhaVistoriador.Text <> '' then
    Begin
      if EditEmail.Text <> '' then
      Begin
        QInsereVistoriador.Close;
        QInsereVistoriador.SQL.Clear;
        QInsereVistoriador.SQL.Add('insert into tbUsuarios (nome, senha, email) values (:n, :s, :e)');
        QInsereVistoriador.ParamByName('n').Text := EditNomeVistoriador.Text;
        QInsereVistoriador.ParamByName('s').Text := EditSenhaVistoriador.Text;
        QInsereVistoriador.ParamByName('e').Text := EditEmail.Text;
        QInsereVistoriador.ExecSQL;

        EditNomeVistoriador.Text := '';
        EditSenhaVistoriador.Text := '';
        EditEmail.Text := '';

        FormCadVistoriadores.QBuscaVistoriadores.Active := false;
        FormCadVistoriadores.QBuscaVistoriadores.Active := true;

        EditNomeVistoriador.SetFocus;
      End
      Else
       ShowMessage('E-mail inválido');
    End
    Else
     ShowMessage('Senha Inválida');
  End
  ELse
   ShowMessage('Usuário Inválido');

end;

procedure TFormNovoVistoriador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 EditNomeVistoriador.Text := '';
 EditSenhaVistoriador.Text := '';
 EditEmail.Text := '';

end;

procedure TFormNovoVistoriador.SpeedButton1Click(Sender: TObject);
begin

 if EditSenhaVistoriador.PasswordChar = '*' then
 EditSenhaVistoriador.PasswordChar := #0
 Else
 EditSenhaVistoriador.PasswordChar := '*';

end;

end.
