unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IBX.IBSQL, Unit1;

type
  TForm3 = class(TForm)
    mmoDescCadastra: TMemo;
    labDesc: TLabel;
    btnCadastraDB: TButton;
    isqCadastra: TIBSQL;
    edtNomeCadastra: TEdit;
    edtLevelCadastra: TEdit;
    edtDanoCadastra: TEdit;
    edtCACadastra: TEdit;
    labNomeCad: TLabel;
    labLevel3: TLabel;
    labDano: TLabel;
    labCA: TLabel;
    edtIDCadastra: TEdit;
    cmbArma1: TComboBox;
    cmbArma2: TComboBox;
    cmbArma3: TComboBox;
    procedure btnCadastraDBClick(Sender: TObject);
  private
    function ValidateInputs: Boolean;
    procedure ClearFormFields;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnCadastraDBClick(Sender: TObject);
var
  RegistroNome: string;
  RegistroLevel, RegistroDano, RegistroCA: Integer;
  RegistroDesc: String;
  NovoID: Integer;
begin
  if not ValidateInputs then
    Exit;

  dtmInimigos.itrInimigos.Active := True;

  try
    // Obtém o próximo ID disponível
    isqCadastra.SQL.Clear;
    isqCadastra.SQL.Add('SELECT MAX(ID) FROM MONSTER');
    isqCadastra.ExecQuery;
    NovoID := isqCadastra.Fields[0].AsInteger + 1;
    edtIDCadastra.Text := IntToStr(NovoID);
    isqCadastra.Close;

    // Prepara os valores para inserção
    RegistroNome := UpperCase(edtNomeCadastra.Text);
    RegistroLevel := StrToInt(edtLevelCadastra.Text);
    RegistroDano := StrToInt(edtDanoCadastra.Text);
    RegistroCA := StrToInt(edtCACadastra.Text);
    RegistroDesc := mmoDescCadastra.Text;

    // Define o comando SQL de inserção
    isqCadastra.SQL.Clear;
    isqCadastra.SQL.Add('INSERT INTO MONSTER (NOME, LEVEL, DANO, CA, DESCRICAO, ID, IDARMA, IDARMA2, IDARMA3)');
    isqCadastra.SQL.Add('VALUES (:NOMEMONSTER, :LEVELMONSTER, :DANOMONSTER, :CAMONSTER, :DESCRICAOMONSTER, :IDMONSTER, :IDDAARMA, :IDDAARMA2, :IDDAARMA3)');

    // Atribui os valores aos parâmetros
    isqCadastra.ParamByName('NOMEMONSTER').AsString := RegistroNome;
    isqCadastra.ParamByName('LEVELMONSTER').AsInteger := RegistroLevel;
    isqCadastra.ParamByName('DANOMONSTER').AsInteger := RegistroDano;
    isqCadastra.ParamByName('CAMONSTER').AsInteger := RegistroCA;
    isqCadastra.ParamByName('DESCRICAOMONSTER').AsString := RegistroDesc;
    isqCadastra.ParamByName('IDMONSTER').AsInteger := NovoID;

    // Associa os IDs das armas usando os índices selecionados
    isqCadastra.ParamByName('IDDAARMA').AsInteger := cmbArma1.ItemIndex;
    isqCadastra.ParamByName('IDDAARMA2').AsInteger := cmbArma2.ItemIndex;
    isqCadastra.ParamByName('IDDAARMA3').AsInteger := cmbArma3.ItemIndex;

    // Executa a inserção e confirma a transação
    isqCadastra.ExecQuery;
    dtmInimigos.itrInimigos.Commit;
    ShowMessage('Registro cadastrado com sucesso!');
  except
    on E: Exception do
    begin
      dtmInimigos.itrInimigos.Rollback;
      ShowMessage('Erro ao cadastrar: ' + E.Message);
    end;
  end;

  // Limpa os campos do formulário
  ClearFormFields;
end;

function TForm3.ValidateInputs: Boolean;
begin
  Result := False;

  if Trim(edtNomeCadastra.Text) = '' then
  begin
    ShowMessage('O campo Nome é obrigatório.');
    edtNomeCadastra.SetFocus;
    Exit;
  end;

  if (not TryStrToInt(edtLevelCadastra.Text, Result)) or (StrToInt(edtLevelCadastra.Text) <= 0) then
  begin
    ShowMessage('O campo Level deve ser um número positivo.');
    edtLevelCadastra.SetFocus;
    Exit;
  end;

  if (not TryStrToInt(edtDanoCadastra.Text, Result)) or (StrToInt(edtDanoCadastra.Text) <= 0) then
  begin
    ShowMessage('O campo Dano deve ser um número positivo.');
    edtDanoCadastra.SetFocus;
    Exit;
  end;

  if (not TryStrToInt(edtCACadastra.Text, Result)) or (StrToInt(edtCACadastra.Text) <= 0) then
  begin
    ShowMessage('O campo CA deve ser um número positivo.');
    edtCACadastra.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TForm3.ClearFormFields;
begin
  edtNomeCadastra.Clear;
  edtLevelCadastra.Clear;
  edtDanoCadastra.Clear;
  edtCACadastra.Clear;
  edtIDCadastra.Clear;
  mmoDescCadastra.Lines.Clear;
  cmbArma1.ItemIndex := -1;
  cmbArma2.ItemIndex := -1;
  cmbArma3.ItemIndex := -1;
end;

end.
