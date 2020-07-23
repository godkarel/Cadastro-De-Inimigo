program Project1;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {frmMonstro},
  Unit1 in 'Unit1.pas' {dtmInimigos: TDataModule},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMonstro, frmMonstro);
  Application.CreateForm(TdtmInimigos, dtmInimigos);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
