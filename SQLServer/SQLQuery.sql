-- List of TV Show which were released in 2012 and more than 5 nominations
select m.[Movie Name],
	ac.[Award Category Name],
	a.[Award Name],
	a.[Award Year]
from Movie m
	join Nominee n on n.MovieID=m.MovieID
	join Award a on a.AwardID=n.AwardID
	join AwardCategory ac on ac.AwardID=a.AwardID
where n.IsWinner = 'Y'
group by m.[Movie Name], 
	ac.[Award Category Name]
having count(n.IsWinner)>10

-- List of Golden Lion winning movies with lowest budget
select m.[Movie Name],
	 b.Budget, 
	 ac.[Award Category Name],
	 a.[Award Name]
from Movie m, 
	BoxOffice b, 
	Award a, 
	AwardCategory ac, 
	Nominee n
where m.MovieID=n.MovieID 
	and a.AwardID =n.AwardID
	and ac.AwardID = a.AwardID
	and n.AwardID = a.AwardID
	and b.MovieID = m.MovieID
	and n.IsWinner like 'Y'
	and a.[Award Name] like 'Golden Lion'
order by b.Budget desc 



--List Theatre which are selling tickets for less than $18 for recliner seats with a rating of 5 and above and playing Comedy genre movie

select t.TheatreName, 
	sty.[SeatType Name], 
	tkt.Cost, 
	t.[Theatre Rating], 
	g.[Genre Name]
from Theatre t, 
	Screen s, 
	Seat st, 
	Ticket tkt, 
	SeatType sty, 
	Genre g, 
	Movie_Genre mg, 
	Movie m, 
	Movie_Screen ms
where t.TheatreID=s.TheatreID
	and s.ScreenID=ms.ScreenID 
	and ms.MovieID=m.MovieID 
	and m.MovieID=mg.MovieID 
	and mg.GenreID=g.GenreID 
	and s.ScreenID=st.ScreenID 
	and tkt.SeatID=st.SeatID 
	and sty.SeatTypeID = st.ScreenTypeID
	and sty.[SeatType Name]='Recliner Seats' 
	and tkt.Cost < 18 
	and t.[Theatre Rating] > 5 
	and g.[Genre Name] like 'Comedy' 


--Color Movies list of Nicholas Sparks with in descending order of the rating and with a budget higher than 50000.
select distinct Movie.[Movie Name], 
	Movie.Rating
from Movie, 
	Artist, 
	TechnicalSpecs,
	BoxOffice, 
	Cast
where Cast.MovieID=Movie.MovieID
	and Cast.ArtistID=Artist.ArtistID
	and TechnicalSpecs.TechnicalSpecsID = Movie.TechnicalSpecsID
	and BoxOffice.MovieID = Movie.MovieID
	and Artist.FirstName like 'Nicholas'
	and Artist.LastName like 'Sparks'
	and BoxOffice.Budget > 50000
	and TechnicalSpecs.Color like 'Color'
order by Movie.Rating desc


--List of Theatre with descending order of the rating showing Comedy movies with a budget of 45000 and playing Dolby Sound
select TheatreName, 
	[Theatre Rating]
from Theatre th, 
	Genre g, 
	Movie_Genre mg, 
	BoxOffice b, 
	TechnicalSpecs ts, 
	Movie m, 
	Movie_Screen ms, 
	Screen s
where g.GenreID=mg.GenreID 
	and ms.MovieID=m.MovieID 
	and mg.MovieID=m.MovieID 
	and s.ScreenID=ms.ScreenID 
	and ms.MovieID = m.MovieID
	and s.TheatreID=th.TheatreID
	and m.TechnicalSpecsID = ts.TechnicalSpecsID
	and b.MovieID = m.MovieID
	and g.[Genre Name] like 'Comedy' 
	and b.Budget > 45000 
	and ts.SoundMix like 'Dobly Sound' 
order by [Theatre Rating] desc


--Production company with most commonly used plot keywords in descending order count with the movie genre
select ProductionCompanyName ,
	 count([Plot Keyword]) as PlotKeyword, 
	 [Genre Name]
from ProductionCompany, 
	ProductionCompany_Bridge, 
	Genre, 
	Movie_Genre,
	PlotKeyword,
	PlotKeyword_Bridge, 
	Movie
where Genre.GenreID=Movie_Genre.GenreID 
	and Movie_Genre.MovieID=Movie.MovieID 
	and PlotKeyword.PlotKeywordID=PlotKeyword_Bridge.PlotKeywordID 
	and PlotKeyword_Bridge.MovieID=Movie.MovieID 
	and ProductionCompany.ProductionCompanyID=ProductionCompany_Bridge.ProductionCompanyID 
	and ProductionCompany_Bridge.MovieID=Movie.MovieID
group by ProductionCompanyName, [Genre Name]
order by count([Plot Keyword]) desc;


--1
select top 10 t.Popularity as Popularity,
	t.[TV Show Name] as TVShow
from TVShow t 
order by t.Popularity desc;

--2
select * 
from Artist a,
	ArtistType art
where a.ArtistTypeID = art.ArtistTypeID
	and art.ArtistType = 'Actor';


--3
select top 10 t.Popularity as Popularity,
	t.[TV Show Name] as TVShow,
	s.SeasonNumber as Season,
	e.EpisodeName as Eposode
from TVShow t,
	Episode e,
	Season s
where e.SeasonID = s.SeasonID
	and s.TVShowID = t.TVShowID
order by t.Popularity desc;

--4
select top 10 m.[Movie Name] as Movie_Name,
	sum(b.OpeningWeek) as Opening_Week_Collection
from Movie m,
	BoxOffice b
where m.MovieID = b.BoxOfficeID
group by m.[Movie Name],
	m.MovieID
order by Opening_Week_Collection;

--5
select tv.[TV Show Name] as TVShow,
	s.SeasonNumber as Season ,
	e.EpisodeName
from TVShow tv,
	Season s,
	Episode e
where tv.TVShowID = s.TVShowID
	and s.SeasonID = e.SeasonID
	and e.ReleaseDate > SYSDATETIME();

--6
select m.[Movie Name] as Movie_Name,
	m.Rating 
from Movie m,
	Genre g,
	Movie_Genre mg
where g.GenreID = mg.GenreID
	and mg.MovieID = m.MovieID
	and m.Rating = (select max(m1.Rating)
				from Movie m1
				where DatePart(yyyy,m1.[Release Date]) = 2016) 
	and DatePart(yyyy,m.[Release Date]) = 2016
	and g.[Genre Name] = 'Romantic';

--7
select top 1 m.[Movie Name] as MovieName,
	m.MetaScore
from Movie m
where datePart(YYYY,m.[Release Date]) between 2010 and 2016
order by m.MetaScore desc

--8
select distinct tv.[TV Show Name] as TVShow
from TVShow tv,
	Episode e,
	Season s,
	TechnicalSpecs tec
where tv.TVShowID = s.TVShowID
	and s.SeasonID = e.SeasonID
	and tec.TechnicalSpecsID = e.TechnicalSpecsID
	and datePart(YYYY,tv.[ReleaseDate]) between 2010 and 2016
	and tec.SoundMix = 'Dolby' 

--9
select distinct tv.[TV Show Name] as TVShow
from TVShow tv,
	Episode e,
	Season s,
	TechnicalSpecs tec
where tv.TVShowID = s.TVShowID
	and s.SeasonID = e.SeasonID
	and tec.TechnicalSpecsID = e.TechnicalSpecsID
	and datePart(YYYY,tv.[ReleaseDate]) < 1990
	and tec.Color =  'Color'

--10 List of movies by Walt Disney Animation Studios
select m.[Movie Name] as MovieName,
	ProductionCompanyName
from Movie m,
	ProductionCompany p,
	ProductionCompany_Bridge pm
where m.MovieID = pm .MovieID
	and pm.ProductionCompanyID = p.ProductionCompanyID
	and p.ProductionCompanyName like '%Walt Disney Animation Studios%';

--11 List of movies with Sex and Nudity rating more than 6
select m.[Movie Name] as MovieName,
	pg.Sex_Nudity as SexAndNudityRating
from Movie m,
	ParentGuide pg
where m.ParentGuideID = pg.ParentGuideID
	and pg.Sex_Nudity > 6;

--12 List of TV Shows with Alcohol/Drugs/Smoking with rating more than 7
select m.[Movie Name] as MovieName,
	pg.Alchol_Drugs_Smoking as Alchol_Drugs_Smoking
from Movie m,
	ParentGuide pg
where m.ParentGuideID = pg.ParentGuideID
	and pg.Alchol_Drugs_Smoking > 7;

--13 Display list of links to the trailer of movies in 2010-2016

select m.[Movie Name] as MovieName,
	t.[Trailer Name]
from Movie m,
	Trailer t
where m.MovieID = t.MovieID
	and datePart(YYYY,t.[Release Date]) between 2010 and 2016;

--14 List of actors who have worked in TV show and Movies as well
select a.FirstName +' '+ a.LastName
from Artist a
where a.ArtistID in (select c1.ArtistID from Cast c1 where c1.ArtistID = a.ArtistID and c1.MovieID is not null)
	and a.ArtistID in (select c2.ArtistID from Cast c2 where c2.ArtistID = a.ArtistID and c2.EpisodeID is not null);


--15 List movies  between 8-16 with total count of seat type across 
select m.[Movie Name] as MovieName,
	t.TheatreName,
	s.ScreenNumber,
	st.ShowTime
from Movie m,
	Theatre t,
	Movie_Screen ms,
	Screen s,
	ShowTiming st
where m.MovieID = ms.MovieID 
	and t.TheatreID = s.TheatreID
	and ms.ScreenID = s.ScreenID
	and st.ScreenID = s.ScreenID 
	and st.MovieID = m.MovieID
	and datepart(HH,st.ShowTime) between 08 and 16;

--16  Golden Lion winning movies with budget in lower budget
select top 10 distinct m.[Movie Name] as Movie_Name,
	a.[Award Name], a.[Award Year],
	b.Budget 
from Movie m,
	Award a,
	Nominee n,
	AwardCategory ac,
	BoxOffice b
where m.MovieID = n.MovieID
	and a.AwardID = n.AwardID
	and ac.AwardID = a.AwardID
	and a.[Award Name] = 'Golden Lion'
	and a.[Award Year] = 2013
	and b.MovieID = m.MovieID
Order by b.Budget;


