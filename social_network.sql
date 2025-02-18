CREATE TABLE social_network( col1 INTEGER, col2 INTEGER);
.separator " "
.import higgs-social_network.edgelist social_network
SELECT "nb total de relations friend / follower : " || ( SELECT count(*) from social_network );
SELECT "nb utilisateurs qui ont au moins un follower : " || (SELECT count(*) from (select distinct col1 from social_network ));
SELECT "nb utilisateurs qui suivent au moins qqn : " || (SELECT count(*) from (select distinct col2 from social_network ));
SELECT "nb max de followers per utilisateur : " || (SELECT MAX(cnt) FROM (SELECT count(col2) as cnt from social_network group by col1));
SELECT "-- exemple utilisateur avec nb max de followers : " || (SELECT col1 FROM (SELECT col1, MAX(cnt) FROM (SELECT col1, count(col2) as cnt from social_network group by col1)));
SELECT "nb min de followers per utilisateur : " || (SELECT MIN(cnt) FROM (SELECT count(col2) as cnt from social_network group by col1));
SELECT "-- exemple utilisateur avec nb max de followers : " || (SELECT col1 FROM (SELECT col1, MIN(cnt) FROM (SELECT col1, count(col2) as cnt from social_network group by col1)));
