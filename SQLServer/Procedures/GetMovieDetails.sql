USE [IMDB]
GO
/****** Object:  StoredProcedure [dbo].[GetMovieDetails]    Script Date: 07-12-2016 02:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[GetMovieDetails]
@MovieName char(1000)
as
begin
	select m.[Movie Name] as Title,
		m.[IMDB Rating] as IMDBRating,
		m.[Movie Description] as Description,
		m.Duration,
		m.Popularity,
		m.Rating,
		m.[Release Date],
		m.StoryLine,
		m.TagLine,
		tec.AspectRatio,
		tec.Color,
		tec.SoundMix,
		lan.Language,
		STUFF((SELECT ', ' + g.[Genre Name] 
			FROM Genre g,
				Movie_Genre mg
			WHERE g.GenreID = mg.GenreID
			and mg.MovieID = m.MovieID
			FOR XML PATH(''), TYPE).value('.','NVARCHAR(MAX)'),1,2,' ') Genre
	from Movie m,
		TechnicalSpecs tec,
		Language lan,
		Country c
	where m.[Movie Name] = @MovieName
		and tec.TechnicalSpecsID = m.TechnicalSpecsID
		and lan.LanguageID = m.LanguageID
		and c.CountryID = m.CountryID;
end;