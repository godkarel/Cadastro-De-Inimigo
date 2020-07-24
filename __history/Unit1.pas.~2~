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
    { Private declarations }
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
  idbInimigos.Connected := True;
  itrInimigos.Active := True;
  isqAux.SQL.Text := 'select T.* from TESTE T';
  isqAux.ExecQuery;

  try
    while not isqAux.Eof do
    begin
      ShowMessage(isqAux.FieldByName('DESCRICAO').AsString);
      isqAux.Next;
    end;
  finally
    isqAux.Close;
  end;
end;

end.
