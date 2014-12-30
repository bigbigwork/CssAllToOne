unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,Dos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    ListBox1: TListBox;

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var FileVar: TextFile;
begin
   AssignFile(FileVar, 'run.Bat');
   Rewrite(FileVar);
   Writeln(FileVar,'al_cartoon.exe test.mp4'+' test_min.mp4');
   CloseFile(FileVar);
   exec('cmd.exe','/c run.bat');
   //ShellExecute(0,nil, PChar('open'),PChar('test.bat'),nil,1);
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String);
var
  i: Integer;
  var FileVar: TextFile;
    var min:String;
      bufferstring : string;
        bufferstream : TStringStream;
        buf : array [1..2048] of char;
        f : file;
        bytesread,total,totalread : integer;
        sl: TStringList;
        filestream: TFileStream;
  stringstream: TStringStream;
  s: String;
begin

   //AssignFile(FileVar, 'run.Bat');
   //Rewrite(FileVar);
  //for i := Low(FileNames) to High(FileNames) do
      //ListBox1.Items.Add(FileNames[i]);
   //begin
   //min:=StringReplace(FileNames[i],'.mp4','_',[rfReplaceAll, rfIgnoreCase]);
   //Writeln(FileVar,'al_cartoon.exe '+FileNames[i]+' '+min+'min.mp4');
      //Append (FileVar);
       //Writeln(FileVar,'file_'+min+'');
   //end;
   //CloseFile(FileVar);
   //exec('cmd.exe','/c run.bat');

   AssignFile(FileVar, 'style_all_in_one.css');
   Rewrite(FileVar);
   for i := Low(FileNames) to High(FileNames) do
   begin

        filestream := TFileStream.Create(FileNames[i], fmOpenRead);
        stringstream := TStringStream.Create(s);
        stringstream.CopyFrom(filestream, 0);
        Writeln(FileVar,stringstream.DataString);
        filestream.free;
        stringstream.free;

   end;

   CloseFile(FileVar);
   exec('cmd.exe','/c style_all_in_one.css');

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

