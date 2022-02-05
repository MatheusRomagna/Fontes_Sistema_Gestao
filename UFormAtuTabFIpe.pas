unit UFormAtuTabFIpe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, uImportExcel, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, DateUtils, Vcl.ComCtrls;

type
  TFormAtuTabFIpe = class(TForm)
    Label1: TLabel;
    EditDiretorioTabFIPE: TEdit;
    img_atu_veic: TImage;
    OpenDialog1: TOpenDialog;
    QueryBuscaFIPE: TUniQuery;
    ImportExcel1: TImportExcel;
    QBuscaFIPEVeiculo: TUniQuery;
    QBuscaFIPE: TUniQuery;
    QAtualizaFIPEveiculos: TUniQuery;
    QAtuConcFipeModelo: TUniQuery;
    MainMenu1: TMainMenu;
    ConfigurarPermisses1: TMenuItem;
    Label2: TLabel;
    editRef: TEdit;
    Label3: TLabel;
    CheckBoxFipePrincipal: TCheckBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DataSource1: TDataSource;
    qBuscaFIPEReferencias: TUniQuery;
    qBuscaFIPEReferenciasid: TIntegerField;
    qBuscaFIPEReferenciasref1: TStringField;
    qBuscaFIPEReferenciasref2: TStringField;
    qBuscaFIPEReferenciasref3: TStringField;
    qBuscaFIPEReferenciasprincipal: TStringField;
    ImageAtualizaPrincipal: TImage;
    Label5: TLabel;
    Label6: TLabel;
    qBuscaFIPEReferenciasrefAvaliacoes: TStringField;
    tbFipeRef: TUniTable;
    tbFipeRefid: TIntegerField;
    tbFipeRefref1: TStringField;
    tbFipeRefref2: TStringField;
    tbFipeRefref3: TStringField;
    tbFipeRefprincipal: TStringField;
    tbFipeRefrefAvaliacoes: TStringField;
    DataSourceTbFipeRef: TDataSource;
    Button1: TButton;
    Image2: TImage;
    StringGrid1: TStringGrid;
    Label7: TLabel;
    ComboBoxBanco: TComboBox;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    procedure EditDiretorioTabFIPEClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_atu_veicClick(Sender: TObject);
    procedure ConfigurarPermisses1Click(Sender: TObject);
    procedure editRefExit(Sender: TObject);
    procedure ImageAtualizaPrincipalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);

  private
    procedure CarregaExcelFIPE;
    procedure ImportaFIPE;
    procedure AtualizaFipeNew(ref, diretorio, banco: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAtuTabFIpe: TFormAtuTabFIpe;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAvarias,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormLoadingOpaco, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos,
  FMX.UFormGraficosAtendimento, UDataModuleBancoVistoria, UDMPermissoes,
  UFormAgendamento, UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAvaliarAvaliacao,
  UFormCadaNovoUsuMobile, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormConcedePermissao, UFormConsutaPlacaAvaliacao, UFormCruzamentoFipes,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormGestaoAvaliacoes, UFormHistoricoAvaliacoes, UFormInformacoes,
  UFormLiberaPermissao, UFormLoginSavauto, UFormLotesArval, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormUsuarios, UnitLogin;


Procedure TFormAtuTabFIpe.AtualizaFipeNew(ref, diretorio, banco: string);
var
 I, C : integer;
 Qinsere : TUniQuery;
begin

  Qinsere := TUniQuery.Create(self);

if banco = 'Anestor' then
  Begin
     qInsere.Connection := DataModuleConexao.UniConnectionSavanna;
     if DataModuleConexao.UniConnectionSavanna.Connected = false then
     DataModuleConexao.UniConnectionSavanna.Connected := true;
  End;

  if banco  = 'Matheus' then
  Begin
    qInsere.Connection := DataModuleConexao.UniConnection1;
    if DataModuleConexao.UniConnection1.Connected = false then
    DataModuleConexao.UniConnection1.Connected := true;
  End;

  if ComboBoxBanco.Text = '' then
  Begin
    ShowMessage('Falha ao conectar banco! Verifique conexão!');
    abort;
  End;

    { if OpenDialog1.Execute() then
        Begin
          OpenDialog1.Filter := '*.xls';
          if OpenDialog1.FileName <> '' then
          Begin
          }
            //diretorio := EditDiretorioTabFIPE.Text;
            ImportExcel1.ExcelFile := diretorio;
            ImportExcel1.ExcelParaStringGrid(StringGrid1 , ProgressBar1 );

        {  End;
        End; }
        ProgressBar1.Max := StringGrid1.RowCount;
        ProgressBar1.Position := 0;

     Try

      var ANO : integer;

      for I := 1 to Pred(StringGrid1.RowCount) do
      Begin

      if I = 0 then
      Continue;

      if Trim(StringGrid1.Cells[0,I]) = '' then
      Continue;

        // ANO := YearOf(NOW)+1;

         for C := 4 to Pred(StringGrid1.ColCount) do
         Begin

            ANO := YearOf(NOW) + 1;

            if not StringGrid1.Cells[C,I].IsEmpty then
            Begin

            Qinsere.SQL.Clear;
            Qinsere.SQL.Add('insert into tbnewfipe');
            Qinsere.SQL.Add('(');
            Qinsere.SQL.Add('COD_FIPE,');
            Qinsere.SQL.Add('MARCA,');
            Qinsere.SQL.Add('ano,');
            Qinsere.SQL.Add('modelo,');
            Qinsere.SQL.Add('valor,');
            Qinsere.SQL.Add('ref,');
            Qinsere.SQL.Add('dt_import,');
            Qinsere.SQL.Add('usuario,');
            Qinsere.SQL.Add('combustivel)');
            Qinsere.SQL.Add('values');
            Qinsere.SQL.Add('(');
            Qinsere.SQL.Add(':codfipe,');
            Qinsere.SQL.Add(':marca,');
            Qinsere.SQL.Add(':ano,');
            Qinsere.SQL.Add(':modelo,');
            Qinsere.SQL.Add(':valor,');
            Qinsere.SQL.Add(':ref,');
            Qinsere.SQL.Add(':dt,');
            Qinsere.SQL.Add(':usu,');
            Qinsere.SQL.Add(':comb)');

            qInsere.ParamByName('codfipe').Text := StringGrid1.Cells[2,I];
            qInsere.ParamByName('marca').Text   := StringGrid1.Cells[0,I];

            qInsere.ParamByName('ano').Text     := StringGrid1.Cells[C,0];

            qInsere.ParamByName('modelo').Text  := StringGrid1.Cells[1,I];
            if StringGrid1.Cells[C,I].IsEmpty then
            qInsere.ParamByName('valor').AsCurrency := 0
            Else
            qInsere.ParamByName('valor').AsCurrency := StrToCurr( StringGrid1.Cells[C,I] );
            qInsere.ParamByName('ref').Text := ref;
            qInsere.ParamByName('dt').AsDateTime := NOW;
            qInsere.ParamByName('usu').Text := 'MATHEUSR';
            qInsere.ParamByName('comb').Text := StringGrid1.Cells[3,I];

            qInsere.ExecSQL;

            lblStatus.Caption := 'Processando Marca: '+ StringGrid1.Cells[0,I] + ' Modelo: ' + StringGrid1.Cells[1,I] + ' ANO ' + StringGrid1.Cells[C,0];
            lblStatus.Refresh;

            ProgressBar1.Position := ProgressBar1.Position +1;
            Application.ProcessMessages;

            End;
          End;
       End;

        Application.ProcessMessages;

        Qinsere.SQL.Clear;
        Qinsere.SQL.Add('delete from tblistfipes where fipe =:fipe');
        Qinsere.ParamByName('fipe').Text := editRef.Text;
        Qinsere.Execute;

        Qinsere.SQL.Clear;
        Qinsere.SQL.Add('insert into tblistfipes (fipe) values (:fipe)');
        Qinsere.ParamByName('fipe').Text := editRef.Text;
        Qinsere.ExecSQL;

        Qinsere.SQL.Clear;
        Qinsere.SQL.Add('update tbfiperef set ref3=ref2, ref2=ref1, ref1=:fipe, principal=:fipe');
        Qinsere.ParamByName('fipe').Text := editRef.Text;
        Qinsere.Execute;


     Except
     On E:Exception do
     Begin
       ShowMessage('Falha ao processar! ' + e.Message);
     End;

     End;
        lblStatus.Caption := 'Processo finalizado';
        //ShowMessage('Processo concluido');
end;


procedure TFormAtuTabFIpe.ConfigurarPermisses1Click(Sender: TObject);
begin

 if UpperCase(FormLoginSavauto.EditUsuario.Text) <> 'ADMINISTRADOR' then
 Begin
    MessageDlg('Usuário sem permissao', mtError, [mbok] , 0);
    Abort;
 End
 Else
 Begin
   if FormLiberaPermissao = nil then
   FormLiberaPermissao := TFormLiberaPermissao.Create(self);
   FormLiberaPermissao.Tela := name;
   FormLiberaPermissao.Position := poScreenCenter;
   FormLiberaPermissao.ShowModal;
 End;

end;

procedure TFormAtuTabFIpe.EditDiretorioTabFIPEClick(Sender: TObject);
begin

 if editRef.Text <> '' then
 Begin

     if EditDiretorioTabFIPE.Text = '' then
     Begin
       OpenDialog1.Execute();
       if OpenDialog1.FileName <> '' then
       EditDiretorioTabFIPE.Text := OpenDialog1.FileName;

       QueryBuscaFIPE.SQL.Clear;
       QueryBuscaFIPE.SQL.Add('delete from TBDIRETORIOS where tipo = ''FIPE''');
       QueryBuscaFIPE.Execute;

       QueryBuscaFIPE.SQL.Clear;
       QueryBuscaFIPE.SQL.Add('insert into TBDIRETORIOS (tipo, diretorio) values (''FIPE'', :dir)');
       QueryBuscaFIPE.ParamByName('dir').Text := OpenDialog1.FileName;
       QueryBuscaFIPE.Execute;

       QueryBuscaFIPE.SQL.Clear;
       QueryBuscaFIPE.SQL.Add('delete from tblistfipes where fipe=:ref');
       QueryBuscaFIPE.ParamByName('ref').Text := editRef.Text;
       QueryBuscaFIPE.Execute;

       QueryBuscaFIPE.SQL.Clear;
       QueryBuscaFIPE.SQL.Add('insert into tblistfipes (fipe) values (:ref)');
       QueryBuscaFIPE.ParamByName('ref').Text := editRef.Text;
       QueryBuscaFIPE.ExecSQL;

     End
     Else
     Begin
      if MessageDlg('Deseja recarregar a planilha FIPE?', mtConfirmation, [ mbno, mbyes] , 0) = mryes then
      Begin
        OpenDialog1.Execute();
        if OpenDialog1.FileName <> '' then
        EditDiretorioTabFIPE.Text := OpenDialog1.FileName;
      End;
     End;

 End
 Else
 Begin
   MessageDlg('Campo referencia em branco', mtInformation, [mbok] , 0);
   Abort;
 End;
end;

procedure TFormAtuTabFIpe.editRefExit(Sender: TObject);
begin
 if editRef.Text <> '' then
   Begin
   if Length(editRef.Text) <> 7 then
   Begin
     MessageDlg('Tamanho do campo inválido!' + #13 +
                 'O mesmo deve respeitar o formato MM/AAAA', mtWarning, [mbok] , 0);
     editRef.SetFocus;
     Abort;
   End;
 End;

end;

procedure TFormAtuTabFIpe.FormShow(Sender: TObject);
begin

  MessageDlg('Sempre analisar se há a coluna inicial do modelo atual disponível já na tabela/excel.' + #13 +
             'Modelo atual: '+IntToStr(YearOf(NOW)+1)+ #13 +
             'A mesma deve ser a primeira com o nome med'+IntToStr(YearOf(NOW)+1)+'g' + #13 +
             'Caso não encontre, deve-se criar a coluna manualmente', mtWarning, [mbok] , 0);

  qBuscaFIPEReferencias.Refresh;

  ClientHeight := 293;
  Height := 293;

end;

procedure TFormAtuTabFIpe.Image1Click(Sender: TObject);
begin

 if EditDiretorioTabFIPE.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioTabFIPE.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório da FIPE', mtWarning, [mbok], 0);
   End
   Else
   Begin
     FormLoading.LabelStatus.Caption := 'Importando tabele FIPE';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelFIPE;
     Application.ProcessMessages;
     ImportaFIPE;
     FormLoading.Close;
     ShowMessage('Tabela FIPE Importada e atualizada com sucesso');
   End;
 End;

end;

procedure TFormAtuTabFIpe.Image2Click(Sender: TObject);
begin

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(Self);
 End;

 if EditDiretorioTabFIPE.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioTabFIPE.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório da FIPE', mtWarning, [mbok], 0);
   End
   Else
   Begin
     FormLoading.LabelStatus.Caption := 'Importando tabele FIPE';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     //CarregaExcelFIPE;
     Application.ProcessMessages;

     AtualizaFipeNew(editRef.Text , EditDiretorioTabFIPE.Text, ComboBoxBanco.Text );

     //ImportaFIPE;
     FormLoading.Close;
     ShowMessage('Tabela FIPE Importada e atualizada com sucesso');
   End;
 End;

end;

procedure TFormAtuTabFIpe.ImageAtualizaPrincipalClick(Sender: TObject);
begin

 if editRef.Text = '' then
 Begin
   MessageDlg('Preencha a referência da FIPE para atualização da FIPE principal!', mtWarning, [mbok] , 0);
   Abort;
 End
 Else
 Begin
  if DBGrid1.DataSource.DataSet.FieldByName('ref1').Text <> editRef.Text then
  Begin
    if DBGrid1.DataSource.DataSet.FieldByName('ref2').Text <> editRef.Text then
    Begin
      if DBGrid1.DataSource.DataSet.FieldByName('ref3').Text <> editRef.Text then
        Begin
          MessageDlg('Referência indicada não possui importação!', mtError, [mbok] , 0);
          Abort;
        End;
    End;
  End
  Else
  Begin
  DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
  DataModuleConexao.QInsereExcelFIPE.SQL.Add('update tbfiperef set principal = :ref');
  DataModuleConexao.QInsereExcelFIPE.ParamByName('ref').Text := editRef.Text;
  DataModuleConexao.QInsereExcelFIPE.Execute;

  MessageDlg('Atualização aplicada com sucesso!', mtInformation, [mbok] , 0);

  qBuscaFIPEReferencias.Refresh;

  End;

 End;

end;


procedure TFormAtuTabFIpe.img_atu_veicClick(Sender: TObject);
Var
 CountMAX, CountAtual, I : Integer;
begin
  FormLoading.LabelStatus.Caption := 'Aguarde, aualizando FIPE de Veículos...';
  FormLoading.LabelStatus.Refresh;

  FormLoading.Position := poScreenCenter;
  FormLoading.Show;

  QBuscaFIPEVeiculo.SQL.Clear;
  QBuscaFIPEVeiculo.SQL.Add('select distinct ANO_MOD, COD_FIPE, VLR_FIPE from TBPROCPLANS where');
  QBuscaFIPEVeiculo.SQL.Add('ANO_MOD is not null and COD_FIPE <> '''' and ano_mod <> ''''');
  QBuscaFIPEVeiculo.Open;

  I := 0;
  FormLoading.ProgressBar1.Position := i;
  QBuscaFIPEVeiculo.Last;
  CountMAX := QBuscaFIPEVeiculo.RecordCount;
  FormLoading.ProgressBar1.Max := CountMAX;

  QBuscaFIPEVeiculo.First;

  while not QBuscaFIPEVeiculo.Eof do
  Begin

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' as VLR_NEW from TBFIPE');
     QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' > 0');
     QBuscaFIPE.ParamByName('c_fipe').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPEVeiculo.FieldByName('VLR_FIPE').AsCurrency <>  QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency then
     Begin

      QAtualizaFIPEveiculos.SQL.Clear;
      QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set VLR_FIPE = :NEW_FIPE where');
      QAtualizaFIPEveiculos.SQL.Add('COD_FIPE = :FIPE and ANO_MOD = :ANO');
      QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtualizaFIPEveiculos.ParamByName('FIPE').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtualizaFIPEveiculos.ParamByName('ANO').Text :=  QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtualizaFIPEveiculos.Execute;

      QAtuConcFipeModelo.SQL.Clear;
      QAtuConcFipeModelo.SQL.Add('update TBCONCFIPEMODELO set VLR_FIPE=:Vlr where COD_FIPE=:Cod_Fipe and ANO=:ANO');
      QAtuConcFipeModelo.ParamByName('Vlr').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtuConcFipeModelo.ParamByName('Cod_Fipe').Text  := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtuConcFipeModelo.ParamByName('ANO').Text       := QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtuConcFipeModelo.Execute;

     End;

      FormLoading.LabelStatus.Caption := 'Atualizou Veículo FIPE: '+QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;

      Application.ProcessMessages;

      FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;

      QBuscaFIPEVeiculo.Next;

     End;

     FormLoading.LabelStatus.Caption := 'Processo finalizado!';
     ShowMessage('Atualização aplicada com sucesso');

     FormLoading.ProgressBar1.Position := 0;

     FormLoading.Close;
end;

procedure TFormAtuTabFIpe.Button1Click(Sender: TObject);
begin

  tbFipeRef.ApplyUpdates();
  tbFipeRef.Close;
  tbFipeRef.Open;
  tbFipeRef.Refresh;

end;

procedure TFormAtuTabFIpe.CarregaExcelFIPE;
begin

  if FormAtualizaTabelaFipe = nil then
  Begin
    FormAtualizaTabelaFipe := TFormAtualizaTabelaFipe.Create(self);
  End;


  if EditDiretorioTabFIPE.Text <> '' then
  Begin
    ImportExcel1.ExcelFile := EditDiretorioTabFIPE.Text;
    Application.ProcessMessages;
    ImportExcel1.ExcelParaStringGrid(FormAtualizaTabelaFipe.StringGridFIPE , FormAtualizaTabelaFipe.ProgressBar1);
    Application.ProcessMessages;
  End
end;


procedure TFormAtuTabFIpe.ImportaFIPE;
Var
  I : integer;
  statusBar, MAX : integer;
  FIPE, ANO : String;
  VLR_FIPE : Currency;
 Begin


    {DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('delete from TBFIPE');
    DataModuleConexao.QInsereExcelFIPE.Execute; }

    FormLoading.ProgressBar1.Position := 0;

    MAX := FormAtualizaTabelaFipe.StringGridFIPE.RowCount;

    FormLoading.ProgressBar1.Max := MAX;


 Try
  for I := 0 to Pred(FormAtualizaTabelaFipe.StringGridFipe.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('insert into TBFIPE');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('COD_FIPE,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MARCA,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('MODELO,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('COMB,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1985,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1986,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1987,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1988,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1989,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1990,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1991,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1992,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1993,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1994,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1995,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1996,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1997,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1998,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO1999,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2000,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2001,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2002,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2003,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2004,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2005,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2006,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2007,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2008,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2009,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2010,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2011,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2012,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2013,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2014,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2015,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2016,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2017,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2018,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2019,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2020,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO0KM,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2021,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('ANO2022,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add('REF)');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('values');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('(');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':codfipe,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':marca,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':modelo,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':comb,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1985,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1986,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1987,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1988,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1989,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1990,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1991,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1992,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1993,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1994,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1995,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1996,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1997,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1998,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':1999,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2000,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2001,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2002,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2003,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2004,');
	  DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2005,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2006,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2007,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2008,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2009,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2010,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2011,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2012,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2013,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2014,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2015,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2016,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2017,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2018,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2019,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2020,');
  	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':zerocaemi,');
   	DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2021,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':2022,');
    DataModuleConexao.QInsereExcelFIPE.SQL.Add(':REF)');

    DataModuleConexao.QInsereExcelFIPE.ParamByName('codfipe').AsString := FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('marca').AsString   := FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('modelo').AsString  := FormAtualizaTabelaFipe.StringGridFipe.Cells[1,I];
	  DataModuleConexao.QInsereExcelFIPE.ParamByName('comb').AsString    := FormAtualizaTabelaFipe.StringGridFipe.Cells[3,I];

    if not FormAtualizaTabelaFipe.StringGridFipe.Cells[42,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[42,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1985').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[41,I])
    else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1986').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[40,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1987').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[39,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1988').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[38,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1989').asCurrency := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[37,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1990').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[36,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1991').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[35,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1992').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[34,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1993').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[33,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1994').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[32,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1995').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[31,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('1996').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[30,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1997').asCurrency  :=  0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[29,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1998').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[28,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('1999').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[27,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2000').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[26,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2001').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I].IsEmpty then
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[25,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2002').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[24,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2003').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[23,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2004').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[22,I])
    Else
     DataModuleConexao.QInsereExcelFIPE.ParamByName('2005').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[21,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2006').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[20,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2007').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[19,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2008').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[18,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2009').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[17,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2010').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[16,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2011').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[15,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2012').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[14,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2013').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[13,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2014').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[12,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2015').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[11,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2016').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[10,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2017').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I].IsEmpty then
   	DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[9,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2018').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[8,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2019').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[7,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2020').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[6,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2021').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('2022').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[5,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('2022').asCurrency  := 0;

    if  not FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I].IsEmpty then
  	DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := StrToCurr(FormAtualizaTabelaFipe.StringGridFipe.Cells[4,I])
    Else
    DataModuleConexao.QInsereExcelFIPE.ParamByName('zerocaemi').asCurrency  := 0;

    DataModuleConexao.QInsereExcelFIPE.ParamByName('REF').Text := editRef.Text;

    DataModuleConexao.QInsereExcelFIPE.Execute;

    FormLoading.LabelStatus.Caption := 'Importando tabela FIPE '+FormAtualizaTabelaFipe.StringGridFipe.Cells[2,I]+' Marca: '+FormAtualizaTabelaFipe.StringGridFipe.Cells[0,I];

    FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;

    Application.ProcessMessages;

  End;
 Finally

 End;

{  FormLoading.LabelStatus.Caption := 'Aguarde, aualizando FIPE de Veículos...';
  FormLoading.LabelStatus.Refresh;

  QBuscaFIPEVeiculo.SQL.Clear;
  QBuscaFIPEVeiculo.SQL.Add('select ANO_MOD, COD_FIPE, VLR_FIPE from TBPROCPLANS');
  QBuscaFIPEVeiculo.Open;

  QBuscaFIPEVeiculo.First;

  while not QBuscaFIPEVeiculo.Eof do
  Begin

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' as VLR_NEW from TBFIPE');
     QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO'+QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text+' > 0');
     QBuscaFIPE.ParamByName('c_fipe').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
     QBuscaFIPE.Open;

      QAtualizaFIPEveiculos.SQL.Clear;
      QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set VLR_FIPE = :NEW_FIPE where');
      QAtualizaFIPEveiculos.SQL.Add('COD_FIPE = :FIPE and ANO_MOD = :ANO');
      QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      QAtualizaFIPEveiculos.ParamByName('FIPE').Text := QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;
      QAtualizaFIPEveiculos.ParamByName('ANO').Text :=  QBuscaFIPEVeiculo.FieldByName('ANO_MOD').Text;
      QAtualizaFIPEveiculos.Execute;

      FormLoading.LabelStatus.Caption := 'Atualizou Veículo FIPE: '+QBuscaFIPEVeiculo.FieldByName('COD_FIPE').Text;

      Application.ProcessMessages;

      QBuscaFIPEVeiculo.Next;
     End;
      }


  DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
  DataModuleConexao.QInsereExcelFIPE.SQL.Add('update tbfiperef set ref3 = ref2, ref2=ref1, ref1=:ref');
  DataModuleConexao.QInsereExcelFIPE.ParamByName('ref').Text := editRef.Text;
  DataModuleConexao.QInsereExcelFIPE.Execute;

  if CheckBoxFipePrincipal.Checked = true then
  Begin
    DataModuleConexao.QInsereExcelFIPE.SQL.Clear;
    DataModuleConexao.QInsereExcelFIPE.SQL.Add('update tbfiperef set principal = :ref');
    DataModuleConexao.QInsereExcelFIPE.ParamByName('ref').Text := editRef.Text;
    DataModuleConexao.QInsereExcelFIPE.Execute;
  End;

  ShowMessage('Atualização aplicada com sucesso');
  editRef.Text := '';
  EditDiretorioTabFIPE.Text := '';
  FormLoading.Close;

  if MessageDlg('Deseja atualizar a FIPE nos veículos já lançados agora?', mtInformation, [mbno, mbyes] , 0) = mrYes then
  Begin
    img_atu_veic.OnClick(Self);
  End;

end;



end.
