
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/06/2022 14:15:25
-- Generated from EDMX file: C:\Users\isma0\source\repos\Kuantum\ConectarDatos\DocumentosDatosModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE Documentos;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA dbo');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'FK_indice_p_indica_document', 'F') IS NOT NULL
    ALTER TABLE indice_pagina_documento DROP CONSTRAINT FK_indice_p_indica_document;
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'documento', 'U') IS NOT NULL
    DROP TABLE documento;
GO
IF OBJECT_ID(N'indice_pagina_documento', 'U') IS NOT NULL
    DROP TABLE indice_pagina_documento;
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'documentos'
CREATE TABLE documentos (
    docu_id int  NOT NULL,
    docu_name varchar(100)  NOT NULL,
    docu_description varchar(1000)  NULL,
    docu_author_full_name varchar(300)  NOT NULL,
    docu_author_email varchar(100)  NULL,
    docu_serial_code varchar(16)  NOT NULL,
    docu_created_at datetime  NULL,
    docu_updated_at datetime  NULL,
    docu_deleted_at datetime  NULL
);
GO

-- Creating table 'indice_pagina_documento'
CREATE TABLE indice_pagina_documento (
    index_id int  NOT NULL,
    docu_id int  NOT NULL,
    index_name varchar(100)  NULL,
    index_page int  NOT NULL,
    index_created_at datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on docu_id in table 'documentos'
ALTER TABLE documentos
ADD CONSTRAINT PK_documentos
    PRIMARY KEY CLUSTERED (docu_id ASC);
GO

-- Creating primary key on index_id in table 'indice_pagina_documento'
ALTER TABLE indice_pagina_documento
ADD CONSTRAINT PK_indice_pagina_documento
    PRIMARY KEY CLUSTERED (index_id ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on docu_id in table 'indice_pagina_documento'
ALTER TABLE indice_pagina_documento
ADD CONSTRAINT FK_indice_p_indica_document
    FOREIGN KEY (docu_id)
    REFERENCES documentos
        (docu_id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_indice_p_indica_document'
CREATE INDEX IX_FK_indice_p_indica_document
ON indice_pagina_documento
    (docu_id);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------