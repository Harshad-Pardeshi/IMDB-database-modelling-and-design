CREATE procedure [dbo].[GetMovieShowTiming]
@MovieName char(1000), @Date Date
as
begin
	select m.[Movie Name] as MovieName,
		th.TheatreName,
		st.ShowDate as Date,
		st.ShowTime as Time,
		s.ScreenNumber as screenNumber
	from Movie m,
		Theatre th,
		ShowTiming st,
		Screen s
	where m.[Movie Name] = @MovieName
		and st.MovieID = m.MovieID
		and s.TheatreID = th.TheatreID
		and st.ShowDate = @Date
end;