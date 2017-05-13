/*
Created: 07-12-2016
Modified: 07-12-2016
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"(
  "MovieID" Integer NOT NULL,
  "IMDB Rating" Float,
  "Rating" Float,
  "Duration" Date,
  "Movie Description" Varchar2(1000 ),
  "Movie Name" Varchar2(1000 ),
  "Popularity" Float,
  "Release Date" Date,
  "MetaScore" Integer,
  "OfficialSite" Integer,
  "FilmingLocation" Integer,
  "CertificateID" Integer,
  "TechnicalSpecsID" Integer,
  "ParentGuideID" Integer,
  "StoryLine" Varchar2(1000 ),
  "LanguageID" Integer,
  "TagLine" Varchar2(2000 ),
  "CountryID" Integer
)
/

-- Create indexes for table Movie

CREATE INDEX "IX_Relationship46" ON "Movie" ("FilmingLocation")
/

CREATE INDEX "IX_Relationship1" ON "Movie" ("CertificateID")
/

CREATE INDEX "IX_Relationship2" ON "Movie" ("TechnicalSpecsID")
/

CREATE INDEX "IX_Relationship3" ON "Movie" ("ParentGuideID")
/

CREATE INDEX "IX_Relationship4" ON "Movie" ("LanguageID")
/

-- Add keys for table Movie

ALTER TABLE "Movie" ADD CONSTRAINT "Key1" PRIMARY KEY ("MovieID")
/

-- Table Award

CREATE TABLE "Award"(
  "AwardID" Integer NOT NULL,
  "Award Name" Varchar2(200 ),
  "Award Year" Integer
)
/

-- Add keys for table Award

ALTER TABLE "Award" ADD CONSTRAINT "Key2" PRIMARY KEY ("AwardID")
/

-- Table TVShow

CREATE TABLE "TVShow"(
  "TVShowID" Integer NOT NULL,
  "TV Show Name" Varchar2(1000 ),
  "Popularity" Float,
  "Rating" Float,
  "TV Show Description" Varchar2(1000 ),
  "StoryLine" Varchar2(1000 ),
  "CountryID" Integer NOT NULL,
  "LanguageID" Integer
)
/

-- Create indexes for table TVShow

CREATE INDEX "IX_Relationship2" ON "TVShow" ("CountryID")
/

CREATE INDEX "IX_Relationship5" ON "TVShow" ("LanguageID")
/

-- Add keys for table TVShow

ALTER TABLE "TVShow" ADD CONSTRAINT "Key3" PRIMARY KEY ("TVShowID")
/

-- Table Season

CREATE TABLE "Season"(
  "SeasonID" Integer NOT NULL,
  "SeasonNumber" Integer,
  "TVShowID" Integer NOT NULL,
  "StoryLine" Varchar2(1000 ),
  "Rating" Float
)
/

-- Create indexes for table Season

CREATE INDEX "IX_FK_Season_TVShow_TVShowID" ON "Season" ("TVShowID")
/

-- Add keys for table Season

ALTER TABLE "Season" ADD CONSTRAINT "Key4" PRIMARY KEY ("SeasonID")
/

-- Table Episode

CREATE TABLE "Episode"(
  "EpisodeName" Clob,
  "EpisodeID" Integer NOT NULL,
  "SeasonID" Integer NOT NULL,
  "CertificateID" Integer,
  "TechnicalSpecsID" Integer,
  "ParentGuideID" Integer,
  "PhotoID" Integer,
  "StoryLine" Varchar2(1000 ),
  "AvailableOnAmazonPrime" Raw(1),
  "Rating" Float
)
/

-- Create indexes for table Episode

CREATE INDEX "IX_FK_Episode_Season_SeasonID" ON "Episode" ("SeasonID")
/

CREATE INDEX "IX_Relationship4" ON "Episode" ("CertificateID")
/

CREATE INDEX "IX_Relationship5" ON "Episode" ("TechnicalSpecsID")
/

CREATE INDEX "IX_Relationship6" ON "Episode" ("ParentGuideID")
/

CREATE INDEX "IX_Relationship7" ON "Episode" ("PhotoID")
/

-- Add keys for table Episode

ALTER TABLE "Episode" ADD CONSTRAINT "Key5" PRIMARY KEY ("EpisodeID")
/

-- Table Genre

CREATE TABLE "Genre"(
  "GenreID" Integer NOT NULL,
  "Genre Name" Varchar2(200 )
)
/

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "Key6" PRIMARY KEY ("GenreID")
/

-- Table Movie_Genre

CREATE TABLE "Movie_Genre"(
  "Movie_GenreID" Integer NOT NULL,
  "GenreID" Integer NOT NULL,
  "MovieID" Integer NOT NULL
)
/

-- Create indexes for table Movie_Genre

CREATE INDEX "IX_FK_Genre_Movie_Genre_GenreID" ON "Movie_Genre" ("GenreID")
/

CREATE INDEX "IX_FK_Movie_Movie_Genre_MovieID" ON "Movie_Genre" ("MovieID")
/

-- Add keys for table Movie_Genre

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "Key7" PRIMARY KEY ("Movie_GenreID")
/

-- Table Trailer

CREATE TABLE "Trailer"(
  "TrailerID" Integer NOT NULL,
  "Trailer Name" Varchar2(100 ),
  "Trailer Description" Clob,
  "Duration" Date,
  "Release Date" Date,
  "TrailerVideo" Raw(1000),
  "MovieID" Integer,
  "TVShowID" Integer,
  "Rating" Float
)
/

-- Create indexes for table Trailer

CREATE INDEX "IX_Relationship23" ON "Trailer" ("MovieID")
/

CREATE INDEX "IX_Relationship24" ON "Trailer" ("TVShowID")
/

-- Add keys for table Trailer

ALTER TABLE "Trailer" ADD CONSTRAINT "Key8" PRIMARY KEY ("TrailerID")
/

-- Table Photo

CREATE TABLE "Photo"(
  "PhotoID" Integer NOT NULL,
  "Photo Name" Varchar2(200 ),
  "Photo Size" Float,
  "Photo" Long raw,
  "MovieID" Integer,
  "SeasonID" Integer,
  "TVShowID" Integer,
  "TrailerID" Integer,
  "ArtistID" Integer
)
/

-- Create indexes for table Photo

CREATE INDEX "IX_Relationship3" ON "Photo" ("MovieID")
/

CREATE INDEX "IX_Relationship6" ON "Photo" ("SeasonID")
/

CREATE INDEX "IX_Relationship7" ON "Photo" ("TVShowID")
/

CREATE INDEX "IX_Relationship8" ON "Photo" ("TrailerID")
/

CREATE INDEX "IX_Relationship9" ON "Photo" ("ArtistID")
/

-- Add keys for table Photo

ALTER TABLE "Photo" ADD CONSTRAINT "Key9" PRIMARY KEY ("PhotoID")
/

-- Table Theatre

CREATE TABLE "Theatre"(
  "TheatreName" Varchar2(200 ),
  "TheatreID" Integer NOT NULL,
  "Number of Screens" Integer,
  "Theatre Rating" Float
)
/

-- Add keys for table Theatre

ALTER TABLE "Theatre" ADD CONSTRAINT "Key10" PRIMARY KEY ("TheatreID")
/

-- Table Screen

CREATE TABLE "Screen"(
  "ScreenID" Integer NOT NULL,
  "ScreenNumber" Varchar2(10 ),
  "TheatreID" Integer NOT NULL
)
/

-- Create indexes for table Screen

CREATE INDEX "IX_FK_Screen_Theater_TheaterID" ON "Screen" ("TheatreID")
/

-- Add keys for table Screen

ALTER TABLE "Screen" ADD CONSTRAINT "Key11" PRIMARY KEY ("ScreenID")
/

-- Table Seat

CREATE TABLE "Seat"(
  "SeatID" Integer NOT NULL,
  "Seat Number" Varchar2(10 ),
  "ScreenTypeID" Integer,
  "ScreenID" Integer NOT NULL
)
/

-- Create indexes for table Seat

CREATE INDEX "IX_Relationship30" ON "Seat" ("ScreenTypeID")
/

CREATE INDEX "IX_FK_Seat_Screen_ScreenID" ON "Seat" ("ScreenID")
/

-- Add keys for table Seat

ALTER TABLE "Seat" ADD CONSTRAINT "Key12" PRIMARY KEY ("SeatID")
/

-- Table Ticket

CREATE TABLE "Ticket"(
  "TicketID" Integer NOT NULL,
  "Cost" Float,
  "SeatID" Integer
)
/

-- Create indexes for table Ticket

CREATE INDEX "IX_Relationship29" ON "Ticket" ("SeatID")
/

-- Add keys for table Ticket

ALTER TABLE "Ticket" ADD CONSTRAINT "Key13" PRIMARY KEY ("TicketID")
/

-- Table Movie_Screen

CREATE TABLE "Movie_Screen"(
  "Movie_ScreenID" Integer NOT NULL,
  "TimeStamp" Timestamp(9),
  "MovieID" Integer NOT NULL,
  "ScreenID" Integer NOT NULL
)
/

-- Create indexes for table Movie_Screen

CREATE INDEX "IX_FK_Movie_Screen_Movie_MovieID" ON "Movie_Screen" ("MovieID")
/

CREATE INDEX "IX_FK_Screen_Movie_Screen_ScreenID" ON "Movie_Screen" ("ScreenID")
/

-- Add keys for table Movie_Screen

ALTER TABLE "Movie_Screen" ADD CONSTRAINT "Key15" PRIMARY KEY ("Movie_ScreenID")
/

-- Table ShowTiming

CREATE TABLE "ShowTiming"(
  "ShowTimingID" Integer NOT NULL,
  "ShowDate" Date,
  "ShowTime" Date,
  "ScreenID" Integer,
  "MovieID" Integer
)
/

-- Create indexes for table ShowTiming

CREATE INDEX "IX_Relationship31" ON "ShowTiming" ("ScreenID")
/

CREATE INDEX "IX_Relationship33" ON "ShowTiming" ("MovieID")
/

-- Add keys for table ShowTiming

ALTER TABLE "ShowTiming" ADD CONSTRAINT "Key16" PRIMARY KEY ("ShowTimingID")
/

-- Table Cast

CREATE TABLE "Cast"(
  "CastID" Integer NOT NULL,
  "MovieID" Integer NOT NULL,
  "EpisodeID" Integer NOT NULL,
  "ArtistID" Integer NOT NULL
)
/

-- Create indexes for table Cast

CREATE INDEX "IX_FK_Episode_Cast_EpisodeID" ON "Cast" ("EpisodeID")
/

CREATE INDEX "IX_FK_Cast_Artist_ArtistID" ON "Cast" ("ArtistID")
/

CREATE INDEX "IX_FK_Movie_Cast_MovieID" ON "Cast" ("MovieID")
/

-- Add keys for table Cast

ALTER TABLE "Cast" ADD CONSTRAINT "Key18" PRIMARY KEY ("CastID")
/

-- Table Artist

CREATE TABLE "Artist"(
  "ArtistID" Integer NOT NULL,
  "ArtistDescription" Varchar2(1000 ),
  "Height" Float,
  "NickName" Varchar2(100 ),
  "BirthName" Varchar2(50 ),
  "SSN" Varchar2(50 ),
  "FirstName" Varchar2(50 ),
  "LastName" Varchar2(50 ),
  "MiddleName" Varchar2(50 ),
  "Age" Integer,
  "Gender" Varchar2(10 ),
  "PlaceOfBirth" Varchar2(100 ),
  "DateOfBirth" Date,
  "DateOfDeath" Date,
  "ArtistTypeID" Integer NOT NULL
)
/

-- Create indexes for table Artist

CREATE INDEX "IX_FK_Artistype_Artist_ArtistTypeID" ON "Artist" ("ArtistTypeID")
/

-- Add keys for table Artist

ALTER TABLE "Artist" ADD CONSTRAINT "Key19" PRIMARY KEY ("ArtistID")
/

-- Table ArtistType

CREATE TABLE "ArtistType"(
  "ArtistTypeID" Integer NOT NULL,
  "ArtistType" Varchar2(100 )
)
/

-- Add keys for table ArtistType

ALTER TABLE "ArtistType" ADD CONSTRAINT "Key20" PRIMARY KEY ("ArtistTypeID")
/

-- Table User

CREATE TABLE "User"(
  "UserID" Integer NOT NULL,
  "UserName" Varchar2(50 ),
  "Password" Varchar2(50 ),
  "Email" Varchar2(50 ),
  "PersonID" Integer
)
/

-- Create indexes for table User

CREATE INDEX "IX_Relationship17" ON "User" ("PersonID")
/

-- Add keys for table User

ALTER TABLE "User" ADD CONSTRAINT "Key22" PRIMARY KEY ("UserID")
/

-- Table Critic

CREATE TABLE "Critic"(
  "CriticID" Integer NOT NULL,
  "CriticDescription" Clob,
  "PersonID" Integer
)
/

-- Create indexes for table Critic

CREATE INDEX "IX_Relationship18" ON "Critic" ("PersonID")
/

-- Add keys for table Critic

ALTER TABLE "Critic" ADD CONSTRAINT "Key23" PRIMARY KEY ("CriticID")
/

-- Table Organization

CREATE TABLE "Organization"(
  "OrganizationID" Integer NOT NULL,
  "Organization Description" Clob,
  "Organization Name" Varchar2(100 )
)
/

-- Add keys for table Organization

ALTER TABLE "Organization" ADD CONSTRAINT "Key24" PRIMARY KEY ("OrganizationID")
/

-- Table Reviews

CREATE TABLE "Reviews"(
  "ReviewID" Integer NOT NULL,
  "Review" Varchar2(1000 ),
  "TVShowID" Integer NOT NULL,
  "SeasonID" Integer NOT NULL,
  "EpisodeID" Integer NOT NULL,
  "CriticID" Integer,
  "OrganizationID" Integer,
  "UserID" Integer NOT NULL,
  "TrailerID" Integer NOT NULL,
  "MovieID" Integer NOT NULL,
  "UserRating" Float
)
/

-- Create indexes for table Reviews

CREATE INDEX "IX_FK_Season_Reviews_SeasonID" ON "Reviews" ("SeasonID")
/

CREATE INDEX "IX_FK_TVShow_Reviews_TVShowID" ON "Reviews" ("TVShowID")
/

CREATE INDEX "IX_Relationship38" ON "Reviews" ("EpisodeID")
/

CREATE INDEX "IX_Relationship40" ON "Reviews" ("CriticID")
/

CREATE INDEX "IX_Relationship41" ON "Reviews" ("OrganizationID")
/

CREATE INDEX "IX_FK_Trailer_Reviews_TrailerID" ON "Reviews" ("TrailerID")
/

CREATE INDEX "IX_FK_Movie_Reviews_MovieID" ON "Reviews" ("MovieID")
/

CREATE INDEX "IX_FK_Reviews_User_UserID" ON "Reviews" ("UserID")
/

-- Add keys for table Reviews

ALTER TABLE "Reviews" ADD CONSTRAINT "Key25" PRIMARY KEY ("ReviewID")
/

-- Table Address

CREATE TABLE "Address"(
  "AddressID" Integer NOT NULL,
  "Address Line1" Varchar2(500 ),
  "Address Line2" Varchar2(500 ),
  "Zip Code" Integer,
  "AddressTypeID" Integer NOT NULL,
  "CityID" Integer
)
/

-- Create indexes for table Address

CREATE INDEX "IX_Relationship19" ON "Address" ("CityID")
/

CREATE INDEX "IX_FK_Address_AddressType_AddressTypeID" ON "Address" ("AddressTypeID")
/

-- Add keys for table Address

ALTER TABLE "Address" ADD CONSTRAINT "Key26" PRIMARY KEY ("AddressID")
/

-- Table Artist_Address

CREATE TABLE "Artist_Address"(
  "Artist_AddressID" Integer NOT NULL,
  "ArtistID" Integer NOT NULL,
  "AddressID" Integer NOT NULL
)
/

-- Create indexes for table Artist_Address

CREATE INDEX "IX_FK_ArtistID_Artist_Address_ArtistID" ON "Artist_Address" ("ArtistID")
/

CREATE INDEX "IX_FK_Address_Artist_Address_AddressID" ON "Artist_Address" ("AddressID")
/

-- Add keys for table Artist_Address

ALTER TABLE "Artist_Address" ADD CONSTRAINT "Key27" PRIMARY KEY ("Artist_AddressID")
/

-- Table AddressType

CREATE TABLE "AddressType"(
  "AddressTypeID" Integer NOT NULL,
  "AddressType Name" Varchar2(200 )
)
/

-- Add keys for table AddressType

ALTER TABLE "AddressType" ADD CONSTRAINT "Key28" PRIMARY KEY ("AddressTypeID")
/

-- Table City

CREATE TABLE "City"(
  "CityID" Integer NOT NULL,
  "City Name" Char(100 ),
  "StateID" Integer
)
/

-- Create indexes for table City

CREATE INDEX "IX_Relationship20" ON "City" ("StateID")
/

-- Add keys for table City

ALTER TABLE "City" ADD CONSTRAINT "Key29" PRIMARY KEY ("CityID")
/

-- Table State

CREATE TABLE "State"(
  "StateID" Integer NOT NULL,
  "State Name" Varchar2(100 ),
  "CountryID" Integer
)
/

-- Create indexes for table State

CREATE INDEX "IX_Relationship21" ON "State" ("CountryID")
/

-- Add keys for table State

ALTER TABLE "State" ADD CONSTRAINT "Key30" PRIMARY KEY ("StateID")
/

-- Table Country

CREATE TABLE "Country"(
  "CountryID" Integer NOT NULL,
  "Country Name" Char(100 )
)
/

-- Add keys for table Country

ALTER TABLE "Country" ADD CONSTRAINT "Key31" PRIMARY KEY ("CountryID")
/

-- Table TradeMark

CREATE TABLE "TradeMark"(
  "TradeMarkID" Integer NOT NULL,
  "TradeMark Description" Varchar2(1000 )
)
/

-- Add keys for table TradeMark

ALTER TABLE "TradeMark" ADD CONSTRAINT "Key32" PRIMARY KEY ("TradeMarkID")
/

-- Table SeatType

CREATE TABLE "SeatType"(
  "SeatTypeID" Integer NOT NULL,
  "SeatType Name" Varchar2(100 )
)
/

-- Add keys for table SeatType

ALTER TABLE "SeatType" ADD CONSTRAINT "Key33" PRIMARY KEY ("SeatTypeID")
/

-- Table Artist_TradeMark

CREATE TABLE "Artist_TradeMark"(
  "Artist_TradeMark_ID" Integer NOT NULL,
  "ArtistID" Integer NOT NULL,
  "TradeMarkID" Integer NOT NULL
)
/

-- Create indexes for table Artist_TradeMark

CREATE INDEX "IX_FK_TradeMark_Artist_TradeMark_TradeMarkID" ON "Artist_TradeMark" ("TradeMarkID")
/

CREATE INDEX "IX_FK_Artist_Artist_TradeMark_AtistID" ON "Artist_TradeMark" ("ArtistID")
/

-- Add keys for table Artist_TradeMark

ALTER TABLE "Artist_TradeMark" ADD CONSTRAINT "Key34" PRIMARY KEY ("Artist_TradeMark_ID")
/

-- Table BoxOffice

CREATE TABLE "BoxOffice"(
  "BoxOfficeID" Integer NOT NULL,
  "Budget" Float,
  "OpeningWeek" Float,
  "Gross" Float,
  "MovieID" Integer NOT NULL,
  "Type" Varchar2(100 ),
  "Date" Date
)
/

-- Create indexes for table BoxOffice

CREATE INDEX "IX_Relationship3" ON "BoxOffice" ("MovieID")
/

-- Add keys for table BoxOffice

ALTER TABLE "BoxOffice" ADD CONSTRAINT "Key35" PRIMARY KEY ("BoxOfficeID")
/

-- Table ParentGuide

CREATE TABLE "ParentGuide"(
  "ParentGuideID" Integer NOT NULL,
  "Voilance_Gore" Integer,
  "Sex_Nudity" Integer,
  "Profanity" Integer,
  "Alchol_Drugs_Smoking" Integer,
  "Frightninig_IntenseScene" Integer
)
/

-- Add keys for table ParentGuide

ALTER TABLE "ParentGuide" ADD CONSTRAINT "Key36" PRIMARY KEY ("ParentGuideID")
/

-- Table TechnicalSpecs

CREATE TABLE "TechnicalSpecs"(
  "TechnicalSpecsID" Integer NOT NULL,
  "SoundMix" Raw(200),
  "Color" Varchar2(200 ),
  "AspectRatio" Raw(200)
)
/

-- Add keys for table TechnicalSpecs

ALTER TABLE "TechnicalSpecs" ADD CONSTRAINT "Key37" PRIMARY KEY ("TechnicalSpecsID")
/

-- Table Certificate

CREATE TABLE "Certificate"(
  "CertificateID" Integer NOT NULL,
  "CertificateName" Varchar2(100 )
)
/

-- Add keys for table Certificate

ALTER TABLE "Certificate" ADD CONSTRAINT "Key38" PRIMARY KEY ("CertificateID")
/

-- Table NewsArticle

CREATE TABLE "NewsArticle"(
  "NewsArticleID" Integer NOT NULL,
  "Article" Clob,
  "MovieID" Integer,
  "TVShowID" Integer,
  "SeasonID" Integer,
  "TrailerID" Integer,
  "EpisodeID" Integer,
  "ArtistID" Integer
)
/

-- Create indexes for table NewsArticle

CREATE INDEX "IX_Relationship10" ON "NewsArticle" ("MovieID")
/

CREATE INDEX "IX_Relationship12" ON "NewsArticle" ("TVShowID")
/

CREATE INDEX "IX_Relationship13" ON "NewsArticle" ("SeasonID")
/

CREATE INDEX "IX_Relationship14" ON "NewsArticle" ("TrailerID")
/

CREATE INDEX "IX_Relationship1" ON "NewsArticle" ("EpisodeID")
/

CREATE INDEX "IX_Relationship2" ON "NewsArticle" ("ArtistID")
/

-- Add keys for table NewsArticle

ALTER TABLE "NewsArticle" ADD CONSTRAINT "Key39" PRIMARY KEY ("NewsArticleID")
/

-- Table ReleaseDate

CREATE TABLE "ReleaseDate"(
  "ReleaseDateID" Integer NOT NULL,
  "ReleaseDate" Date,
  "MovieID" Integer,
  "TrailerID" Integer NOT NULL,
  "EpisodeID" Integer,
  "CountryID" Integer,
  "SeasonID" Integer,
  "TVShowID" Integer
)
/

-- Create indexes for table ReleaseDate

CREATE INDEX "IX_Relationship10" ON "ReleaseDate" ("MovieID")
/

CREATE INDEX "IX_Relationship12" ON "ReleaseDate" ("EpisodeID")
/

CREATE INDEX "IX_Relationship13" ON "ReleaseDate" ("CountryID")
/

CREATE INDEX "IX_Relationship14" ON "ReleaseDate" ("SeasonID")
/

CREATE INDEX "IX_Relationship15" ON "ReleaseDate" ("TVShowID")
/

CREATE INDEX "IX_FK_Trailer_ReleaseDate_TrailerID" ON "ReleaseDate" ("TrailerID")
/

-- Add keys for table ReleaseDate

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "Key41" PRIMARY KEY ("ReleaseDateID")
/

-- Table PlotKeyword

CREATE TABLE "PlotKeyword"(
  "PlotKeywordID" Integer NOT NULL,
  "Plot Keyword" Varchar2(200 )
)
/

-- Add keys for table PlotKeyword

ALTER TABLE "PlotKeyword" ADD CONSTRAINT "Key43" PRIMARY KEY ("PlotKeywordID")
/

-- Table Trivia

CREATE TABLE "Trivia"(
  "TriviaID" Integer NOT NULL,
  "Trivia" Clob,
  "TrailerID" Integer,
  "MovieID" Integer,
  "EpisodeID" Integer,
  "SeasonID" Integer,
  "TVShowID" Integer
)
/

-- Create indexes for table Trivia

CREATE INDEX "IX_Relationship3" ON "Trivia" ("TrailerID")
/

CREATE INDEX "IX_Relationship4" ON "Trivia" ("MovieID")
/

CREATE INDEX "IX_Relationship5" ON "Trivia" ("EpisodeID")
/

CREATE INDEX "IX_Relationship6" ON "Trivia" ("SeasonID")
/

CREATE INDEX "IX_Relationship7" ON "Trivia" ("TVShowID")
/

-- Add keys for table Trivia

ALTER TABLE "Trivia" ADD CONSTRAINT "Key44" PRIMARY KEY ("TriviaID")
/

-- Table PlotKeyword_Bridge

CREATE TABLE "PlotKeyword_Bridge"(
  "PlotKeyword_BridgeID" Integer NOT NULL,
  "PlotKeywordID" Integer NOT NULL,
  "EpisodeID" Integer,
  "SeasonID" Integer,
  "TVShowID" Integer,
  "TrailerID" Integer,
  "MovieID" Integer
)
/

-- Create indexes for table PlotKeyword_Bridge

CREATE INDEX "IX_Relationship9" ON "PlotKeyword_Bridge" ("EpisodeID")
/

CREATE INDEX "IX_Relationship10" ON "PlotKeyword_Bridge" ("SeasonID")
/

CREATE INDEX "IX_Relationship11" ON "PlotKeyword_Bridge" ("TVShowID")
/

CREATE INDEX "IX_Relationship12" ON "PlotKeyword_Bridge" ("TrailerID")
/

CREATE INDEX "IX_Relationship13" ON "PlotKeyword_Bridge" ("MovieID")
/

-- Add keys for table PlotKeyword_Bridge

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "Key45" PRIMARY KEY ("PlotKeyword_BridgeID","PlotKeywordID")
/

-- Table Nominee

CREATE TABLE "Nominee"(
  "NomineeID" Integer NOT NULL,
  "AwardID" Integer,
  "IsWinner" Varchar2(1 ),
  "MovieID" Integer,
  "TVShowID" Integer,
  "ArtistID" Integer,
  "EpisodeID" Integer
)
/

-- Create indexes for table Nominee

CREATE INDEX "IX_Relationship18" ON "Nominee" ("AwardID")
/

CREATE INDEX "IX_Relationship21" ON "Nominee" ("MovieID")
/

CREATE INDEX "IX_Relationship22" ON "Nominee" ("TVShowID")
/

CREATE INDEX "IX_Relationship23" ON "Nominee" ("ArtistID")
/

CREATE INDEX "IX_Relationship4" ON "Nominee" ("EpisodeID")
/

-- Add keys for table Nominee

ALTER TABLE "Nominee" ADD CONSTRAINT "Key46" PRIMARY KEY ("NomineeID")
/

-- Table AwardCategory

CREATE TABLE "AwardCategory"(
  "AwardCategoryID" Integer NOT NULL,
  "Award Category Name" Varchar2(200 ),
  "AwardID" Integer
)
/

-- Create indexes for table AwardCategory

CREATE INDEX "IX_Relationship20" ON "AwardCategory" ("AwardID")
/

-- Add keys for table AwardCategory

ALTER TABLE "AwardCategory" ADD CONSTRAINT "Key47" PRIMARY KEY ("AwardCategoryID")
/

-- Table ProductionCompany

CREATE TABLE "ProductionCompany"(
  "ProductionCompanyID" Integer NOT NULL,
  "ProductionCompanyName" Varchar2(100 )
)
/

-- Add keys for table ProductionCompany

ALTER TABLE "ProductionCompany" ADD CONSTRAINT "Key48" PRIMARY KEY ("ProductionCompanyID")
/

-- Table ProductionCompany_Bridge

CREATE TABLE "ProductionCompany_Bridge"(
  "ProductionCompany_Bridge_ID" Integer NOT NULL,
  "ProductionCompanyID" Integer,
  "MovieID" Integer,
  "TVShowID" Integer
)
/

-- Create indexes for table ProductionCompany_Bridge

CREATE INDEX "IX_Relationship1" ON "ProductionCompany_Bridge" ("ProductionCompanyID")
/

CREATE INDEX "IX_Relationship2" ON "ProductionCompany_Bridge" ("MovieID")
/

CREATE INDEX "IX_Relationship3" ON "ProductionCompany_Bridge" ("TVShowID")
/

-- Add keys for table ProductionCompany_Bridge

ALTER TABLE "ProductionCompany_Bridge" ADD CONSTRAINT "Key49" PRIMARY KEY ("ProductionCompany_Bridge_ID")
/

-- Table ReadBy

CREATE TABLE "ReadBy"(
  "ReadByID" Integer NOT NULL,
  "InterestFlag" Raw(1),
  "UserID" Integer,
  "ReviewID" Integer
)
/

-- Create indexes for table ReadBy

CREATE INDEX "IX_Relationship5" ON "ReadBy" ("UserID")
/

CREATE INDEX "IX_Relationship6" ON "ReadBy" ("ReviewID")
/

-- Add keys for table ReadBy

ALTER TABLE "ReadBy" ADD CONSTRAINT "Key50" PRIMARY KEY ("ReadByID")
/

-- Table MessageBoardReadBy

CREATE TABLE "MessageBoardReadBy"(
  "ReadByID" Integer,
  "InterestFlag" Raw(1),
  "UserID" Integer,
  "MessageBoardID" Integer
)
/

-- Create indexes for table MessageBoardReadBy

CREATE INDEX "IX_Relationship8" ON "MessageBoardReadBy" ("UserID")
/

CREATE INDEX "IX_Relationship16" ON "MessageBoardReadBy" ("MessageBoardID")
/

-- Table MessageBoard

CREATE TABLE "MessageBoard"(
  "MessageBoardID" Integer NOT NULL,
  "MovieID" Integer,
  "EpisodeID" Integer,
  "SeasonID" Integer,
  "TVShowID" Integer
)
/

-- Create indexes for table MessageBoard

CREATE INDEX "IX_Relationship12" ON "MessageBoard" ("MovieID")
/

CREATE INDEX "IX_Relationship13" ON "MessageBoard" ("EpisodeID")
/

CREATE INDEX "IX_Relationship14" ON "MessageBoard" ("SeasonID")
/

CREATE INDEX "IX_Relationship15" ON "MessageBoard" ("TVShowID")
/

-- Add keys for table MessageBoard

ALTER TABLE "MessageBoard" ADD CONSTRAINT "Key52" PRIMARY KEY ("MessageBoardID")
/

-- Table ReplyThread

CREATE TABLE "ReplyThread"(
  "ReplyThreadID" Integer NOT NULL,
  "Message" Varchar2(1000 ),
  "DateTime" Date,
  "MessageBoardID" Integer,
  "FK_ReplyThreadID" Integer
)
/

-- Create indexes for table ReplyThread

CREATE INDEX "IX_Relationship9" ON "ReplyThread" ("MessageBoardID")
/

CREATE INDEX "IX_Relationship10" ON "ReplyThread" ("FK_ReplyThreadID")
/

-- Add keys for table ReplyThread

ALTER TABLE "ReplyThread" ADD CONSTRAINT "Key53" PRIMARY KEY ("ReplyThreadID")
/

-- Table Comments

CREATE TABLE "Comments"(
  "CommentID" Integer NOT NULL,
  "Comment" Varchar2(1000 ),
  "DateTime" Date,
  "ReplyThreadID" Integer
)
/

-- Create indexes for table Comments

CREATE INDEX "IX_Relationship11" ON "Comments" ("ReplyThreadID")
/

-- Add keys for table Comments

ALTER TABLE "Comments" ADD CONSTRAINT "Key54" PRIMARY KEY ("CommentID")
/

-- Table Person

CREATE TABLE "Person"(
  "PersonID" Integer NOT NULL,
  "SSN" Varchar2(100 ),
  "FirstName" Varchar2(100 ),
  "LastName" Varchar2(100 ),
  "MiddleName" Varchar2(100 ),
  "Age" Integer,
  "Gender" Varchar2(10 )
)
/

-- Add keys for table Person

ALTER TABLE "Person" ADD CONSTRAINT "Key55" PRIMARY KEY ("PersonID")
/

-- Table PlotSummary

CREATE TABLE "PlotSummary"(
  "PlotSummaryID" Integer NOT NULL,
  "PlotSummary" Varchar2(1000 ),
  "MovieID" Integer,
  "EpisodeID" Integer,
  "UserID" Integer NOT NULL
)
/

-- Create indexes for table PlotSummary

CREATE INDEX "IX_Relationship2" ON "PlotSummary" ("MovieID")
/

CREATE INDEX "IX_Relationship3" ON "PlotSummary" ("EpisodeID")
/

CREATE INDEX "IX_Relationship4" ON "PlotSummary" ("UserID")
/

-- Add keys for table PlotSummary

ALTER TABLE "PlotSummary" ADD CONSTRAINT "Key56" PRIMARY KEY ("PlotSummaryID")
/

-- Table Language

CREATE TABLE "Language"(
  "LanguageID" Integer NOT NULL,
  "Language" Varchar2(100 )
)
/

-- Add keys for table Language

ALTER TABLE "Language" ADD CONSTRAINT "Key57" PRIMARY KEY ("LanguageID")
/

-- Table List

CREATE TABLE "List"(
  "ListId" Integer NOT NULL,
  "ListName" Varchar2(1000 ),
  "ListDescription" Varchar2(1000 ),
  "CreatedBy" Integer
)
/

-- Create indexes for table List

CREATE INDEX "IX_Relationship5" ON "List" ("CreatedBy")
/

-- Add keys for table List

ALTER TABLE "List" ADD CONSTRAINT "Key58" PRIMARY KEY ("ListId")
/

-- Table ListBridge

CREATE TABLE "ListBridge"(
  "ListBridgeID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ArtistID" Integer,
  "ListId" Integer
)
/

-- Create indexes for table ListBridge

CREATE INDEX "IX_Relationship2" ON "ListBridge" ("MovieID")
/

CREATE INDEX "IX_Relationship3" ON "ListBridge" ("TVShowID")
/

CREATE INDEX "IX_Relationship4" ON "ListBridge" ("ArtistID")
/

CREATE INDEX "IX_Relationship6" ON "ListBridge" ("ListId")
/

-- Add keys for table ListBridge

ALTER TABLE "ListBridge" ADD CONSTRAINT "Key59" PRIMARY KEY ("ListBridgeID")
/

-- Table Polls

CREATE TABLE "Polls"(
  "PollID" Integer NOT NULL,
  "PollName" Varchar2(1000 ),
  "PollDiscription" Long raw,
  "CreatedBy" Integer
)
/

-- Create indexes for table Polls

CREATE INDEX "IX_Relationship13" ON "Polls" ("CreatedBy")
/

-- Add keys for table Polls

ALTER TABLE "Polls" ADD CONSTRAINT "Key60" PRIMARY KEY ("PollID")
/

-- Table PollBridge

CREATE TABLE "PollBridge"(
  "PollBridgeID" Integer NOT NULL,
  "VoteCount" Integer,
  "ArtistID" Integer,
  "PollID" Integer,
  "MovieID" Integer,
  "TVShowID" Integer
)
/

-- Create indexes for table PollBridge

CREATE INDEX "IX_Relationship7" ON "PollBridge" ("ArtistID")
/

CREATE INDEX "IX_Relationship8" ON "PollBridge" ("PollID")
/

CREATE INDEX "IX_Relationship9" ON "PollBridge" ("MovieID")
/

CREATE INDEX "IX_Relationship10" ON "PollBridge" ("TVShowID")
/

-- Add keys for table PollBridge

ALTER TABLE "PollBridge" ADD CONSTRAINT "Key61" PRIMARY KEY ("PollBridgeID")
/

-- Table PollVote

CREATE TABLE "PollVote"(
  "PollVoteID" Integer NOT NULL,
  "PollBridgeID" Integer,
  "UserID" Integer
)
/

-- Create indexes for table PollVote

CREATE INDEX "IX_Relationship11" ON "PollVote" ("PollBridgeID")
/

CREATE INDEX "IX_Relationship12" ON "PollVote" ("UserID")
/

-- Add keys for table PollVote

ALTER TABLE "PollVote" ADD CONSTRAINT "Key62" PRIMARY KEY ("PollVoteID")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Polls" ADD CONSTRAINT "FK_User_Polls_UserID" FOREIGN KEY ("CreatedBy") REFERENCES "User" ("UserID")
/

ALTER TABLE "PollVote" ADD CONSTRAINT "FK_User_PollVote_UserID" FOREIGN KEY ("UserID") REFERENCES "User" ("UserID")
/

ALTER TABLE "PollVote" ADD CONSTRAINT "PollBridge_PollVote_PollBridgeID" FOREIGN KEY ("PollBridgeID") REFERENCES "PollBridge" ("PollBridgeID")
/

ALTER TABLE "PollBridge" ADD CONSTRAINT "FK_TVShow_PollBridge_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "PollBridge" ADD CONSTRAINT "FK_Movie_PollBridge_MOvieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "PollBridge" ADD CONSTRAINT "FK_Polls_PollBridge_PollID" FOREIGN KEY ("PollID") REFERENCES "Polls" ("PollID")
/

ALTER TABLE "PollBridge" ADD CONSTRAINT "FK_Artist_PollBridge_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "ListBridge" ADD CONSTRAINT "FK_List_ListBridge_ListID" FOREIGN KEY ("ListId") REFERENCES "List" ("ListId")
/

ALTER TABLE "List" ADD CONSTRAINT "FK_User_List_UserID" FOREIGN KEY ("CreatedBy") REFERENCES "User" ("UserID")
/

ALTER TABLE "ListBridge" ADD CONSTRAINT "FK_Artist_ListBridge_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "ListBridge" ADD CONSTRAINT "FK_TVShow_ListBridge_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "ListBridge" ADD CONSTRAINT "FK_Movie_ListBridge_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_Country_Movie_CountryID" FOREIGN KEY ("CountryID") REFERENCES "Country" ("CountryID")
/

ALTER TABLE "TVShow" ADD CONSTRAINT "FK_Language_TVShow_LanguageID" FOREIGN KEY ("LanguageID") REFERENCES "Language" ("LanguageID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_Language_Movie_LanguageID" FOREIGN KEY ("LanguageID") REFERENCES "Language" ("LanguageID")
/

ALTER TABLE "BoxOffice" ADD CONSTRAINT "FK_BoxOfficeID_Movie_BoxOfficeID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "TVShow" ADD CONSTRAINT "FK_Country_TVShow_CountryID" FOREIGN KEY ("CountryID") REFERENCES "Country" ("CountryID")
/

ALTER TABLE "PlotSummary" ADD CONSTRAINT "FK_User_PlotSummary_UserID" FOREIGN KEY ("UserID") REFERENCES "User" ("UserID")
/

ALTER TABLE "PlotSummary" ADD CONSTRAINT "FK_Episode_PlotSummary_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "PlotSummary" ADD CONSTRAINT "FK_Movie_PlotSummary_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Critic" ADD CONSTRAINT "FK_Person_Critic_PersonID" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "User" ADD CONSTRAINT "FK_User_Person_PersonID" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "MessageBoardReadBy" ADD CONSTRAINT "FK_MessageBoard_MessageBoardReadBy_MessageBoardID" FOREIGN KEY ("MessageBoardID") REFERENCES "MessageBoard" ("MessageBoardID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "FK_TVShow_MessageBoard_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "FK_Season_MessageBoard_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "FK_Episode_MessageBoard_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "FK_Movie_MessageBoard_MovieII" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Comments" ADD CONSTRAINT "FK_ReplyThread_Comments_ReplyThreadID" FOREIGN KEY ("ReplyThreadID") REFERENCES "ReplyThread" ("ReplyThreadID")
/

ALTER TABLE "ReplyThread" ADD CONSTRAINT "FK_Thread_ReplyThread_ReplyThreadID" FOREIGN KEY ("FK_ReplyThreadID") REFERENCES "ReplyThread" ("ReplyThreadID")
/

ALTER TABLE "ReplyThread" ADD CONSTRAINT "FK_MessageBoard_ReplyThread_MessageBoardID" FOREIGN KEY ("MessageBoardID") REFERENCES "MessageBoard" ("MessageBoardID")
/

ALTER TABLE "MessageBoardReadBy" ADD CONSTRAINT "FK_User_MessageBoardReadBy_UserID" FOREIGN KEY ("UserID") REFERENCES "User" ("UserID")
/

ALTER TABLE "ReadBy" ADD CONSTRAINT "FK_Reviews_ReadBy_ReviewID" FOREIGN KEY ("ReviewID") REFERENCES "Reviews" ("ReviewID")
/

ALTER TABLE "ReadBy" ADD CONSTRAINT "FK_User_ReadBy_UserID" FOREIGN KEY ("UserID") REFERENCES "User" ("UserID")
/

ALTER TABLE "Nominee" ADD CONSTRAINT "FK_Episode_Nominee_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "ProductionCompany_Bridge" ADD CONSTRAINT "FK_TVShow_ProductionCompany_Bridge_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "ProductionCompany_Bridge" ADD CONSTRAINT "FK_Movie_ProductionCompany_Bridge_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "ProductionCompany_Bridge" ADD CONSTRAINT "FK_ProductionCompany_ProductionCompany_Bridge_ProductionCompanyID" FOREIGN KEY ("ProductionCompanyID") REFERENCES "ProductionCompany" ("ProductionCompanyID")
/

ALTER TABLE "Nominee" ADD CONSTRAINT "PF_Artist_Nominee_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "Nominee" ADD CONSTRAINT "FK_TVShow_Nominee_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Nominee" ADD CONSTRAINT "FK_Movie_Nominee_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "AwardCategory" ADD CONSTRAINT "FK_Award_AwardCategory_AwardID" FOREIGN KEY ("AwardID") REFERENCES "Award" ("AwardID")
/

ALTER TABLE "Nominee" ADD CONSTRAINT "FK_Award_Nominee_AwardID" FOREIGN KEY ("AwardID") REFERENCES "Award" ("AwardID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_Movie_PlotKeyword_Bridge_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_Trailer_PlotKeyword_Bridge_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_TVShow_PlotKeyword_Bridge_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_Season_PlotKeyword_Bridge_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_Episode_PlotKeyword_Bridge_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "Trivia" ADD CONSTRAINT "FK_TVShow_Trivia_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Trivia" ADD CONSTRAINT "FK_Season_Trivia_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "Trivia" ADD CONSTRAINT "FK_Episode_Trivia_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "Trivia" ADD CONSTRAINT "FK_Movie_Trivia_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Trivia" ADD CONSTRAINT "FK_Trailer_Trivia_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "PlotKeyword_Bridge" ADD CONSTRAINT "FK_PlotKeyword_PlotKeyword_Bridge_PlotKeywordID" FOREIGN KEY ("PlotKeywordID") REFERENCES "PlotKeyword" ("PlotKeywordID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_TVShow_ReleaseDate_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_Season_ReleaseDate_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_Country_ReleaseDate_CountryID" FOREIGN KEY ("CountryID") REFERENCES "Country" ("CountryID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_Episode_ReleaseDate_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_Trailer_ReleaseDate_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "ReleaseDate" ADD CONSTRAINT "FK_Movie_ReleaseDate_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Photo" ADD CONSTRAINT "FK_Artist_Photo_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "Photo" ADD CONSTRAINT "FK_Trailer_Photo_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "Photo" ADD CONSTRAINT "FK_TVShow_Photo_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Photo" ADD CONSTRAINT "FK_Season_Photo_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "Episode" ADD CONSTRAINT "FK_Photo_Episode_PhotoID" FOREIGN KEY ("PhotoID") REFERENCES "Photo" ("PhotoID")
/

ALTER TABLE "Photo" ADD CONSTRAINT "FK_Movie_Photo_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_Artist_NewsArticle_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_Episode_NewsArticle_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_Trailer_NewsArticle_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_Season_NewsArticle_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_TVShow_NewsArticle_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "FK_Movie_NewsArticle_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Episode" ADD CONSTRAINT "FK_ParentGuide_Episode_ParentGuideID" FOREIGN KEY ("ParentGuideID") REFERENCES "ParentGuide" ("ParentGuideID")
/

ALTER TABLE "Episode" ADD CONSTRAINT "FK_TechnicalSpecs_Episode_TechnicalSpecsID" FOREIGN KEY ("TechnicalSpecsID") REFERENCES "TechnicalSpecs" ("TechnicalSpecsID")
/

ALTER TABLE "Episode" ADD CONSTRAINT "FK_Certificate_Episode_CertificateID" FOREIGN KEY ("CertificateID") REFERENCES "Certificate" ("CertificateID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_ParentGuide_Movie_ParentGuideID" FOREIGN KEY ("ParentGuideID") REFERENCES "ParentGuide" ("ParentGuideID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_TechnicalSpecs_Movie_TechnicalSpecsID" FOREIGN KEY ("TechnicalSpecsID") REFERENCES "TechnicalSpecs" ("TechnicalSpecsID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_Certificate_Movie_CertificateID" FOREIGN KEY ("CertificateID") REFERENCES "Certificate" ("CertificateID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "FK_Address_Movie_FilmingLocation" FOREIGN KEY ("FilmingLocation") REFERENCES "Address" ("AddressID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Movie_Reviews_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Trailer_Reviews_TrailerID" FOREIGN KEY ("TrailerID") REFERENCES "Trailer" ("TrailerID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Reviews_User_UserID" FOREIGN KEY ("UserID") REFERENCES "User" ("UserID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Reviews_Organization_OrganizationID" FOREIGN KEY ("OrganizationID") REFERENCES "Organization" ("OrganizationID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Reviews_Critic_CriticID" FOREIGN KEY ("CriticID") REFERENCES "Critic" ("CriticID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Episode_Reviews_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_Season_Reviews_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "Reviews" ADD CONSTRAINT "FK_TVShow_Reviews_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Screen" ADD CONSTRAINT "FK_Screen_Theater_TheaterID" FOREIGN KEY ("TheatreID") REFERENCES "Theatre" ("TheatreID")
/

ALTER TABLE "Seat" ADD CONSTRAINT "FK_Seat_Screen_ScreenID" FOREIGN KEY ("ScreenID") REFERENCES "Screen" ("ScreenID")
/

ALTER TABLE "ShowTiming" ADD CONSTRAINT "FK_Movie_ShowTiming_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "ShowTiming" ADD CONSTRAINT "FK_Screen_ShowTiming_ScreenID" FOREIGN KEY ("ScreenID") REFERENCES "Screen" ("ScreenID")
/

ALTER TABLE "Seat" ADD CONSTRAINT "FK_ScreenType_Seat_ScreenTypeID" FOREIGN KEY ("ScreenTypeID") REFERENCES "SeatType" ("SeatTypeID")
/

ALTER TABLE "Ticket" ADD CONSTRAINT "FK_Seat_Ticket_SeatID" FOREIGN KEY ("SeatID") REFERENCES "Seat" ("SeatID")
/

ALTER TABLE "Movie_Screen" ADD CONSTRAINT "FK_Screen_Movie_Screen_ScreenID" FOREIGN KEY ("ScreenID") REFERENCES "Screen" ("ScreenID")
/

ALTER TABLE "Movie_Screen" ADD CONSTRAINT "FK_Movie_Screen_Movie_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Trailer" ADD CONSTRAINT "FK_TVShow_Trailer_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Trailer" ADD CONSTRAINT "FK_Movie_Trailer_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "State" ADD CONSTRAINT "FK_State_Country_CountryID" FOREIGN KEY ("CountryID") REFERENCES "Country" ("CountryID")
/

ALTER TABLE "City" ADD CONSTRAINT "FK_State_City_StateID" FOREIGN KEY ("StateID") REFERENCES "State" ("StateID")
/

ALTER TABLE "Address" ADD CONSTRAINT "FK_Address_City_CityID" FOREIGN KEY ("CityID") REFERENCES "City" ("CityID")
/

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "FK_Movie_Movie_Genre_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "FK_Genre_Movie_Genre_GenreID" FOREIGN KEY ("GenreID") REFERENCES "Genre" ("GenreID")
/

ALTER TABLE "Artist_Address" ADD CONSTRAINT "FK_Address_Artist_Address_AddressID" FOREIGN KEY ("AddressID") REFERENCES "Address" ("AddressID")
/

ALTER TABLE "Artist_Address" ADD CONSTRAINT "FK_ArtistID_Artist_Address_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "Episode" ADD CONSTRAINT "FK_Episode_Season_SeasonID" FOREIGN KEY ("SeasonID") REFERENCES "Season" ("SeasonID")
/

ALTER TABLE "Season" ADD CONSTRAINT "FK_Season_TVShow_TVShowID" FOREIGN KEY ("TVShowID") REFERENCES "TVShow" ("TVShowID")
/

ALTER TABLE "Artist" ADD CONSTRAINT "FK_Artistype_Artist_ArtistTypeID" FOREIGN KEY ("ArtistTypeID") REFERENCES "ArtistType" ("ArtistTypeID")
/

ALTER TABLE "Artist_TradeMark" ADD CONSTRAINT "FK_TradeMark_Artist_TradeMark_TradeMarkID" FOREIGN KEY ("TradeMarkID") REFERENCES "TradeMark" ("TradeMarkID")
/

ALTER TABLE "Artist_TradeMark" ADD CONSTRAINT "FK_Artist_Artist_TradeMark_AtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "Cast" ADD CONSTRAINT "FK_Cast_Artist_ArtistID" FOREIGN KEY ("ArtistID") REFERENCES "Artist" ("ArtistID")
/

ALTER TABLE "Cast" ADD CONSTRAINT "FK_Episode_Cast_EpisodeID" FOREIGN KEY ("EpisodeID") REFERENCES "Episode" ("EpisodeID")
/

ALTER TABLE "Cast" ADD CONSTRAINT "FK_Movie_Cast_MovieID" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Address" ADD CONSTRAINT "FK_Address_AddressType_AddressTypeID" FOREIGN KEY ("AddressTypeID") REFERENCES "AddressType" ("AddressTypeID")
/



