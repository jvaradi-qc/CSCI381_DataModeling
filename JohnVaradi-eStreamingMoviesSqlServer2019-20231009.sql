
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [user_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [password]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [CUST]
( 
	[CustAddress]        [address] ,
	[CustCity]           [city] ,
	[CustFirstName]      [first_name] ,
	[CustLastName]       [last_name] ,
	[CustState]          [state] ,
	[CustZipCode]        [zip_code] ,
	[Email]              varchar  NULL ,
	[CustNumber]         integer  NOT NULL ,
	[CustUserName]       [user_name] ,
	[CustPassword]       [password] 
)
go

CREATE TABLE [CUSTCredit]
( 
	[CreditCard]         integer  NULL ,
	[CreditCardExp]      integer  NULL ,
	[StatusCode]         varchar(20)  NULL ,
	[CustNumber]         integer  NOT NULL 
)
go

CREATE TABLE [CUSTMovieFavorites]
( 
	[FavoriteId]         integer  NOT NULL ,
	[CustNumber]         integer  NULL ,
	[MovieNumber]        integer  NULL 
)
go

CREATE TABLE [CUSTMoviePurchase]
( 
	[MoviePurchaseId]    integer  NOT NULL ,
	[CustNumber]         integer  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[PurchaseDate]       datetime  NULL 
)
go

CREATE TABLE [CUSTMovieRental]
( 
	[MovieRentalId]      integer  NOT NULL ,
	[CustNumber]         integer  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[RentalDate]         datetime  NULL ,
	[ExpirationDate]     datetime  NULL ,
	[RentalRate]         money  NULL 
)
go

CREATE TABLE [EMP]
( 
	[EmpFirstName]       [first_name] ,
	[EmpAddress]         [address] ,
	[EmpPhone]           [phone] ,
	[EmpAddress2]        [address_2] ,
	[Email]              varchar(20)  NULL ,
	[Salary]             integer  NULL ,
	[HireDate]           datetime  NULL ,
	[SocSecNumber]       integer  NULL ,
	[EmpNumber]          varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [Genre]
( 
	[GenreId]            integer  NOT NULL ,
	[GenreName]          varchar(25)  NULL ,
	[GenreDescription]   varchar(100)  NULL 
)
go

CREATE TABLE [LoginHistory]
( 
	[LoginHistoryId]     integer  NOT NULL ,
	[CustNumber]         integer  NOT NULL ,
	[IpAddress]          varchar(15)  NULL ,
	[LoginDate]          datetime  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieTitle]         [title] ,
	[MovieDirector]      [director] ,
	[Description]        varchar(20)  NULL ,
	[Star1Name]          [first_name] ,
	[Rating]             varchar  NULL ,
	[Star2Name]          [first_name] ,
	[MovieNumber]        integer  NOT NULL ,
	[GenreId]            integer  NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL 
)
go

CREATE TABLE [MovieStreaming]
( 
	[StreamingId]        integer  NOT NULL ,
	[MovieNumber]        integer  NULL ,
	[CustNumber]         integer  NULL ,
	[StreamTypeId]       integer  NULL ,
	[StreamDate]         datetime  NULL ,
	[ExpirationDate]     datetime  NULL 
)
go

CREATE TABLE [Payment]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      numeric  NULL ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmpNumber]          varchar(20)  NOT NULL ,
	[CustNumber]         integer  NULL ,
	[CustomerNo]         integer  NULL ,
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[EpayVendorNumber]   integer  NULL ,
	[EpayAccountNumber]  integer  NULL ,
	[CreditCardNumber]   char(18)  NULL ,
	[CreditCardExp]      datetime  NULL ,
	[CreditCardType]     char(18)  NULL 
)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustNumber] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [CUST]
( 
	[CustLastName]        ASC
)
go

ALTER TABLE [CUSTCredit]
	ADD CONSTRAINT [XPKCustomer_Credit] PRIMARY KEY  CLUSTERED ([CustNumber] ASC)
go

ALTER TABLE [CUSTMovieFavorites]
	ADD CONSTRAINT [XPKCustomer_Movie_Favorites] PRIMARY KEY  CLUSTERED ([FavoriteId] ASC)
go

ALTER TABLE [CUSTMoviePurchase]
	ADD CONSTRAINT [XPKCustomer_Movie_Purchase] PRIMARY KEY  CLUSTERED ([MoviePurchaseId] ASC)
go

ALTER TABLE [CUSTMovieRental]
	ADD CONSTRAINT [XPKCustomer_Movie_Rental] PRIMARY KEY  CLUSTERED ([MovieRentalId] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmpNumber] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([SocSecNumber]  ASC,[EmpPhone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [EMP]
( 
	[EmpFirstName]        ASC
)
go

ALTER TABLE [Genre]
	ADD CONSTRAINT [XPKGenre] PRIMARY KEY  CLUSTERED ([GenreId] ASC)
go

ALTER TABLE [LoginHistory]
	ADD CONSTRAINT [XPKLogin_History] PRIMARY KEY  CLUSTERED ([LoginHistoryId] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [MovieStreaming]
	ADD CONSTRAINT [XPKMovie_Streaming] PRIMARY KEY  CLUSTERED ([StreamingId] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

CREATE VIEW [CUSTOMER_INVOICE]([CreditCard],[CreditCardExp],[StatusCode],[CustNumber],[CustAddress],[Email],[CustCity],[CustFirstName],[CustLastName],[CustState],[CustZipCode],[MovieTitle])
AS
SELECT ALL [CUSTCredit].[CreditCard],[CUSTCredit].[CreditCardExp],[CUSTCredit].[StatusCode],[CUST].[CustNumber],[CUST].[CustAddress],[CUST].[Email],[CUST].[CustCity],[CUST].[CustFirstName],[CUST].[CustLastName],[CUST].[CustState],[CUST].[CustZipCode],[Movie].[MovieTitle]
	FROM [CUSTCredit],[CUST],[Movie]
go


ALTER TABLE [CUSTMovieFavorites]
	ADD CONSTRAINT [R_25] FOREIGN KEY ([CustNumber]) REFERENCES [CUST]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CUSTMovieFavorites]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CUSTMoviePurchase]
	ADD CONSTRAINT [R_28] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Payment]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CUSTMovieRental]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Payment]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EMP]
	ADD CONSTRAINT [FK_Emp_EMP] FOREIGN KEY ([Supervisor]) REFERENCES [EMP]([EmpNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [LoginHistory]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([CustNumber]) REFERENCES [CUST]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Movie]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([GenreId]) REFERENCES [Genre]([GenreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStreaming]
	ADD CONSTRAINT [R_23] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStreaming]
	ADD CONSTRAINT [R_24] FOREIGN KEY ([CustNumber]) REFERENCES [CUST]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_EMP] FOREIGN KEY ([EmpNumber]) REFERENCES [EMP]([EmpNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_CUST] FOREIGN KEY ([CustomerNo]) REFERENCES [CUST]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_CUST_CREDIT] FOREIGN KEY ([CustNumber]) REFERENCES [CUSTCredit]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_CUST ON CUST FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST has CUSTMovieFavorites on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004126d", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="are saved by", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieFavorites
      WHERE
        /*  %JoinFKPK(CUSTMovieFavorites,deleted," = "," AND") */
        CUSTMovieFavorites.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because CUSTMovieFavorites exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  MovieStreaming on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreaming
      WHERE
        /*  %JoinFKPK(MovieStreaming,deleted," = "," AND") */
        MovieStreaming.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because MovieStreaming exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST generates LoginHistory on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="LoginHistory"
    P2C_VERB_PHRASE="generates", C2P_VERB_PHRASE="is generated by", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,LoginHistory
      WHERE
        /*  %JoinFKPK(LoginHistory,deleted," = "," AND") */
        LoginHistory.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because LoginHistory exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustomerNo" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNo = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST ON CUST FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST has CUSTMovieFavorites on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00048ce4", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="are saved by", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieFavorites
      WHERE
        /*  %JoinFKPK(CUSTMovieFavorites,deleted," = "," AND") */
        CUSTMovieFavorites.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because CUSTMovieFavorites exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  MovieStreaming on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreaming
      WHERE
        /*  %JoinFKPK(MovieStreaming,deleted," = "," AND") */
        MovieStreaming.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because MovieStreaming exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST generates LoginHistory on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="LoginHistory"
    P2C_VERB_PHRASE="generates", C2P_VERB_PHRASE="is generated by", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,LoginHistory
      WHERE
        /*  %JoinFKPK(LoginHistory,deleted," = "," AND") */
        LoginHistory.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because LoginHistory exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustomerNo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNo = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because Payment exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTCredit ON CUSTCredit FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTCredit */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUSTCredit makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011b24", PARENT_OWNER="", PARENT_TABLE="CUSTCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUSTCredit because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTCredit ON CUSTCredit FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTCredit */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUSTCredit makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000131f7", PARENT_OWNER="", PARENT_TABLE="CUSTCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUSTCredit because Payment exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTMovieFavorites ON CUSTMovieFavorites FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTMovieFavorites */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  CUSTMovieFavorites on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002935c", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM CUSTMovieFavorites
          WHERE
            /* %JoinFKPK(CUSTMovieFavorites,Movie," = "," AND") */
            CUSTMovieFavorites.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTMovieFavorites because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST has CUSTMovieFavorites on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="are saved by", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustNumber = CUST.CustNumber AND
        NOT EXISTS (
          SELECT * FROM CUSTMovieFavorites
          WHERE
            /* %JoinFKPK(CUSTMovieFavorites,CUST," = "," AND") */
            CUSTMovieFavorites.CustNumber = CUST.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTMovieFavorites because CUST exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTMovieFavorites ON CUSTMovieFavorites FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTMovieFavorites */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insFavoriteId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  CUSTMovieFavorites on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002fe98", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTMovieFavorites because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST has CUSTMovieFavorites on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="are saved by", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustNumber = CUST.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTMovieFavorites because CUST does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTMoviePurchase ON CUSTMoviePurchase FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTMoviePurchase */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment made for CUSTMoviePurchase on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00017f3d", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMoviePurchase"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM CUSTMoviePurchase
          WHERE
            /* %JoinFKPK(CUSTMoviePurchase,Payment," = "," AND") */
            CUSTMoviePurchase.PaymentTransactionNumber = Payment.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTMoviePurchase because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTMoviePurchase ON CUSTMoviePurchase FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTMoviePurchase */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMoviePurchaseId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment made for CUSTMoviePurchase on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001a485", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMoviePurchase"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTMoviePurchase because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTMovieRental ON CUSTMovieRental FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTMovieRental */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment made for CUSTMovieRental on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000180ca", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieRental"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM CUSTMovieRental
          WHERE
            /* %JoinFKPK(CUSTMovieRental,Payment," = "," AND") */
            CUSTMovieRental.PaymentTransactionNumber = Payment.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTMovieRental because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTMovieRental ON CUSTMovieRental FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTMovieRental */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieRentalId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment made for CUSTMovieRental on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001c1fd", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieRental"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTMovieRental because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EMP ON EMP FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EMP */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EMP receives Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003112a", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.Supervisor = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.Supervisor = EMP.EmpNumber AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,EMP," = "," AND") */
            EMP.Supervisor = EMP.EmpNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EMP ON EMP FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EMP */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmpNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMP receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00039e4c", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.Supervisor = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because EMP exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.Supervisor = EMP.EmpNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Genre ON Genre FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Genre */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Genre genre categorizes movie Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011a23", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="genre categorizes movie", C2P_VERB_PHRASE="movie is cateogized by genre", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="GenreId" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.GenreId = deleted.GenreId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Genre because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Genre ON Genre FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Genre */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insGenreId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Genre genre categorizes movie Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012c19", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="genre categorizes movie", C2P_VERB_PHRASE="movie is cateogized by genre", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="GenreId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(GenreId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.GenreId = deleted.GenreId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Genre because Movie exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_LoginHistory ON LoginHistory FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on LoginHistory */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST generates LoginHistory on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000154b0", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="LoginHistory"
    P2C_VERB_PHRASE="generates", C2P_VERB_PHRASE="is generated by", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustNumber = CUST.CustNumber AND
        NOT EXISTS (
          SELECT * FROM LoginHistory
          WHERE
            /* %JoinFKPK(LoginHistory,CUST," = "," AND") */
            LoginHistory.CustNumber = CUST.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last LoginHistory because CUST exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_LoginHistory ON LoginHistory FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on LoginHistory */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insLoginHistoryId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST generates LoginHistory on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018a11", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="LoginHistory"
    P2C_VERB_PHRASE="generates", C2P_VERB_PHRASE="is generated by", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustNumber = CUST.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update LoginHistory because CUST does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  CUSTMovieFavorites on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000361c4", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieFavorites
      WHERE
        /*  %JoinFKPK(CUSTMovieFavorites,deleted," = "," AND") */
        CUSTMovieFavorites.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because CUSTMovieFavorites exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is streamed MovieStreaming on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="is streamed", C2P_VERB_PHRASE="occurs", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreaming
      WHERE
        /*  %JoinFKPK(MovieStreaming,deleted," = "," AND") */
        MovieStreaming.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieStreaming exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Genre genre categorizes movie Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="genre categorizes movie", C2P_VERB_PHRASE="movie is cateogized by genre", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="GenreId" */
    IF EXISTS (SELECT * FROM deleted,Genre
      WHERE
        /* %JoinFKPK(deleted,Genre," = "," AND") */
        deleted.GenreId = Genre.GenreId AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,Genre," = "," AND") */
            Movie.GenreId = Genre.GenreId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because Genre exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Movie ON Movie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  CUSTMovieFavorites on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003d54e", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieFavorites"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieFavorites
      WHERE
        /*  %JoinFKPK(CUSTMovieFavorites,deleted," = "," AND") */
        CUSTMovieFavorites.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because CUSTMovieFavorites exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is streamed MovieStreaming on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="is streamed", C2P_VERB_PHRASE="occurs", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreaming
      WHERE
        /*  %JoinFKPK(MovieStreaming,deleted," = "," AND") */
        MovieStreaming.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieStreaming exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Genre genre categorizes movie Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="genre categorizes movie", C2P_VERB_PHRASE="movie is cateogized by genre", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="GenreId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(GenreId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Genre
        WHERE
          /* %JoinFKPK(inserted,Genre) */
          inserted.GenreId = Genre.GenreId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.GenreId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because Genre does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MovieStreaming ON MovieStreaming FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStreaming */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST  MovieStreaming on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027e25", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustNumber = CUST.CustNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreaming
          WHERE
            /* %JoinFKPK(MovieStreaming,CUST," = "," AND") */
            MovieStreaming.CustNumber = CUST.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreaming because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is streamed MovieStreaming on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="is streamed", C2P_VERB_PHRASE="occurs", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreaming
          WHERE
            /* %JoinFKPK(MovieStreaming,Movie," = "," AND") */
            MovieStreaming.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreaming because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MovieStreaming ON MovieStreaming FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStreaming */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST  MovieStreaming on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f312", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustNumber = CUST.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreaming because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is streamed MovieStreaming on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreaming"
    P2C_VERB_PHRASE="is streamed", C2P_VERB_PHRASE="occurs", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreaming because Movie does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Payment ON Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment made for CUSTMoviePurchase on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005d23b", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMoviePurchase"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTMoviePurchase
      WHERE
        /*  %JoinFKPK(CUSTMoviePurchase,deleted," = "," AND") */
        CUSTMoviePurchase.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CUSTMoviePurchase exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment made for CUSTMovieRental on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieRental"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieRental
      WHERE
        /*  %JoinFKPK(CUSTMovieRental,deleted," = "," AND") */
        CUSTMovieRental.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CUSTMovieRental exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTCredit makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUSTCredit
      WHERE
        /* %JoinFKPK(deleted,CUSTCredit," = "," AND") */
        deleted.CustNumber = CUSTCredit.CustNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,CUSTCredit," = "," AND") */
            Payment.CustNumber = CUSTCredit.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because CUSTCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustomerNo" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustomerNo = CUST.CustNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,CUST," = "," AND") */
            Payment.CustomerNo = CUST.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP receives Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EmpNumber = EMP.EmpNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,EMP," = "," AND") */
            Payment.EmpNumber = EMP.EmpNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Payment ON Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment made for CUSTMoviePurchase on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006ee9c", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMoviePurchase"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTMoviePurchase
      WHERE
        /*  %JoinFKPK(CUSTMoviePurchase,deleted," = "," AND") */
        CUSTMoviePurchase.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CUSTMoviePurchase exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment made for CUSTMovieRental on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CUSTMovieRental"
    P2C_VERB_PHRASE="made for", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTMovieRental
      WHERE
        /*  %JoinFKPK(CUSTMovieRental,deleted," = "," AND") */
        CUSTMovieRental.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CUSTMovieRental exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTCredit makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUSTCredit
        WHERE
          /* %JoinFKPK(inserted,CUSTCredit) */
          inserted.CustNumber = CUSTCredit.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because CUSTCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustomerNo" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNo)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustomerNo = CUST.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerNo IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP receives Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EmpNumber = EMP.EmpNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmpNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


