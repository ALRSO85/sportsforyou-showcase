/*
    Sanitized database health check example.
    This file demonstrates validation style without exposing production schema details.
*/

SET NOCOUNT ON;

DECLARE @Issues TABLE
(
    IssueType NVARCHAR(100) NOT NULL,
    IssueDescription NVARCHAR(400) NOT NULL
);

-- Example validation: required metadata table exists.
IF OBJECT_ID(N'dbo.SampleMetadata', N'U') IS NULL
BEGIN
    INSERT INTO @Issues
    (
        IssueType,
        IssueDescription
    )
    VALUES
    (
        N'metadata-table-missing',
        N'The sample metadata table was not found.'
    );
END;

-- Example validation: required active records exist.
IF OBJECT_ID(N'dbo.SampleMetadata', N'U') IS NOT NULL
BEGIN
    IF NOT EXISTS
    (
        SELECT 1
        FROM dbo.SampleMetadata
        WHERE IsActive = 1
    )
    BEGIN
        INSERT INTO @Issues
        (
            IssueType,
            IssueDescription
        )
        VALUES
        (
            N'active-metadata-missing',
            N'No active metadata records were found.'
        );
    END;
END;

SELECT
    IssueType,
    IssueDescription
FROM @Issues;

IF EXISTS (SELECT 1 FROM @Issues)
BEGIN
    THROW 51000, 'Database health check failed.', 1;
END;
