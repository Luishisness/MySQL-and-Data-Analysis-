/*URL for data:  http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_base_stats_(Generation_VI-present)*/

DROP TABLE IF EXISTS PokemonTable;
CREATE TABLE PokemonTable (
  /*#	Pokémon	HP	Attack	Defense	Sp.Attack	Sp.Defense	Speed*/
  poke_num int,
  poke_Name varchar(20),
  poke_HP int,
  poke_Attack int,
  poke_Defense int,
  poke_SpAttack int,
  poke_SpDefense int,
  poke_Speed int,
  PRIMARY KEY( poke_num)
  ) ;
 /* ############################################ the above is working*/


LOAD DATA LOCAL INFILE '/home/spv224//pokemon_stats.txt'  
INTO TABLE PokemonTable 
LINES TERMINATED BY '\n';


/*Display Count*/
SELECT COUNT(poke_num) 
FROM PokemonTable;


/*Group by hp above 100 and attack above 30  then display the highest */
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_HP>100 AND poke_Attack>60
ORDER BY poke_HP DESC
LIMIT 1;

/*Display three fields, alphabatize one, show the first ten records*/
SELECT poke_num, poke_Name, poke_HP
FROM PokemonTable
ORDER BY poke_Name
limit 10;

/*Use GROUP BY to find the averages on a numerical field in a reasonable breakdown*/
SELECT poke_num, poke_Name, SUM(poke_HP + poke_Attack + poke_Defense + poke_SpAttack + poke_SpDefense + poke_Speed)/5 as Average
FROM PokemonTable
GROUP BY poke_num;

/*Create a user-friendly listing of the first 15 records in alphabetical order*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_num BETWEEN 1 AND 15
ORDER BY poke_Name;

/*Top 50 best Pokemon for offensive play*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_Attack>90 AND poke_SpAttack>90
ORDER BY poke_Attack DESC	
LIMIT 50; 

/*Top 50 best Best Pokemon for defensive play*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_Defense>90 AND poke_SpDefense>90
ORDER BY poke_Defense DESC	
LIMIT 50; 

/*Top 50  Pokemon with highest overall average stats*/
SELECT poke_num, poke_Name, SUM(poke_HP + poke_Attack + poke_Defense + poke_SpAttack + poke_SpDefense + poke_Speed)/5 as Average
FROM PokemonTable
GROUP BY poke_num
ORDER BY Average DESC
LIMIT 50;


/*Top 10 Weakest Pokemon*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_Defense<50 AND poke_SpDefense<50 AND poke_HP<50 AND poke_Attack<50 AND poke_SpAttack<50 AND poke_Speed<50
ORDER BY poke_HP 
Limit 10;
	
/*Top 10 Strongest Pokemon*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
	WHERE poke_Defense>80 AND poke_SpDefense>80 AND poke_HP>80 AND poke_Attack>80 AND poke_SpAttack>80 AND poke_Speed>80
ORDER BY poke_HP DESC
Limit 10;

/*Highest Hit points*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
ORDER BY poke_HP DESC
Limit 1;

/*Highest Attack*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
ORDER BY poke_Attack DESC
Limit 1;

/*Highest Defense*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
ORDER BY poke_Defense DESC
Limit 1;

/*Highest Speed*/
SELECT poke_num, poke_Name, poke_HP, poke_Attack, poke_Defense, poke_SpAttack, poke_SpDefense, poke_Speed
FROM PokemonTable
ORDER BY poke_Speed DESC
Limit 1;
