unit Unit1;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.Client, Data.SqlExpr, IBX.IBDatabase, IBX.IBSQL,
  IBX.IBCustomDataSet, FMX.Dialogs;

type
  TdtmInimigos = class(TDataModule)
    idbInimigos: TIBDatabase;
    itrInimigos: TIBTransaction;
    isqAux: TIBSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConectarBanco;
    procedure DesconectarBanco;
  public
    { Public declarations }
  end;

var
  dtmInimigos: TdtmInimigos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Unit2, Unit3;

{$R *.dfm}

procedure TdtmInimigos.DataModuleCreate(Sender: TObject);
begin
  try
    ConectarBanco;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao conectar com o banco de dados: ' + E.Message);
    end;
  end;
end;

procedure TdtmInimigos.ConectarBanco;
begin
  if not idbInimigos.Connected then
    idbInimigos.Connected := True;
  if not itrInimigos.Active then
    itrInimigos.Active := True;
end;

procedure TdtmInimigos.DesconectarBanco;
begin
  if itrInimigos.Active then
    itrInimigos.Active := False;
  if idbInimigos.Connected then
    idbInimigos.Connected := False;
end;

end.
