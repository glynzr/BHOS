CREATE DATABASE music;
USE music;
-- Create User table
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    DateOfBirth DATE
);

-- Create PlayHistory table
CREATE TABLE PlayHistory (
    PlayHistoryID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SongID INT,
    Timestamp DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (SongID) REFERENCES Song(SongID)
);

-- Create Follow table
CREATE TABLE Follow (
    FollowID INT PRIMARY KEY AUTO_INCREMENT,
    FollowerUserID INT,
    FollowedUserID INT,
    FOREIGN KEY (FollowerUserID) REFERENCES User(UserID),
    FOREIGN KEY (FollowedUserID) REFERENCES User(UserID)
);

-- Create Musician table
CREATE TABLE Musician (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Biography TEXT
);

-- Create Song table
CREATE TABLE Song (
    SongID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    GenreID INT,
    AlbumID INT,
    ArtistID INT,
    Duration INT,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Musician(ArtistID)
);

-- Create Playlist table
CREATE TABLE Playlist (
    PlaylistID INT PRIMARY KEY AUTO_INCREMENT,
    PlaylistName VARCHAR(255),
    UserID INT,
    AlbumID INT,
    SongID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID),
    FOREIGN KEY (SongID) REFERENCES Song(SongID)
);

-- Create Album table
CREATE TABLE Album (
    AlbumID INT PRIMARY KEY AUTO_INCREMENT,
    AlbumTitle VARCHAR(255),
    ArtistID INT,
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES Musician(ArtistID)
);

-- Create Genre table
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(255)
);

INSERT INTO User (FirstName, LastName, Username, Email, Password, DateOfBirth)
VALUES
    ('John', 'Doe', 'johndoe', 'john@example.com', 'password123', '1990-05-15'),
    ('Alice', 'Smith', 'alicesmith', 'alice@example.com', 'alicepass', '1988-10-22'),
    ('Michael', 'Johnson', 'michaelj', 'michael@example.com', 'michaelpass', '1995-07-03'),
    ('Sophia', 'Brown', 'sophiab', 'sophia@example.com', 'sophiapass', '1992-11-28'),
    ('William', 'Taylor', 'williamt', 'william@example.com', 'williampass', '1987-08-10'),
    ('Olivia', 'Clark', 'oliviac', 'olivia@example.com', 'oliviapass', '1998-02-18'),
    ('James', 'Wilson', 'jamesw', 'james@example.com', 'jamespass', '1985-09-09'),
    ('Emma', 'Anderson', 'emmaa', 'emma@example.com', 'emmapass', '1993-04-25'),
    ('Alexander', 'Thomas', 'alexandert', 'alexander@example.com', 'alexanderpass', '1997-06-30'),
    ('Mia', 'Hill', 'miah', 'mia@example.com', 'miapass', '1991-12-14');


INSERT INTO Genre (GenreName)
VALUES
    ('Pop'),
    ('R&B'),
    ('Hip Hop'),
    ('Rock'),
    ('Country'),
    ('Electronic'),
    ('Reggae'),
    ('Classical'),
    ('Jazz'),
    ('Blues');


INSERT INTO Follow (FollowerUserID, FollowedUserID)
VALUES
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (4, 8),
    (4, 9),
    (5, 10),
    (5, 1),
    (6, 2),
    (6, 3),
    (7, 4),
    (7, 5),
    (8, 6),
    (8, 7),
    (9, 8),
    (9, 9),
    (10, 10),
    (10, 1);


INSERT INTO Musician (FirstName, LastName, Biography)
VALUES
    ('John', 'Legend', 'John Legend is a singer-songwriter known for his soulful R&B music.'),
    ('Adele', 'Adkins', 'Adele is a British singer-songwriter acclaimed for her powerful voice and emotional ballads.'),
    ('Bruno', 'Mars', 'Bruno Mars is a versatile musician, singer, and dancer with hits across various genres.'),
    ('Taylor', 'Swift', 'Taylor Swift is a pop and country singer-songwriter recognized for her storytelling through music.'),
    ('Ed', 'Sheeran', 'Ed Sheeran is a singer-songwriter known for his heartfelt acoustic pop songs.'),
    ('Beyoncé', 'Knowles', 'Beyoncé is an iconic performer and singer known for her powerful vocals and stage presence.'),
    ('Drake', 'Graham', 'Drake is a rapper and singer-songwriter celebrated for his chart-topping hits.'),
    ('Rihanna', 'Fenty', 'Rihanna is a singer, actress, and fashion icon known for her versatile music.'),
    ('Kanye', 'West', 'Kanye West is a rapper, producer, and fashion designer known for pushing musical boundaries.'),
    ('Lady', 'Gaga', 'Lady Gaga is a singer-songwriter and actress known for her unique style and vocal range.');


INSERT INTO Song (Title, GenreID, AlbumID, ArtistID, Duration)
VALUES
    ('Ordinary People', 2, 1, 1, 239),              -- R&B - John Legend
    ('When We Were Young', 1, 2, 2, 292),            -- Pop - Adele
    ('Locked Out of Heaven', 1, 3, 3, 233),          -- Pop - Bruno Mars
    ('Wildest Dreams', 4, 4, 4, 230),               -- Country - Taylor Swift
    ('Thinking Out Loud', 1, 5, 5, 281),             -- Pop - Ed Sheeran
    ('Halo', 2, 6, 6, 235),                          -- R&B - Beyoncé
    ('Hotline Bling', 3, 7, 7, 267),                 -- Hip Hop - Drake
    ('Diamonds', 7, 8, 8, 230),                      -- Reggae - Rihanna
    ('Stronger', 3, 9, 9, 311),                      -- Hip Hop - Kanye West
    ('Shallow', 1, 10, 10, 216),                     -- Pop - Lady Gaga
    ('Shape of You', 1, 1, 1, 234),                 -- Pop - John Legend
    ('Set Fire to the Rain', 2, 2, 2, 238),         -- R&B - Adele
    ('24K Magic', 1, 3, 3, 225),                    -- Pop - Bruno Mars
    ('Love Story', 4, 4, 4, 235),                   -- Country - Taylor Swift
    ('Perfect', 1, 5, 5, 263),                      -- Pop - Ed Sheeran
    ('Crazy in Love', 2, 6, 6, 229),                -- R&B - Beyoncé
    ('In My Feelings', 3, 7, 7, 217),               -- Hip Hop - Drake
    ('We Found Love', 7, 8, 8, 223),                -- Reggae - Rihanna
    ('Heartless', 3, 9, 9, 214),                    -- Hip Hop - Kanye West
    ('Bad Romance', 1, 10, 10, 294);                 -- Pop - Lady Gaga


INSERT INTO Album (AlbumTitle, ArtistID, ReleaseDate)
VALUES
    ('Get Lifted', 1, '2004-12-28'),               -- John Legend
    ('25', 2, '2015-11-20'),                        -- Adele
    ('Unorthodox Jukebox', 3, '2012-12-07'),        -- Bruno Mars
    ('1989', 4, '2014-10-27'),                      -- Taylor Swift
    ('÷', 5, '2017-03-03'),                         -- Ed Sheeran
    ('I Am... Sasha Fierce', 6, '2008-11-12'),      -- Beyoncé
    ('Views', 7, '2016-04-29'),                     -- Drake
    ('Anti', 8, '2016-01-28'),                      -- Rihanna
    ('My Beautiful Dark Twisted Fantasy', 9, '2010-11-22'),  -- Kanye West
    ('The Fame Monster', 10, '2009-11-18');          -- Lady Gaga


INSERT INTO PlayHistory (UserID, SongID, Timestamp)
VALUES
    (1, 1, '2023-11-01 08:00:00'),  -- John listening to 'All of Me'
    (2, 2, '2023-11-02 09:15:00'),  -- Alice listening to 'Rolling in the Deep'
    (3, 3, '2023-11-03 10:30:00'),  -- Michael listening to 'Just the Way You Are'
    (4, 4, '2023-11-04 11:45:00'),  -- Sophia listening to 'Love Story'
    (5, 5, '2023-11-05 12:00:00'),  -- William listening to 'Shape of You'
    (1, 6, '2023-11-06 13:15:00'),  -- John listening to 'Single Ladies (Put a Ring on It)'
    (2, 7, '2023-11-07 14:30:00'),  -- Alice listening to 'Hotline Bling'
    (3, 8, '2023-11-08 15:45:00'),  -- Michael listening to 'Umbrella'
    (4, 9, '2023-11-09 16:00:00'),  -- Sophia listening to 'Stronger'
    (5, 10, '2023-11-10 17:15:00'), -- William listening to 'Bad Romance'
    (1, 1, '2023-11-11 18:30:00'), -- John listening to 'All of Me' again
    (2, 2, '2023-11-12 19:45:00'), -- Alice listening to 'Rolling in the Deep' again
    (3, 3, '2023-11-13 20:00:00'), -- Michael listening to 'Just the Way You Are' again
    (4, 4, '2023-11-14 21:15:00'), -- Sophia listening to 'Love Story' again
    (5, 5, '2023-11-15 22:30:00'), -- William listening to 'Shape of You' again
    (1, 6, '2023-11-16 23:45:00'), -- John listening to 'Single Ladies (Put a Ring on It)' again
    (2, 7, '2023-11-17 00:00:00'), -- Alice listening to 'Hotline Bling' again
    (3, 8, '2023-11-18 01:15:00'), -- Michael listening to 'Umbrella' again
    (4, 9, '2023-11-19 02:30:00'), -- Sophia listening to 'Stronger' again
    (5, 10, '2023-11-20 03:45:00');-- William listening to 'Bad Romance' again



INSERT INTO Playlist (PlaylistName, UserID, AlbumID, SongID)
VALUES
    ('Chill Vibes', 1, 2, 2),      -- John's playlist with 'Rolling in the Deep' by Adele from album '25'
    ('Soulful Melodies', 2, 4, 4), -- Alice's playlist with 'Love Story' by Taylor Swift from album '1989'
    ('Hip Hop Hits', 3, 7, 7),     -- Michael's playlist with 'Hotline Bling' by Drake from album 'Views'
    ('Country Tunes', 4, 9, 9),    -- Sophia's playlist with 'Stronger' by Kanye West from album 'My Beautiful Dark Twisted Fantasy'
    ('Pop Favorites', 5, 10, 10),  -- William's playlist with 'Bad Romance' by Lady Gaga from album 'The Fame Monster'
    ('Relaxing Beats', 1, 3, 3),   -- John's playlist with 'Locked Out of Heaven' by Bruno Mars from album 'Unorthodox Jukebox'
    ('Throwback Jams', 2, 6, 6),   -- Alice's playlist with 'Single Ladies (Put a Ring on It)' by Beyoncé from album 'I Am... Sasha Fierce'
    ('R&B Classics', 3, 8, 8),     -- Michael's playlist with 'Umbrella' by Rihanna from album 'Anti'
    ('Favorites Mix', 4, 5, 5),    -- Sophia's playlist with 'Shape of You' by Ed Sheeran from album '÷'
    ('Dance Party', 5, 1, 1),      -- William's playlist with 'All of Me' by John Legend from album 'Get Lifted'
    ('Sentimental Journey', 1, 4, 4), -- John's playlist with 'Love Story' by Taylor Swift from album '1989'
    ('Mood Boosters', 2, 7, 7),    -- Alice's playlist with 'Hotline Bling' by Drake from album 'Views'
    ('Road Trip Tracks', 3, 10, 10), -- Michael's playlist with 'Bad Romance' by Lady Gaga from album 'The Fame Monster'
    ('Acoustic Feels', 4, 9, 9),   -- Sophia's playlist with 'Stronger' by Kanye West from album 'My Beautiful Dark Twisted Fantasy'
    ('Energetic Vibes', 5, 2, 2),  -- William's playlist with 'Rolling in the Deep' by Adele from album '25'
    ('Mellow Moods', 1, 8, 8),     -- John's playlist with 'Umbrella' by Rihanna from album 'Anti'
    ('Throwback Hits', 2, 6, 6),   -- Alice's playlist with 'Single Ladies (Put a Ring on It)' by Beyoncé from album 'I Am... Sasha Fierce'
    ('Rhythmic Beats', 3, 3, 3),   -- Michael's playlist with 'Locked Out of Heaven' by Bruno Mars from album 'Unorthodox Jukebox'
    ('Chillout Mix', 4, 5, 5),     -- Sophia's playlist with 'Shape of You' by Ed Sheeran from album '÷'
    ('Pop Anthems', 5, 1, 1);      -- William's playlist with 'All of Me' by John Legend from album 'Get Lifted'




-- This query fetches all users and their playlists, including users who haven't created any playlists yet.
SELECT u.Username, p.PlaylistName
FROM User u
LEFT JOIN Playlist p ON u.UserID = p.UserID;

SELECT Username, GROUP_CONCAT(PlaylistName) FROM User 
LEFT JOIN Playlist USING(UserID);


-- This query fetches all playlists and their associated users, 
-- including playlists that don't have any assigned users.
SELECT u.Username, p.PlaylistName
FROM User u
RIGHT JOIN Playlist p ON u.UserID = p.UserID;



-- This query retrieves users who have followed 
-- others along with the usernames of the users they are following.
SELECT u1.Username AS Follower, u2.Username AS Followed
FROM User u1
INNER JOIN Follow f ON u1.UserID = f.FollowerUserID
INNER JOIN User u2 ON f.FollowedUserID = u2.UserID;


-- This query fetches users along with a concatenated list of their playlist names.
SELECT u.Username, GROUP_CONCAT(p.PlaylistName SEPARATOR ', ') AS UserPlaylists
FROM User u
LEFT JOIN Playlist p ON u.UserID = p.UserID
GROUP BY u.UserID;


-- This query finds users who have created playlists 
-- by using a subquery to filter the User table based 
-- on the existence of their records in the Playlist table.
SELECT Username
FROM User
WHERE UserID IN (
    SELECT DISTINCT UserID
    FROM Playlist
);

-- This query identifies songs that have a duration greater than the average duration of all songs.
SELECT Title, Duration
FROM Song
WHERE Duration > (
    SELECT AVG(Duration)
    FROM Song
);

-- This query identifies 
-- users who haven't played any songs based on the absence of their records in the PlayHistory table.
SELECT Username
FROM User
WHERE UserID NOT IN (
    SELECT DISTINCT UserID
    FROM PlayHistory
);

-- This procedure fetches playlists for a specific user:
DELIMITER $$

CREATE PROCEDURE GetUserPlaylists(IN userID INT)
BEGIN
    SELECT p.PlaylistName
    FROM Playlist p
    WHERE p.UserID = userID;
END $$
DELIMITER ;


CALL GetUserPlaylists(3);

-- This procedure adds a new song to the database:
DELIMITER $$

CREATE PROCEDURE AddNewSong(
    IN songTitle VARCHAR(255),
    IN genreID INT,
    IN albumID INT,
    IN artistID INT,
    IN duration INT
)
BEGIN
    INSERT INTO Song (Title, GenreID, AlbumID, ArtistID, Duration)
    VALUES (songTitle, genreID, albumID, artistID, duration);
END $$

DELIMITER ;

CALL AddNewSong('New Song Title', 3, 5, 7, 240);

-- get song title
DELIMITER $$

CREATE PROCEDURE GetSongDetails(IN songTitle VARCHAR(255))
BEGIN
    SELECT *
    FROM Song
    WHERE Title = songTitle;
END $$

DELIMITER ;

CALL GetSongDetails('Halo');


-- This procedure retrieves the count of songs for a specific genre using its ID:
DELIMITER $$

CREATE PROCEDURE GetSongCountByGenre(
    IN genreID INT,
    OUT songCount INT
)
BEGIN
    SELECT COUNT(*) INTO songCount
    FROM Song
    WHERE GenreID = genreID;
END $$

DELIMITER ;


SET @genreSongCount = 0; -- Variable to store the OUT parameter value
CALL GetSongCountByGenre(2, @genreSongCount);
SELECT @genreSongCount AS SongCountForGenre2;

-- This trigger updates a user's playlist count when a new playlist is inserted into the Playlist table:
DELIMITER $$

CREATE TRIGGER UpdatePlaylistCountAfterInsert
AFTER INSERT ON Playlist
FOR EACH ROW
BEGIN
    UPDATE User
    SET PlaylistCount = PlaylistCount + 1
    WHERE UserID = NEW.UserID;
END $$

DELIMITER ;

-- This trigger ensures that the 
-- release date of an album is updated whenever a new song belonging to that album is inserted:
DELIMITER $$

CREATE TRIGGER UpdateAlbumReleaseDate
AFTER INSERT ON Song
FOR EACH ROW
BEGIN
    UPDATE Album
    SET ReleaseDate = NEW.ReleaseDate
    WHERE AlbumID = NEW.AlbumID;
END $$

DELIMITER ;

-- This trigger logs information about inserted songs into a separate SongLog table:
CREATE TABLE SongLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    SongTitle VARCHAR(255),
    InsertedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$

CREATE TRIGGER LogSongInsertion
AFTER INSERT ON Song
FOR EACH ROW
BEGIN
    INSERT INTO SongLog (SongTitle, InsertedAt)
    VALUES (NEW.Title, NOW());
END $$

DELIMITER ;

-- This trigger prevents a user from adding more than 20 songs to a playlist:
DELIMITER $$

CREATE TRIGGER EnforceMaxPlaylistLength
BEFORE INSERT ON Playlist
FOR EACH ROW
BEGIN
    DECLARE playlistLength INT;
    SELECT COUNT(*) INTO playlistLength
    FROM Playlist
    WHERE UserID = NEW.UserID;
    
    IF playlistLength >= 20 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add more songs; maximum playlist length reached.';
    END IF;
END $$

DELIMITER ;

-- This trigger logs user deletions into an audit table:
CREATE TABLE UserAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


DELIMITER $$

CREATE TRIGGER AuditUserDeletion
AFTER DELETE ON User
FOR EACH ROW
BEGIN
    INSERT INTO UserAudit (UserID, DeletedAt)
    VALUES (OLD.UserID, NOW());
END $$

DELIMITER ;


-- This function calculates the average duration of songs in an album based on the AlbumID:
DELIMITER $$

CREATE FUNCTION CalculateAvgSongDuration(albumID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avgDuration DECIMAL(10,2);
    SELECT AVG(Duration) INTO avgDuration
    FROM Song
    WHERE AlbumID = albumID;
    RETURN avgDuration;
END $$

DELIMITER ;


SELECT CalculateAvgSongDuration(3) AS AvgDurationForAlbum3;



-- This function retrieves the count of playlists for a specific user using their UserID:
DELIMITER $$

CREATE FUNCTION GetUserPlaylistCount(userID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE playlistCount INT;
    SELECT COUNT(*) INTO playlistCount
    FROM Playlist
    WHERE UserID = userID;
    RETURN playlistCount;
END $$

DELIMITER ;


SELECT GetUserPlaylistCount(5) AS PlaylistCountForUser5;


-- This function concatenates a user's first and last names:
DELIMITER $$

CREATE FUNCTION ConcatenateNames(firstName VARCHAR(255), lastName VARCHAR(255))
RETURNS VARCHAR(511)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(511);
    SET fullName = CONCAT(firstName, ' ', lastName);
    RETURN fullName;
END $$

DELIMITER ;

SELECT ConcatenateNames(FirstName, LastName) AS FullName from User;
