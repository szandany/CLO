-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: dbchangelogWithPro.xml
-- Ran at: 11/15/19, 1:33 PM
-- Against: QA@jdbc:oracle:thin:@localhost:1521:xe
-- Liquibase version: 3.8.1
-- *********************************************************************

SET DEFINE OFF;

-- Lock Database
UPDATE QA.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.99.1 (192.168.99.1)', LOCKGRANTED = TO_TIMESTAMP('2019-11-15 13:33:59.483', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Changeset dbchangelogWithPro.xml::1573061755492-70::support.liquibase.net (generated)
CREATE UNIQUE INDEX QA.AK_EXEMPLAR_PPD ON QA.T_EXEMPLAR(EXEMPLAR_ID, PRICE_PER_DAY);

INSERT INTO QA.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1573061755492-70', 'support.liquibase.net (generated)', 'dbchangelogWithPro.xml', SYSTIMESTAMP, 70, '8:7bac736c69c7c58f40fea82d6bfea7ee', 'createIndex indexName=AK_EXEMPLAR_PPD, tableName=T_EXEMPLAR', '', 'EXECUTED', NULL, NULL, '3.8.1', '3846442049');

-- Changeset dbchangelogWithPro.xml::157306175549r323f::support.liquibase.net (generated)
CREATE TABLE QA.T_TABLE67764 (ID NUMBER(*, 0) NOT NULL, NAME VARCHAR2(20 BYTE), REGION VARCHAR2(20 BYTE), MARKET VARCHAR2(20 BYTE));

INSERT INTO QA.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('157306175549r323f', 'support.liquibase.net (generated)', 'dbchangelogWithPro.xml', SYSTIMESTAMP, 71, '8:b6016dca0345b99add77bae0f9f7bcc7', 'createTable tableName=T_TABLE67764', '', 'EXECUTED', NULL, NULL, '3.8.1', '3846442049');

-- Changeset dbchangelogWithPro.xml::15730617554532658::support.liquibase.net (generated)
CREATE TABLE QA.T_TABLE67432 (ID NUMBER(*, 0) NOT NULL, NAME VARCHAR2(20 BYTE), REGION VARCHAR2(20 BYTE), MARKET VARCHAR2(20 BYTE));

INSERT INTO QA.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('15730617554532658', 'support.liquibase.net (generated)', 'dbchangelogWithPro.xml', SYSTIMESTAMP, 72, '8:5c729fbb24fa70d97041b07a8c9dfe01', 'createTable tableName=T_TABLE67432', '', 'EXECUTED', NULL, NULL, '3.8.1', '3846442049');

-- Release Database Lock
UPDATE QA.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

