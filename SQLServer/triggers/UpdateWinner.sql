USE [IMDB]
GO
/****** Object:  Trigger [dbo].[trgBeforeInsertOnNominee]    Script Date: 07-12-2016 03:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trgBeforeInsertOnNominee] on [dbo].[Nominee]
FOR UPDATE,INSERT
AS 
declare 

@inputIsWinner char(30),
@MovieId Integer,
@TVShowId Integer,
@EposodeId Integer,
@ArtistId Integer,
@AwardId Integer,
@NomineeID Integer;

	select @inputIsWinner = i.IsWinner,
		@MovieId = i.MovieID,
		@TVShowId = i.TVShowID,
		@EposodeId = i.EpisodeID,
		@ArtistId = i.ArtistID,
		@AwardId = i.AwardID,
		@NomineeID = i.NomineeID
	from inserted i;

	IF (@inputIsWinner = 'Y' OR @inputIsWinner = 'y')
	BEGIN
		UPDATE Nominee  
		SET IsWinner = 'N'
		where MovieID = @MovieId
			and TVShowID = @TVShowId
			and EpisodeID = @EposodeId
			and ArtistID = @ArtistId
			and AwardID = @AwardId
			and NomineeID <> @NomineeID;
	END;