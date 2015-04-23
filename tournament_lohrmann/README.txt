# tournament
Python Files
------------
tournament.py code for querying database 
tournament_test.py  code for testing tournament.py

SQL files
------------	
tournament.sql	database tables and view construction

INSTALL
--------------
Unzip file into c:\{your path here}
create the database
  psql 
  create database tournament;
  \q
load the database from sql file
  psql tournament
  \i tournament.sql
  
RUN
-------------
Navigate to the folder with the  tournament_test.py file
  cd /vagrant/tournament
  python tournament_test.py
(Sample Output)
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
[(21, 'Melpomene Murray', 0, 0), (22, 'Randy Schwartz', 0, 0)]
6. Newly registered players appear in the standings with no matches.
[(23, 'Bruno Walton', 1, 1), (25, 'Cathy Burton', 1, 1), (24, "Boots O'Neal", 0, 1), (26, 'Diane Grant', 0, 1)]
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$

Assumptions
-------------
User has a working knowledge of Windows Operating system, python, vagrant, and postgres

Sources
------------
tournament_test.py was provided
comments in functions were provided