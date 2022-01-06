/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     6/1/2022 11:47:11                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INDICE_PAGINA_DOCUMENTO') and o.name = 'FK_INDICE_P_INDICA_DOCUMENT')
alter table INDICE_PAGINA_DOCUMENTO
   drop constraint FK_INDICE_P_INDICA_DOCUMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOCUMENTO')
            and   type = 'U')
   drop table DOCUMENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INDICE_PAGINA_DOCUMENTO')
            and   name  = 'INDICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index INDICE_PAGINA_DOCUMENTO.INDICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INDICE_PAGINA_DOCUMENTO')
            and   type = 'U')
   drop table INDICE_PAGINA_DOCUMENTO
go

/*==============================================================*/
/* Table: DOCUMENTO                                             */
/*==============================================================*/
create table DOCUMENTO (
   DOCU_ID              int                  not null,
   DOCU_NAME            varchar(100)         not null,
   DOCU_DESCRIPTION     varchar(1000)        null,
   DOCU_AUTHOR_FULL_NAME varchar(300)         not null,
   DOCU_AUTHOR_EMAIL    varchar(100)         null,
   DOCU_SERIAL_CODE     varchar(16)          not null,
   DOCU_CREATED_AT      datetime             not null,
   DOCU_UPDATED_AT      datetime             null,
   DOCU_DELETED_AT      datetime             null,
   constraint PK_DOCUMENTO primary key (DOCU_ID)
)
go

/*==============================================================*/
/* Table: INDICE_PAGINA_DOCUMENTO                               */
/*==============================================================*/
create table INDICE_PAGINA_DOCUMENTO (
   INDEX_ID             int                  not null,
   DOCU_ID              int                  not null,
   INDEX_NAME           varchar(100)         null,
   INDEX_PAGE           int                  not null,
   INDEX_CREATED_AT     datetime             not null,
   constraint PK_INDICE_PAGINA_DOCUMENTO primary key (INDEX_ID)
)
go

/*==============================================================*/
/* Index: INDICA_FK                                             */
/*==============================================================*/




create nonclustered index INDICA_FK on INDICE_PAGINA_DOCUMENTO (DOCU_ID ASC)
go

alter table INDICE_PAGINA_DOCUMENTO
   add constraint FK_INDICE_P_INDICA_DOCUMENT foreign key (DOCU_ID)
      references DOCUMENTO (DOCU_ID)
go

