-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP TABLE IF EXISTS players CASCADE;

CREATE TABLE players (
   playerId serial PRIMARY KEY,
   playerName  varchar(100) 
);


DROP TABLE IF EXISTS matches CASCADE; 
 
CREATE TABLE matches (
     matchId serial PRIMARY KEY,
     winnerId integer,
     loserId integer
);


DROP TABLE IF EXISTS standings CASCADE; 

CREATE TABLE standings (
     playerId           integer,
     numberOfWins	integer,
     numberOfMatches	integer
);


/* DROP VIEW IF EXISTS view_swiss_pairings; */

CREATE VIEW view_swiss_pairings AS 
 SELECT DISTINCT winnerid, winnername, loserid, losername
   FROM 
   ( SELECT s.playerId as winnerId, p.playerName as winnerName, s.numberOfWins as wins
      FROM standings s, players p 
        WHERE s.playerId = p.playerId 
          Group By s.playerId, p.playerName, s.numberOfWins
            ORDER BY s.numberOfWins DESC ) as junk,
   ( SELECT s2.playerId as loserId, p2.playerName as loserName, s2.numberOfWins as wins2
        FROM standings s2, players p2 
          WHERE s2.playerId = p2.playerId 
            Group By s2.playerId, p2.playerName, s2.numberOfWins
              ORDER BY s2.numberOfWins DESC ) as junk2
  WHERE junk2.wins2 = junk.wins AND winnerid > loserid;

