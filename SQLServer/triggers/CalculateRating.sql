USE [IMDB]
GO
/****** Object:  Trigger [dbo].[trgBeforeInsert]    Script Date: 08-12-2016 08:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trgBeforeInsert] on [dbo].[Reviews]
FOR INSERT
AS 
declare 

@userRating float,
@MovieId Integer,
@TVShowID Integer,
@EpisodeId Integer,
@SeasonId Integer,
@TrailerId Integer;

	select @userRating = i.UserRating from inserted i;

	IF exists(Select * from Movie m where m.MovieID = @MovieId)
	BEGIN
		update Movie  
		set Rating = (select avg(r.UserRating) from Reviews r where r.MovieID = @MovieId),
		Popularity = Popularity +1;
	end;
	ELSE
	IF exists(Select * from TVShow t where t.TVShowID = @TVShowID)
	BEGIN
		update TVShow  
		set Rating = (select avg(r.UserRating) from Reviews r where r.TVShowID = @TVShowID),
		Popularity = Popularity +1;
	end;
	ELSE
	IF exists(Select * from Episode e where e.EpisodeID = @EpisodeId)
	BEGIN
		update Episode  
		set Rating = (select avg(r.UserRating) from Reviews r where r.EpisodeID = @EpisodeId);
	end;
	ELSE
	IF exists(Select * from Season s where s.SeasonID = @SeasonId)
	BEGIN
		update Season  
		set Rating = (select avg(r.UserRating) from Reviews r where r.SeasonID = @SeasonId);
	end;
	ELSE
	IF exists(Select * from Trailer t where t.TrailerID = @TrailerId)
	BEGIN
		update Trailer
		set Rating = (select avg(r.UserRating) from Reviews r where r.TrailerID = @TrailerId);
	end;
	ELSE
	BEGIN
		PRINT 'Invalid values';
	END;	
