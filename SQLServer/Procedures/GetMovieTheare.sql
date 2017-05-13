CREATE procedure [dbo].[GetMovieTheatre]
@MovieName char(1000)
as
begin
	select distinct m.[Movie Name] as MovieName,
		th.TheatreName
	from Movie m,
		Theatre th,
		ShowTiming st,
		Screen s
	where m.[Movie Name] = @MovieName
		and st.MovieID = m.MovieID
		and s.TheatreID = th.TheatreID
end;