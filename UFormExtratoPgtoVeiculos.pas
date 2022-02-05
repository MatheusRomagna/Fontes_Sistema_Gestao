unit UFormExtratoPgtoVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, DateUtils, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TFormExtratoPgtoVeiculos = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaPgtosVeiculos: TUniQuery;
    qBuscaPgtosVeiculosid: TIntegerField;
    qBuscaPgtosVeiculosid_atendimento: TIntegerField;
    qBuscaPgtosVeiculosplaca: TStringField;
    qBuscaPgtosVeiculosdata_pgto: TDateTimeField;
    qBuscaPgtosVeiculosvalor_avaliacao: TFloatField;
    qBuscaPgtosVeiculosvalor_desconto: TFloatField;
    qBuscaPgtosVeiculosvalor_pagar: TFloatField;
    qBuscaPgtosVeiculostipo: TStringField;
    qBuscaPgtosVeiculosnome: TStringField;
    qBuscaPgtosVeiculoscpf: TStringField;
    qBuscaPgtosVeiculosbanco: TStringField;
    qBuscaPgtosVeiculosagencia: TStringField;
    qBuscaPgtosVeiculosconta: TStringField;
    qBuscaPgtosVeiculosusuario: TStringField;
    qBuscaPgtosVeiculosconcluido: TIntegerField;
    qBuscaPgtosVeiculoschave_pix: TStringField;
    qBuscaPgtosVeiculosdata: TDateTimeField;
    dtInicial: TDateTimePicker;
    dtFinal: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    EditPlaca: TEdit;
    qBuscaPgtosVeiculosValor_Pago: TFloatField;
    btnPagar: TBitBtn;
    panel_pagar: TPanel;
    panel_pago: TPanel;
    panel_geral: TPanel;
    img_imprimir: TImage;
    img_excel: TImage;
    PopupMenu1: TPopupMenu;
    Excluirregistro1: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure panel_pagarClick(Sender: TObject);
    procedure panel_pagoClick(Sender: TObject);
    procedure panel_geralClick(Sender: TObject);
    procedure Excluirregistro1Click(Sender: TObject);
  private
    { Private declarations }
    Pagar, Pago : Currency;
    procedure ExcluirPgtoPlaca(id: integer);
  public
    { Public declarations }
  end;

var
  FormExtratoPgtoVeiculos: TFormExtratoPgtoVeiculos;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormPgtoExtratoVeiculo;

procedure TFormExtratoPgtoVeiculos.ExcluirPgtoPlaca(id : integer);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

   query.SQL.Clear;
   query.SQL.Add('delete  FROM tbcompras_pagamento_detalhe WHERE id_atendimento=:id');
   query.ParamByName('id').AsInteger := id;
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbcompras_atendimento set situacao=:sit where id=:id');
   query.ParamByName('id').AsInteger := id;
   query.ParamByName('sit').Text := 'Aguardando Pagamento';
   query.Execute;

  Except
  On E:Exception
  Do Begin
     ShowMessage('Falha ao tentar excluir registro! '+ E.Message);
  End;

 end;


End;

procedure TFormExtratoPgtoVeiculos.BitBtn1Click(Sender: TObject);
begin

 Pagar := 0;
 Pago  := 0;

 qBuscaPgtosVeiculos.Filter := 'data >='+QuotedStr(DateToStr(dtInicial.Date)) + ' and data <='+QuotedStr(DateToStr(dtFinal.Date))
 + 'and placa like ' + QuotedStr('%'+EditPlaca.Text+'%');

 qBuscaPgtosVeiculos.Filtered := true;

 qBuscaPgtosVeiculos.Refresh;

 with DBGrid1.DataSource.DataSet do
 Begin
   First;
   while not Eof do
   Begin
     if FieldByName('Valor_Pago').AsCurrency < FieldByName('Valor_Pagar').AsCurrency then
     Begin
      Pagar := Pagar + FieldByName('Valor_pagar').AsCurrency;
     End;
      Pago  := Pago  + FieldByName('Valor_Pago').AsCurrency;
     Next;
   End;
 End;

 panel_pagar.Caption := 'Total a Pagar: ' +  floatToStrF(Pagar,ffCurrency,10,2);
 panel_pago.Caption :=  'Total Pago: '    +  floatToStrF(Pago, ffCurrency,10,2);
 panel_geral.Caption:=  'Total Geral: '   +  floatToStrF(Pagar + Pago, ffCurrency,10,2);

end;

procedure TFormExtratoPgtoVeiculos.btnPagarClick(Sender: TObject);
begin

 if FormPgtoExtratoVeiculo = nil then
 Begin
   FormPgtoExtratoVeiculo := TFormPgtoExtratoVeiculo.Create(self);
 End;

 if DBGrid1.DataSource.DataSet.FieldByName('concluido').AsInteger = 0 then
 Begin
   FormPgtoExtratoVeiculo.Position := poScreenCenter;
   FormPgtoExtratoVeiculo.ShowModal;
 End
 Else
 Begin
   MessageDlg('Pagamento ja efetuado para este registro, clique com o botão direito do mouse e selecione editar', mtInformation, [mbok] , 0);
   Abort;
 End;

end;

procedure TFormExtratoPgtoVeiculos.DBGrid1DblClick(Sender: TObject);
begin

 if FormPgtoExtratoVeiculo = nil then
 Begin
   FormPgtoExtratoVeiculo := TFormPgtoExtratoVeiculo.Create(self);
 End;


 if DBGrid1.DataSource.DataSet.FieldByName('concluido').AsInteger = 0 then
 Begin
   FormPgtoExtratoVeiculo.btnEfetuaPgto.Enabled := True;
   FormPgtoExtratoVeiculo.Position := poScreenCenter;
   FormPgtoExtratoVeiculo.ShowModal;
 End
 Else
 Begin
   FormPgtoExtratoVeiculo.btnEfetuaPgto.Enabled := false;
   FormPgtoExtratoVeiculo.Position := poScreenCenter;
   FormPgtoExtratoVeiculo.ShowModal;

   {MessageDlg('Pagamento ja efetuado para este registro, clique com o botão direito do mouse e selecione editar', mtInformation, [mbok] , 0);
   Abort;}
 End;

end;

procedure TFormExtratoPgtoVeiculos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

 If qBuscaPgtosVeiculosValor_Pago.AsCurrency < (qBuscaPgtosVeiculosvalor_pagar.AsCurrency) then
  Begin
   Dbgrid1.Canvas.Brush.Color:= clRed;
   DBGrid1.Canvas.Font.Color := clWhite;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End
  Else
  Begin
   Dbgrid1.Canvas.Brush.Color:= clGreen;
   DBGrid1.Canvas.Font.Color := clWhite;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

end;

procedure TFormExtratoPgtoVeiculos.Excluirregistro1Click(Sender: TObject);
begin

 if DBGrid1.DataSource.DataSet.FieldByName('Valor_Pago').AsCurrency = DBGrid1.DataSource.DataSet.FieldByName('Valor Pagar').AsCurrency then
 Begin
   ShowMessage('Registro ja pago! Não pode ser excluído!');
   Abort;
 End
 Else
 Begin

   if FormPrincipal.InputBoxPass('Digite a senha de gestao' , '' , '') <> 'raoni@2021' then
   Begin
     MessageDlg('Senha inválida!', mtError, [mbok] , 0);
   End
   Else
   Begin

      if MessageDlg('Deseja mesmo excluir a solicitação da placa ' + DBGrid1.DataSource.DataSet.FieldByName('placa').Text+' ?', mtInformation, [mbno, mbyes], 0) = mrYes then
      Begin
       ExcluirPgtoPlaca( DBGrid1.DataSource.DataSet.FieldByName('id_atendimento').AsInteger );

       DBGrid1.DataSource.DataSet.Refresh;
      End;
   End;

 End;

end;

procedure TFormExtratoPgtoVeiculos.FormShow(Sender: TObject);
Var
 Pagar, Pago : Currency;
 DataIni, DataFim, dia, mes, ano : string;
begin

 Pagar := 0;
 Pago := 0;

 dtInicial.Date := StartOfTheMonth(NOW);
 dtFinal.Date   := EndOfTheMonth(now);

 qBuscaPgtosVeiculos.Open;
 qBuscaPgtosVeiculos.Filter := 'data >='+QuotedStr(DateToStr(dtInicial.Date)) + ' and data <='+QuotedStr(DateToStr(dtFinal.Date));
 qBuscaPgtosVeiculos.Filtered := true;
 qBuscaPgtosVeiculos.Refresh;

 with DBGrid1.DataSource.DataSet do
 Begin
   First;
   while not Eof do
   Begin
     if FieldByName('Valor_Pago').AsCurrency < FieldByName('Valor_Pagar').AsCurrency then
     Begin
      Pagar := Pagar + FieldByName('Valor_pagar').AsCurrency;
     End;
      Pago  := Pago  + FieldByName('Valor_Pago').AsCurrency;
     Next;
   End;
 End;

 panel_pagar.Caption := 'Total a Pagar: ' +  floatToStrF(Pagar,ffCurrency,10,2);
 panel_pago.Caption :=  'Total Pago: '    +  floatToStrF(Pago, ffCurrency,10,2);
 panel_geral.Caption:=  'Total Geral: '   +  floatToStrF(Pagar + Pago, ffCurrency,10,2);

end;

procedure TFormExtratoPgtoVeiculos.panel_geralClick(Sender: TObject);
begin

 Pagar := 0;
 Pago  := 0;

 qBuscaPgtosVeiculos.Filter := 'data >='+QuotedStr(DateToStr(dtInicial.Date)) + ' and data <='+QuotedStr(DateToStr(dtFinal.Date))
 + 'and placa like ' + QuotedStr('%'+EditPlaca.Text+'%');
 qBuscaPgtosVeiculos.Filtered := true;

 with DBGrid1.DataSource.DataSet do
 Begin
   First;
   while not Eof do
   Begin
     if FieldByName('Valor_Pago').AsCurrency < FieldByName('Valor_Pagar').AsCurrency then
     Begin
      Pagar := Pagar + FieldByName('Valor_pagar').AsCurrency;
     End;
      Pago  := Pago  + FieldByName('Valor_Pago').AsCurrency;
     Next;
   End;
 End;

 panel_pagar.Caption := 'Total a Pagar: ' +  floatToStrF(Pagar,ffCurrency,10,2);
 panel_pago.Caption :=  'Total Pago: '    +  floatToStrF(Pago, ffCurrency,10,2);
 panel_geral.Caption:=  'Total Geral: '   +  floatToStrF(Pagar + Pago, ffCurrency,10,2);

end;

procedure TFormExtratoPgtoVeiculos.panel_pagarClick(Sender: TObject);
begin

 Pagar := 0;
 Pago  := 0;

 qBuscaPgtosVeiculos.Filter := 'Valor_pago < Valor_pagar and data >='+QuotedStr(DateToStr(dtInicial.Date)) + ' and data <='+QuotedStr(DateToStr(dtFinal.Date))
 + 'and placa like ' + QuotedStr('%'+EditPlaca.Text+'%');
 qBuscaPgtosVeiculos.Filtered := true;

 with DBGrid1.DataSource.DataSet do
 Begin
   First;
   while not Eof do
   Begin
     if FieldByName('Valor_Pago').AsCurrency < FieldByName('Valor_Pagar').AsCurrency then
     Begin
      Pagar := Pagar + FieldByName('Valor_pagar').AsCurrency;
     End;
      Pago  := Pago  + FieldByName('Valor_Pago').AsCurrency;
     Next;
   End;
 End;

 panel_pagar.Caption := 'Total a Pagar: ' +  floatToStrF(Pagar,ffCurrency,10,2);
 panel_pago.Caption :=  'Total Pago: '    +  floatToStrF(Pago, ffCurrency,10,2);
 panel_geral.Caption:=  'Total Geral: '   +  floatToStrF(Pagar + Pago, ffCurrency,10,2);

end;

procedure TFormExtratoPgtoVeiculos.panel_pagoClick(Sender: TObject);
begin

 Pagar := 0;
 Pago  := 0;

 qBuscaPgtosVeiculos.Filter := 'Valor_pago > 0 and data >='+QuotedStr(DateToStr(dtInicial.Date)) + ' and data <='+QuotedStr(DateToStr(dtFinal.Date))
 + 'and placa like ' + QuotedStr('%'+EditPlaca.Text+'%');
 qBuscaPgtosVeiculos.Filtered := true;

 with DBGrid1.DataSource.DataSet do
 Begin
   First;
   while not Eof do
   Begin
     if FieldByName('Valor_Pago').AsCurrency < FieldByName('Valor_Pagar').AsCurrency then
     Begin
      Pagar := Pagar + FieldByName('Valor_pagar').AsCurrency;
     End;
      Pago  := Pago  + FieldByName('Valor_Pago').AsCurrency;
     Next;
   End;
 End;

 panel_pagar.Caption := 'Total a Pagar: ' +  floatToStrF(Pagar,ffCurrency,10,2);
 panel_pago.Caption :=  'Total Pago: '    +  floatToStrF(Pago, ffCurrency,10,2);
 panel_geral.Caption:=  'Total Geral: '   +  floatToStrF(Pagar + Pago, ffCurrency,10,2);

end;

end.
