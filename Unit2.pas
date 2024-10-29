unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, IBX.IBSQL, IBX.IBCustomDataSet, IBX.IBQuery, Unit1, Unit3;

type
  TfrmMonstro = class(TForm)
    Label1: TLabel;
    labSeach: TLabel;
    edtLevel: TLabeledEdit;
    edtDano: TLabeledEdit;
    edtCA: TLabeledEdit;
    labDesc: TLabel;
    edtSeach: TEdit;
    btnProcurar: TButton;
    isqProcuraInimigo: TIBSQL;
    mmoDesc: TMemo;
    edtNome: TLabeledEdit;
    btnCadastrar: TButton;
    dbg1: TDBGrid;
    tqrListaInimigos: TIBQuery;
    dsListaInimigos: TDataSource;
    edtProcura2: TEdit;
    btnProcura2: TButton;
    btnListaInimigos: TButton;
    labListaInimigos: TLabel;
    btnDeletar: TButton;
    edtIDProcura: TEdit;
    dsArmaRegistro: TDataSource;
    tqrArmaInimigo: TIBQuery;
    edtRegistroArma1: TEdit;
    edtRegistroArma2: TEdit;
    edtRegistroArma3: TEdit;
    labArma1: TLabel;
    labArma2: TLabel;
    labArma3: TLabel;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnProcura2Click(Sender: TObject);
    procedure btnListaInimigosClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherCampo(Edit: TEdit; const Campo, Parametro: string);
    procedure PreencherArmas(const NomeMonstro: string);
    procedure ExibirMensagemErro(const Mensagem: string);
  public
    { Public declarations }
  end;

var
  frmMonstro: TfrmMonstro;

implementation

{$R *.dfm}

procedure TfrmMonstro.btnCadastrarClick(Sender: TObject);
begin
  Form3.Show;
end;

procedure TfrmMonstro.btnDeletarClick(Sender: TObject);
var
  RespostaUsuario: Integer;
begin
  RespostaUsuario := MessageDlg('Tem certeza de que quer apagar todos os registros?', mtWarning, [mbYes, mbNo], 0);
  if RespostaUsuario = mrYes then
  begin
    try
      isqProcuraInimigo.SQL.Text := 'DELETE FROM MONSTER';
      isqProcuraInimigo.ExecQuery;
      dtmInimigos.itrInimigos.Commit;
    except
      dtmInimigos.itrInimigos.Rollback;
      ExibirMensagemErro('Ops, algo deu errado!!!');
    end;
  end;
end;

procedure TfrmMonstro.btnProcura2Click(Sender: TObject);
begin
  tqrListaInimigos.Close;
  tqrListaInimigos.SQL.Text := 'SELECT * FROM MONSTER';
  tqrListaInimigos.Open;
end;

procedure TfrmMonstro.btnProcurarClick(Sender: TObject);
var
  Procura: String;
begin
  edtLevel.Clear;
  edtNome.Clear;
  edtCA.Clear;
  edtDano.Clear;
  mmoDesc.Clear;

  Procura := edtSeach.Text;
  PreencherCampo(mmoDesc, 'DESCRICAO', Procura);
  PreencherCampo(edtNome, 'NOME', Procura);
  PreencherCampo(edtLevel, 'LEVEL', Procura);
  PreencherCampo(edtDano, 'DANO', Procura);
  PreencherCampo(edtCA, 'CA', Procura);
  PreencherArmas(Procura);

  if mmoDesc.Text = '' then
    ExibirMensagemErro('Nenhum Monstro com esse nome foi encontrado, tente novamente!!');
end;

procedure TfrmMonstro.btnListaInimigosClick(Sender: TObject);
var
  ProcuraMelhor: string;
begin
  tqrListaInimigos.Close;
  ProcuraMelhor := '%' + UpperCase(edtProcura2.Text) + '%';
  tqrListaInimigos.SQL.Text := 'SELECT * FROM MONSTER WHERE NOME LIKE :PROCURAMONSTRO';
  tqrListaInimigos.ParamByName('PROCURAMONSTRO').AsString := ProcuraMelhor;
  tqrListaInimigos.Open;
  edtProcura2.Clear;
end;

procedure TfrmMonstro.PreencherCampo(Edit: TEdit; const Campo, Parametro: string);
begin
  isqProcuraInimigo.SQL.Text := Format('SELECT %s FROM MONSTER WHERE NOME = :PARAM', [Campo]);
  isqProcuraInimigo.ParamByName('PARAM').AsString := Parametro;
  isqProcuraInimigo.ExecQuery;
  try
    Edit.Text := isqProcuraInimigo.FieldByName(Campo).AsString;
  finally
    isqProcuraInimigo.Close;
  end;
end;

procedure TfrmMonstro.PreencherArmas(const NomeMonstro: string);
  procedure PreencherArma(Edit: TEdit; const Campo: string);
  begin
    PreencherCampo(Edit, Campo, NomeMonstro);
    case StrToIntDef(Edit.Text, -1) of
      0: Edit.Text := 'Nenhum';
      1: Edit.Text := 'Espada';
      2: Edit.Text := 'Arco';
      3: Edit.Text := 'Machado';
      4: Edit.Text := 'Cajado';
      5: Edit.Text := 'Pistola';
    else
      Edit.Text := 'Desconhecido';
    end;
  end;

begin
  PreencherArma(edtRegistroArma1, 'IDARMA');
  PreencherArma(edtRegistroArma2, 'IDARMA2');
  PreencherArma(edtRegistroArma3, 'IDARMA3');
end;

procedure TfrmMonstro.ExibirMensagemErro(const Mensagem: string);
begin
  MessageDlg(Mensagem, mtError, [mbOK], 0);
end;

end.
