unit UFormProcPlanFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Buttons;

type
  TFormProcPlanFinal = class(TForm)
    CheckListBox1: TCheckListBox;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private


    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormProcPlanFinal: TFormProcPlanFinal;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE, UFormLoading,
  UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero;

procedure TFormProcPlanFinal.SpeedButton1Click(Sender: TObject);
begin

// Acelero
  if CheckListBox1.Checked[0] then
  Begin



  End;
  // ALD
  if CheckListBox1.Checked[1] then
  Begin



  End;
  // ARVAL
  if CheckListBox1.Checked[2] then
  Begin



  End;
  // JSL
  if CheckListBox1.Checked[3] then
  Begin



  End;
  // LM
  if CheckListBox1.Checked[4] then
  Begin



  End;
  // LOCALIZA
  if CheckListBox1.Checked[5] then
  Begin



  End;
  // MOVIDA
  if CheckListBox1.Checked[6] then
  Begin



  End;
  // OURO VERDE
  if CheckListBox1.Checked[7] then
  Begin



  End;
  // UNIDAS
  if CheckListBox1.Checked[8] then
  Begin



  End;

end;

end.
