unit UFormAtendimentoNovo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, Vcl.XPMan;

type
  TFormAtendimentoNovo = class(TForm)
    GroupBoxDadosCliente: TGroupBox;
    Label1: TLabel;
    EditNomeCliente: TEdit;
    Label2: TLabel;
    EditTelefone: TMaskEdit;
    GroupBoxDadosAnuncio: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EditCodAnuncio: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    EditAnoModelo: TEdit;
    Label6: TLabel;
    EditModelo: TEdit;
    Label7: TLabel;
    EditCodFipe: TEdit;
    Label8: TLabel;
    EditVlrFipe: TEdit;
    Label9: TLabel;
    EditProposta: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    Label10: TLabel;
    Panel2: TPanel;
    img_cancel: TImage;
    img_save: TImage;
    Label11: TLabel;
    EditPlaca: TEdit;
    qInsereAtendimento: TUniQuery;
    ImageValidaMidiaCodAnuncio: TImage;
    qValidaMidiaCodAnuncio: TUniQuery;
    ComboBoxMidia: TComboBox;
    qVerificaPlacaAvaliacao: TUniQuery;
    lblStatus: TLabel;
    lblProposta: TLabel;
    EditAvaliacao: TEdit;
    btnAlterar: TButton;
    XPManifest1: TXPManifest;
    Label12: TLabel;
    editDataAvaliacao: TEdit;
    CheckSemAnuncio: TCheckBox;
    procedure EditTelefoneExit(Sender: TObject);
    procedure EditNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EditTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure EditTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMidiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMidiaKeyPress(Sender: TObject; var Key: Char);
    procedure EditCodAnuncioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAnoModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAnoModeloKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVlrFipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVlrFipeKeyPress(Sender: TObject; var Key: Char);
    procedure EditPropostaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditPropostaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure EditPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure img_saveClick(Sender: TObject);
    procedure EditPlacaExit(Sender: TObject);
    procedure EditAnoModeloExit(Sender: TObject);
    procedure ImageValidaMidiaCodAnuncioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAtendimentoNovo: TFormAtendimentoNovo;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaUsuario, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcedePermissao, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDadosPerfil, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormPesquisaFipe,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento,
  UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo, UFormCadaNovoUsuMobile,
  UFormCadaUsuariosMobile, UFormCruzamentoFipes, UFormDetalhesAtendimento,
  UFormHistoricoObsAtn, UFormInformacoes, UFormLiberaPermissao, UformNovaObs,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic, UFormNovaAvaliacao,
  UFormAlteraDadosCliente;

procedure TFormAtendimentoNovo.btnAlterarClick(Sender: TObject);
begin

 if MessageDlg('Esta proposta vem de uma avaliação já feita por um colaborador, deseja mesmo altera-la?', mtInformation, [mbno, mbyes] , 0) = mrYes then
 Begin

   FormNovaAvaliacao.Position := poScreenCenter;
   FormNovaAvaliacao.EditNovaAvaliacao.Text := '0,00';
   //FormNovaAvaliacao.EditNovaAvaliacao.SetFocus;
   FormNovaAvaliacao.ShowModal;

 End;

end;

procedure TFormAtendimentoNovo.EditAnoModeloExit(Sender: TObject);
begin

 if EditAnoModelo.Text <> '' then
 Begin

   if Length(EditAnoModelo.Text) <> 4 then
   Begin
    MessageDlg('Ano inválido!', mtWarning, [mbok] , 0);
    EditAnoModelo.SetFocus;
   End;

   if StrToInt(EditAnoModelo.Text) > 2030 then
  Begin
    MessageDlg('Ano inválido!', mtWarning, [mbok] , 0);
    EditAnoModelo.SetFocus;
  End;

 End;

end;

procedure TFormAtendimentoNovo.EditAnoModeloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if key = VK_ESCAPE then
 Begin
    EditPlaca.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditAnoModeloKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
    EditModelo.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditCodAnuncioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if key = VK_ESCAPE then
 Begin
   ComboBoxMidia.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditMidiaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then
  Begin
   EditTelefone.SetFocus;
  End;
end;

procedure TFormAtendimentoNovo.EditMidiaKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   EditCodAnuncio.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = VK_ESCAPE then
 Begin
    EditAnoModelo.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditModeloKeyPress(Sender: TObject;
  var Key: Char);
begin

 if FormPesquisaFipe = nil then
 Begin
   FormPesquisaFipe := TFormPesquisaFipe.Create(self);
 End;

 if key = #13 then
 Begin
    FormPesquisaFipe.Position := poScreenCenter;
    FormPesquisaFipe.ShowModal;
 End;

end;

procedure TFormAtendimentoNovo.EditNomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   EditTelefone.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditPlacaExit(Sender: TObject);
begin

    if EditPlaca.Text <> ''  then
    Begin
      lblStatus.Visible := true;
      lblStatus.Font.Color := clBlack;
      lblStatus.Caption := 'Aguarde...Verificando placa...';
      lblStatus.Refresh;

      Sleep(2000);

      qVerificaPlacaAvaliacao.SQL.Clear;
      qVerificaPlacaAvaliacao.SQL.Add('select * from tbavaliacoes where placa=:pl');
      qVerificaPlacaAvaliacao.ParamByName('pl').Text := EditPlaca.Text;
      qVerificaPlacaAvaliacao.Open;

      if qVerificaPlacaAvaliacao.RecordCount > 0 then
      Begin
        if qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency > 0 then
        Begin
          lblStatus.Caption := 'Veículo já avaliado com valor pela Savauto.';
          lblStatus.Refresh;

          lblProposta.Visible := true;
          EditAvaliacao.Visible:= true;
          EditAvaliacao.Enabled := false;
          btnAlterar.Visible := true;
          EditAvaliacao.Text   := CurrToStr(qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency);
          EditAvaliacao.Text := floattoStrF(qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency, ffFixed, 15,2);
          EditDataAvaliacao.Text := DateTimeToStr(qVerificaPlacaAvaliacao.FieldByName('data_avaliacao').AsDateTime);
        End
        Else
        Begin
          lblStatus.Caption := 'Veículo já avaliado pela Savauto. Mas não foi encontrado valor. Contate o Administrador';
          lblStatus.Font.Color := clRed;
          lblStatus.Refresh;
          lblProposta.Visible := true;
          EditAvaliacao.Visible:= true;
          btnAlterar.Visible := true;
        End;

      End
      Else
      Begin
       lblStatus.Caption := 'Veículo não avaliado pela Savauto.';
       lblStatus.Font.Color := clNavy;
       lblStatus.Refresh;
       lblProposta.Visible := true;
       EditAvaliacao.Visible:= true;
       EditAvaliacao.Enabled := FALSE;
       editDataAvaliacao.Enabled := false;
       btnAlterar.Visible := false;
      End;

    End;

    EditAnoModelo.SetFocus;

end;

procedure TFormAtendimentoNovo.EditPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = VK_RETURN then
 Begin
    EditTelefone.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditPlacaKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin

    if EditPlaca.Text <> ''  then
    Begin
      lblStatus.Visible := true;
      lblStatus.Font.Color := clBlack;
      lblStatus.Caption := 'Aguarde...Verificando placa...';
      lblStatus.Refresh;

      Sleep(2000);

      qVerificaPlacaAvaliacao.SQL.Clear;
      qVerificaPlacaAvaliacao.SQL.Add('select * from tbavaliacoes where placa=:pl');
      qVerificaPlacaAvaliacao.ParamByName('pl').Text := EditPlaca.Text;
      qVerificaPlacaAvaliacao.Open;

      if qVerificaPlacaAvaliacao.RecordCount > 0 then
      Begin
        if qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency > 0 then
        Begin
          lblStatus.Caption := 'Veículo já avaliado com valor pela Savauto.';
          lblStatus.Refresh;

          lblProposta.Visible := true;
          EditAvaliacao.Visible:= true;
          EditAvaliacao.Enabled := false;
          btnAlterar.Visible := true;
          EditAvaliacao.Text   := CurrToStr(qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency);
          EditAvaliacao.Text := floattoStrF(qVerificaPlacaAvaliacao.FieldByName('avaliacao').AsCurrency, ffFixed, 15,2);
          EditDataAvaliacao.Text := DateTimeToStr(qVerificaPlacaAvaliacao.FieldByName('data_avaliacao').AsDateTime);
        End
        Else
        Begin
          lblStatus.Caption := 'Veículo já avaliado pela Savauto. Mas não foi encontrado valor. Contate o Administrador';
          lblStatus.Font.Color := clRed;
          lblStatus.Refresh;
          lblProposta.Visible := true;
          EditAvaliacao.Visible:= true;
          btnAlterar.Visible := true;
        End;

      End
      Else
      Begin
       lblStatus.Caption := 'Veículo não avaliado pela Savauto.';
       lblStatus.Font.Color := clNavy;
       lblStatus.Refresh;
       lblProposta.Visible := true;
       EditAvaliacao.Visible:= true;
       EditAvaliacao.Enabled := FALSE;
       editDataAvaliacao.Enabled := false;
       btnAlterar.Visible := false;
      End;

    End;

    EditAnoModelo.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditPropostaExit(Sender: TObject);
begin

 EditProposta.Text := floattoStrF(StrToFloat( EditProposta.Text ), ffFixed, 15,2);

end;

procedure TFormAtendimentoNovo.EditPropostaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if key = VK_ESCAPE then
  Begin
   EditModelo.SetFocus;
  End;

end;

procedure TFormAtendimentoNovo.EditTelefoneExit(Sender: TObject);
begin

 if EditTelefone.Text = '' then
 Begin
   EditTelefone.Text := '00000000000';
 End;

end;

procedure TFormAtendimentoNovo.EditTelefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if key = VK_ESCAPE then
 Begin
   EditNomeCliente.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.EditTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
 Begin
   EditPlaca.SetFocus;
 End;
end;

procedure TFormAtendimentoNovo.EditVlrFipeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

if key = VK_ESCAPE then
  Begin
   EditCodFipe.SetFocus;
  End;

end;

procedure TFormAtendimentoNovo.EditVlrFipeKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   EditProposta.SetFocus;
 End;

end;

procedure TFormAtendimentoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 ComboBoxMidia.Enabled := true;
 ComboBoxMidia.Text := '';

 EditCodAnuncio.Enabled := true;
 EditCodAnuncio.Text := '';

 CheckSemAnuncio.Checked := false;
 CheckSemAnuncio.Enabled := true;

end;

procedure TFormAtendimentoNovo.FormShow(Sender: TObject);
begin


 EditProposta.Text := '0,00';

 EditTelefone.Text := '00000000000';

 FormAtendimentoNovo.Position := poScreenCenter;

 lblStatus.Caption := '';
 lblStatus.Visible := false;

 lblProposta.Visible := false;
 EditAvaliacao.Text := 'R$ 0,00';
 EditAvaliacao.Visible := false;
 btnAlterar.Visible := false;

 EditAvaliacao.Text := '';
 editDataAvaliacao.Text := '';

end;

procedure TFormAtendimentoNovo.ImageValidaMidiaCodAnuncioClick(Sender: TObject);
begin

 if CheckSemAnuncio.Checked = false then
 Begin
      if EditCodAnuncio.Text <> '' then
      Begin
       qValidaMidiaCodAnuncio.SQL.Clear;
       qValidaMidiaCodAnuncio.SQL.Add('select * from tbcompras_atendimento where midia=:midia and cod_anuncio=:anuncio');
       qValidaMidiaCodAnuncio.ParamByName('midia').Text := ComboBoxMidia.Text;
       qValidaMidiaCodAnuncio.ParamByName('anuncio').Text := EditCodAnuncio.Text;
       qValidaMidiaCodAnuncio.Open;
      End;

       if qValidaMidiaCodAnuncio.RecordCount <= 0 then
       Begin
         FormAtendimentoNovo.Height := 689;
         Panel2.Visible := true;
         FormAtendimentoNovo.Position := poScreenCenter;
         ComboBoxMidia.Enabled := false;
         EditCodAnuncio.Enabled := false;
       End
       Else
       Begin
         MessageDlg('Já existe um atendimento com esta midia e cod de anuncio cadastrado.'+#13+
                    '  '+#13+
                    'Cod: '+ IntToStr(qValidaMidiaCodAnuncio.FieldByName('id').AsInteger) +#13+
                    'Placa: '+qValidaMidiaCodAnuncio.FieldByName('placa').Text + #13 +
                    'Usuário: '+ qValidaMidiaCodAnuncio.FieldByName('usuario').Text + #13 +
                    'Data: '+ DateTimeToStr( qValidaMidiaCodAnuncio.FieldByName('Data').AsDateTime ), mtWarning, [mbok], 0 );
         Abort;
       End;

 End
 Else
 Begin
         FormAtendimentoNovo.Height := 689;
         Panel2.Visible := true;
         FormAtendimentoNovo.Position := poScreenCenter;
         ComboBoxMidia.Enabled := false;
         EditCodAnuncio.Enabled := false;
         EditCodAnuncio.Text := '';
         CheckSemAnuncio.Enabled := false;
 End;
end;

procedure TFormAtendimentoNovo.img_saveClick(Sender: TObject);
Var
 ID : integer;
begin

 if EditVlrFipe.Text = '' then
 Begin

  ShowMessage('Valor de fipe inválido!');
  Abort;

 End;

 if EditNomeCliente.Text <> '' then
 Begin
          if EditAnoModelo.Text <> '' then
          Begin
             if EditModelo.Text <> '' then
             Begin
               if EditProposta.Text <> '' then
               Begin

                 qInsereAtendimento.SQL.Clear;
                 qInsereAtendimento.SQL.Add('insert into tbcompras_atendimento (nome, telefone, midia, cod_anuncio, ano_modelo, modelo,');
                 qInsereAtendimento.SQL.Add('fipe, cod_fipe, proposta, situacao, usuario, cod_usuario, QtdDias, Placa, Data, ID_AVALIACAO, VlrAvaliacao)');
                 qInsereAtendimento.SQL.Add('values (:nome, :telefone, :midia, :codanuncio, :ano, :modelo, :fipe, :cod_fipe,');
                 qInsereAtendimento.SQL.Add(':proposta, :situacao, :usuario, :cod_usuario, :dias, :placa, :dt, :id_aval, :vl_aval)');
                 qInsereAtendimento.ParamByName('nome').Text := EditNomeCliente.Text;
                 qInsereAtendimento.ParamByName('telefone').Text := EditTelefone.Text;
                 qInsereAtendimento.ParamByName('midia').Text := ComboBoxMidia.Text;
                 if EditCodAnuncio.Text = '' then
                 EditCodAnuncio.Text := ' ';
                 qInsereAtendimento.ParamByName('codanuncio').Text := EditCodAnuncio.Text;
                 qInsereAtendimento.ParamByName('ano').Text := EditAnoModelo.Text;
                 qInsereAtendimento.ParamByName('modelo').Text := EditModelo.Text;
                 qInsereAtendimento.ParamByName('fipe').AsCurrency := StrToCurr(StringReplace( EditVlrFipe.Text, '.', '',[rfReplaceAll, rfIgnoreCase]));
                 qInsereAtendimento.ParamByName('cod_fipe').Text := EditCodFipe.Text;
                 qInsereAtendimento.ParamByName('proposta').AsCurrency := StrToCurr(EditProposta.Text);
                 qInsereAtendimento.ParamByName('situacao').Text := 'Aguardando Documentos';
                 qInsereAtendimento.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
                 qInsereAtendimento.ParamByName('cod_usuario').AsInteger := FormLoginSavauto.qValidaUsuario.FieldByName('id').AsInteger;
                 qInsereAtendimento.ParamByName('dias').AsInteger := 0;
                 qInsereAtendimento.ParamByName('placa').Text := EditPlaca.Text;
                 qInsereAtendimento.ParamByName('dt').AsDateTime := NOW;

                 if qVerificaPlacaAvaliacao.RecordCount > 0 then

                 qInsereAtendimento.ParamByName('id_aval').AsInteger := qVerificaPlacaAvaliacao.FieldByName('id').AsInteger

                 Else
                 qInsereAtendimento.ParamByName('id_aval').AsInteger := 0;

                 if qVerificaPlacaAvaliacao.RecordCount > 0 then
                 qInsereAtendimento.ParamByName('vl_aval').AsCurrency := StrToCurr(EditAvaliacao.Text)
                 Else
                 qInsereAtendimento.ParamByName('vl_aval').AsCurrency := 0;

                 qInsereAtendimento.ExecSQL;

                 qInsereAtendimento.SQL.Clear;
                 qInsereAtendimento.SQL.Add('select max(id) as ID from tbcompras_atendimento where placa = :placa');
                 qInsereAtendimento.ParamByName('placa').Text := EditPlaca.Text;
                 qInsereAtendimento.Open;

                 ID := qInsereAtendimento.FieldByName('ID').AsInteger;

                 qInsereAtendimento.SQL.Clear;
                 qInsereAtendimento.SQL.Add('insert into tbcompras_status_atendimento(id_atendimento, status_nome, valor)');
                 qInsereAtendimento.SQL.Add('values (:id, :status, 0)');
                 qInsereAtendimento.ParamByName('id').AsInteger := ID;
                 qInsereAtendimento.ParamByName('status').Text := 'Aguardando Documentos';
                 qInsereAtendimento.ExecSQL;

                 FormAtendimentos.AtualizaChamado(ID);

                 qInsereAtendimento.SQL.Clear;
                 qInsereAtendimento.SQL.Add('insert  into tbcompras_hist_status_atendimento (id_atendimento, documentos, verificacao, agendamento, pagamento, cancelado) values ');
                 qInsereAtendimento.SQL.Add('(:id, 0,0,0,0,0)');
                 qInsereAtendimento.ParamByName('id').AsInteger := ID;
                 qInsereAtendimento.ExecSQL;

                 EditNomeCliente.Text := '';
                 EditTelefone.Text := '';
                 ComboBoxMidia.Text := '';
                 EditCodAnuncio.Text := '';
                 EditAnoModelo.Text := '';
                 EditModelo.Text := '';
                 EditCodFipe.Text := '';
                 EditVlrFipe.Text := '';
                 EditProposta.Text := '';
                 EditPlaca.Text := '';

                 FormPesquisaFipe.EditModelo.Text := '';
                 FormPesquisaFipe.EditAnoModelo.Text := '';
                 FormPesquisaFipe.qBuscaFipe.Active := false;

                 if FormLoginSavauto.qValidaUsuario.FieldByName('NOME_PERFIL').Text = 'ADMINISTRADOR' then
                 Begin
                  FormAtendimentos.qBuscaAtendimentos.Active := false;
                  FormAtendimentos.qBuscaAtendimentos.Active := true;

                 End
                 Else
                 Begin
                  FormAtendimentos.qBuscaAtendimentos.Active := false;
                  FormAtendimentos.qBuscaAtendimentos.Active := true;
                 End;

                 Close;

               End
               Else
                MessageDlg('Proposta inválida!', mtError, [mbok] , 0);
             End
             Else
              MessageDlg('Modelo inválido!', mtError, [mbok] , 0);
          End
          Else
           MessageDlg('Ano/Modelo inválido!', mtError, [mbok] , 0);
 End
 Else
  MessageDlg('Nome do cliente inválido!', mtError, [mbok] , 0);

end;

end.
