 execute ibeblock
 as   
 begin
   DBClientLib = ibec_GetGlobalVar('IB_CLIENT', null);
   DBCharset = 'WIN1251';
   SRC_DB = ibec_GetGlobalVar('SRC_DB', null);
   SRC_PSW = ibec_GetGlobalVar('SRC_PSW', null);
   DATA_TABLES = ibec_GetGlobalVar('DATA_TABLES', null);
   
   META_FILENAME = ibec_GetGlobalVar('META_FILENAME', null);
   
   --ibec_MessageDlg(:META_FILENAME, 0, 1);

   SrcDBParams = 'DBName=' + SRC_DB + ';' +
                 'User=' + 'SYSDBA' + ';' +
                 'Password=' + SRC_PSW + ';' +
                 'Names=' + DBCharset + ';' +
                 'ClientLib=' + DBClientLib;
   
   SrcDB = ibec_CreateConnection(__ctFirebird, SrcDBParams);

   cbb = 'execute ibeblock (LogLine variant)
          as
          begin
            ibec_progress(LogLine);
          end';

   ibec_ExtractMetadata(SrcDB, META_FILENAME, 'ExtractPrivileges; ExtractDescriptions; DataTables=' || :DATA_TABLES, cbb);
   close connection SrcDB;
 end
 