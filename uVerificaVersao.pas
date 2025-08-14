unit uVerificaVersao;

interface

   uses
      Windows,
      Messages,
      SysUtils,
      Variants,
      Classes,
      Graphics,
      Controls,
      Forms,
      Dialogs,
      IniFiles,
      ShellAPI;

   function GetCaminhoIniFile:String;
   function GetVersion(sFileName:string): string;
   function EncontrouIni :Boolean;
   function ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
   function CopyData(const fromDir, toDir: string): Boolean;

   procedure CopiarNovaVersao(exeLocal, exeRemoto:String);

implementation

//Retorna o caminho do arquivo INI
function GetCaminhoIniFile:String;
begin
   result:= ExtractFileDir(Application.ExeName)+'\ConfigArquivos.ini';
end;

function  EncontrouIni: Boolean;
begin
   result :=True;

   //se não encontrar o arquivo ini, retorna falseo e exibe mesnagem
   if not FileExists(GetCaminhoIniFile) then
      begin
         Application.MessageBox(Pchar('O arquivo de configurações não foi encontrado.' + #13 + GetCaminhoIniFile), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
         result :=False;
      end;
end;

function  ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
begin
   result:=True;

   //verifica se se o arquivo local existe
   if not FileExists(exeLocal) then
      begin
         Application.MessageBox(Pchar('O arquivo local não foi encontrado.'+#13+exeLocal), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
         result :=False;
      end
   else
      begin
         //verifica se o arquivo remoto existe
         if not FileExists(exeRemoto) then
            begin
               Application.MessageBox(Pchar('O arquivo Remoto não foi encontrado.'+#13+exeRemoto), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
               result :=False;
            end;
      end;
end;

//Função usada para copiar arquivos
function  CopyData(const fromDir, toDir: string): Boolean;
var fos: TSHFileOpStruct;
begin
   ZeroMemory(@fos, SizeOf(fos));

   with fos do
      begin
         wFunc  := FO_COPY;
         fFlags := {FOF_SILENT or} FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR;
         pFrom  := PChar(fromDir + #0);
         pTo    := PChar(toDir);
      end;

   Result := (0 = ShFileOperation(fos));
end;

{Função que retorna a versão do executável
para ativar o controle de versões de seu executável, no delphi, com o projeto aberto,
vá em Project=>Options=>Version Info e marque a opção Include version information in project}
function GetVersion(sFileName:string): string;
var VerInfoSize  : DWORD;
    VerInfo      : Pointer;
    VerValueSize : DWORD;
    VerValue     : PVSFixedFileInfo;
    Dummy        : DWORD;
begin
   try
      VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);

      GetMem(VerInfo, VerInfoSize);

      GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);

      VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

      with VerValue^ do
         begin
            Result := IntToStr(dwFileVersionMS shr 16);
            Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
            Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
            Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
         end;

      FreeMem(VerInfo, VerInfoSize);
   except //se ocorrer um erro retorna a versão 1.0.0.0, vai ocoorer um erro se o arquivo não tiver versão
      Result:='1.0.0.0';
   end;
end;

procedure  CopiarNovaVersao(exeLocal, exeRemoto:String);
begin
   Application.MessageBox(pchar('Foi encontrada uma nova versão do programa no servidor.'+#13+
                                'Versão Atual : '+GetVersion(exeLocal)+#13+
                                'Nova versão  : '+GetVersion(exeRemoto)), 'Atenção', MB_OK+MB_ICONERROR);

   //faz um backup do arquivo velho para o fomato arquivo.exeDD_MM_yyyy
   if RenameFile(exeLocal, (exeLocal+FormatDateTime('dd_mm_yyyy', date))) then
      if not  CopyData(exeRemoto, exeLocal) then //copia o arquivo
         Application.MessageBox('Ocorreu um erro ao copiar nova versão do servidor.', 'Atenção', MB_OK+MB_ICONERROR);
end;

end.
