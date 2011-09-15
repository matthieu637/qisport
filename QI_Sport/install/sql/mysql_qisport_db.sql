
DROP TABLE IF EXISTS qisport_db.Accounts CASCADE ;

CREATE TABLE `qisport_db`.`Accounts` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`login` VARCHAR( 20 ) NOT NULL ,
`password` VARCHAR( 40 ) NOT NULL ,
`email` VARCHAR( 40 ) NOT NULL ,
`sex` ENUM( 'M', 'F' ) NULL ,
`years` INT NULL ,
`months` INT NULL ,
`days` INT NULL ,
`nationality` VARCHAR( 40 ) NULL ,
`sport` ENUM( 'Basket-Ball', 'Cyclisme', 'Football', 'Rugby', 'Sports d''Hiver', 'Tennis' ) NOT NULL ,
`fan` VARCHAR( 20 ) NULL ,
`newsletter` BOOL NOT NULL ,
`ip` VARCHAR( 16 ) NOT NULL ,
`ban_time` TIMESTAMP NOT NULL ,
`register_date` TIMESTAMP NOT NULL ,
`last_connection` TIMESTAMP NOT NULL,
`accesslevel` INTEGER NOT NULL,
UNIQUE (
`login` ,
`email`
)
) ENGINE = MYISAM ;

DROP TABLE IF EXISTS qisport_db.LoginLog CASCADE;

CREATE TABLE `qisport_db`.`LoginLog` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`log_time` TIMESTAMP NOT NULL ,
`ip` VARCHAR( 16 ) NOT NULL ,
`login` VARCHAR( 20 ) NOT NULL ,
`password` VARCHAR( 40 ) NOT NULL ,
`account_exist` BOOL NOT NULL ,
`right_password` BOOL NULL
) ENGINE = MYISAM ;


DROP TABLE IF EXISTS qisport_db.Connected CASCADE;

CREATE TABLE `qisport_db`.`Connected` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`ip` VARCHAR( 16 ) NOT NULL ,
`connect_time` TIMESTAMP NOT NULL
) ENGINE = MYISAM ;


DROP TABLE IF EXISTS qisport_db.Questions CASCADE;

CREATE TABLE `qisport_db`.`questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sport` enum('Basket-Ball','Cyclisme','Football','Rugby','Sports d''Hiver','Tennis') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`(250))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



INSERT INTO `qisport_db`.`questions` VALUES (27, 'Quel est le premier fran�ais a figur� sur la liste d�finitive du ballon d''or 2009 ?', 'henry', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (36, 'R�v�lation de la Bundesliga, j''inscris pas moins de 26 buts avec Wolsburg, qui suis-je ?', 'dzeko', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (28, 'Apr�s avoir quitt� Lyon, dans quel club �volue Juninho Pernambucano ?', 'Doha', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (31, 'A d�faut de temps de jeu � l''Internazionale, dans quel club �volue depuis l''�t� 2009, Adriano ?', 'flamengo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (29, 'Combien de fran�ais compte l''effectif du  Real Madrid en fin d''ann�e 2009 ?', '2', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (30, 'En 2009, combien de millions d''euros a vers� le Real de Madrid pour se payer les services de C.Ronaldo ?', '94', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (37, 'Suite � une visite m�dicale r�v�lant un probl�me cardiaque, ma carri�re et mon transfert � l''AS Monaco sont suspendus, qui suis-je ?', 'savidan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (41, 'Form� � Metz, et aujourd''hui � Manchester City, je suis consid�r� avec Samuel Eto''o comme l''un des meilleurs attaquants africains au monde, qui suis je ?', 'adebayor', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (46, 'Quel club a remport� pour la deuxi�me ann�e cons�cutive le championnat russe ?', 'rubin kazan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (51, 'Combien d''�quipes participeront � la phase finale de la Coupe du Monde 2010 ? ', '32', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (52, 'Combien de fran�ais figurent dans la liste des 30 derniers joueurs du Ballon d''Or 2009 ?', '4', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (53, 'Ancien milieu d�fensif irlandais, je suis limog� du poste d''entraineur de Sunderland, qui suis-je ?', 'keane', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (55, 'Ballon d''or 2009, compl�tez :

1: Messi
2: C.Ronaldo
3: Xavi
4: ?', 'iniesta', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (58, 'Quel ancien joueur d�clare, fin novembre 2009 : " Domenech, c''est le plus mauvais entraineur depuis Louis 16 ! (...) " ? ', 'cantona', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (32, 'Joueur mythique de Boca Junior, je reviens en s�lection et marque un but important lors des qualifications pour la Coupe du Monde, qui suis-je ? ', 'palermo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (59, 'D�fenseur international fran�ais, je raccroche les crampons en milieu d''ann�e 2009 suite � une terrible blessure au tendon d''Achille, qui suis-je ?', 'sagnol', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (33, 'Transf�r� durant l''�t� 2009 du Werder de Br�me, je gagne petit � petit le c�ur des supporters de la Vieille Dame, qui suis-je ?', 'diego', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (34, 'Transf�r� durant l''�t� 2009 du Genoa, je forme avec Samuel Eto''o, l''attaque explosive de l''Inter de Milan, qui suis-je ?', 'milito', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (35, 'Jeune Nig�rian, transf�r� de Newcastle � Wolsburg apr�s avoir pass� une saison noire avec les Black Catz, qui suis-je ? ', 'martins', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (39, 'Milieu de terrain hollandais, ayant �volu� � Bordeaux, � l''Atletico Madrid. J''ai �t� mis a l''essai par le FC METZ, mais finalement non conserv�, qui suis-je ?', 'musampa', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (40, 'Transf�r� de l''Ajax durant le mercato d''�t� 2009, je forme aujourd''hui la charni�re centrale avec William GALLAS � Arsenal, qui suis-je ?', 'vermaelen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (43, 'Dans quel club �volue, en 2009, Damian DUFF ?', 'fulham', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (44, 'Quel club br�silien, a pour but le recrutement de l''ancien parisien Ronaldinho pour la saison 2010/2011 ?', 'corinthians', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (45, 'Milieu belge d''Everton, je surprends par ma coupe de cheveux mais surtout pour mon talent, qui suis-je ?', 'fellaini', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (48, 'Quel joueur fantasque, a inscrit un quintupl� et figure au 1er d�cembre 2009, comme le meilleur buteur de la Premier League ?', 'defoe', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (61, 'Quelle star du rugby a fait un retour remarqu� au sein du petit club de Marseille-Vitrolles ?', 'Lomu', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (50, 'Attaquant fran�ais, je quitte Sunderland pour le Panathinaikos durant l''�t� 2009, qui suis-je ?', 'cisse', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (54, 'Attaquant br�silien, je retrouve les terrains avec Arsenal, apr�s une tr�s longue blessure, qui suis-je ?', 'eduardo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (26, 'Dans la course au Ballon d''or, combien de points ont s�par� Lionel Messi de son dauphin, C.Ronaldo ?', '240', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (47, 'Quel club anglais est surnomm� le "deuxi�me Chelsea" apr�s un recrutement digne des plus grands ?', 'manchester city', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (49, 'Irlandais consid�r� comme l''un des meilleurs passeurs de Premier League, mes rapports houleux avec l''entraineur ne me permettent pas d''int�grer l''effectif pour les qualifications � la Coupe du Monde 2010, qui suis-je ?', 'ireland', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (57, 'Quelle �quipe, n''ayant plus particip� � la Coupe du Monde depuis 1985, sera de la partie en Afrique du Sud ?', 'alg�rie', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (62, 'Quel ancien entraineur de la Squadra Azzura, a pris les r�nes du Racing M�tro ?', 'Berbizier', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (64, 'Flanker prometteur du Clermont-Auvergne, je f�te ma premi�re s�lection, � l''�ge de 20 ans, contre les Samoa. Je suis... ', 'Lapandry', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (65, 'Je suis un entraineur australien limog� par Guazzini apr�s un d�but de saison 2009 catastrophique avec le Stade Fran�ais. Je suis...', 'McKenzie', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (66, 'V�ritable poutre en m�l�e, et d''une puissance rare, je suis avec mes 138kg un joueur � part enti�re du Stade Toulousain. Je suis...', 'Census Johnston', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (67, 'Capitaine �m�rite de Toulon, je suis d�sign� meilleur troisi�me ligne centre du Top 14, lors de la saison 2008-2009. Je suis...', 'Van Niekerk', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (63, 'Je suis un joueur n�o-z�landais, ancienne star du XIII, aujourd''hui Centre � XV, et ayant remport� un match de Boxe professionnel. Je suis... ', 'Sony Bill Williams', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (68, 'Quel jeune ouvreur argentin du Stade Fran�ais, a jou� � Perpignan et � Leicester ?', 'Mieres', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (69, 'Quel International fran�ais s''est exil� outre Manche pendant une saison, avant de faire son retour dans son club formateur, le Stade Fran�ais ?', 'Kayser', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (71, 'Quel ancien talonneur international est l''entraineur des avants du Stade Toulousain, pour la saison 2009-2010 ?', 'Bru', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (72, 'Quel arri�re, pouvant aussi jou� ouvreur, a rejoint le Racing M�tro apr�s avoir r�ussi quelques jolis drops avec Montauban ?', 'Fortassin', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (70, 'En Mars 2009, quel joueur du Top 14 a battu le record du plus grand nombre de coups de pieds cons�cutifs r�ussis ?', 'Brock James', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (42, 'Quel club, en 2009, est consid�r� comme le club le plus riche au monde ?', 'manchester united', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (56, 'Form� au FC METZ, je me r�v�le au grand public avec l''Olympique Lyonnais en fin d''ann�e 2009, qui suis-je ?', 'pjanic', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (38, 'Conscient de la difficult� de jouer en �quipe de France, je prends la nationalit� polonaise, en 2009, et inscrit deux buts pour mon premier match, qui suis-je ?', 'obraniak', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (82, 'Famille de biathl�tes, chefs de file de l''�quipe de France de Biathlon. Nous enchainons les podiums en 2009. Nous sommes les...', 'Fourcade', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (74, 'Quel ancien treiziste australien, aujourd''hui converti au XV, s''impose match apr�s match au poste d''ouvreur avec la Squadra Azzura ?', 'Gower', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (75, 'Rugbyman camerounais au physique impressionnant, pass� par Auch et le Stade Fran�ais, ayant gagn�, � la surprise g�n�rale, une place de titulaire � l''USAP. Je suis... ', 'Tchale-Watchou', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (76, 'Capitaine polyvalent de l''�quipe briviste. Je suis un ancien treiziste pouvant couvrir tous les postes du 10 au 15. Je suis...', 'Estebanez', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (77, 'Apr�s avoir entrain� Montauban, j''ai pris en 2009, la t�te du Castres Olympique avec Laurent Travers. Je suis...', 'Labit', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (78, 'Entraineur fran�ais ayant remplac� au pied lev� C.Dominici pour entrainer les lignes arri�res du Stade Fran�ais, � l''or�e de la saison 2009. Je suis...', 'Faugeron', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (79, 'Perpignanais pure souche, je marque l''essai de la victoire en finale du Top 14 saison 2008/2009 contre l''ASM.', 'Marty', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (80, 'Ailier am�ricain, v�ritable feu follet, je suis capable de courir le 100m en 10 sec. et 25 centi�mes, et j''enchante le Top 14 � chacun de mes essais. Je suis...', 'Ngwenya', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (81, 'Pilier sur le terrain, tout comme dans le vestiaire, je signe dans mon club de c�ur apr�s 6 saisons au Clermont Auvergne.', 'Emmanuelli', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (83, 'Course de Biathlon, signifiant �tymologiquement "d�part en ligne". Je mets au prise les trente premiers du classement g�n�ral. Je suis la...', 'Mass-Start', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (84, 'Biathl�te su�doise, aussi rapide � ski qu''habile au tir, je remporte le gros globe de Cristal durant la saison 2008/2009.', 'Jonsson', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (85, 'Jeune et talentueuse biathl�te allemande, j''ai connu une saison difficile en 2008/09, apr�s avoir survol� la saison pr�c�dente.', 'Neuner', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (86, 'Biathl�te polonais, tr�s adroit au tir, je termine la saison 2008/09  � la deuxi�me place du classement g�n�ral.', 'Sikora', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (87, 'Biathl�te italienne, je suis plus connue pour �tre la femme du champion Bjoerndalen, que pour mes performances.', 'Santer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (88, 'Biathl�te suisse, qui a cr�� la surprise fin d''ann�e 2009, en accrochant un podium inesp�r� en Sprint. Je suis...', 'Frei', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (89, 'Biathl�te fran�ais qui, par sa r�gularit� au tir, remporte le seul succ�s fran�ais en 2008/09.', 'Jay', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (90, 'Biathl�te su�dois, souvent plac� mais rarement gagnant, ses 6�me, 7�me et 9�me au classement g�n�ral final, ces derni�res ann�es, en attestent.', 'Ferry', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (91, 'Biathl�te autrichien, consid�r� comme un des plus rapides sur les skis, je remporte le classement g�n�ral de la Mass-Start en 2009.', 'Landertinger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (92, 'Je suis un biathl�te norv�gien, consid�r� comme le plus rapide � ski, je n''ai malheureusement pas la m�me r�ussite au tir, ce qui ne me permet pas de jouer les premiers r�les. je suis...', 'Berger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (93, 'Sportif autrichien surnomm� Felitsche, je participe au combin� nordique, et remporte de nombreuses victoires, dont la plus belle : la m�daille d''or aux J.O de Turin en 2006.', 'Gottwald', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (94, 'Finlandais sp�cialiste du Combin� Nordique, et malgr� quelques difficult�s au saut, j''ai survol� les �preuves � ski, qui m''ont apport� mes quatre Globes de Cristal.', 'Manninen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (95, 'Sp�cialiste du combin� nordique finlandais, je suis la rel�ve d''Hannu Manninen, mais ce sont mes qualit�s de sauteur qui m''apportent le gros globe de Cristal en 2009.', 'Koivuranta', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (96, 'Sportif allemand, sp�cialiste du Combin�, j''ai livr�, pendant des ann�es, avec Hannu Manninen une des plus belles batailles offertes par les sports d''Hiver, et j''ai remport�, au passage, trois globes de Cristal.', 'Ackermann', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (97, 'Sportif fran�ais, participant au Combin� Nordique, je suis, avec Lamy-Chappuis, consid�r� comme le fran�ais le plus rapide � ski.', 'Lacroix', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (98, 'Je suis un am�ricain, participant au Combin� Nordique, j''ai livr� de belles batailles avec Lamy-Chappuis, me permettant d''accrocher la troisi�me place au g�n�ral en 2008. Je suis...', 'Demong', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (99, 'Champion am�ricain de Combin� Nordique , j''ai remport�, � Liberec, deux m�dailles d''or aux championnats du Monde 2009, apr�s �tre sorti de ma retraite. Je suis... ', 'Lodwick', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (100, 'Sportif norv�gien, j''ai livr�, � coup de meilleur temps � ski, une lutte fratricide avec Hannu Manninen. Mes limites au saut ne m''ont, pour l''instant, pas permis de remporter un globe de Cristal.', 'Moan', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (101, 'Jeune sportif fran�ais, qui apr�s avoir remport� des titres en espoir, fais, actuellement, avec Lamy-Chappuis et Lacroix, partie int�grante du groupe France.', 'Braud', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (102, 'Athl�te italien, sp�cialiste du Combin� Nordique, je monte, fin 2009 et � seulement 19 ans, sur mon premier podium en Coupe du Monde.', 'Pittin', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (103, 'Sportif norv�gien pr�nomm� Peter, j''ai termin� deuxi�me de la Coupe du Monde 2008, apr�s de belles victoires acquises par des sauts d�cisifs.', 'Tande', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (104, 'Famille de cyclistes russes, c''est Ag2r qui nous rassemblent sous le m�me maillot pour la saison 2008/09.', 'Efimkin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (106, 'Fils de grand champion fran�ais, j''ai rejoins Ag2r La Mondiale apr�s de nombreuses saisons au Cr�dit Agricole.', 'Sebastien Hinault', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (107, 'Cycliste, �quipier mod�le, et champion de Norv�ge 2009, je dois abandonner lors du Tour de France, � la suite d''une fracture de la clavicule.', 'Arvesen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (108, 'Sprinteur australien, poisson pilote de Mark Cavendish, j''�volue en 2009 chez Team Columbia, apr�s avoir roul� deux saisons pour le Cr�dit Agricole.', 'Renshaw', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (109, 'Cycliste fran�ais, je suis, � ma grande surprise, s�lectionn� pour les Championnats du Monde sur route, � Mendrisio, apr�s une saison 2009 prometteuse.', 'Riblon', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (110, 'Champion de Bi�lorussie, sprinteur de la Fran�aise des Jeux, je termine lanterne rouge du Tour de France 2009.', 'Hutarovich', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (111, 'Premier japonais � terminer le Tour de France, je suis, en 2009, un baroudeur, mais surtout un �quipier mod�le de la B-Box.', 'Arashiro', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (112, 'Cycliste colombien, je suis le plus jeune coureur sur le Tour de France 2009. �quipier de Valverde � la Caisse d''Epargne, je termine 5�me du Tour de Romandie.', 'Uran', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (114, 'Cycliste Italien, on m''a d�cern� le titre de Super combatif au Tour de France 2009, apr�s d''innombrables �chapp�es. Je suis... ', 'Pellizotti', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (115, 'Ancien coureur du Cr�dit Agricole, je suis, en 2009, le directeur sportif de Garmin-Slipstream. Je suis...', 'Vaughters', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (116, 'Coureur portugais, �quipier mod�le chez Astana, j''ai men� Contador � la victoire lors du Tour de France 2009. Je suis... ', 'Paulinho', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (118, 'Coureur italien, ayant port� le maillot Jaune pendant 8 jours sur le Tour de France 2009, je n''ai malheureusement pas r�ussi � terminer la Vuelta par la suite.', 'Nocentini', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (142, 'Cycliste et puncheur autrichien, champion national � plusieurs reprises, je suis contr�l� positif � l''EPO pour la seconde fois, et suis interdit � vie de toute comp�tition.', 'Pfannberger', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (119, 'Les trois fran�ais vainqueurs lors du Tour de France 2009 sont : Fedrigo Voeckler et...', 'Brice Feillu', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (120, '�quipe russe, soutenu par Poutine, je poss�de, en 2009, des coureurs tels que Karpets ou Steegmans. ', 'Katusha', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (121, 'Maillot vert du Tour de France 2009, j''ai eu pour co�quipier Mark Renshaw ou encore Julian Dean.', 'Hushovd', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (122, 'Le Luxembourg poss�de trois coureurs de grand talent : Andy et Franck Schleck et...', 'Kirchen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (123, 'Cycliste irlandais de l''�quipe Cerv�lo, je me classe 9�me du Tour d''Espagne apr�s y avoir remport� une victoire.', 'Deignan', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (124, 'Jeune coureur fran�ais de la Fran�aise des Jeux, je remporte, � la surprise g�n�rale, une �tape du Tour d''Espagne, qui vient r�compenser une premi�re saison prometteuse.', 'Anthony Roux', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (125, 'Cycliste espagnol m�connu, courant pour une �quipe continentale, ma r�gularit� et mes capacit�s en montagne me permettent de me classer dans les 5 premiers des trois derni�res Vueltas. Je suis...', 'Mosquera', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (126, 'Champion d''Estonie sur route et contre-la-montre, � seulement 22 ans, coureur de la Cofidis, je remporte le Tour de l''Ain et participe entres autres � la Vuelta.', 'Taaramae', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (127, 'Champion de France sur route 2009 au nez et � la barbe des �quipes Pro Tour, je contribue � la d�couverte de mon �quipe : Bretagne Armor-Lux. Je suis.', 'Champion', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (128, 'Octobre 2009 : D�c�s d''un des cyclistes belges les plus dou�s de sa g�n�ration, il remporta Li�ge-Bastogne-Li�ge, ou encore Gand-Wevelgem. J''�tais... ', 'Vandenbroucke', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (129, 'En 2009, r�volution sur la Vuelta, le maillot de Oro est remplac�. Mais quelle est la couleur du nouveau maillot du classement g�n�ral ?', 'Rouge', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (131, 'Apr�s une suspension en 2008, Alessandro Petacchi revient, en 2009, dans l''�quipe des "repentis", o� se trouve Di Luca ou encore Savoldelli. Mais quel est le nom de cette �quipe ?', 'LPR Brakes', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (132, 'Famille de cyclistes argentins, l''ain� appartenait � la Saxo Bank, avant que son fr�re, fin 2009, ne le rejoigne. Nous sommes les...', 'Haedo', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (133, 'Cycliste, r�f�rence du Cyclo-cross fran�ais sur la sc�ne internationale, je me suis impos� progressivement au sein de la Fran�aise des Jeux, au point de participer aux trois Grands Tours.', 'Mourey', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (134, 'Jeune Lituanien, ancien coureur du Cr�dit Agricole, j''ai sign� en 2009 chez Cerv�lo, et ai remport� la m�me saison, le contre-la-montre final du Giro.', 'Konovalovas', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (130, 'Je suis consid�r� comme le lieutenant de Valverde. Puncheur de talent, je termine la Vuelta 2009 � la 7�me place.  Je suis...', 'Joaquin Rodriguez', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (135, 'Exp�riment� cycliste italien, j''ai des faux airs de M.Pantani, et, en 2009, je remporte le maillot de Meilleur Grimpeur sur le Giro. Je suis...', 'Garzelli', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (136, 'Jeune cycliste fran�ais, je remporte la m�daille d''or dans la cat�gorie Espoirs aux championnats du Monde � Mendrisio.', 'Sicard', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (137, 'Grandissime championne n�erlandaise, j''ai tout gagn� depuis mes d�buts, mais �choue, en 2009, pour le troisi�me fois cons�cutive, � la deuxi�me place des Championnats du Monde sur route.', 'Marianne Vos', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (138, 'Cycliste belge, ancien coureur de la Fran�aise des Jeux, je remporte, en fin de saison 2009, Paris-Tours et le Tour de Lombardie.', 'Gilbert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (139, 'Cycliste allemand, licenci� chez Cerv�lo, apr�s avoir lanc� le sprint de tr�s loin, je me fait saut� sur la ligne par Cavendish sur le Milan-San Remo, puis accumule les places d''honneur durant la saison 2009.', 'Haussler', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (140, 'Cycliste fran�ais qui, gr�ce � mes belles performances sur les classiques, termine Premier fran�ais au Classement Pro Tour 2009.', 'Sylvain Chavanel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (113, 'Cycliste fran�ais, licenci� chez Agritubel, je signe pour la saison 2010 dans l''�quipe de Lance Arsmtrong, RadioShack.', 'Lequatre', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (141, 'Cycliste fran�ais, chef de file du sprint dans l''Hexagone, je remporte la Coupe de France 2009.', 'Casper', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (143, 'Cycliste hongrois, rouleur et co�quipier hors pair, j''ai remport� de nombreux contre-la-montre, avec le Cr�dit Agricole, puis en 2009, avec Katusha.', 'Bodrogi', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (144, 'Petit prodige norv�gien, aussi bon rouleur que grimpeur, je remporte des succ�s sur le Giro, et Gand-Wevelgem en 2009, avec Team Columbia, avant de signer en 2010 chez Sky.', 'Boasson Hagen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (145, 'Sprinteur allemand, appartenant � Team Columbia, je survole la Vuelta 2009 avec 4 victoires d''�tapes et domine le Classement par Points.', 'Greipel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (146, 'Baroudeur n�erlandais pr�nomm� Martijn, sp�cialiste des classiques flandriennes, apr�s avoir termin� 4�me de Paris-Roubaix l''ann�e pr�c�dente, je confirme, en 2009, avec une quatri�me place au Tour des Flandres.', 'Maaskant', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (147, 'Quel sauteur � ski est surnomm� "l''�berflieger" ?', 'Martin Schmitt', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (148, 'Exp�riment� sauteur � ski polonais, star et mythe de la discipline, j''ai survol� la discipline pendant plusieurs ann�es, et d�tient le nombre de victoires en comp�tition, et je monte encore aujourd''hui sur les podiums � 32 ans.', 'Malysz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (149, 'Sauteur � ski finlandais, de retour � la comp�tition, en 2009, apr�s une ann�e sabbatique, j''ai remport� cinq fois la tourn�e des Quatre Tremplins, ce qui fait de moi un des plus grands sauteurs de l''Histoire.', 'Ahonen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (150, 'Sauteur � ski finlandais, on me surnomme "l''Homme qui ne sourit jamais", je suis...', 'Ahonen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (151, 'Sauteur � ski suisse, aux faux airs d''Harry Potter, je reviens en forme en 2009 avec plusieurs succ�s, mais mon principal fait d''arme reste ma m�daille d''or inattendue au J.O d''Hiver en 2002. Je suis...', 'Ammann', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (152, 'Je suis la ville poss�dant le plus grand Tremplin du Monde, tous les plus beaux records y sont tomb�s. Je suis le K185 de...', 'Planica', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (153, 'Sauteur � ski autrichien, surnomm� "l''�toile du matin", je remporte de nombreuses victoires en fin de saison 2008/09, et suis dans la lign�e des grands champions tels que Loitzl, ou autres Widholzl. Je suis...', 'Morgenstern', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (154, 'Prodige du saut � ski autrichien, je remporte mes premi�res comp�titions internationales � seulement 16 ans, et, en 2009, je remporte le Classement g�n�ral de la Coupe du Monde.', 'Schlirenzauer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (155, 'Le saut � ski est bas� sur le saut proprement dit, mai aussi sur la r�ception, pour optimiser la qualit� de la r�ception, il faut poser le...', 'Telemark', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (156, 'Sauteur � ski norv�gien, pr�nomm� Bjorn, je poss�de, avec mes 239,5m, le record officiel du plus long saut jamais r�alis�. Je suis...', 'Romoeren', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (158, 'Sauteur � ski fran�ais, en constante progression, je me classe r�guli�rement dans le Top 15, r�ussissant m�me un podium (3�me) en fin d''ann�e 2009.', 'Chedal', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (159, 'Sauteur � ski fran�ais qui, malgr� des difficult�s en 2009, a longtemps �t� recordman de France avant d''�tre d�poss�d� de ce titre par E.Chedal. Je suis David...', 'Lazzaroni', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (160, 'Petite perle de la Mannschaft, et digne successeur de M.Schmitt, je monte, en fin d''ann�e 2009 et � seulement 18 ans, sur un podium en Coupe du Monde. Je suis...', 'Bodmer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (157, 'Compatriote de Simon Ammann, je remporte une m�daille d''or inesp�r�e aux Championnats du Monde Grand Tremplin de Liberec en 2009. Je suis...', 'Kuettel', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (161, 'Famille de sauteurs � ski finlandais, Matti, la cadet remporta de nombreux succ�s, tandis que l''ain� Jussi eu une carri�re plus modeste. Nous sommes les...', 'Hautamaki', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (162, 'Sauteur � ski finlandais, digne successeur de J.Ahonen, je compte trois victoires en 2009 dont une mythique sur le tremplin de Planica. Mes bons r�sultats me permettent de terminer quatri�me au classement g�n�ral de la Coupe du Monde.', 'Olli', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (163, 'Pour tenter de se rapprocher du meilleur niveau mondial, l''�quipe de France de Saut � ski s''attache les services d''un entraineur de renom. Mais quelle est la nationalit� de cet entraineur ? ', 'finlandais', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (164, 'En d�ficit de sauteurs � ski performants pour le concours par �quipes 2009, l''Equipe de France s''octroie les services d''un talentueux athl�te. Qui est-il ?', 'Lamy-Chappuis', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (165, 'En 2009, l''entraineur adjoint de l''�quipe de France de Saut � ski n''est autre que le dernier vainqueur fran�ais en Coupe du Monde. Qui est-il ?', 'Dessum', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (167, 'Sauteur � ski russe, ma r�gularit� me permet de monter sur quelques podiums et de terminer 5�me de la Coupe du Monde 2009, sans jamais remporter le moindre concours au cours de ma carri�re. Je suis...', 'Vassiliev', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (168, 'Sauteur � ski japonais, qui en 2009, et � 38 ans, devient le vainqueur d''un concours le plus �g� de l''Histoire. ', 'Okabe', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (166, 'Ensemble de sauteurs � ski class�s dans les dix premiers mondiaux, ces derniers privil�gient d''une immunit� lors des qualifications. Ces sauteurs font partis du groupe des...', 'prot�g�s', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (169, 'Star australienne longtemps pressentie � Bayonne, je signe finalement, fin 2009, pour le Leicester, et vient renforcer leur ligne de trois-quart.', 'Tuqiri', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (170, 'Ancien troisi�me ligne et capitaine embl�matique de Montauban, je succ�de, en 2009, � L.Travers et L.Labit au poste d''entraineur de Montauban.', 'Marc Raynaud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (171, 'Pilier camerounais, toujours un casque sur la t�te, je participe � la finale du Challenge Europ�en en 2009, et f�te une s�lection avec les Barbarians la m�me ann�e. Je suis...', 'Tchougong', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (172, 'Demi de M�l�e form� au RC Metz, je fais mes gammes � Bourgoin Jailleu, avant de taper dans l''�il de Vern Cotter, par ma vivacit� et ma qualit� de passe. Je suis...', 'Parra', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (173, 'V�ritable mal�diction perpignanaise, en 2009, joker m�dical, joueur replac�, titulaire, ou simple rempla�ant tous se blessent � un poste cl�. Mais lequel ?!', 'demi d''ouverture', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (174, 'Troisi�me ligne sud-africain, �voluant � Brive, mes remarquables performances en 2009 tapent dans l''oeil de M.Li�vremont qui me voit un avenir en bleu, blanc, rouge. Je suis...', 'Claassen', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (175, 'Centre anglais d''origine n�o-z�landaise, je signe, en 2009, � Brive apr�s une saison remarquable avec les Wasps et le XV de la Rose.', 'Flutey', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (176, 'Arri�re talentueux mais fragile, apr�s mon d�part du Stade Fran�ais, je suis longtemps rest� sans club, avant de trouver refuge � Brive, fin 2009.', 'Jeanjean', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (177, 'Rugbyman roumain, apr�s plusieurs saisons � Pau, je viens renforcer la ligne arri�re d''Albi,fin 2009, qui utilise avant tout ma qualit� de jeu au pied, par des drops ou des p�nalit�s.', 'Dumitras', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (178, 'Pilier fran�ais form� � Albi, qui apr�s une saison d�cevante avec le Stade Fran�ais, a rejoins son club formateur, en 2009.', 'Correia', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (179, 'Demi de m�l�e samoan, qui apr�s l''arriv�e de Parra � Clermont en 2009 � fait le chemin inverse pour rejoindre Bourgoin et regagner du temps de jeu. Je suis...', 'John Senio', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (180, 'Meilleur contreur du Top 14, troisi�me ligne aile fran�ais, j''ai quitt� Montauban pour rejoindre les rangs du Castres Olympique en 2009. Je suis...', 'Caballero', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (181, 'Jeune troisi�me ligne fran�ais, form� au Stade Toulousain et qui, apr�s une belle saison avec le Stade Montois en Top 14, a rejoint les rangs de Montpellier en 2009.', 'Giraud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (182, 'Famille de rugbymen fran�ais, tous deux demi de m�l�e, nous sommes, en 2009, l''avenir du Montpellier Herault. Nous sommes les...', 'Tomas', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (183, 'Rugbyman polyvalent capable de couvrir tous les postes dans les lignes arri�res, j''ai jou� au Stade fran�ais plusieurs saisons avant de signer il y a quelques ann�es � Montpellier. Je suis, en 2009, et � 34 ans, un arri�re exp�riment�.', 'Sarramea', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (184, 'Rugbyman �cossais international �voluant au poste d''arri�re, je signe, en 2009, � Toulon, apr�s avoir �volu� � Sale et Glasgow.', 'Rory Lamont', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (185, 'Jeune international espoir, champion du monde 2006 avec L.Beauxis, apr�s quelques matchs prometteurs � la m�l�e en 2009, je signe sur la Rade, pour rejoindre la bande � Saint Andr�. Je suis...', 'Cibray', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (186, 'Trois-quart centre italien, je suis repositionn� � l''arri�re par N.Mallet en s�lection, je tarde � m''imposer apr�s mon transfert de Biarritz au Racing M�tro, en 2009.', 'Masi', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (187, 'En 2009, le Racing M�tro r�ussit un gros coup sur le march� des transferts en enr�lant la star sud-africaine : Fran�ois Steyn. Mais � quel club du Super 14 appartenait-il avant la transaction ?', 'Natal Sharks', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (188, 'Jeune pilier form� au Stade fran�ais, je m''exile au Stade Toulousain en 2007, mais mes performances et la concurrence au poste ne me permettent pas d''�tre, en 2009, un �l�ment incontournable du XV compos� par G.Nov�s.', 'Montes', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (189, 'Brock James termine l''exercice 2008/09 comme meilleur r�alisateur du Top 14. Mais quel joueur anglais, plus connu pour son jeu au pied que pour ses relances, prend la deuxi�me place ? ', 'Goode', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (117, 'Coureur n�o-z�landais, ancien poisson pilote d''Hushovd, il f�t celui de Farrar pendant les Grands Tours 2009. Je suis...', 'Dean', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (73, 'Quel arri�re, buteur r�gulier, du Castres Olympique est surnomm� Robocop ?', 'Teulet', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (190, 'Seul gallois pr�sent dans l''�quipe type de la saison 2009 (source : L''�quipe) , on me pr�sente comme le digne successeur de l''ailier S.Williams. Je suis...', 'Halfpenny', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (192, 'L''USAP remporte, en 2009, le titre de Champion de France du Top 14 et est maintenant la 5�me �quipe fran�aise la plus titr�e. Mais avec combien de Bouclier de Brennus ?', '7', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (193, 'D�sillusion majeure du rugby fran�ais en 2009, L''�quipe de France �choue dans sa qu�te de Grand Chelem lors du Tournoi des VI Nations. Pire, elle s''incline � deux reprises. Mais � quelle place termine-t-elle ?', '3', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (194, 'Troisi�me ligne castrais pr�sent dans l''�quipe type du Top 14 2009 (source : L''�quipe), j''ai renonc�, depuis mon arriv�e en France, au maillot all-black. Je suis... ', 'Masoe', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (191, 'Seul fran�ais pr�sent dans l''�quipe type de la saison 2009 (source : L''�quipe) , je m''inscris dans la lign�e des P.De Villiers ou autres C.Califano. Je suis...', 'Barcella', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (195, 'Aux Mondiaux de Val d''Is�re 2009, une fran�aise cr�e la sensation en prenant la deuxi�me place du Super-G derri�re L.Vonn. Qui est-elle ?', 'Marchand-Arvier', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (196, 'Aux Mondiaux de Val d''Is�re 2009, Julien Lizeroux remporte deux m�dailles en slalom et super combin�. Mais de quel m�tal ?', 'argent', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (197, 'Grandissime championne de ski-cross, pr�nomm�e Oph�lie, je remporte, en 2009, ma sixi�me Coupe du Monde de la discipline. Je suis...', 'David', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (199, 'Jeune et talentueux fondeur suisse, je remporte, en 2009, le classement g�n�ral de la Coupe du Monde de Ski de fond. Je suis...', 'Cologna', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (200, 'Fondeuse polonaise, pr�nomm� Justina, je remporte le classement g�n�ral de la Coupe du Monde 2009, devant la slov�ne Petra Majdic. Je suis...', 'Kowalczyk', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (201, 'Skieur de fond fran�ais, sp�cialiste du sprint, qui, apr�s une m�daille d''argent surprise � Turin en 2006, tarde � m''imposer comme un cador de la discipline. Je suis...', 'Darragon', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (202, 'Skieur de fond fran�ais, pr�nomm� Maurice, je monte, fin 2009, sur mon premier podium en Coupe du Monde, lors d''un 15km, � Davos.', 'Manificat', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (203, 'Fin 2009, � Davos, l''�quipe de France de Ski de fond r�alise un v�ritable exploit en pla�ant tous ses skieurs dans la Top 10. Mais combien �taient-ils ?', '5', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (204, 'Skieur de fond italien, connu pour mon mon bonnet jaune � pompon, je termine 4�me du classement g�n�ral de la Coupe du Monde 2009, � plus de 35 ans. Je suis...', 'Piller Cottrer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (206, 'Fondeuse finlandaise, je remporte le Tour de Ski 2009, apr�s avoir �t� suspendu deux ans pour dopage. Je suis...', 'Kuitunen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (207, 'Quel club, fut champion d''hiver de ligue 1 fran�aise en cette fin d''ann�e 2009 ?', 'Bordeaux', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (208, 'Dans quel club anglais, Fr�d�ric PIQUIONNE, s''est il relanc� ?', 'portsmouth', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (209, 'Quel grand attaquant munichois a re�u un bon de sortie pour le mercato hivernal en cette fin d''ann�e 2009 ?', 'toni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (198, 'Chef de file du ski de fond fran�ais, je vis une ann�e 2009 difficile, malgr� quelques podiums et une bonne fin de saison. Je suis...', 'Vittoz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (210, 'Entra�neur, j''entra�ne successivement : Cor�e du Sud, Australie et Russie, qui suis je ?', 'hiddink', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (205, 'Skieur de fond, je termine meilleur fran�ais du Tour de Ski 2009, � la 6�me place du g�n�ral. Je suis...', 'Gaillard', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (211, 'Quelle nation, �limine la Russie en barrages de la Coupe du Monde 2010 ? ', 'Slov�nie', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (212, 'Parmi ces �quipes : Italie, Br�sil, Angleterre et France, laquelle se retrouve dans le groupe de la C�te d''Ivoire lors de la Coupe du Monde 2010 ? ', 'Br�sil', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (213, 'Dans quel club, �volue depuis le mercato d''�t� 2009, le fran�ais Younes KABOUL ?', 'portsmouth', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (214, 'Quel entra�neur, remplace Mark HUGUES, � la t�te de Manchester City ?', 'mancini', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (216, 'Quel joueur, qualifie l''Alg�rie pour la Coupe du monde 2010 ?', 'Yahia', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (217, 'Dans quel pays, a eu lieu le match d�cisif entre l''Alg�rie et l''Egypte en barrages de la Coupe du Monde 2010 ?', 'soudan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (221, 'Combien de Portugais compte l''effectif du Real Madrid depuis l''�t� 2009 ?', '2', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (223, 'Combien d''arbitres officiels compte un match d''Europa League ?', '5', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (224, 'Je suis argentin et porte le num�ro 22 de l''Internazionale, qui suis-je ?', 'milito', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (227, 'Je suis licenci� du poste d''entra�neur au Mans en cette fin d''ann�e 2009 et dirige d''une main de ma�tre l''�quipe nationale du Burkina Faso, qui suis-je ?', 'duarte', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (218, 'Ancien madril�ne et bordelais, j''�tudie, en cette fin d''ann�e 2009, la possibilit� de jouer pour l''Alg�rie, qui suis-je ? ', 'faubert', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (222, 'Combien d''�quipes italiennes, participeront � la phase finale de Ligue des Champions 2009/2010 ? ', '3', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (225, 'En 2009, dans quel club, a �t� pr�t� Andriy Shevchenko ?', 'dynamo kiev', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (215, 'Quel est l''entra�neur de West Ham depuis l''�t� 2009 ?', 'zola', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (226, 'Quel joueur autrichien est venu s''ajouter � l''effectif Interiste durant le mercato d''�t� 2009 ? ', 'arnautovic', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (219, 'Quel est le plus jeune joueur de l''Histoire de Premier League � avoir d�but�, en 2009, sa carri�re avec le maillot des Blues ?', 'kakuta', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (228, 'Skieur fran�ais, pr�nomm� Cyprien, je monte pour la premi�re fois sur un podium en Coupe du Monde, avec une troisi�me place, fin 2009, � Alta Badia.', 'Richard', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (229, 'Jeune patineur fran�ais, je remporte, en 2009, et � 19 ans, les championnats de France devant Y.Ponsero et A.Pr�aubert. Je suis...', 'Amodio', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (230, 'Champion allemand de bobsleigh, je participe, en fin 2009, et � 36 ans, � ma derni�re saison Coupe du Monde, apr�s avoir tout gagn�. Je suis...', 'Lange', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (231, 'Skieur polyvalent norv�gien, je remporte, en 2009, le grand globe de Cristal, ainsi que le petit globe du Super-G. Je suis...', 'Svindal', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (232, 'Jeune biathl�te fran�aise, pr�nomm� Marie-Laure. Je monte, en 2009, sur mon premier podium, avec une prometteuse troisi�me place lors d''une poursuite.', 'Brunet', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (233, 'International gallois, je r�alise, en 2009 et � la surprise g�n�rale, mon coming-out, en avouant mon homsexualit�. Je suis...', 'Gareth Thomas', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (234, 'L''ann�e 2009 a �t� marqu�e par la premi�re s�ance de tirs au but en H-Cup. Mais quel vaillant troisi�me ligne gallois, pr�nomm� Martyn, manqua le tir au but d�cisif ?', 'Williams', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (235, 'Talentueux international fran�ais �voluant � Perpignan, je remporte, en 2009, l''Oscar Midi Olympique. Je suis...', 'Mermoz', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (236, 'Entraineur fran�ais, ayant men� mon �quipe au Brennus en 2009, je remporte la m�me ann�e l''Oscar Midi Olympique du Meilleur Entra�neur. Je suis...', 'Brunel', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (237, '�quipe de rugby fran�aise, je connais une saison 2008/2009 difficile en �vitant de peu la rel�gation, mais arrive, tout de m�me, en finale du Challenge europ�en, finale perdue face � Northampton. Je suis...', 'Bourgoin-Jallieu', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (239, 'Cycliste sur piste surpuissant, je remporte la vitesse individuelle aux Championnats du Monde 2009. Je suis...', 'Bauge', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (240, 'Cycliste belge, pr�nomm� Dominique. Apr�s avoir �t� champion du Monde espoirs du Contre-la-montre, je remporte la m�daille de bronze lors de la poursuite aux Championnats du Monde sur piste, en 2009.', 'Cornu', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (241, 'V�ritable surprise fran�aise aux Championnats du Monde sur piste en 2009, je remporte la m�daille d''or du scratch, � seulement 22 ans. Je suis Morgan...', 'Kneisky', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (242, 'Pistarde fran�aise de talent, sp�cialiste de la vitesse et du keirin, je remporte la m�daille d''argent dans cette �preve aux Championnats du Monde 2009. Je suis... ', 'Clara Sanchez', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (238, 'Nouvelle �quipe sur le circuit Continental, j''impressionne, en 2009, avec mon recrutement labellis� ProTour : Evans, Hincapie, et autres Ballan... Je suis...', 'BMC Racing', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (243, 'Apr�s un passage �clair � Saint Etienne, je signe en faveur du Z�nith Saint P�tersbourg, avant de me relancer avec Monaco en cette fin d''ann�e 2009, qui suis-je ?', 'puygrenier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (244, 'Irlandais, je quitte Tottenham pour Liverpool, avant d''y revenir au mercato d''�t� 2009, qui suis-je ?', 'keane', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (247, 'Ancien marseillais, je suis forc� de quitter Bastia apr�s avoir re�u des menaces de mort du fait des mauvais r�sultas du club en ligue 2, qui suis-je ? ', 'arrache', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (246, 'Attaquant italien, j''effectue mon retour a San Siro apr�s avoir excell� pendant une saison du cot� du Genoa, qui suis-je ? ', 'boriello', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (248, 'Gardien international allemand, d�c�d� le 11 Novembre 2009 dans un accident de train, je suis ...', 'enke', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (249, 'Ballon d''or africain 2009, je suis ..', 'eto''o', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (220, 'Quel �quipe surprise, a disput� la finale de la Coupe des Conf�d�rations 2009 face au Br�sil ?', '�tats unis', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (250, 'Ailier gauche br�silien du championnat fran�ais , j''effectue ma premi�re s�lection dans un match amical face � l''Angleterre, � Doha, je suis ...', 'bastos', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (251, 'En mal de temps de jeu au LOSC, je me relance du c�t� de strasbourg en 2009, en ligue 2, qui suis-je ?', 'fauvergue', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (252, 'Pr�t� � Grenoble pour sa premi�re saison en Ligue 1 par Lyon, il rejoint finalement ce club d�finitivement au mercato d''�t�, qui suis-je ?', 'paillot', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (254, 'Capitaine embl�matique, je rate la premi�re partie de saison avec Boulogne-sur-Mer, qui suis-je ?', 'thill', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (256, 'Ancien gardien Bordelais, je suis transf�r� � Toulouse en D�cembre 2009, pour pallier aux blessures, qui suis-je?', 'valverde', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (258, 'Dans quel club italien, Simone INZAGHI, a retrouv� du temps de jeu en cette fin d''ann�e 2009 ?', 'lazio', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (259, 'Quelle est la derni�re �quipe africaine qualifi�e pour la Coupe du Monde 2010, en plus de celles ci : C�te d''Ivoire, Alg�rie, Cameroun, Nigeria et Afrique du Sud ?', 'ghana', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (280, 'Apr�s avoir quitt� le SLUC en 2009, dans quel club s''est r�fugi� TJ Parker ?', 'villeurbanne', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (261, 'Sur quel score, le FC Barcelone bat en finale de Ligue des Champions 2009, le tenant du titre Manchester United ? ', '2-0', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (263, 'Quel fut le meilleur buteur de la Coupe des Conf�d�rations 2009 ?', 'luis fabiano', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (264, 'Lors de la Coupe des conf�d�rations 2009, le groupe A �tait compos� de : Espagne, Afrique du Sud, Nouvelle-Z�lande et ...', 'Irak', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (266, 'Pour quel club, Kaba DIAWARA, a t-il sign� cet �t� 2009 ?', 'arles-avignon', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (267, 'Apr�s une saison g�ch�e par des blessures, dans quel club, John MENSAH, s''est il relanc� cet �t� 2009 ?', 'sunderland', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (268, 'Pr�t� la saison derni�re � la Fiorentina, il revient cet �t� 2009, et devient le troisi�me gardien officiel de l''AC Milan, qui est-il ? ', 'storari', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (265, 'Qui est le pr�sident de la F�d�ration Fran�aise de Football en 2009 ?', 'escalettes', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (255, 'En mal de temps de jeu au FC Metz, je suis pr�t� en fin de saison 2008/2009 � Sedan, qui suis-je ?', 'babacar gueye', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (269, 'Ancien d�fenseur parisien, il se relance lors de la saison 2008/2009, � Hull City, qui est-il ? ', 'bernard mendy', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (257, 'Comment se nomme le pr�sident fran�ais de la juventus de Turin ?', 'jean-claude blanc', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (245, 'Capitaine de l''�quipe de France Espoir, je figure comme un �l�ment d�fensif indispensable pour le club de la capitale, qui suis-je ?', 'mamadou sakho', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (260, 'Quel est le num�ro de maillot de RONALDINHO � l''AC MILAN, durant la saison 2009/2010 ?', '80', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (253, 'Espoir en devenir, je quitte le Rh�ne pour signer durant l''�t� 2009 du c�t� de l''OGC Nice, qui suis-je ?', 'mounier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (262, 'Milieu ghan�en �voluant en Italie, je suis exclu, fin D�cembre 2009, du groupe de joueurs, destin� � jouer la Coupe d''Afrique 2010, qui suis-je ?', 'muntari', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (270, 'Quel lieutenant de K.Bryant, consid�r� comme le meilleur 6�me Homme de la NBA, permet au Lakers de remporter le titre NBA, en 2009 ?', 'Odom', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (271, 'Quel joueur fut, en 2009, �lu meilleur �tranger de pro A ?', 'nichols', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (272, 'Dans quel club �volue, Austin Nichols lors de la saison 2009/2010 de pro A ?', 'orl�ans', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (273, 'Quel joueur, a �t� �lu MVP fran�ais lors de la saison 2008/2009 de pro A ?', 'koffi', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (274, 'Quel joueur a �t� �lu meilleur espoir de pro A, lors de la saison 2008/2009 ?', 'heurtel', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (275, 'Quel joueur a �t� �lu meilleur d�fenseur de pro A, lors de la saison 2008/2009 ?', 'dobbins', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (276, 'Quel joueur �voluant en 2009, au Dallas Mavericks, a re�u le titre MIP lors de la saison 2008/2009 de pro A ? ', 'beaubois', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (277, 'Quel est le premier club NBA de Rodrigue Beaubois ?', 'dallas', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (278, 'Dans quel club, Ronny Turiaf, s''est r�fugi� apr�s avoir quitt� les lakers en 2009 ?', 'golden state', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (279, 'Dans quel club �voluait Boris Diaw, avant de rejoindre les Charlotte Bobcats en 2009 ?', 'phoenix suns', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (281, 'Derri�re quelle grande star des SPURS, Ian Mahinmi tente-t-il de gagner du temps de jeu au poste de centre lors de la saison 2009 ?  ', 'duncan', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (282, 'Sauteur � ski autrichien, je remporte devant S.Ammann et G.Schlirenzauer, la tourn�e des 4 Tremplins, au d�but de l''ann�e 2009. Je suis...', 'Loitzl', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (283, 'Famille de skieurs italiens, le fr�re est un concurrent direct de J.B. Grange en slalom, tout comme la soeur, sp�cialiste du slalom g�ant et du slalom. Nous sommes les...', 'Moelgg', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (284, 'Skieuse fran�aise, pr�nomm� Taina, je suis une sp�cialiste du G�ant, et monte sur mon premier podium, fin 2009, � 21 ans.', 'Barioz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (285, 'Descendeur fran�ais, pr�nomm� Johan, je reviens en forme et monte sur le podium � Val Gardena, apr�s une terrible blessure aux deux genoux, au d�but de l''ann�e 2009. Je suis...', 'Clarey', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (286, 'Descendeur canadien, pr�nomm� John, je remporte � la surprise g�n�rale, la m�daille d''or lors de la descente des Championnats du Monde � Val d''Is�re, en 2009.', 'Kucera', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (287, 'Fin 2009, Julien Dupuy est suspendu pour 6 mois par l''ERC. Mais quel mauvais geste est responsable de cette sanction disciplinaire ?', 'Fourchette', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (289, '�quipe d''Afrique du Sud, je remporte le Super 14, en 2009, avant de voir ma star, B.Habana, rejoindre les Stormers. ', 'Bulls', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (290, 'Province sud-africaine, qui apr�s avoir recrut� Michalak en 2008, se paye les services du magicien, Juan Martin Hernandez, en 2009.', 'Sharks', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (288, 'Apr�s l''�viction de Laurent Seigne, en 2009, je prends seul les commandes de l''entrainement brisviste. Ancien demi de m�l�e international, je suis Christophe...', 'Laussucq', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (291, 'Demi de m�l�e international argentin, qui malgr� les propositions de clubs du Top 14, en 2009, apr�s la rel�gation de son club, d�cide de continuer l''aventure avec Dax, en Pro D2.', 'Vergallo', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (292, 'Fantasque joueur fidjien, connu autant pour mon indiscipline que pour ma puissance. Je reviens, en 2009, au niveau qui a fait de moi, le meilleur joueur du Top 14, avec Agen.', 'Caucaunibuca', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (293, 'Cycliste fran�ais de la FdJ, ancien puncheur du Cr�dit Agricole, qui, apr�s une belle 10�me place � Paris-Nice, confirme en terminant 10�me du Tour de France 2009.', 'Le Mevel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (294, 'Champion de cyclisme sur route finlandais, je participe, en 2009, avec la FdJ au Tour de France, et y porte le maillot de Meilleur Grimpeur.', 'Veikkanen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (295, 'Exp�riment� cycliste fran�ais, apr�s une belle fin de saison 2009 avec Agritubel, je signe, pour un dernier challenge, � la Caisse d''Epargne. ', 'Moreau', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (296, 'Cycliste irlandais, je suis champion national en 2009. Dans la lign�e de mon p�re Stephen, je termine mon premier Tour de France � la 29�me place. ', 'Nicolas Roche', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (297, 'Prometteur cycliste allemand, pr�nomm� Tony, qui, apr�s de nombreuses places d''honneur, en 2009, remporte la m�daille de bronze aux Championnats du Monde de contre-la-montre � Mendrisio.  ', 'Martin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (298, 'Cycliste fran�ais, co�quipier mod�le en montagne, et capitaine de route d''Ag2r la Mondiale, je mets un terme � ma carri�re, en 2009, � 39 ans.', 'Goubert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (299, 'Cycliste belge, pr�nomm� Niels, je remporte, en 2009, devant mon rival, Sven Nys, le titre de Champion du Monde de Cyclo-cross. ', 'Albert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (300, 'Grandissime champion de Cyclo-cross belge, je survole la discipline depuis plusieurs ann�es et remporte, en 2009, et pour la 5�me fois cons�cutive le classement de la Coupe du Monde. Je suis...', 'Nys', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (303, 'Ancien rennais, lyonnais mais aussi st�phanois, je prends les commandes de Dijon en tant qu''entraineur durant la saison 2009/2010, qui suis-je ?', 'carteron', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (302, 'Grand espoir anglais, je suis transf�r� �t� 2009 du c�t� de Chelsea, je quitte alors mon club formateur Manchester City, qui suis-je ?', 'sturridge', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (305, 'Milieu offensif tunisien, form� � Amiens, je suis l''un des principaux artisans du bon d�but de saison 2009 de Valenciennes, qui suis-je ?', 'Ben Khalfallah', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (306, 'Ancien mon�gasque et caennais, je suis pr�t� par mon club, au Glasgow Rangers pour la saison 2009/2010, qui suis-je ?', 'rothen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (307, 'Championnats du Monde 2009 � Val d''Is�re : la descente femmes est remport� par l''am�ricaine...', 'Vonn', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (309, 'Championnats du Monde 2009 � Val d''Is�re : belle performance d''ensemble des fran�aises en descente, avec, pour point d''orgue, la 4�me place de Marion...', 'Rolland', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (314, 'Skieuse allemande, s�ur de Susanne, elle aussi skieuse, je remporte le slalom aux Championnats du Monde 2009 � Val d''Is�re.   ', 'Maria Riesch', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (310, 'Prodige suisse, pr�nomm�e Lara, je termine 2�me de la descente femme des Championnats du Monde 2009 � Val d''Is�re, � seulement 18 ans. Je suis... ', 'Gut', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (315, 'Ailier international fran�ais, je rejoins pour la saison 2008/2009, les Trail Blazers de Portland, qui suis-je ?', 'batum', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (316, 'Slalomeur autrichien, pr�nomm� Manfred, ma m�daille d''or aux Championnats du Monde � Val d''Is�re vient r�compenser une belle saison 2009.', 'Pranger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (317, 'Pivot asiatique, j''entame ma 7 �me saison avec les Houston Rockets en 2009, qui suis-je ?', 'yao ming', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (318, 'Skieur croate, sp�cialiste du slalom, je termine la saison 2009, en �chouant de peu dans la qu�te du petit Globe de Cristal dans ma discipline de pr�dilection.', 'Ivica Kostelic', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (308, 'Ancien manager et entraineur, j''occupe en 2009, la place de DTN � la F�d�ration Fran�aise de Football , qui suis-je ?', 'houiller', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (301, 'Attaquant transf�r� au Mercato hivernal 2009, il quitte le FC Metz pour rejoindre Fribourg, en Allemagne, qui est-il ?', 'papiss cisse', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (312, 'Fils d''un mythique gardien mancunien, je rejoins Notts County en juillet 2009 avec Sol Campbell entre autre, qui suis-je ?', 'kasper schmeichel', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (311, 'Ancien d�fenseur gunner, je rejoins le club de Notts County en juillet 2009, qui suis-je ? ', 'sol campbell', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (304, 'Attaquant fran�ais consid�r� comme un �ternel espoir, je suis transf�r� au 
Mercato hivernal 2009 de l''Atletico Madrid au Sporting Lisbonne, qui suis-je ?', 'sinama-pongolle', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (320, 'Face � quelle �quipe, les grecs du Panathina�k�s Ath�nes ont il remport� la finale de l''Euroligue 2009 ?', 'Moscou', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (327, 'L''�t� 2009 est marqu� par une affaire entre France et Nouvelle Z�lande. Ces rixes sont dus aux mensonges d''un jeune et prometteur fran�ais, au gabarit impressionnant. Il se pr�nomme...', 'Bastareaud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (321, 'Troisi�me ligne des London Irish, je f�te ma premi�re s�lection, avec mon fr�re Delon, sous le maillot du XV de la Rose, en 2009.', 'Steffon Armitage', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (322, 'Quelle �quipe, est en 2009, la plus titr�e en Euroligue depuis sa cr�ation en 1958 ?', 'real madrid', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (324, 'Meneur serbe du Tau Vitoria, je suis le meilleur marqueur de l''Euroligue 2008/2009 ?', 'Rakocevic', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (323, 'Quelle �quipe anglaise � la chance de compter, en 2009, dans ses rangs, les deux fr�res Armitage, Delon et Steffon ? ', 'London Irish', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (332, 'Ancien ailier de Dax et du Stade fran�ais, je suis recrut� par le Racing M�tro, en 2009, pour mes qualit�s de vitesse et de finisseur. Je suis...', 'Saubade', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (330, 'Quel ancien international fran�ais s''occupe, en 2009, des lignes arri�res du XV de France ?', 'N''tamack', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (319, 'Quelle �quipe a remport� l''Euroligue 2009, � Berlin, en dominant les russes du CSKA Moscou ?', 'Panathinaikos', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (331, 'Ailier argentin, pr�nomm� Lucas, qui apr�s une saison en demi-teinte � Dax, choisi de rejoindre les rangs d''Albi en 2009.', 'Borges', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (328, 'Meneur grec du Panathina�kos, je suis �lu meilleur d�fenseur de l''Euroligue, saison 2008/2009, qui suis-je ?', 'Diamantidis', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (333, 'Demi d''ouverture n�o-z�landais, qui en rejoignant les Harlequins, lors de la saison 2008/2009, tire un trait sur sa carri�re internationale. Je suis...', 'Evans', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (334, 'Arri�re serbe, je suis transf�r� au Real Madrid, apr�s avoir �t� �lu meilleur espoir lors de l''Euroligue 2008/2009, qui suis-je ?', 'velickovic', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (360, '�quipier mod�le, et coureur espagnol exp�riment� de Cerv�lo, je suis, � 40 ans, le cycliste le plus �g� du Tour de France 2009.', 'Cuesta', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (335, 'Ailier anglais des Harlequins, surnomm� Moners, je participe, en 2009, � mon premier Tournoi des 6 Nations.', 'Monye', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (326, 'Surnomm� la " bomba " au FC Barcelone et ancien joueur de NBA, je suis �lu MVP de la saison r�guli�re en Euroligue, saison 2008/2009 ?', 'Juan Carlos Navarro ', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (336, 'Ailier fidjien aux appuis hors norme, je mets un terme � ma carri�re internationale pour me consacrer � mon club, Montauban. Je suis...', 'Delasau', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (337, 'Arri�re espagnol, form� � Barcelone, je signe � Memphis Grizzlies, en NBA, avant de revenir � mes premiers amours lors de la saison 2008/2009, qui suis-je ? ', 'Juan Carlos Navarro ', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (338, 'Ancien espoir du rugby fran�ais pr�nomm� Pierre, j''ai du mal � m''imposer en deuxi�me ligne au Stade Fran�ais, apr�s mon arriv�e du Clermont Auvergne en 2008/09.', 'Vigouroux', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (340, 'Grimpeur italien, surnomm� "le Cobra", je suis suspendu pour dopage, puis rejoins Ceramica Flaminia, en fin d''ann�e 2009.', 'Ricco', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (341, 'Entraineur de Villeurbanne depuis la saison 2008/2009 de pro A, je prends les r�nes de l''�quipe de France de Basket ball en 2009, qui suis-je ?', 'collet', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (343, 'Entraineur de Bourges Basket, j''entame ma 7 �me saison avec l''�quipe de France f�minine de Basket Ball en 2009, qui suis-je ?', 'pierre vincent', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (344, 'Alors qu''il devait signer avec la Quick Step pour 2009 apr�s la dissolution de la Gerolsteiner, un contr�le antidopage positif sur le Tour de France met fin aux r�ves de ce rouleur allemand. Mais qui est-ce ?', 'Stefan Schumacher', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (345, 'Combien de grands chelems, comporte le circuit ATP, en 2009 ?', '4', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (346, 'Cycliste britannique, �quipier mod�le, je signe en 2009, chez Cerv�lo. Mes qualit�s sur les pav�s m''ont permis de me distinguer dans Paris-Roubaix et Gand-Wevelgem.', 'Hammond', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (348, 'Cycliste australien, ancien du Cr�dit Agricole, je signe chez Cerv�lo, en 2009, et remporte, la m�me ann�e, une �tape sur le Giro et une sur la Vuelta.', 'Gerrans', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (347, 'Sur le circuit ATP , deux Indiens figurent dans le Top Ten Mondial de Double en 2009, ils sont : Paes et ...', 'bhupathi', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (349, 'Ancien coureur espagnol de Bouygues T�l�com, avec qui j''ai remport� la Classica San Sebastian, je signe, en 2009, chez Cerv�lo pour mes qualit�s de puncheur. ', 'Florencio', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (342, 'L''ann�e 2009 est l''opportunit� de voir le retour d''un banni, suspendu pour dopage. Surnomm� "Chicken Legs", il s''agit bien s�r de...', 'Michael Rasmussen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (351, 'Gaucher canadien et co�quipier de Nenad Zimonjic en double, en 2009, je me consid�re comme un r�el joueur de Double, qui suis-je ? ', 'nestor', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (352, 'Seul espagnol qui appr�cie la pluie et les pav�s, ce coureur de classiques confirme sa renomm�e en prenant la 6�me place de Paris-Roubaix 2009.', 'Flecha', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (350, 'Co�quipier de Nestor en double et droitier serbe, je figure au 3 �me rang Mondial en Double en 2009, qui suis-je ? ', 'zimonjic', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (353, 'Sprinteur baroudeur fran�ais, souvent consid�r� comme le plus petit du peloton, cela ne m''emp�che pas de remporter une �tape sur le Tour de France en 2009.', 'Dumoulin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (354, 'Entrain� par Magnus Norman, j''occupe fin d''ann�e 2009, une excellente 8 �me place mondiale, qui suis-je ?', 'soderling', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (355, 'Cycliste fran�ais, je pr�f�re les coups d''�clats aux performances r�guli�res. Je confirme mes capacit�s de grimpeur avec le maillot de Meilleur Grimpeur sur la Vuelta 2009.', 'Moncouti�', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (356, 'Puncheur " col�rique " et d�tenteur de 14 titres sur le circuit ATP, j''obtiens mon meilleur classement en aout 2009, une 2�me place mondiale, qui suis-je ?', 'murray', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (357, 'Surnomm� le Mont Chauve, l''ann�e 2009 a vu Garate triompher � mon sommet lors de l''avant derni�re �tape du Tour de France 2009. Je suis...', 'Mont Ventoux', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (358, 'Ancien directeur de TF1, je prends la pr�sidence de l''Olympique de Marseille, en 2009, qui suis-je ?', 'dassier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (359, 'Cycliste belge appartenant � Silence-Lotto, apr�s la d�faillance de mon leader lors du Tour de France 2009, je prends le leadership et termine � une prometteuse 15�me place.', 'Van den Broeck', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (362, '�quipe am�ricaine de rouleurs, je pr�sente sur le Tour de France 2009, le champion du Monde contre-la-montre, et les champions d''Australie, d''Allemagne, et du Luxembourg du contre-la-montre.', 'High Road', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (363, 'Le Tour de France 2009 est marqu� par la victoire de Contador. Mais lors du podium final, quel pays est mis � l''honneur � la place de l''hymne espagnol ?', 'Danemark', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (364, 'Pour la premi�re fois sur le Tour de France, Quick Step pr�sente deux francais en la personne de S.Chavanel et du puncheur...', 'Jerome Pineau', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (365, 'Prometteur grimpeur fran�ais, ancien coureur du Cr�dit agricole. Je confirme les espoirs plac�s en moi par Bernaudeau, mon directeur sportif, en terminant 4�me au classement du Meilleur Jeune au Tour de France 2009.', 'Pierre Rolland', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (366, 'Champion de VTT, ou cycliste en devenir, je remporte le championnat de France 2009 du CLM, et repr�sente le France aux Championnats du Monde � Mendrisio, o� je prends une belle 12�me place.', 'Peraud', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (367, 'Vainqueur du Super G des Championnats du Monde 2009, j''en deviens le plus vieux vainqueur. Suisse, de 35 ans, je remporte, la m�me ann�e, le petit globe de Cristal du G�ant.', 'Cuche', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (368, 'Polyvalent skieur suisse, je me r�v�le, en 2009 et du haut des mes 23 ans, avec une m�daille d''or aux Championnats du Monde � Val d''Is�re 2009 et le petit globe de cristal du combin�.', 'Janka', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (369, 'Cycliste espagnol de la Caisse d''�pargne je remporte le Tour de France 2006, et signe fin 2009 chez Astana, en �quipier de Luxe.', 'Oscar Pereiro', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (370, 'Le maillot du Stade Fran�ais 2009 met en valeur une c�l�bre reine en la personne de...', 'Blanche de Castille', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (371, 'Skieur autrichien, pr�nomm� Benjamin, ma r�gularit� et ma polyvalence me permettent de terminer, en 2009, sur le podium du Classement g�n�ral de la Coupe du Monde, pour la 6�me ann�e cons�cutive.', 'Raich', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (372, 'Grosse d�sillusion 2009, Championnats du Monde � Val d''Is�re, alors qu''il �tait le grand favori du slalom, il sort lors de la deuxi�me manche et laisse les honneurs � un autre fran�ais, J.Lizeroux.', 'Grange', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (373, 'Famille de rugbymen argentins, l''a�n� termine sa carri�re du c�t� de Clermont-Auvergne, tandis que le cadet, revient fin 2009, avec le Stade Fran�ais, apr�s un grave blessure. Nous sommes...', 'Ledesma', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (374, 'R�v�lation du Top 14 2009 au poste d''ouvreur, Jonathan Wisniewski s''impose comme un titulaire en club, et frappe aux portes de l''�quipe de France. Mais quelle  est cette �quipe, en 2009, qui l''a r�v�l� ?', 'Racing M�tro', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (375, 'Fantasque skieur am�ricain, mon ski tout en risque m''a valu de nombreux succ�s. Je veux, fin 2009, montrer que ma 15�me place lors du pr�c�dent exercice n''�tait qu''une erreur de parcours.', 'Bode Miller', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (376, 'Prometteur arri�re fran�ais, je prends mes responsabilit�s en finale du Top 14, en juin 2009. Mes r�ussites au pied permettent � mon �quipe de l''emporter face au Clermont-Auvergne. Je suis...', 'Porical', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (377, 'Demi d''ouverture fran�ais au coup de pied surpuissant, je termine meilleur r�alisateur fran�ais du Top 14, lors de la saison 2008/09.', 'Beauxis', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (378, '�quipe fran�aise, au recrutement ronflant, je remporte, avec 13 points d''avance sur mon dauphin Agen, la Pro D2, en 2009.', 'Racing M�tro', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (391, 'Attaquant Islandais, arriv� �t� 2009 � l'' AS Monaco, je d�sire quitter la principaut� d�s le mercato hivernal 2009/2010, qui suis-je ?', 'Gudjohnsen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (379, 'Rugbyman fran�ais capable de jouer deuxi�me ou troisi�me ligne. Je suis loin d''�tre un titulaire indiscutable au Stade Toulousain, mais je participe, en 2009, gr�ce � ma polyvalence, � 26 matchs avec l''�quipe de G.Nov�s.', 'Lamboley', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (381, 'Quelle �quipe nationale, titr�e � 7 reprises en championnats du Monde en 2009, domine le Basket f�minin depuis ses d�buts ?   ', '�tats unis', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (380, 'Quelle �quipe nationale f�minine de Basket Ball, est actuelle Championne du Monde, un titre conquis au Br�sil, en 2006 face, � la Russie ?', 'Australie', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (382, 'Quelle est la p�riodicit�, en ann�es, des championnats du Monde de Basket Ball f�minin ?', '4', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (384, 'Form� � Southampton, avant de rejoindre les Blues et  Stamford Bridge, je me pr�sente, depuis l''�t� 2009, comme le titulaire indiscutable au poste de d�fenseur gauche, � Manchester City, qui suis-je ?', 'bridge', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (385, 'Petit feu follet et international anglais, je surprends mes adversaires, par ma vitesse et mes enchainements balle au pied; pass� par Chelsea, je figure, indiscutablement, dans le Onze de d�part de Manchester City en 2009, qui suis-je ?', 'wright-phillips', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (386, 'Attaquant Sud Am�ricain, pass� du c�t� de l''Alliance Arena, je suis transf�r� �t� 2009 en provenance de Blackburn, � Manchester City, et compte, fin 2009, aucune titularisation en Premier League, qui suis-je ?', 'santa cruz', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (383, 'N�e le 25 mars 1971 au Texas, et �voluant � Houston, je suis en 2009, la joueuse am�ricaine, la plus titr�e dans l''histoire des championnats du Monde, qui suis-je ? ', 'swoopes', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (387, 'Ballon d''or 1991, je prends les r�nes, le 30 D�cembre 2009, de Ch�teauroux alors 18�me de Ligue 2, qui suis-je ?', 'papin', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (388, 'Ancienne Num�ro 1 Mondiale, je prends ma retraite le 3 d�cembre 2009, qui suis-je ?', 'mauresmo', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (389, 'Attaquant Hondurien, et bloqu� au poste par Milito, Eto''o et Balotelli, je suis pr�t� � Genoa, fin 2009 pour une dur�e de 6 mois, qui suis-je ?', 'suazo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (390, 'Ancien d�fenseur mythique n�erlandais, je fais depuis 2009, les beaux jours de Galatasaray, en tant qu''entraineur, qui suis-je ?', 'rijkaard', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (394, 'Attaquant, je suis pr�sent� comme le futur prodige Am�ricain dans les m�dias, mais je d��ois tr�s vite par mes prestations en Europe, je suis de retour en D�cembre 2009 � Benfica,apr�s un pr�t stopp� par Belenenses, qui suis-je ?', 'freddy adu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (395, 'Dans un livre autobiographique, sorti fin 2009, j''�voque mon quotidien sportif g�ch� par la prise de substances illicites, qui suis-je ? ', 'agassi', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (396, 'Attaquant fantaisiste, je suis l''objet d''une vive pol�mique, en 2009, � la suite de son licenciement par Chelsea, pour cause de dopage, quelques ann�es plus t�t, qui suis-je ?  ', 'mutu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (397, 'Arri�re lat�ral gauche, form� � Sochaux, comptant une s�lection en �quipe de France A'', je suis transf�r� �t� 2009 du c�t� de l''Espagne et plus pr�cis�ment � Valence, qui suis-je ?  ', 'j�r�my mathieu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (398, 'Arriv� sous forme de pr�t chez les Rossoneri, en D�cembre 2009, je n''en finis de surprendre par mon look extravagant, qui prend parfois le dessus sur mes performances footballistiques, qui suis-je ? ', 'beckham', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (399, 'Quelle �quipe, les Bleus de Raymond Domenech, affronteront lors de leur premier match, � la Coupe du Monde 2010, qui se d�roulera en Afrique du Sud ?', 'uruguay', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (393, 'Attaquant Suisse, je suis transf�r� �t� 2009 � Zurich, et suis le plus jeune buteur de l''histoire d''un championnat d''Europe, qui suis-je ?', 'vonlanthen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (400, 'Arriv� en 2009, du c�t� de l''ASVEL, quel club de renom, en pro A, Vincent Collet a-t-il entrain� auparavant ?', 'le mans', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (401, 'Milieu de terrain, appartenant � la Lazio de Rome, pr�sent�, il y a encore quelques ann�es, comme le futur " zizou ", j''inaugure ma premi�re s�lection avec les fennecs, qui suis-je ? ', 'meghni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (402, 'Grand attaquant italien d''origine Australienne, je joue pour les plus grands clubs europ�ens, et notamment pour l''Internazionale, entre 1999 et 2005, je prends ma retraite le 22 Octobre 2009, qui suis-je ?', 'vieri', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (404, 'Quelle �quipe, a �tabli un nouveau record, qui est de 18 d�faites de suite, correspondant donc, au plus mauvais d�but de saison de l''histoire de la NBA ?  ', 'new jersey', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (405, 'Les Nets ont �tabli le plus mauvais d�but de saison de l''histoire de la NBA, mais avec combien de d�faites de suite ? ', '18', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (406, 'Milieu de Terrain valenciennois, je d�cline, fin  d�cembre 2009, la s�lection avec les Aigles de Carthages, et ne disputera donc pas la Coupe d''Afrique des Nations, qui suis-je ?', 'Ben Khalfallah', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (407, 'Titulaire indiscutable, en 2009, � la pointe du Real Madrid, dans quel club, Gonzalo HIGUAIN a-t-il fait ses armes ?', 'River Plate', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (409, 'Verdasco, 9 �me Mondial, a pu particip� au Masters de Londres 2009, r�unissant les 8 meilleurs joueurs mondiaux, suite � une blessure d''un joueur, mais qui est il ?', 'roddick', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (408, 'Tenant du Titre � Monte Carlo, je remporte une nouvelle fois cette finale, en 2009, face � Djokovic, qui suis-je ?', 'nadal', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (410, 'Attaquant international allemand, je finis 3 �me meilleur buteur du championnat allemand avec Stuttgart lors de la saison 2008/2009, avant de rejoindre Munich l''�t� qui suit, qui suis-je ?', 'mario gomez', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (411, 'Milieu offensif alg�rien, form� � Sochaux, je quitte la France pour rejoindre Wolfsburg, en Allemagne, durant l''�t� 2009, qui suis-je ?', 'karim ziani', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (412, 'Robuste d�fenseur fran�ais, form� au RC France, j''arrive � Bordeaux �t� 2009, en provenance de Lorient, et me pr�sente comme un titulaire indiscutable dans le Onze type de d�part, qui suis-je ?', 'ciani', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (413, 'Champion du monde 2006, je signe � la Roma, au Mercato hivernal 2009, afin de me relancer et de faire partie du groupe Italien qui s''envolera en juin 2010, pour l''Afrique du Sud, qui suis-je ?', 'toni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (415, 'Pr�sente pour la premi�re fois � Roland Garros 2009, je gagne cette m�me ann�e l''�dition junior, et suis �lue fin 2009, � 16 ans, meilleure junior de l''ann�e 2009, qui suis-je ?', 'mladenovic', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (416, 'D�fenseur s�n�galais, Champion de France 2008/2009, je quitte mes camarades �t� 2009 pour rejoindre la cit� foss�enne , qui suis-je ?
', 'souleymane diawara', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (403, 'Seul joueur du Top Ten en 2009, � ne pas poss�der d''�quipementier officiel, je suis...', 'davydenko', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (414, 'Ancien parmesan, je suis �lu, en D�cembre 2009, et pour la deuxi�me ann�e cons�cutive, meilleur joueur de la zone AMSUD, qui suis-je ?', 'juan sebastian veron', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (418, 'Ancien d�fenseur Nanc�ien, je reviens, fin D�cembre 2009, en pr�t � Saint-�tienne, pour une dur�e de 6 mois, qui suis-je ?', 'Diakhate', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (419, 'Ancien Bordelais, je suis pr�t�, � la surprise g�n�rale, en Janvier 2009, du c�t� de Santiago Bernabeu, qui suis-je ? ', 'faubert', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (420, 'Joueur des Denver Nuggets, je suis Franchise Player de mon �quipe et meilleur scorer de la NBA, en 2009, qui suis-je ?', 'carmelo anthony', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (421, 'Quel Sophomore est consid�r�, en 2009, comme le Franchise Player d''Oklahoma City ?', 'Kevin Durant', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (423, 'Rafael NADAL et son entraineur en 2009, pr�sentent des liens tr�s particuliers, en effet, Toni NADAL est son ...', 'oncle', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (422, 'Roger Federer �tablit un record en 2009, il devient le seul joueur, a remport�, combien de titres du Grand Chelem ?', '15', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (424, '2009, ann�e de ma cons�cration, je parviens � me hisser dans le Top Ten, et m�me � d�crocher une place de 5 �me joueur mondial le 6 avril 2009 que j''occuperai    jusqu''� la fin de la saison, qui suis-je ?', 'del potro', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (427, 'Grand attaquant international Tch�que, je signe � l''AS Cannes, au Mercato hivernal 2009/2010, qui suis-je ?', 'koller', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (429, 'Ancien attaquant international francais, present� � ses d�buts, comme le futur Jean Pierre Papin, je mets un terme � ma carri�re en 2005 apr�s �tre pass� par Paris, Marseille ou encore le Celta Vigo; je rejoins le 1 er Juillet 2009, la cellule de recrutement de l''OL, qui suis-je ? ', 'Florian Maurice', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (428, 'Quel fut le joueur, en 2009, �lu meilleur espoir masculin fran�ais ?', 'mina', 'Tennis');



