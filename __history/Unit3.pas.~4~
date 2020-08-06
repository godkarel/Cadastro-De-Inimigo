unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IBX.IBSQL;

type
  TForm3 = class(TForm)
    edtNomeCadastra: TLabeledEdit;
    labLevelCadastra: TLabeledEdit;
    labDanoCadastra: TLabeledEdit;
    labCACadastra: TLabeledEdit;
    mmoDescCadastra: TMemo;
    Label1: TLabel;
    btnCadastraDB: TButton;
    btnArmasCadastra: TButton;
    isqCadastra: TIBSQL;
    procedure btnCadastraDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm3.btnCadastraDBClick(Sender: TObject);
var
RegistroNome : string;
RegistroLevel : Integer;
RegistroDano: Integer;
begin
   RegistroNome := 'Gilbertinho';
   RegistroLevel := 9;
   RegistroDano := 7;
   isqCadastra.Close;
   isqCadastra.SQL.add('INSERT INTO MONSTER');
   isqCadastra.SQL.add('(NOME, LEVEL, DANO)');
   isqCadastra.SQL.add('values (:NOMEMONSTER, :LEVELMONSTER, :DANOMONSTER)');

   isqCadastra.ParamByName('NOMEMONSTER').AsString := RegistroNome;
   isqCadastra.ParamByName('LEVELMONSTER').AsInteger := RegistroLevel;
   isqCadastra.ParamByName('DANOMONSTER').AsInteger := RegistroDano;
   isqCadastra.ExecQuery;
end;

end.
