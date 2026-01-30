/* **********************************************
 * SEQUENCES                                    *
 ************************************************/
CREATE SEQUENCE adus_seq START WITH 77990001 INCREMENT BY 1;
CREATE SEQUENCE adtr_seq;

/*==============================================================*/
/* Table: User                                                  */
/* Module: Administrator Management (ADMG).                     */
/*==============================================================*/
CREATE TABLE adm_user (
  adus_uid              BIGINT      NOT NULL,
  adus_status           INTEGER     NOT NULL,
  adus_username         VARCHAR(20) NOT NULL,
  adus_password         VARCHAR(20) NOT NULL,
  adus_first_names      VARCHAR(70) NOT NULL,
  adus_last_names       VARCHAR(70) NOT NULL,
  adus_email            VARCHAR(70)     NULL,
  adus_bank             VARCHAR(11)     NULL,
  adus_level            INTEGER     NOT NULL,
  adus_create_date      TIMESTAMP   NOT NULL,
  adus_last_update_date TIMESTAMP   NOT NULL
);

ALTER TABLE adm_user
  ALTER COLUMN   adus_uid              SET DEFAULT nextval('adus_seq'),
  ALTER COLUMN   adus_create_date      SET DEFAULT NOW(),
  ALTER COLUMN   adus_last_update_date SET DEFAULT NOW(),
  ALTER COLUMN   adus_status           SET DEFAULT 1,
  ADD CONSTRAINT pk_adus_uid      PRIMARY KEY (adus_uid);

/*==============================================================*/
/* Table:  Transaction                                          */
/* Module: Transaction Management (SPMG).                       */
/*==============================================================*/
CREATE TABLE adm_transaction (
  adtr_uid              BIGINT        NOT NULL,
  adtr_adus_uid1        BIGINT        NOT NULL,
  adtr_adus_uid2        BIGINT            NULL,
  adtr_status           INTEGER       NOT NULL,
  adtr_transaction_id   BIGINT        NOT NULL,
  adtr_reason           VARCHAR(40)   NOT NULL,
  adtr_amount           NUMERIC(9, 2) NOT NULL,
  adtr_days             INTEGER       NOT NULL,
  adtr_hours            INTEGER       NOT NULL,
  adtr_minutes          INTEGER       NOT NULL,
  adtr_code01           INTEGER       NOT NULL,
  adtr_code02           INTEGER           NULL,
  adtr_final_amount     NUMERIC(9, 2)     NULL,
  adtr_fee_amount       NUMERIC(9, 2)     NULL,
  adtr_bank             VARCHAR(11)   NOT NULL,
  adtr_create_date      TIMESTAMP     NOT NULL,
  adtr_last_update_date TIMESTAMP     NOT NULL
);

ALTER TABLE adm_transaction
  ALTER COLUMN   adtr_uid              SET DEFAULT nextval('adtr_seq'),
  ALTER COLUMN   adtr_create_date      SET DEFAULT NOW(),
  ALTER COLUMN   adtr_last_update_date SET DEFAULT NOW(),
  ALTER COLUMN   adtr_status           SET DEFAULT 1,
  ADD CONSTRAINT pk_adtr_uid       PRIMARY KEY (adtr_uid),
  ADD CONSTRAINT fk_adtr_adus_uid1 FOREIGN KEY (adtr_adus_uid1) REFERENCES adm_user(adus_uid)   ON UPDATE CASCADE ON DELETE CASCADE,
  ADD CONSTRAINT fk_adtr_adus_uid2 FOREIGN KEY (adtr_adus_uid2) REFERENCES adm_user(adus_uid)   ON UPDATE CASCADE ON DELETE CASCADE;

/* **********************************************
 * REFERENCE DATA                               *
 ************************************************/
INSERT INTO adm_user (adus_uid, adus_username, adus_password, adus_first_names, adus_last_names, adus_email, adus_bank, adus_level)
  VALUES('77900000', 'root', '4652', 'Pepito', 'Merlin', 'aebytes@gmail.com', 'BNB', '0');
INSERT INTO adm_user (adus_uid, adus_username, adus_password, adus_first_names, adus_last_names, adus_email, adus_bank, adus_level)
  VALUES('77900001', 'admin', '4652', 'Thomas', 'Mar', 'aebytes@gmail.com', 'BNB', '0');
INSERT INTO adm_user (adus_uid, adus_username, adus_password, adus_first_names, adus_last_names, adus_email, adus_bank, adus_level)
  VALUES('77900002', 'manu', '4652', 'Mamuel', 'Veliz', 'aebytes@gmail.com', 'BNB', '0');
INSERT INTO adm_user (adus_uid, adus_username, adus_password, adus_first_names, adus_last_names, adus_email, adus_bank, adus_level)
  VALUES('77900003', 'franz', '4652', 'Franz', 'Canaviri', 'aebytes@gmail.com', 'BNB', '0');


