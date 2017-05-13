/*
Created: 02-12-2016
Modified: 08-12-2016
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE [Movie]
(
 [MovieID] Int NOT NULL,
 [IMDB Rating] Float NULL,
 [Rating] Float NULL,
 [Duration] Time NULL,
 [Movie Description] Varchar(1000) NULL,
 [Movie Name] Varchar(1000) NULL,
 [Popularity] Float NULL,
 [Release Date] Date NULL,
 [MetaScore] Int NULL,
 [OfficialSite] Int NULL,
 [FilmingLocation] Int NULL,
 [CertificateID] Int NULL,
 [TechnicalSpecsID] Int NULL,
 [ParentGuideID] Int NULL,
 [StoryLine] Varchar(1000) NULL,
 [LanguageID] Int NULL,
 [TagLine] Varchar(2000) NULL,
 [CountryID] Int NULL
)
go

-- Create indexes for table Movie

CREATE INDEX [IX_Relationship46] ON [Movie] ([FilmingLocation])
go

CREATE INDEX [IX_Relationship1] ON [Movie] ([CertificateID])
go

CREATE INDEX [IX_Relationship2] ON [Movie] ([TechnicalSpecsID])
go

CREATE INDEX [IX_Relationship3] ON [Movie] ([ParentGuideID])
go

CREATE INDEX [IX_Relationship4] ON [Movie] ([LanguageID])
go

-- Add keys for table Movie

ALTER TABLE [Movie] ADD CONSTRAINT [Key1] PRIMARY KEY ([MovieID])
go

-- Table Award

CREATE TABLE [Award]
(
 [AwardID] Int NOT NULL,
 [Award Name] Varchar(200) NULL,
 [Award Year] Int NULL
)
go

-- Add keys for table Award

ALTER TABLE [Award] ADD CONSTRAINT [Key2] PRIMARY KEY ([AwardID])
go

-- Table TVShow

CREATE TABLE [TVShow]
(
 [TVShowID] Int NOT NULL,
 [TV Show Name] Varchar(1000) NULL,
 [Popularity] Float NULL,
 [Rating] Float NULL,
 [TV Show Description] Varchar(1000) NULL,
 [StoryLine] Varchar(1000) NULL,
 [CountryID] Int NOT NULL,
 [LanguageID] Int NULL
)
go

-- Create indexes for table TVShow

CREATE INDEX [IX_Relationship2] ON [TVShow] ([CountryID])
go

CREATE INDEX [IX_Relationship5] ON [TVShow] ([LanguageID])
go

-- Add keys for table TVShow

ALTER TABLE [TVShow] ADD CONSTRAINT [Key3] PRIMARY KEY ([TVShowID])
go

-- Table Season

CREATE TABLE [Season]
(
 [SeasonID] Int NOT NULL,
 [SeasonNumber] Int NULL,
 [TVShowID] Int NOT NULL,
 [StoryLine] Varchar(1000) NULL,
 [Rating] Float NULL
)
go

-- Create indexes for table Season

CREATE INDEX [IX_FK_Season_TVShow_TVShowID] ON [Season] ([TVShowID])
go

-- Add keys for table Season

ALTER TABLE [Season] ADD CONSTRAINT [Key4] PRIMARY KEY ([SeasonID])
go

-- Table Episode

CREATE TABLE [Episode]
(
 [EpisodeName] Varchar(max) NULL,
 [EpisodeID] Int NOT NULL,
 [SeasonID] Int NOT NULL,
 [CertificateID] Int NULL,
 [TechnicalSpecsID] Int NULL,
 [ParentGuideID] Int NULL,
 [PhotoID] Int NULL,
 [StoryLine] Varchar(1000) NULL,
 [AvailableOnAmazonPrime] Binary(1) NULL,
 [Rating] Float NULL
)
go

-- Create indexes for table Episode

CREATE INDEX [IX_FK_Episode_Season_SeasonID] ON [Episode] ([SeasonID])
go

CREATE INDEX [IX_Relationship4] ON [Episode] ([CertificateID])
go

CREATE INDEX [IX_Relationship5] ON [Episode] ([TechnicalSpecsID])
go

CREATE INDEX [IX_Relationship6] ON [Episode] ([ParentGuideID])
go

CREATE INDEX [IX_Relationship7] ON [Episode] ([PhotoID])
go

-- Add keys for table Episode

ALTER TABLE [Episode] ADD CONSTRAINT [Key5] PRIMARY KEY ([EpisodeID])
go

-- Table Genre

CREATE TABLE [Genre]
(
 [GenreID] Int NOT NULL,
 [Genre Name] Varchar(200) NULL
)
go

-- Add keys for table Genre

ALTER TABLE [Genre] ADD CONSTRAINT [Key6] PRIMARY KEY ([GenreID])
go

-- Table Movie_Genre

CREATE TABLE [Movie_Genre]
(
 [Movie_GenreID] Int NOT NULL,
 [GenreID] Int NOT NULL,
 [MovieID] Int NOT NULL
)
go

-- Create indexes for table Movie_Genre

CREATE INDEX [IX_FK_Genre_Movie_Genre_GenreID] ON [Movie_Genre] ([GenreID])
go

CREATE INDEX [IX_FK_Movie_Movie_Genre_MovieID] ON [Movie_Genre] ([MovieID])
go

-- Add keys for table Movie_Genre

ALTER TABLE [Movie_Genre] ADD CONSTRAINT [Key7] PRIMARY KEY ([Movie_GenreID])
go

-- Table Trailer

CREATE TABLE [Trailer]
(
 [TrailerID] Int NOT NULL,
 [Trailer Name] Varchar(100) NULL,
 [Trailer Description] Varchar(max) NULL,
 [Duration] Time NULL,
 [Release Date] Date NULL,
 [TrailerVideo] Varbinary(1000) NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL,
 [Rating] Float NULL
)
go

-- Create indexes for table Trailer

CREATE INDEX [IX_Relationship23] ON [Trailer] ([MovieID])
go

CREATE INDEX [IX_Relationship24] ON [Trailer] ([TVShowID])
go

-- Add keys for table Trailer

ALTER TABLE [Trailer] ADD CONSTRAINT [Key8] PRIMARY KEY ([TrailerID])
go

-- Table Photo

CREATE TABLE [Photo]
(
 [PhotoID] Int NOT NULL,
 [Photo Name] Varchar(200) NULL,
 [Photo Size] Float NULL,
 [Photo] Image NULL,
 [MovieID] Int NULL,
 [SeasonID] Int NULL,
 [TVShowID] Int NULL,
 [TrailerID] Int NULL,
 [ArtistID] Int NULL
)
go

-- Create indexes for table Photo

CREATE INDEX [IX_Relationship3] ON [Photo] ([MovieID])
go

CREATE INDEX [IX_Relationship6] ON [Photo] ([SeasonID])
go

CREATE INDEX [IX_Relationship7] ON [Photo] ([TVShowID])
go

CREATE INDEX [IX_Relationship8] ON [Photo] ([TrailerID])
go

CREATE INDEX [IX_Relationship9] ON [Photo] ([ArtistID])
go

-- Add keys for table Photo

ALTER TABLE [Photo] ADD CONSTRAINT [Key9] PRIMARY KEY ([PhotoID])
go

-- Table Theatre

CREATE TABLE [Theatre]
(
 [TheatreName] Varchar(200) NULL,
 [TheatreID] Int NOT NULL,
 [Number of Screens] Int NULL,
 [Theatre Rating] Float NULL
)
go

-- Add keys for table Theatre

ALTER TABLE [Theatre] ADD CONSTRAINT [Key10] PRIMARY KEY ([TheatreID])
go

-- Table Screen

CREATE TABLE [Screen]
(
 [ScreenID] Int NOT NULL,
 [ScreenNumber] Varchar(10) NULL,
 [TheatreID] Int NOT NULL
)
go

-- Create indexes for table Screen

CREATE INDEX [IX_FK_Screen_Theater_TheaterID] ON [Screen] ([TheatreID])
go

-- Add keys for table Screen

ALTER TABLE [Screen] ADD CONSTRAINT [Key11] PRIMARY KEY ([ScreenID])
go

-- Table Seat

CREATE TABLE [Seat]
(
 [SeatID] Int NOT NULL,
 [Seat Number] Varchar(10) NULL,
 [ScreenTypeID] Int NULL,
 [ScreenID] Int NOT NULL
)
go

-- Create indexes for table Seat

CREATE INDEX [IX_Relationship30] ON [Seat] ([ScreenTypeID])
go

CREATE INDEX [IX_FK_Seat_Screen_ScreenID] ON [Seat] ([ScreenID])
go

-- Add keys for table Seat

ALTER TABLE [Seat] ADD CONSTRAINT [Key12] PRIMARY KEY ([SeatID])
go

-- Table Ticket

CREATE TABLE [Ticket]
(
 [TicketID] Int NOT NULL,
 [Cost] Float NULL,
 [SeatID] Int NULL
)
go

-- Create indexes for table Ticket

CREATE INDEX [IX_Relationship29] ON [Ticket] ([SeatID])
go

-- Add keys for table Ticket

ALTER TABLE [Ticket] ADD CONSTRAINT [Key13] PRIMARY KEY ([TicketID])
go

-- Table Movie_Screen

CREATE TABLE [Movie_Screen]
(
 [Movie_ScreenID] Int NOT NULL,
 [TimeStamp] Datetime NULL,
 [MovieID] Int NOT NULL,
 [ScreenID] Int NOT NULL
)
go

-- Create indexes for table Movie_Screen

CREATE INDEX [IX_FK_Movie_Screen_Movie_MovieID] ON [Movie_Screen] ([MovieID])
go

CREATE INDEX [IX_FK_Screen_Movie_Screen_ScreenID] ON [Movie_Screen] ([ScreenID])
go

-- Add keys for table Movie_Screen

ALTER TABLE [Movie_Screen] ADD CONSTRAINT [Key15] PRIMARY KEY ([Movie_ScreenID])
go

-- Table ShowTiming

CREATE TABLE [ShowTiming]
(
 [ShowTimingID] Int NOT NULL,
 [ShowDate] Date NULL,
 [ShowTime] Time NULL,
 [ScreenID] Int NULL,
 [MovieID] Int NULL
)
go

-- Create indexes for table ShowTiming

CREATE INDEX [IX_Relationship31] ON [ShowTiming] ([ScreenID])
go

CREATE INDEX [IX_Relationship33] ON [ShowTiming] ([MovieID])
go

-- Add keys for table ShowTiming

ALTER TABLE [ShowTiming] ADD CONSTRAINT [Key16] PRIMARY KEY ([ShowTimingID])
go

-- Table Cast

CREATE TABLE [Cast]
(
 [CastID] Int NOT NULL,
 [MovieID] Int NOT NULL,
 [EpisodeID] Int NOT NULL,
 [ArtistID] Int NOT NULL
)
go

-- Create indexes for table Cast

CREATE INDEX [IX_FK_Episode_Cast_EpisodeID] ON [Cast] ([EpisodeID])
go

CREATE INDEX [IX_FK_Cast_Artist_ArtistID] ON [Cast] ([ArtistID])
go

CREATE INDEX [IX_FK_Movie_Cast_MovieID] ON [Cast] ([MovieID])
go

-- Add keys for table Cast

ALTER TABLE [Cast] ADD CONSTRAINT [Key18] PRIMARY KEY ([CastID])
go

-- Table Artist

CREATE TABLE [Artist]
(
 [ArtistID] Int NOT NULL,
 [ArtistDescription] Varchar(1000) NULL,
 [Height] Float NULL,
 [NickName] Varchar(100) NULL,
 [BirthName] Varchar(50) NULL,
 [SSN] Varchar(50) NULL,
 [FirstName] Varchar(50) NULL,
 [LastName] Varchar(50) NULL,
 [MiddleName] Varchar(50) NULL,
 [Age] Int NULL,
 [Gender] Varchar(10) NULL,
 [PlaceOfBirth] Varchar(100) NULL,
 [DateOfBirth] Date NULL,
 [DateOfDeath] Date NULL,
 [ArtistTypeID] Int NOT NULL
)
go

-- Create indexes for table Artist

CREATE INDEX [IX_FK_Artistype_Artist_ArtistTypeID] ON [Artist] ([ArtistTypeID])
go

-- Add keys for table Artist

ALTER TABLE [Artist] ADD CONSTRAINT [Key19] PRIMARY KEY ([ArtistID])
go

-- Table ArtistType

CREATE TABLE [ArtistType]
(
 [ArtistTypeID] Int NOT NULL,
 [ArtistType] Varchar(100) NULL
)
go

-- Add keys for table ArtistType

ALTER TABLE [ArtistType] ADD CONSTRAINT [Key20] PRIMARY KEY ([ArtistTypeID])
go

-- Table User

CREATE TABLE [User]
(
 [UserID] Int NOT NULL,
 [UserName] Varchar(50) NULL,
 [Password] Varchar(50) NULL,
 [Email] Varchar(50) NULL,
 [PersonID] Int NULL
)
go

-- Create indexes for table User

CREATE INDEX [IX_Relationship17] ON [User] ([PersonID])
go

-- Add keys for table User

ALTER TABLE [User] ADD CONSTRAINT [Key22] PRIMARY KEY ([UserID])
go

-- Table Critic

CREATE TABLE [Critic]
(
 [CriticID] Int NOT NULL,
 [CriticDescription] Varchar(max) NULL,
 [PersonID] Int NULL
)
go

-- Create indexes for table Critic

CREATE INDEX [IX_Relationship18] ON [Critic] ([PersonID])
go

-- Add keys for table Critic

ALTER TABLE [Critic] ADD CONSTRAINT [Key23] PRIMARY KEY ([CriticID])
go

-- Table Organization

CREATE TABLE [Organization]
(
 [OrganizationID] Int NOT NULL,
 [Organization Description] Varchar(max) NULL,
 [Organization Name] Varchar(100) NULL
)
go

-- Add keys for table Organization

ALTER TABLE [Organization] ADD CONSTRAINT [Key24] PRIMARY KEY ([OrganizationID])
go

-- Table Reviews

CREATE TABLE [Reviews]
(
 [ReviewID] Int NOT NULL,
 [Review] Varchar(1000) NULL,
 [TVShowID] Int NOT NULL,
 [SeasonID] Int NOT NULL,
 [EpisodeID] Int NOT NULL,
 [CriticID] Int NULL,
 [OrganizationID] Int NULL,
 [UserID] Int NOT NULL,
 [TrailerID] Int NOT NULL,
 [MovieID] Int NOT NULL,
 [UserRating] Float NULL
)
go

-- Create indexes for table Reviews

CREATE INDEX [IX_FK_Season_Reviews_SeasonID] ON [Reviews] ([SeasonID])
go

CREATE INDEX [IX_FK_TVShow_Reviews_TVShowID] ON [Reviews] ([TVShowID])
go

CREATE INDEX [IX_Relationship38] ON [Reviews] ([EpisodeID])
go

CREATE INDEX [IX_Relationship40] ON [Reviews] ([CriticID])
go

CREATE INDEX [IX_Relationship41] ON [Reviews] ([OrganizationID])
go

CREATE INDEX [IX_FK_Trailer_Reviews_TrailerID] ON [Reviews] ([TrailerID])
go

CREATE INDEX [IX_FK_Movie_Reviews_MovieID] ON [Reviews] ([MovieID])
go

CREATE INDEX [IX_FK_Reviews_User_UserID] ON [Reviews] ([UserID])
go

-- Add keys for table Reviews

ALTER TABLE [Reviews] ADD CONSTRAINT [Key25] PRIMARY KEY ([ReviewID])
go

-- Table Address

CREATE TABLE [Address]
(
 [AddressID] Int NOT NULL,
 [Address Line1] Varchar(500) NULL,
 [Address Line2] Varchar(500) NULL,
 [Zip Code] Int NULL,
 [AddressTypeID] Int NOT NULL,
 [CityID] Int NULL
)
go

-- Create indexes for table Address

CREATE INDEX [IX_Relationship19] ON [Address] ([CityID])
go

CREATE INDEX [IX_FK_Address_AddressType_AddressTypeID] ON [Address] ([AddressTypeID])
go

-- Add keys for table Address

ALTER TABLE [Address] ADD CONSTRAINT [Key26] PRIMARY KEY ([AddressID])
go

-- Table Artist_Address

CREATE TABLE [Artist_Address]
(
 [Artist_AddressID] Int NOT NULL,
 [ArtistID] Int NOT NULL,
 [AddressID] Int NOT NULL
)
go

-- Create indexes for table Artist_Address

CREATE INDEX [IX_FK_ArtistID_Artist_Address_ArtistID] ON [Artist_Address] ([ArtistID])
go

CREATE INDEX [IX_FK_Address_Artist_Address_AddressID] ON [Artist_Address] ([AddressID])
go

-- Add keys for table Artist_Address

ALTER TABLE [Artist_Address] ADD CONSTRAINT [Key27] PRIMARY KEY ([Artist_AddressID])
go

-- Table AddressType

CREATE TABLE [AddressType]
(
 [AddressTypeID] Int NOT NULL,
 [AddressType Name] Varchar(200) NULL
)
go

-- Add keys for table AddressType

ALTER TABLE [AddressType] ADD CONSTRAINT [Key28] PRIMARY KEY ([AddressTypeID])
go

-- Table City

CREATE TABLE [City]
(
 [CityID] Int NOT NULL,
 [City Name] Char(100) NULL,
 [StateID] Int NULL
)
go

-- Create indexes for table City

CREATE INDEX [IX_Relationship20] ON [City] ([StateID])
go

-- Add keys for table City

ALTER TABLE [City] ADD CONSTRAINT [Key29] PRIMARY KEY ([CityID])
go

-- Table State

CREATE TABLE [State]
(
 [StateID] Int NOT NULL,
 [State Name] Varchar(100) NULL,
 [CountryID] Int NULL
)
go

-- Create indexes for table State

CREATE INDEX [IX_Relationship21] ON [State] ([CountryID])
go

-- Add keys for table State

ALTER TABLE [State] ADD CONSTRAINT [Key30] PRIMARY KEY ([StateID])
go

-- Table Country

CREATE TABLE [Country]
(
 [CountryID] Int NOT NULL,
 [Country Name] Char(100) NULL
)
go

-- Add keys for table Country

ALTER TABLE [Country] ADD CONSTRAINT [Key31] PRIMARY KEY ([CountryID])
go

-- Table TradeMark

CREATE TABLE [TradeMark]
(
 [TradeMarkID] Int NOT NULL,
 [TradeMark Description] Varchar(1000) NULL
)
go

-- Add keys for table TradeMark

ALTER TABLE [TradeMark] ADD CONSTRAINT [Key32] PRIMARY KEY ([TradeMarkID])
go

-- Table SeatType

CREATE TABLE [SeatType]
(
 [SeatTypeID] Int NOT NULL,
 [SeatType Name] Varchar(100) NULL
)
go

-- Add keys for table SeatType

ALTER TABLE [SeatType] ADD CONSTRAINT [Key33] PRIMARY KEY ([SeatTypeID])
go

-- Table Artist_TradeMark

CREATE TABLE [Artist_TradeMark]
(
 [Artist_TradeMark_ID] Int NOT NULL,
 [ArtistID] Int NOT NULL,
 [TradeMarkID] Int NOT NULL
)
go

-- Create indexes for table Artist_TradeMark

CREATE INDEX [IX_FK_TradeMark_Artist_TradeMark_TradeMarkID] ON [Artist_TradeMark] ([TradeMarkID])
go

CREATE INDEX [IX_FK_Artist_Artist_TradeMark_AtistID] ON [Artist_TradeMark] ([ArtistID])
go

-- Add keys for table Artist_TradeMark

ALTER TABLE [Artist_TradeMark] ADD CONSTRAINT [Key34] PRIMARY KEY ([Artist_TradeMark_ID])
go

-- Table BoxOffice

CREATE TABLE [BoxOffice]
(
 [BoxOfficeID] Int NOT NULL,
 [Budget] Float NULL,
 [OpeningWeek] Float NULL,
 [Gross] Float NULL,
 [MovieID] Int NOT NULL,
 [Type] Varchar(100) NULL,
 [Date] Date NULL
)
go

-- Create indexes for table BoxOffice

CREATE INDEX [IX_Relationship3] ON [BoxOffice] ([MovieID])
go

-- Add keys for table BoxOffice

ALTER TABLE [BoxOffice] ADD CONSTRAINT [Key35] PRIMARY KEY ([BoxOfficeID])
go

-- Table ParentGuide

CREATE TABLE [ParentGuide]
(
 [ParentGuideID] Int NOT NULL,
 [Voilance_Gore] Int NULL,
 [Sex_Nudity] Int NULL,
 [Profanity] Int NULL,
 [Alchol_Drugs_Smoking] Int NULL,
 [Frightninig_IntenseScene] Int NULL
)
go

-- Add keys for table ParentGuide

ALTER TABLE [ParentGuide] ADD CONSTRAINT [Key36] PRIMARY KEY ([ParentGuideID])
go

-- Table TechnicalSpecs

CREATE TABLE [TechnicalSpecs]
(
 [TechnicalSpecsID] Int NOT NULL,
 [SoundMix] Varbinary(200) NULL,
 [Color] Varchar(200) NULL,
 [AspectRatio] Varbinary(200) NULL
)
go

-- Add keys for table TechnicalSpecs

ALTER TABLE [TechnicalSpecs] ADD CONSTRAINT [Key37] PRIMARY KEY ([TechnicalSpecsID])
go

-- Table Certificate

CREATE TABLE [Certificate]
(
 [CertificateID] Int NOT NULL,
 [CertificateName] Varchar(100) NULL
)
go

-- Add keys for table Certificate

ALTER TABLE [Certificate] ADD CONSTRAINT [Key38] PRIMARY KEY ([CertificateID])
go

-- Table NewsArticle

CREATE TABLE [NewsArticle]
(
 [NewsArticleID] Int NOT NULL,
 [Article] Varchar(max) NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL,
 [SeasonID] Int NULL,
 [TrailerID] Int NULL,
 [EpisodeID] Int NULL,
 [ArtistID] Int NULL
)
go

-- Create indexes for table NewsArticle

CREATE INDEX [IX_Relationship10] ON [NewsArticle] ([MovieID])
go

CREATE INDEX [IX_Relationship12] ON [NewsArticle] ([TVShowID])
go

CREATE INDEX [IX_Relationship13] ON [NewsArticle] ([SeasonID])
go

CREATE INDEX [IX_Relationship14] ON [NewsArticle] ([TrailerID])
go

CREATE INDEX [IX_Relationship1] ON [NewsArticle] ([EpisodeID])
go

CREATE INDEX [IX_Relationship2] ON [NewsArticle] ([ArtistID])
go

-- Add keys for table NewsArticle

ALTER TABLE [NewsArticle] ADD CONSTRAINT [Key39] PRIMARY KEY ([NewsArticleID])
go

-- Table ReleaseDate

CREATE TABLE [ReleaseDate]
(
 [ReleaseDateID] Int NOT NULL,
 [ReleaseDate] Date NULL,
 [MovieID] Int NULL,
 [TrailerID] Int NOT NULL,
 [EpisodeID] Int NULL,
 [CountryID] Int NULL,
 [SeasonID] Int NULL,
 [TVShowID] Int NULL
)
go

-- Create indexes for table ReleaseDate

CREATE INDEX [IX_Relationship10] ON [ReleaseDate] ([MovieID])
go

CREATE INDEX [IX_Relationship12] ON [ReleaseDate] ([EpisodeID])
go

CREATE INDEX [IX_Relationship13] ON [ReleaseDate] ([CountryID])
go

CREATE INDEX [IX_Relationship14] ON [ReleaseDate] ([SeasonID])
go

CREATE INDEX [IX_Relationship15] ON [ReleaseDate] ([TVShowID])
go

CREATE INDEX [IX_FK_Trailer_ReleaseDate_TrailerID] ON [ReleaseDate] ([TrailerID])
go

-- Add keys for table ReleaseDate

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [Key41] PRIMARY KEY ([ReleaseDateID])
go

-- Table PlotKeyword

CREATE TABLE [PlotKeyword]
(
 [PlotKeywordID] Int NOT NULL,
 [Plot Keyword] Varchar(200) NULL
)
go

-- Add keys for table PlotKeyword

ALTER TABLE [PlotKeyword] ADD CONSTRAINT [Key43] PRIMARY KEY ([PlotKeywordID])
go

-- Table Trivia

CREATE TABLE [Trivia]
(
 [TriviaID] Int NOT NULL,
 [Trivia] Varchar(max) NULL,
 [TrailerID] Int NULL,
 [MovieID] Int NULL,
 [EpisodeID] Int NULL,
 [SeasonID] Int NULL,
 [TVShowID] Int NULL
)
go

-- Create indexes for table Trivia

CREATE INDEX [IX_Relationship3] ON [Trivia] ([TrailerID])
go

CREATE INDEX [IX_Relationship4] ON [Trivia] ([MovieID])
go

CREATE INDEX [IX_Relationship5] ON [Trivia] ([EpisodeID])
go

CREATE INDEX [IX_Relationship6] ON [Trivia] ([SeasonID])
go

CREATE INDEX [IX_Relationship7] ON [Trivia] ([TVShowID])
go

-- Add keys for table Trivia

ALTER TABLE [Trivia] ADD CONSTRAINT [Key44] PRIMARY KEY ([TriviaID])
go

-- Table PlotKeyword_Bridge

CREATE TABLE [PlotKeyword_Bridge]
(
 [PlotKeyword_BridgeID] Int NOT NULL,
 [PlotKeywordID] Int NOT NULL,
 [EpisodeID] Int NULL,
 [SeasonID] Int NULL,
 [TVShowID] Int NULL,
 [TrailerID] Int NULL,
 [MovieID] Int NULL
)
go

-- Create indexes for table PlotKeyword_Bridge

CREATE INDEX [IX_Relationship9] ON [PlotKeyword_Bridge] ([EpisodeID])
go

CREATE INDEX [IX_Relationship10] ON [PlotKeyword_Bridge] ([SeasonID])
go

CREATE INDEX [IX_Relationship11] ON [PlotKeyword_Bridge] ([TVShowID])
go

CREATE INDEX [IX_Relationship12] ON [PlotKeyword_Bridge] ([TrailerID])
go

CREATE INDEX [IX_Relationship13] ON [PlotKeyword_Bridge] ([MovieID])
go

-- Add keys for table PlotKeyword_Bridge

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [Key45] PRIMARY KEY ([PlotKeyword_BridgeID],[PlotKeywordID])
go

-- Table Nominee

CREATE TABLE [Nominee]
(
 [NomineeID] Int NOT NULL,
 [AwardID] Int NULL,
 [IsWinner] Varchar(1) NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL,
 [ArtistID] Int NULL,
 [EpisodeID] Int NULL
)
go

-- Create indexes for table Nominee

CREATE INDEX [IX_Relationship18] ON [Nominee] ([AwardID])
go

CREATE INDEX [IX_Relationship21] ON [Nominee] ([MovieID])
go

CREATE INDEX [IX_Relationship22] ON [Nominee] ([TVShowID])
go

CREATE INDEX [IX_Relationship23] ON [Nominee] ([ArtistID])
go

CREATE INDEX [IX_Relationship4] ON [Nominee] ([EpisodeID])
go

-- Add keys for table Nominee

ALTER TABLE [Nominee] ADD CONSTRAINT [Key46] PRIMARY KEY ([NomineeID])
go

-- Table AwardCategory

CREATE TABLE [AwardCategory]
(
 [AwardCategoryID] Int NOT NULL,
 [Award Category Name] Varchar(200) NULL,
 [AwardID] Int NULL
)
go

-- Create indexes for table AwardCategory

CREATE INDEX [IX_Relationship20] ON [AwardCategory] ([AwardID])
go

-- Add keys for table AwardCategory

ALTER TABLE [AwardCategory] ADD CONSTRAINT [Key47] PRIMARY KEY ([AwardCategoryID])
go

-- Table ProductionCompany

CREATE TABLE [ProductionCompany]
(
 [ProductionCompanyID] Int NOT NULL,
 [ProductionCompanyName] Varchar(100) NULL
)
go

-- Add keys for table ProductionCompany

ALTER TABLE [ProductionCompany] ADD CONSTRAINT [Key48] PRIMARY KEY ([ProductionCompanyID])
go

-- Table ProductionCompany_Bridge

CREATE TABLE [ProductionCompany_Bridge]
(
 [ProductionCompany_Bridge_ID] Int NOT NULL,
 [ProductionCompanyID] Int NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL
)
go

-- Create indexes for table ProductionCompany_Bridge

CREATE INDEX [IX_Relationship1] ON [ProductionCompany_Bridge] ([ProductionCompanyID])
go

CREATE INDEX [IX_Relationship2] ON [ProductionCompany_Bridge] ([MovieID])
go

CREATE INDEX [IX_Relationship3] ON [ProductionCompany_Bridge] ([TVShowID])
go

-- Add keys for table ProductionCompany_Bridge

ALTER TABLE [ProductionCompany_Bridge] ADD CONSTRAINT [Key49] PRIMARY KEY ([ProductionCompany_Bridge_ID])
go

-- Table ReadBy

CREATE TABLE [ReadBy]
(
 [ReadByID] Int NOT NULL,
 [InterestFlag] Binary(1) NULL,
 [UserID] Int NULL,
 [ReviewID] Int NULL
)
go

-- Create indexes for table ReadBy

CREATE INDEX [IX_Relationship5] ON [ReadBy] ([UserID])
go

CREATE INDEX [IX_Relationship6] ON [ReadBy] ([ReviewID])
go

-- Add keys for table ReadBy

ALTER TABLE [ReadBy] ADD CONSTRAINT [Key50] PRIMARY KEY ([ReadByID])
go

-- Table MessageBoardReadBy

CREATE TABLE [MessageBoardReadBy]
(
 [ReadByID] Int NULL,
 [InterestFlag] Binary(1) NULL,
 [UserID] Int NULL,
 [MessageBoardID] Int NULL
)
go

-- Create indexes for table MessageBoardReadBy

CREATE INDEX [IX_Relationship8] ON [MessageBoardReadBy] ([UserID])
go

CREATE INDEX [IX_Relationship16] ON [MessageBoardReadBy] ([MessageBoardID])
go

-- Table MessageBoard

CREATE TABLE [MessageBoard]
(
 [MessageBoardID] Int NOT NULL,
 [MovieID] Int NULL,
 [EpisodeID] Int NULL,
 [SeasonID] Int NULL,
 [TVShowID] Int NULL
)
go

-- Create indexes for table MessageBoard

CREATE INDEX [IX_Relationship12] ON [MessageBoard] ([MovieID])
go

CREATE INDEX [IX_Relationship13] ON [MessageBoard] ([EpisodeID])
go

CREATE INDEX [IX_Relationship14] ON [MessageBoard] ([SeasonID])
go

CREATE INDEX [IX_Relationship15] ON [MessageBoard] ([TVShowID])
go

-- Add keys for table MessageBoard

ALTER TABLE [MessageBoard] ADD CONSTRAINT [Key52] PRIMARY KEY ([MessageBoardID])
go

-- Table ReplyThread

CREATE TABLE [ReplyThread]
(
 [ReplyThreadID] Int NOT NULL,
 [Message] Varchar(1000) NULL,
 [DateTime] Date NULL,
 [MessageBoardID] Int NULL,
 [FK_ReplyThreadID] Int NULL
)
go

-- Create indexes for table ReplyThread

CREATE INDEX [IX_Relationship9] ON [ReplyThread] ([MessageBoardID])
go

CREATE INDEX [IX_Relationship10] ON [ReplyThread] ([FK_ReplyThreadID])
go

-- Add keys for table ReplyThread

ALTER TABLE [ReplyThread] ADD CONSTRAINT [Key53] PRIMARY KEY ([ReplyThreadID])
go

-- Table Comments

CREATE TABLE [Comments]
(
 [CommentID] Int NOT NULL,
 [Comment] Varchar(1000) NULL,
 [DateTime] Date NULL,
 [ReplyThreadID] Int NULL
)
go

-- Create indexes for table Comments

CREATE INDEX [IX_Relationship11] ON [Comments] ([ReplyThreadID])
go

-- Add keys for table Comments

ALTER TABLE [Comments] ADD CONSTRAINT [Key54] PRIMARY KEY ([CommentID])
go

-- Table Person

CREATE TABLE [Person]
(
 [PersonID] Int NOT NULL,
 [SSN] Varchar(100) NULL,
 [FirstName] Varchar(100) NULL,
 [LastName] Varchar(100) NULL,
 [MiddleName] Varchar(100) NULL,
 [Age] Int NULL,
 [Gender] Varchar(10) NULL
)
go

-- Add keys for table Person

ALTER TABLE [Person] ADD CONSTRAINT [Key55] PRIMARY KEY ([PersonID])
go

-- Table PlotSummary

CREATE TABLE [PlotSummary]
(
 [PlotSummaryID] Int NOT NULL,
 [PlotSummary] Varchar(1000) NULL,
 [MovieID] Int NULL,
 [EpisodeID] Int NULL,
 [UserID] Int NOT NULL
)
go

-- Create indexes for table PlotSummary

CREATE INDEX [IX_Relationship2] ON [PlotSummary] ([MovieID])
go

CREATE INDEX [IX_Relationship3] ON [PlotSummary] ([EpisodeID])
go

CREATE INDEX [IX_Relationship4] ON [PlotSummary] ([UserID])
go

-- Add keys for table PlotSummary

ALTER TABLE [PlotSummary] ADD CONSTRAINT [Key56] PRIMARY KEY ([PlotSummaryID])
go

-- Table Language

CREATE TABLE [Language]
(
 [LanguageID] Int NOT NULL,
 [Language] Varchar(100) NULL
)
go

-- Add keys for table Language

ALTER TABLE [Language] ADD CONSTRAINT [Key57] PRIMARY KEY ([LanguageID])
go

-- Table List

CREATE TABLE [List]
(
 [ListId] Int NOT NULL,
 [ListName] Varchar(1000) NULL,
 [ListDescription] Varchar(1000) NULL,
 [CreatedBy] Int NULL
)
go

-- Create indexes for table List

CREATE INDEX [IX_Relationship5] ON [List] ([CreatedBy])
go

-- Add keys for table List

ALTER TABLE [List] ADD CONSTRAINT [Key58] PRIMARY KEY ([ListId])
go

-- Table ListBridge

CREATE TABLE [ListBridge]
(
 [ListBridgeID] Int NOT NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL,
 [ArtistID] Int NULL,
 [ListId] Int NULL
)
go

-- Create indexes for table ListBridge

CREATE INDEX [IX_Relationship2] ON [ListBridge] ([MovieID])
go

CREATE INDEX [IX_Relationship3] ON [ListBridge] ([TVShowID])
go

CREATE INDEX [IX_Relationship4] ON [ListBridge] ([ArtistID])
go

CREATE INDEX [IX_Relationship6] ON [ListBridge] ([ListId])
go

-- Add keys for table ListBridge

ALTER TABLE [ListBridge] ADD CONSTRAINT [Key59] PRIMARY KEY ([ListBridgeID])
go

-- Table Polls

CREATE TABLE [Polls]
(
 [PollID] Int NOT NULL,
 [PollName] Varchar(1000) NULL,
 [PollDiscription] Varbinary(max) NULL,
 [CreatedBy] Int NULL
)
go

-- Create indexes for table Polls

CREATE INDEX [IX_Relationship13] ON [Polls] ([CreatedBy])
go

-- Add keys for table Polls

ALTER TABLE [Polls] ADD CONSTRAINT [Key60] PRIMARY KEY ([PollID])
go

-- Table PollBridge

CREATE TABLE [PollBridge]
(
 [PollBridgeID] Int NOT NULL,
 [VoteCount] Int NULL,
 [ArtistID] Int NULL,
 [PollID] Int NULL,
 [MovieID] Int NULL,
 [TVShowID] Int NULL
)
go

-- Create indexes for table PollBridge

CREATE INDEX [IX_Relationship7] ON [PollBridge] ([ArtistID])
go

CREATE INDEX [IX_Relationship8] ON [PollBridge] ([PollID])
go

CREATE INDEX [IX_Relationship9] ON [PollBridge] ([MovieID])
go

CREATE INDEX [IX_Relationship10] ON [PollBridge] ([TVShowID])
go

-- Add keys for table PollBridge

ALTER TABLE [PollBridge] ADD CONSTRAINT [Key61] PRIMARY KEY ([PollBridgeID])
go

-- Table PollVote

CREATE TABLE [PollVote]
(
 [PollVoteID] Int NOT NULL,
 [PollBridgeID] Int NULL,
 [UserID] Int NULL
)
go

-- Create indexes for table PollVote

CREATE INDEX [IX_Relationship11] ON [PollVote] ([PollBridgeID])
go

CREATE INDEX [IX_Relationship12] ON [PollVote] ([UserID])
go

-- Add keys for table PollVote

ALTER TABLE [PollVote] ADD CONSTRAINT [Key62] PRIMARY KEY ([PollVoteID])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [Cast] ADD CONSTRAINT [FK_Movie_Cast_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Cast] ADD CONSTRAINT [FK_Episode_Cast_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Cast] ADD CONSTRAINT [FK_Cast_Artist_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Artist_TradeMark] ADD CONSTRAINT [FK_Artist_Artist_TradeMark_AtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Artist_TradeMark] ADD CONSTRAINT [FK_TradeMark_Artist_TradeMark_TradeMarkID] FOREIGN KEY ([TradeMarkID]) REFERENCES [TradeMark] ([TradeMarkID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Artist] ADD CONSTRAINT [FK_Artistype_Artist_ArtistTypeID] FOREIGN KEY ([ArtistTypeID]) REFERENCES [ArtistType] ([ArtistTypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Season] ADD CONSTRAINT [FK_Season_TVShow_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episode] ADD CONSTRAINT [FK_Episode_Season_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Artist_Address] ADD CONSTRAINT [FK_ArtistID_Artist_Address_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Artist_Address] ADD CONSTRAINT [FK_Address_Artist_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [Address] ([AddressID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Address] ADD CONSTRAINT [FK_Address_AddressType_AddressTypeID] FOREIGN KEY ([AddressTypeID]) REFERENCES [AddressType] ([AddressTypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie_Genre] ADD CONSTRAINT [FK_Genre_Movie_Genre_GenreID] FOREIGN KEY ([GenreID]) REFERENCES [Genre] ([GenreID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie_Genre] ADD CONSTRAINT [FK_Movie_Movie_Genre_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Address] ADD CONSTRAINT [FK_Address_City_CityID] FOREIGN KEY ([CityID]) REFERENCES [City] ([CityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [City] ADD CONSTRAINT [FK_State_City_StateID] FOREIGN KEY ([StateID]) REFERENCES [State] ([StateID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [State] ADD CONSTRAINT [FK_State_Country_CountryID] FOREIGN KEY ([CountryID]) REFERENCES [Country] ([CountryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trailer] ADD CONSTRAINT [FK_Movie_Trailer_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trailer] ADD CONSTRAINT [FK_TVShow_Trailer_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie_Screen] ADD CONSTRAINT [FK_Movie_Screen_Movie_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie_Screen] ADD CONSTRAINT [FK_Screen_Movie_Screen_ScreenID] FOREIGN KEY ([ScreenID]) REFERENCES [Screen] ([ScreenID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Ticket] ADD CONSTRAINT [FK_Seat_Ticket_SeatID] FOREIGN KEY ([SeatID]) REFERENCES [Seat] ([SeatID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Seat] ADD CONSTRAINT [FK_ScreenType_Seat_ScreenTypeID] FOREIGN KEY ([ScreenTypeID]) REFERENCES [SeatType] ([SeatTypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ShowTiming] ADD CONSTRAINT [FK_Screen_ShowTiming_ScreenID] FOREIGN KEY ([ScreenID]) REFERENCES [Screen] ([ScreenID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ShowTiming] ADD CONSTRAINT [FK_Movie_ShowTiming_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Seat] ADD CONSTRAINT [FK_Seat_Screen_ScreenID] FOREIGN KEY ([ScreenID]) REFERENCES [Screen] ([ScreenID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Screen] ADD CONSTRAINT [FK_Screen_Theater_TheaterID] FOREIGN KEY ([TheatreID]) REFERENCES [Theatre] ([TheatreID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_TVShow_Reviews_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Season_Reviews_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Episode_Reviews_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Critic_CriticID] FOREIGN KEY ([CriticID]) REFERENCES [Critic] ([CriticID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Organization_OrganizationID] FOREIGN KEY ([OrganizationID]) REFERENCES [Organization] ([OrganizationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_User_UserID] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Trailer_Reviews_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Movie_Reviews_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_Address_Movie_FilmingLocation] FOREIGN KEY ([FilmingLocation]) REFERENCES [Address] ([AddressID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_Certificate_Movie_CertificateID] FOREIGN KEY ([CertificateID]) REFERENCES [Certificate] ([CertificateID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_TechnicalSpecs_Movie_TechnicalSpecsID] FOREIGN KEY ([TechnicalSpecsID]) REFERENCES [TechnicalSpecs] ([TechnicalSpecsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_ParentGuide_Movie_ParentGuideID] FOREIGN KEY ([ParentGuideID]) REFERENCES [ParentGuide] ([ParentGuideID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episode] ADD CONSTRAINT [FK_Certificate_Episode_CertificateID] FOREIGN KEY ([CertificateID]) REFERENCES [Certificate] ([CertificateID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episode] ADD CONSTRAINT [FK_TechnicalSpecs_Episode_TechnicalSpecsID] FOREIGN KEY ([TechnicalSpecsID]) REFERENCES [TechnicalSpecs] ([TechnicalSpecsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episode] ADD CONSTRAINT [FK_ParentGuide_Episode_ParentGuideID] FOREIGN KEY ([ParentGuideID]) REFERENCES [ParentGuide] ([ParentGuideID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_Movie_NewsArticle_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_TVShow_NewsArticle_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_Season_NewsArticle_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_Trailer_NewsArticle_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_Episode_NewsArticle_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [NewsArticle] ADD CONSTRAINT [FK_Artist_NewsArticle_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Photo] ADD CONSTRAINT [FK_Movie_Photo_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episode] ADD CONSTRAINT [FK_Photo_Episode_PhotoID] FOREIGN KEY ([PhotoID]) REFERENCES [Photo] ([PhotoID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Photo] ADD CONSTRAINT [FK_Season_Photo_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Photo] ADD CONSTRAINT [FK_TVShow_Photo_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Photo] ADD CONSTRAINT [FK_Trailer_Photo_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Photo] ADD CONSTRAINT [FK_Artist_Photo_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_Movie_ReleaseDate_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_Trailer_ReleaseDate_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_Episode_ReleaseDate_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_Country_ReleaseDate_CountryID] FOREIGN KEY ([CountryID]) REFERENCES [Country] ([CountryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_Season_ReleaseDate_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReleaseDate] ADD CONSTRAINT [FK_TVShow_ReleaseDate_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_PlotKeyword_PlotKeyword_Bridge_PlotKeywordID] FOREIGN KEY ([PlotKeywordID]) REFERENCES [PlotKeyword] ([PlotKeywordID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trivia] ADD CONSTRAINT [FK_Trailer_Trivia_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trivia] ADD CONSTRAINT [FK_Movie_Trivia_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trivia] ADD CONSTRAINT [FK_Episode_Trivia_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trivia] ADD CONSTRAINT [FK_Season_Trivia_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trivia] ADD CONSTRAINT [FK_TVShow_Trivia_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_Episode_PlotKeyword_Bridge_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_Season_PlotKeyword_Bridge_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_TVShow_PlotKeyword_Bridge_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_Trailer_PlotKeyword_Bridge_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotKeyword_Bridge] ADD CONSTRAINT [FK_Movie_PlotKeyword_Bridge_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Nominee] ADD CONSTRAINT [FK_Award_Nominee_AwardID] FOREIGN KEY ([AwardID]) REFERENCES [Award] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [AwardCategory] ADD CONSTRAINT [FK_Award_AwardCategory_AwardID] FOREIGN KEY ([AwardID]) REFERENCES [Award] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Nominee] ADD CONSTRAINT [FK_Movie_Nominee_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Nominee] ADD CONSTRAINT [FK_TVShow_Nominee_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Nominee] ADD CONSTRAINT [PF_Artist_Nominee_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ProductionCompany_Bridge] ADD CONSTRAINT [FK_ProductionCompany_ProductionCompany_Bridge_ProductionCompanyID] FOREIGN KEY ([ProductionCompanyID]) REFERENCES [ProductionCompany] ([ProductionCompanyID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ProductionCompany_Bridge] ADD CONSTRAINT [FK_Movie_ProductionCompany_Bridge_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ProductionCompany_Bridge] ADD CONSTRAINT [FK_TVShow_ProductionCompany_Bridge_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Nominee] ADD CONSTRAINT [FK_Episode_Nominee_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReadBy] ADD CONSTRAINT [FK_User_ReadBy_UserID] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReadBy] ADD CONSTRAINT [FK_Reviews_ReadBy_ReviewID] FOREIGN KEY ([ReviewID]) REFERENCES [Reviews] ([ReviewID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoardReadBy] ADD CONSTRAINT [FK_User_MessageBoardReadBy_UserID] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReplyThread] ADD CONSTRAINT [FK_MessageBoard_ReplyThread_MessageBoardID] FOREIGN KEY ([MessageBoardID]) REFERENCES [MessageBoard] ([MessageBoardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ReplyThread] ADD CONSTRAINT [FK_Thread_ReplyThread_ReplyThreadID] FOREIGN KEY ([FK_ReplyThreadID]) REFERENCES [ReplyThread] ([ReplyThreadID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Comments] ADD CONSTRAINT [FK_ReplyThread_Comments_ReplyThreadID] FOREIGN KEY ([ReplyThreadID]) REFERENCES [ReplyThread] ([ReplyThreadID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoard] ADD CONSTRAINT [FK_Movie_MessageBoard_MovieII] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoard] ADD CONSTRAINT [FK_Episode_MessageBoard_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoard] ADD CONSTRAINT [FK_Season_MessageBoard_SeasonID] FOREIGN KEY ([SeasonID]) REFERENCES [Season] ([SeasonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoard] ADD CONSTRAINT [FK_TVShow_MessageBoard_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [MessageBoardReadBy] ADD CONSTRAINT [FK_MessageBoard_MessageBoardReadBy_MessageBoardID] FOREIGN KEY ([MessageBoardID]) REFERENCES [MessageBoard] ([MessageBoardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [User] ADD CONSTRAINT [FK_User_Person_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person] ([PersonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Critic] ADD CONSTRAINT [FK_Person_Critic_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person] ([PersonID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotSummary] ADD CONSTRAINT [FK_Movie_PlotSummary_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotSummary] ADD CONSTRAINT [FK_Episode_PlotSummary_EpisodeID] FOREIGN KEY ([EpisodeID]) REFERENCES [Episode] ([EpisodeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PlotSummary] ADD CONSTRAINT [FK_User_PlotSummary_UserID] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShow] ADD CONSTRAINT [FK_Country_TVShow_CountryID] FOREIGN KEY ([CountryID]) REFERENCES [Country] ([CountryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [BoxOffice] ADD CONSTRAINT [FK_BoxOfficeID_Movie_BoxOfficeID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_Language_Movie_LanguageID] FOREIGN KEY ([LanguageID]) REFERENCES [Language] ([LanguageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShow] ADD CONSTRAINT [FK_Language_TVShow_LanguageID] FOREIGN KEY ([LanguageID]) REFERENCES [Language] ([LanguageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movie] ADD CONSTRAINT [FK_Country_Movie_CountryID] FOREIGN KEY ([CountryID]) REFERENCES [Country] ([CountryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ListBridge] ADD CONSTRAINT [FK_Movie_ListBridge_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ListBridge] ADD CONSTRAINT [FK_TVShow_ListBridge_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ListBridge] ADD CONSTRAINT [FK_Artist_ListBridge_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [List] ADD CONSTRAINT [FK_User_List_UserID] FOREIGN KEY ([CreatedBy]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ListBridge] ADD CONSTRAINT [FK_List_ListBridge_ListID] FOREIGN KEY ([ListId]) REFERENCES [List] ([ListId]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollBridge] ADD CONSTRAINT [FK_Artist_PollBridge_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artist] ([ArtistID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollBridge] ADD CONSTRAINT [FK_Polls_PollBridge_PollID] FOREIGN KEY ([PollID]) REFERENCES [Polls] ([PollID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollBridge] ADD CONSTRAINT [FK_Movie_PollBridge_MOvieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie] ([MovieID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollBridge] ADD CONSTRAINT [FK_TVShow_PollBridge_TVShowID] FOREIGN KEY ([TVShowID]) REFERENCES [TVShow] ([TVShowID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollVote] ADD CONSTRAINT [PollBridge_PollVote_PollBridgeID] FOREIGN KEY ([PollBridgeID]) REFERENCES [PollBridge] ([PollBridgeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [PollVote] ADD CONSTRAINT [FK_User_PollVote_UserID] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Polls] ADD CONSTRAINT [FK_User_Polls_UserID] FOREIGN KEY ([CreatedBy]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



