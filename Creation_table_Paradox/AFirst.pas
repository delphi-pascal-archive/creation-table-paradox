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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;
  TableEtudiants: TTable;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// N'oublie pas de d�clarer TableEtudiants dans les variables (TableEtudiants:=TTable)
// Tout d'abord on d�bute par la cr�ation de la TableEtudiants

    TableEtudiants := TTable.Create(nil);
    with  TableEtudiants do begin
// Nom de la table = Etudiants.DB qui se trouve dans le m�me r�pertoire du l'�x�cutable

          TableName := 'Etudiants.db';
// on v�rifie l'�xistance de la table TableEtudiants.DB

          if not Exists then begin
// si la table n''existe pas afficher le message et continuer

                 MessageDlg('Database file "Etudiants.db" not exist, and will be created.'
                 , mtInformation, [mbok], 0);
// d�sactiver TableEtudiants

                 Active := False;
// on doit pr�ciser le type de la table; dans notre cas c'est une table PARADOX=ttParadox;

                 TableType := ttParadox;
// On doit pr�ciser le nom de la table qu'elle sera cr�e

                 TableName := 'Etudiants.db';
// ici on commance par la cr�ation des champs

                 with FieldDefs do begin
// tout d'abord on doit supprimer tous les champs existants;

                      Clear;
// on a six champs � cr�er successivemet "Nom", "Prenom", "Date de naissance", "Age", "Photo", "Remarques";

// Notre premier champ est nomm� 'Nom' est de type String=ftstring, la taille =40;
                      with AddFieldDef do begin
                           Name := 'Nom';
                           DataType := ftstring;
                           Size:=40;
                           Required := True;
                      end;
// Notre deuxi�me champ est nomm� 'Prenom' est de type string=ftstring;, la taille du champ = 25;
                      with AddFieldDef do begin
                           Name := 'Prenom';
                           DataType := ftstring;
                           Size:=25;
                           Required := True;
                      end;
// Notre troisi�me champ est nomm� 'Date_Naissance' est de type Date=ftDate;
                      with AddFieldDef do begin
                           Name := 'Date_Naissance';
                           DataType := ftDate;
                           Required := True;
                      end;
// Notre quatri�me champ est nomm� 'age' est de type integer=ftinteger;
                      with AddFieldDef do begin
                           Name := 'Age';
                           DataType := ftInteger;
                           Required := True;
                      end;
// Le Cinqui�me champ est nomm� 'Photo' est de type Graphique=ftGraphic;
                      with AddFieldDef do begin
                           Name := 'Photo';
                           DataType := ftGraphic;
                           size:=240;
                           Required := True;
                      end;
// Le dernier champ est nomm� 'Remarques' est de type Memo=ftMemo;
                      with AddFieldDef do begin
                           Name := 'Remarques';
                           DataType := ftMemo;
                           size:=255;
                           Required := True;
                      end;
                end;
// apr�s la cr�ation des champs on peut mettre des index: primaires et secondaires
                with IndexDefs do begin
// On doit supprimer tous les index �xistants;
                     Clear;
                     with AddIndexDef do begin
// On doit pr�ciser le type de l'index (Primiare ou secondaire) dans notre cas c'est un index primaire
                          Name := 'idxPrim';
                          Fields := 'Nom';
                          Options := [ixPrimary];
                end;

           end;
// tout est bon il ne r�ste qu'a cr�er la table "Etudiants.DB"
           CreateTable;
           end;
// on doit pr�ciser le DataSet Utilis� � notre DS(DataSource)
           DS.DataSet := TableEtudiants;
// m�me on doit pr�ciser le DataSource Utilis� � notre DBNavigator
           DBNavigator.DataSource := DS;
// Ici je pr�cise datasource, datafields aux DBEdit utilis�;
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

// tout est bon il ne r�ste qu'ouvire la table
           Open;
    end;

end;

procedure TForm1.SBQuitterClick(Sender: TObject);
begin
 Application.Terminate;   // quitter l'application
end;

procedure TForm1.DBImageDblClick(Sender: TObject);
begin
// Avant de charger une image dans notre DBImage on doit v�rifier le statut de la table
// si l table est en mode lecture annuler l''op�ration;
if (TableEtudiants.State<>DsInsert) or (TableEtudiants.State<>DsEdit) then exit;
// pour charger une image � partir d'un OpenImageDialog on doit l'�x�cuter avant pour avoir un FileName;
if OPD.Execute then
DBImage.Picture.Bitmap.LoadFromFile(OPD.FileName);
end;

end.
