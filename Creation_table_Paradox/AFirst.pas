unit AFirst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, DBCtrls, StdCtrls, Mask, Grids,
  DBGrids, Buttons, ExtDlgs;

type
  TForm1 = class(TForm)
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    DS: TDataSource;
    PlFiche: TPanel;
    DBENom: TDBEdit;
    DBEPrenom: TDBEdit;
    DBEAge: TDBEdit;
    LabelNom: TLabel;
    LabelPrenom: TLabel;
    LabelAge: TLabel;
    SBQuitter: TSpeedButton;
    DBEDate: TDBEdit;
    LabelDate: TLabel;
    DBImage: TDBImage;
    OPD: TOpenPictureDialog;
    LabelPhoto: TLabel;
    Label1: TLabel;
    DBMemo: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure SBQuitterClick(Sender: TObject);
    procedure DBImageDblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  TableEtudiants: TTable;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// N'oublie pas de déclarer TableEtudiants dans les variables (TableEtudiants:=TTable)
// Tout d'abord on débute par la création de la TableEtudiants

    TableEtudiants := TTable.Create(nil);
    with  TableEtudiants do begin
// Nom de la table = Etudiants.DB qui se trouve dans le même répertoire du l'éxécutable

          TableName := 'Etudiants.db';
// on vérifie l'éxistance de la table TableEtudiants.DB

          if not Exists then begin
// si la table n''existe pas afficher le message et continuer

                 MessageDlg('Database file "Etudiants.db" not exist, and will be created.'
                 , mtInformation, [mbok], 0);
// désactiver TableEtudiants

                 Active := False;
// on doit préciser le type de la table; dans notre cas c'est une table PARADOX=ttParadox;

                 TableType := ttParadox;
// On doit préciser le nom de la table qu'elle sera crée

                 TableName := 'Etudiants.db';
// ici on commance par la création des champs

                 with FieldDefs do begin
// tout d'abord on doit supprimer tous les champs existants;

                      Clear;
// on a six champs à créer successivemet "Nom", "Prenom", "Date de naissance", "Age", "Photo", "Remarques";

// Notre premier champ est nommé 'Nom' est de type String=ftstring, la taille =40;
                      with AddFieldDef do begin
                           Name := 'Nom';
                           DataType := ftstring;
                           Size:=40;
                           Required := True;
                      end;
// Notre deuxième champ est nommé 'Prenom' est de type string=ftstring;, la taille du champ = 25;
                      with AddFieldDef do begin
                           Name := 'Prenom';
                           DataType := ftstring;
                           Size:=25;
                           Required := True;
                      end;
// Notre troisième champ est nommé 'Date_Naissance' est de type Date=ftDate;
                      with AddFieldDef do begin
                           Name := 'Date_Naissance';
                           DataType := ftDate;
                           Required := True;
                      end;
// Notre quatrième champ est nommé 'age' est de type integer=ftinteger;
                      with AddFieldDef do begin
                           Name := 'Age';
                           DataType := ftInteger;
                           Required := True;
                      end;
// Le Cinquième champ est nommé 'Photo' est de type Graphique=ftGraphic;
                      with AddFieldDef do begin
                           Name := 'Photo';
                           DataType := ftGraphic;
                           size:=240;
                           Required := True;
                      end;
// Le dernier champ est nommé 'Remarques' est de type Memo=ftMemo;
                      with AddFieldDef do begin
                           Name := 'Remarques';
                           DataType := ftMemo;
                           size:=255;
                           Required := True;
                      end;
                end;
// aprés la création des champs on peut mettre des index: primaires et secondaires
                with IndexDefs do begin
// On doit supprimer tous les index éxistants;
                     Clear;
                     with AddIndexDef do begin
// On doit préciser le type de l'index (Primiare ou secondaire) dans notre cas c'est un index primaire
                          Name := 'idxPrim';
                          Fields := 'Nom';
                          Options := [ixPrimary];
                end;

           end;
// tout est bon il ne rêste qu'a créer la table "Etudiants.DB"
           CreateTable;
           end;
// on doit préciser le DataSet Utilisé à notre DS(DataSource)
           DS.DataSet := TableEtudiants;
// même on doit préciser le DataSource Utilisé à notre DBNavigator
           DBNavigator.DataSource := DS;
// Ici je précise datasource, datafields aux DBEdit utilisé;
           with DBENom do begin
                DataSource := DS;
                DataField := 'Nom';
           //     ReadOnly := false ou True;
           end;
           with DBEPrenom do begin
                DataSource := DS;
                DataField := 'Prenom';
           end;
           with DBEDate do begin
                DataSource := DS;
                DataField := 'Date_Naissance';
           end;
           with DBEAge do begin
                DataSource := DS;
                DataField := 'Age';
           end;
           with DBImage do begin
                DataSource := DS;
                DataField := 'Photo';
           end;
           with DBMemo do begin
                DataSource := DS;
                DataField := 'Remarques';
           end;

// tout est bon il ne rêste qu'ouvire la table
           Open;
    end;

end;

procedure TForm1.SBQuitterClick(Sender: TObject);
begin
 Application.Terminate;   // quitter l'application
end;

procedure TForm1.DBImageDblClick(Sender: TObject);
begin
// Avant de charger une image dans notre DBImage on doit vérifier le statut de la table
// si l table est en mode lecture annuler l''opération;
if (TableEtudiants.State<>DsInsert) or (TableEtudiants.State<>DsEdit) then exit;
// pour charger une image à partir d'un OpenImageDialog on doit l'éxécuter avant pour avoir un FileName;
if OPD.Execute then
DBImage.Picture.Bitmap.LoadFromFile(OPD.FileName);
end;

end.
