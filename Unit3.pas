unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IBX.IBSQL;

type
  TForm3 = class(TForm)
    mmoDescCadastra: TMemo;
    Label1: TLabel;
    btnCadastraDB: TButton;
    btnArmasCadastra: TButton;
    isqCadastra: TIBSQL;
    edtNomeCadastra: TEdit;
    edtLevelCadastra: TEdit;
    edtDanoCadastra: TEdit;
    edtCACadastra: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtIDCadastra: TEdit;
    ComboBox1: TComboBox;
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
RegistroCA: Integer;
RegistroDesc: String;
GambiarraRegistroRecebe: String;
GambiarraRegistroEntrega: Integer;
GambiarraRegistroFinal: Integer;
begin
  dtmInimigos.itrInimigos.Active := True;

  isqCadastra.SQL.Clear;
  isqCadastra.SQL.add('SELECT MAX(ID) FROM MONSTER');
  isqCadastra.ExecQuery;
  GambiarraRegistroRecebe := (isqCadastra.FieldByName('MAX').AsString);
  GambiarraRegistroEntrega := StrToInt(GambiarraRegistroRecebe) + 1;
  GambiarraRegistroFinal := GambiarraRegistroEntrega;
  edtNomeCadastra.Text := IntToStr(GambiarraRegistroEntrega);
  isqCadastra.Close;

  try
    isqCadastra.SQL.Clear;
    RegistroNome := UpperCase(edtNomeCadastra.Text);
    RegistroLevel := StrToInt(edtLevelCadastra.Text);
    RegistroDano := StrToInt(edtDanoCadastra.Text);
    RegistroCA := StrToInt(edtCACadastra.Text);
    RegistroDesc := mmoDescCadastra.text;

    isqCadastra.SQL.add('INSERT INTO MONSTER');
    isqCadastra.SQL.add('(NOME, LEVEL, DANO, CA, DESCRICAO, ID)');
    isqCadastra.SQL.add('values (:NOMEMONSTER, :LEVELMONSTER, :DANOMONSTER, :CAMONSTER, :DESCRICAOMONSTER, :IDMONSTER)');

    isqCadastra.ParamByName('NOMEMONSTER').AsString := RegistroNome;
    isqCadastra.ParamByName('LEVELMONSTER').AsInteger := RegistroLevel;
    isqCadastra.ParamByName('DANOMONSTER').AsInteger := RegistroDano;
    isqCadastra.ParamByName('CAMONSTER').AsInteger := RegistroCA;
    isqCadastra.ParamByName('DESCRICAOMONSTER').AsString := RegistroDesc;
    isqCadastra.ParamByName('IDMONSTER').AsInteger := GambiarraRegistroFinal;

    isqCadastra.ExecQuery;
    dtmInimigos.itrInimigos.Commit;
    except
    dtmInimigos.itrInimigos.Rollback;
    ShowMessage('Ops, algo deu errado!!!');
    raise
  end;
  isqCadastra.Close;
  edtNomeCadastra.Clear;
  edtLevelCadastra.Clear;
  edtDanoCadastra.Clear;
  edtCACadastra.Clear;
  mmoDescCadastra.Lines.Clear;
end;


end.
