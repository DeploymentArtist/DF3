USE [MDT]
GO
/****** Object:  StoredProcedure [dbo].[IdentifyComputer]    Script Date: 11/01/2009 07:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[IdentifyComputer]
@MacAddress CHAR(17)
/* @Make VARCHAR(50), */
/* @Model VARCHAR(50) */
AS

DECLARE @Cnt INT,
        @Prefix VARCHAR(50),
        @Sequence INT,
        @NewName VARCHAR(50)

SET NOCOUNT ON

/* See if there is an existing record for this machine */

SELECT @Cnt=COUNT(*) FROM ComputerIdentity
WHERE MacAddress = @MacAddress

/* No record?  Add one.  */

IF @Cnt = 0
BEGIN

    /* Create a new machine name */

    BEGIN TRAN

    SELECT @Prefix=Prefix, @Sequence=Sequence FROM MachineNameSequence
    SET @Sequence = @Sequence + 1
    UPDATE MachineNameSequence SET Sequence = @Sequence
    SET @NewName = @Prefix + Right('00000'+LTrim(Str(@Sequence)),5)

    /* Insert the new record */

    INSERT INTO ComputerIdentity (MacAddress, Description) 
    VALUES (@MacAddress, @NewName)
    INSERT INTO Settings (Type, ID, OSDComputerName, OSDInstallSilent, OSInstall) 
    VALUES ('C',@@IDENTITY, @NewName, '1', 'Y')

    COMMIT TRAN

END

/*  Return the record as the result set */

SELECT * FROM ComputerIdentity
WHERE MacAddress = @MacAddress



