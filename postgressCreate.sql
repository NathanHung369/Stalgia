DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS PhotoEntries;
DROP TABLE IF EXISTS GalleryEntries;
DROP TABLE IF EXISTS TextEntries;
DROP TABLE IF EXISTS TemplateEntries;
DROP TABLE IF EXISTS PromptEntries;
DROP TABLE IF EXISTS Notifications;
DROP TABLE IF EXISTS Following;
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS Invitations;
DROP TABLE IF EXISTS UserChapterRole;
DROP TABLE IF EXISTS Chapter;
DROP TABLE IF EXISTS UserCircleRole;
DROP TABLE IF EXISTS Circle;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Users;





CREATE TABLE Users
(
	UserID varchar(50) NOT NULL PRIMARY KEY,
	Epigraph TEXT,
	Birthday timestamp,
	Email varchar,
	FirstName varchar(50),
	LastName varchar(50),
	CreateAt timestamp,
	UpdatedAt timestamp
);
CREATE TABLE Roles
(
	RoleID varchar(50) NOT NULL PRIMARY KEY,
	RoleName varchar(20)
);
CREATE TABLE Location
(
	LocationID varchar(50) NOT NULL PRIMARY KEY,
	PlaceID varchar(100),
	CreateAt timestamp,
	UpdatedAt timestamp
);
CREATE TABLE Circle
(
	CircleID varchar(50) NOT NULL PRIMARY KEY,
	CircleName varchar(50),
	Type varchar(20),
	CreateAt timestamp,
	UpdatedAt timestamp
);
CREATE TABLE Invitations
(
	InvitationID varchar(50) NOT NULL PRIMARY KEY,
	CreatorID varchar(50),
	IfUsed varchar(10),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID)
);
CREATE TABLE Devices
(
	DeviceID varchar(50) NOT NULL PRIMARY KEY,
	UserID varchar(50),
	DeviceName varchar(50),
	DeviceModel varchar(50),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (UserID)
		REFERENCES Users(UserID)
);
CREATE TABLE Following
(
	FollowingID varchar(50) NOT NULL PRIMARY KEY,
	UserFollower varchar(50),
	UserFollowing varchar(50),
	StatusType varchar(20),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (UserFollower)
		REFERENCES Users(UserID),
	FOREIGN KEY (UserFollowing)
		REFERENCES Users(UserID)
);
CREATE TABLE Notifications
(
	NotificationID varchar(50) NOT NULL PRIMARY KEY,
	Reciever varchar(50),
	Sender varchar(50),
	IfSent varchar(10),
	CreateAt timestamp,
	ReadAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (Reciever)
		REFERENCES Users(UserID),
	FOREIGN KEY (Sender)
		REFERENCES Users(UserID)
);
CREATE TABLE Chapter
(
	ChapterID varchar(50) NOT NULL PRIMARY KEY,
	CircleID varchar(50),
	CreatorID varchar(50),
	LocationID varchar(50),
	ChapterName varchar(100),
	IsCollaborative varchar(5),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (CircleID)
		REFERENCES Circle(CircleID),
	FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID),
	FOREIGN KEY (LocationID)
		REFERENCES Location(LocationID)
);
CREATE TABLE UserChapterRole
(
	UserChapterRoleID varchar(50) NOT NULL PRIMARY KEY,
	UserID varchar(50),
	ChapterID varchar(50),
	RoleID varchar(50),
	IsCreator varchar(5),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (UserID)
		REFERENCES Users(UserID),
	FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID),
	FOREIGN KEY (RoleID)
		REFERENCES Roles(RoleID)
);
CREATE TABLE TemplateEntries
(
   TemplateEntryID varchar(50) NOT NULL PRIMARY KEY,
   CreatorID varchar(50),
   ChapterID varchar(50),
   LocationID Varchar(50),
    TemplateType varchar(20),
   CreatedAt timestamp,
   UpdatedAt timestamp,
   FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID),
   FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID),
  FOREIGN KEY (LocationID)
		REFERENCES Location(LocationID)
);
CREATE TABLE PromptEntries
(
   PromptEntryID varchar(50) NOT NULL PRIMARY KEY,
   CreatorID varchar(50),
   ChapterID varchar(50),
    PromptName varchar(100),
   CreatedAt timestamp,
   UpdatedAt timestamp,
   FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID),
	FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID)
);
CREATE TABLE GalleryEntries
(   
   GalleryEntryID varchar(50) NOT NULL PRIMARY KEY,
   CreatorID varchar(50),
   ChapterID varchar(50),
   CreatedAt timestamp,
   UpdatedAt timestamp,
   FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID),
   FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID)
);
CREATE TABLE PhotoEntries
(
   EntryID varchar(500) NOT NULL PRIMARY KEY,
   CreatorID varchar(500), 
   ChapterID varchar(500),   
   GalaryEntryID  varchar(500),
   URL varchar(500) ,
   CreatedAt timestamp,
   UpdatedAt timestamp,
   FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID),
   FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID),
   FOREIGN KEY(GalaryEntryID)
        REFERENCES GalleryEntries(GalleryEntryID)
);
CREATE TABLE TextEntries
(
   TextEntryID varchar(50) NOT NULL PRIMARY KEY,
   CreatorID varchar(50),
   ChapterID varchar(50),  
   LocationID varchar(50),
   EntryName varchar(1000),
   Text varchar(20000),
   CreatedAt timestamp,
   UpdatedAt timestamp,
   FOREIGN KEY (ChapterID)
		REFERENCES Chapter(ChapterID),
   FOREIGN KEY (CreatorID)
		REFERENCES Users(UserID),
   FOREIGN KEY (LocationID)
		REFERENCES Location(LocationID)
);
CREATE TABLE Comment
(
 CommentID varchar(50) NOT NULL PRIMARY KEY,
  EntryID varchar(25),
   ChapterID varchar(50),
   AuthorID varchar(50),
  EntryName text ,
  Text varchar(5000) ,
   CreatedAt timestamp,
   UpdatedAt timestamp,
FOREIGN KEY (ChapterID)
	References Chapter(ChapterID),
FOREIGN KEY (AuthorID)
	References Users(UserID)
);
CREATE TABLE UserCircleRole
(
	UserCircleRoleID varchar(50) NOT NULL PRIMARY KEY,
	UserID varchar(50),
	CircleID varchar(50),
	RoleID varchar(50),
	CreateAt timestamp,
	UpdatedAt timestamp,
	FOREIGN KEY (UserID)
		REFERENCES Users(UserID),
	FOREIGN KEY (CircleID)
		REFERENCES Circle(CircleID),
	FOREIGN KEY (RoleID)
		REFERENCES Roles(RoleID)
);