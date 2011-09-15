
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



INSERT INTO `qisport_db`.`questions` VALUES (27, 'Quel est le premier français a figuré sur la liste définitive du ballon d''or 2009 ?', 'henry', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (36, 'Révélation de la Bundesliga, j''inscris pas moins de 26 buts avec Wolsburg, qui suis-je ?', 'dzeko', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (28, 'Après avoir quitté Lyon, dans quel club évolue Juninho Pernambucano ?', 'Doha', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (31, 'A défaut de temps de jeu à l''Internazionale, dans quel club évolue depuis l''été 2009, Adriano ?', 'flamengo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (29, 'Combien de français compte l''effectif du  Real Madrid en fin d''année 2009 ?', '2', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (30, 'En 2009, combien de millions d''euros a versé le Real de Madrid pour se payer les services de C.Ronaldo ?', '94', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (37, 'Suite à une visite médicale révélant un problème cardiaque, ma carrière et mon transfert à l''AS Monaco sont suspendus, qui suis-je ?', 'savidan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (41, 'Formé à Metz, et aujourd''hui à Manchester City, je suis considéré avec Samuel Eto''o comme l''un des meilleurs attaquants africains au monde, qui suis je ?', 'adebayor', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (46, 'Quel club a remporté pour la deuxième année consécutive le championnat russe ?', 'rubin kazan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (51, 'Combien d''équipes participeront à la phase finale de la Coupe du Monde 2010 ? ', '32', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (52, 'Combien de français figurent dans la liste des 30 derniers joueurs du Ballon d''Or 2009 ?', '4', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (53, 'Ancien milieu défensif irlandais, je suis limogé du poste d''entraineur de Sunderland, qui suis-je ?', 'keane', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (55, 'Ballon d''or 2009, complétez :

1: Messi
2: C.Ronaldo
3: Xavi
4: ?', 'iniesta', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (58, 'Quel ancien joueur déclare, fin novembre 2009 : " Domenech, c''est le plus mauvais entraineur depuis Louis 16 ! (...) " ? ', 'cantona', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (32, 'Joueur mythique de Boca Junior, je reviens en sélection et marque un but important lors des qualifications pour la Coupe du Monde, qui suis-je ? ', 'palermo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (59, 'Défenseur international français, je raccroche les crampons en milieu d''année 2009 suite à une terrible blessure au tendon d''Achille, qui suis-je ?', 'sagnol', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (33, 'Transféré durant l''été 2009 du Werder de Brême, je gagne petit à petit le cœur des supporters de la Vieille Dame, qui suis-je ?', 'diego', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (34, 'Transféré durant l''été 2009 du Genoa, je forme avec Samuel Eto''o, l''attaque explosive de l''Inter de Milan, qui suis-je ?', 'milito', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (35, 'Jeune Nigérian, transféré de Newcastle à Wolsburg après avoir passé une saison noire avec les Black Catz, qui suis-je ? ', 'martins', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (39, 'Milieu de terrain hollandais, ayant évolué à Bordeaux, à l''Atletico Madrid. J''ai été mis a l''essai par le FC METZ, mais finalement non conservé, qui suis-je ?', 'musampa', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (40, 'Transféré de l''Ajax durant le mercato d''été 2009, je forme aujourd''hui la charnière centrale avec William GALLAS à Arsenal, qui suis-je ?', 'vermaelen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (43, 'Dans quel club évolue, en 2009, Damian DUFF ?', 'fulham', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (44, 'Quel club brésilien, a pour but le recrutement de l''ancien parisien Ronaldinho pour la saison 2010/2011 ?', 'corinthians', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (45, 'Milieu belge d''Everton, je surprends par ma coupe de cheveux mais surtout pour mon talent, qui suis-je ?', 'fellaini', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (48, 'Quel joueur fantasque, a inscrit un quintuplé et figure au 1er décembre 2009, comme le meilleur buteur de la Premier League ?', 'defoe', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (61, 'Quelle star du rugby a fait un retour remarqué au sein du petit club de Marseille-Vitrolles ?', 'Lomu', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (50, 'Attaquant français, je quitte Sunderland pour le Panathinaikos durant l''été 2009, qui suis-je ?', 'cisse', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (54, 'Attaquant brésilien, je retrouve les terrains avec Arsenal, après une très longue blessure, qui suis-je ?', 'eduardo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (26, 'Dans la course au Ballon d''or, combien de points ont séparé Lionel Messi de son dauphin, C.Ronaldo ?', '240', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (47, 'Quel club anglais est surnommé le "deuxième Chelsea" après un recrutement digne des plus grands ?', 'manchester city', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (49, 'Irlandais considéré comme l''un des meilleurs passeurs de Premier League, mes rapports houleux avec l''entraineur ne me permettent pas d''intégrer l''effectif pour les qualifications à la Coupe du Monde 2010, qui suis-je ?', 'ireland', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (57, 'Quelle équipe, n''ayant plus participé à la Coupe du Monde depuis 1985, sera de la partie en Afrique du Sud ?', 'algérie', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (62, 'Quel ancien entraineur de la Squadra Azzura, a pris les rênes du Racing Métro ?', 'Berbizier', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (64, 'Flanker prometteur du Clermont-Auvergne, je fête ma première sélection, à l''âge de 20 ans, contre les Samoa. Je suis... ', 'Lapandry', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (65, 'Je suis un entraineur australien limogé par Guazzini après un début de saison 2009 catastrophique avec le Stade Français. Je suis...', 'McKenzie', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (66, 'Véritable poutre en mêlée, et d''une puissance rare, je suis avec mes 138kg un joueur à part entière du Stade Toulousain. Je suis...', 'Census Johnston', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (67, 'Capitaine émérite de Toulon, je suis désigné meilleur troisième ligne centre du Top 14, lors de la saison 2008-2009. Je suis...', 'Van Niekerk', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (63, 'Je suis un joueur néo-zélandais, ancienne star du XIII, aujourd''hui Centre à XV, et ayant remporté un match de Boxe professionnel. Je suis... ', 'Sony Bill Williams', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (68, 'Quel jeune ouvreur argentin du Stade Français, a joué à Perpignan et à Leicester ?', 'Mieres', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (69, 'Quel International français s''est exilé outre Manche pendant une saison, avant de faire son retour dans son club formateur, le Stade Français ?', 'Kayser', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (71, 'Quel ancien talonneur international est l''entraineur des avants du Stade Toulousain, pour la saison 2009-2010 ?', 'Bru', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (72, 'Quel arrière, pouvant aussi joué ouvreur, a rejoint le Racing Métro après avoir réussi quelques jolis drops avec Montauban ?', 'Fortassin', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (70, 'En Mars 2009, quel joueur du Top 14 a battu le record du plus grand nombre de coups de pieds consécutifs réussis ?', 'Brock James', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (42, 'Quel club, en 2009, est considéré comme le club le plus riche au monde ?', 'manchester united', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (56, 'Formé au FC METZ, je me révèle au grand public avec l''Olympique Lyonnais en fin d''année 2009, qui suis-je ?', 'pjanic', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (38, 'Conscient de la difficulté de jouer en équipe de France, je prends la nationalité polonaise, en 2009, et inscrit deux buts pour mon premier match, qui suis-je ?', 'obraniak', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (82, 'Famille de biathlètes, chefs de file de l''équipe de France de Biathlon. Nous enchainons les podiums en 2009. Nous sommes les...', 'Fourcade', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (74, 'Quel ancien treiziste australien, aujourd''hui converti au XV, s''impose match après match au poste d''ouvreur avec la Squadra Azzura ?', 'Gower', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (75, 'Rugbyman camerounais au physique impressionnant, passé par Auch et le Stade Français, ayant gagné, à la surprise générale, une place de titulaire à l''USAP. Je suis... ', 'Tchale-Watchou', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (76, 'Capitaine polyvalent de l''équipe briviste. Je suis un ancien treiziste pouvant couvrir tous les postes du 10 au 15. Je suis...', 'Estebanez', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (77, 'Après avoir entrainé Montauban, j''ai pris en 2009, la tête du Castres Olympique avec Laurent Travers. Je suis...', 'Labit', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (78, 'Entraineur français ayant remplacé au pied levé C.Dominici pour entrainer les lignes arrières du Stade Français, à l''orée de la saison 2009. Je suis...', 'Faugeron', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (79, 'Perpignanais pure souche, je marque l''essai de la victoire en finale du Top 14 saison 2008/2009 contre l''ASM.', 'Marty', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (80, 'Ailier américain, véritable feu follet, je suis capable de courir le 100m en 10 sec. et 25 centièmes, et j''enchante le Top 14 à chacun de mes essais. Je suis...', 'Ngwenya', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (81, 'Pilier sur le terrain, tout comme dans le vestiaire, je signe dans mon club de cœur après 6 saisons au Clermont Auvergne.', 'Emmanuelli', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (83, 'Course de Biathlon, signifiant étymologiquement "départ en ligne". Je mets au prise les trente premiers du classement général. Je suis la...', 'Mass-Start', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (84, 'Biathlète suédoise, aussi rapide à ski qu''habile au tir, je remporte le gros globe de Cristal durant la saison 2008/2009.', 'Jonsson', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (85, 'Jeune et talentueuse biathlète allemande, j''ai connu une saison difficile en 2008/09, après avoir survolé la saison précédente.', 'Neuner', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (86, 'Biathlète polonais, très adroit au tir, je termine la saison 2008/09  à la deuxième place du classement général.', 'Sikora', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (87, 'Biathlète italienne, je suis plus connue pour être la femme du champion Bjoerndalen, que pour mes performances.', 'Santer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (88, 'Biathlète suisse, qui a créé la surprise fin d''année 2009, en accrochant un podium inespéré en Sprint. Je suis...', 'Frei', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (89, 'Biathlète français qui, par sa régularité au tir, remporte le seul succès français en 2008/09.', 'Jay', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (90, 'Biathlète suédois, souvent placé mais rarement gagnant, ses 6ème, 7ème et 9ème au classement général final, ces dernières années, en attestent.', 'Ferry', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (91, 'Biathlète autrichien, considéré comme un des plus rapides sur les skis, je remporte le classement général de la Mass-Start en 2009.', 'Landertinger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (92, 'Je suis un biathlète norvégien, considéré comme le plus rapide à ski, je n''ai malheureusement pas la même réussite au tir, ce qui ne me permet pas de jouer les premiers rôles. je suis...', 'Berger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (93, 'Sportif autrichien surnommé Felitsche, je participe au combiné nordique, et remporte de nombreuses victoires, dont la plus belle : la médaille d''or aux J.O de Turin en 2006.', 'Gottwald', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (94, 'Finlandais spécialiste du Combiné Nordique, et malgré quelques difficultés au saut, j''ai survolé les épreuves à ski, qui m''ont apporté mes quatre Globes de Cristal.', 'Manninen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (95, 'Spécialiste du combiné nordique finlandais, je suis la relève d''Hannu Manninen, mais ce sont mes qualités de sauteur qui m''apportent le gros globe de Cristal en 2009.', 'Koivuranta', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (96, 'Sportif allemand, spécialiste du Combiné, j''ai livré, pendant des années, avec Hannu Manninen une des plus belles batailles offertes par les sports d''Hiver, et j''ai remporté, au passage, trois globes de Cristal.', 'Ackermann', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (97, 'Sportif français, participant au Combiné Nordique, je suis, avec Lamy-Chappuis, considéré comme le français le plus rapide à ski.', 'Lacroix', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (98, 'Je suis un américain, participant au Combiné Nordique, j''ai livré de belles batailles avec Lamy-Chappuis, me permettant d''accrocher la troisième place au général en 2008. Je suis...', 'Demong', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (99, 'Champion américain de Combiné Nordique , j''ai remporté, à Liberec, deux médailles d''or aux championnats du Monde 2009, après être sorti de ma retraite. Je suis... ', 'Lodwick', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (100, 'Sportif norvégien, j''ai livré, à coup de meilleur temps à ski, une lutte fratricide avec Hannu Manninen. Mes limites au saut ne m''ont, pour l''instant, pas permis de remporter un globe de Cristal.', 'Moan', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (101, 'Jeune sportif français, qui après avoir remporté des titres en espoir, fais, actuellement, avec Lamy-Chappuis et Lacroix, partie intégrante du groupe France.', 'Braud', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (102, 'Athlète italien, spécialiste du Combiné Nordique, je monte, fin 2009 et à seulement 19 ans, sur mon premier podium en Coupe du Monde.', 'Pittin', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (103, 'Sportif norvégien prénommé Peter, j''ai terminé deuxième de la Coupe du Monde 2008, après de belles victoires acquises par des sauts décisifs.', 'Tande', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (104, 'Famille de cyclistes russes, c''est Ag2r qui nous rassemblent sous le même maillot pour la saison 2008/09.', 'Efimkin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (106, 'Fils de grand champion français, j''ai rejoins Ag2r La Mondiale après de nombreuses saisons au Crédit Agricole.', 'Sebastien Hinault', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (107, 'Cycliste, équipier modèle, et champion de Norvège 2009, je dois abandonner lors du Tour de France, à la suite d''une fracture de la clavicule.', 'Arvesen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (108, 'Sprinteur australien, poisson pilote de Mark Cavendish, j''évolue en 2009 chez Team Columbia, après avoir roulé deux saisons pour le Crédit Agricole.', 'Renshaw', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (109, 'Cycliste français, je suis, à ma grande surprise, sélectionné pour les Championnats du Monde sur route, à Mendrisio, après une saison 2009 prometteuse.', 'Riblon', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (110, 'Champion de Biélorussie, sprinteur de la Française des Jeux, je termine lanterne rouge du Tour de France 2009.', 'Hutarovich', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (111, 'Premier japonais à terminer le Tour de France, je suis, en 2009, un baroudeur, mais surtout un équipier modèle de la B-Box.', 'Arashiro', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (112, 'Cycliste colombien, je suis le plus jeune coureur sur le Tour de France 2009. Équipier de Valverde à la Caisse d''Epargne, je termine 5ème du Tour de Romandie.', 'Uran', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (114, 'Cycliste Italien, on m''a décerné le titre de Super combatif au Tour de France 2009, après d''innombrables échappées. Je suis... ', 'Pellizotti', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (115, 'Ancien coureur du Crédit Agricole, je suis, en 2009, le directeur sportif de Garmin-Slipstream. Je suis...', 'Vaughters', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (116, 'Coureur portugais, équipier modèle chez Astana, j''ai mené Contador à la victoire lors du Tour de France 2009. Je suis... ', 'Paulinho', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (118, 'Coureur italien, ayant porté le maillot Jaune pendant 8 jours sur le Tour de France 2009, je n''ai malheureusement pas réussi à terminer la Vuelta par la suite.', 'Nocentini', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (142, 'Cycliste et puncheur autrichien, champion national à plusieurs reprises, je suis contrôlé positif à l''EPO pour la seconde fois, et suis interdit à vie de toute compétition.', 'Pfannberger', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (119, 'Les trois français vainqueurs lors du Tour de France 2009 sont : Fedrigo Voeckler et...', 'Brice Feillu', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (120, 'Équipe russe, soutenu par Poutine, je possède, en 2009, des coureurs tels que Karpets ou Steegmans. ', 'Katusha', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (121, 'Maillot vert du Tour de France 2009, j''ai eu pour coéquipier Mark Renshaw ou encore Julian Dean.', 'Hushovd', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (122, 'Le Luxembourg possède trois coureurs de grand talent : Andy et Franck Schleck et...', 'Kirchen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (123, 'Cycliste irlandais de l''équipe Cervélo, je me classe 9ème du Tour d''Espagne après y avoir remporté une victoire.', 'Deignan', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (124, 'Jeune coureur français de la Française des Jeux, je remporte, à la surprise générale, une étape du Tour d''Espagne, qui vient récompenser une première saison prometteuse.', 'Anthony Roux', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (125, 'Cycliste espagnol méconnu, courant pour une équipe continentale, ma régularité et mes capacités en montagne me permettent de me classer dans les 5 premiers des trois dernières Vueltas. Je suis...', 'Mosquera', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (126, 'Champion d''Estonie sur route et contre-la-montre, à seulement 22 ans, coureur de la Cofidis, je remporte le Tour de l''Ain et participe entres autres à la Vuelta.', 'Taaramae', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (127, 'Champion de France sur route 2009 au nez et à la barbe des équipes Pro Tour, je contribue à la découverte de mon équipe : Bretagne Armor-Lux. Je suis.', 'Champion', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (128, 'Octobre 2009 : Décès d''un des cyclistes belges les plus doués de sa génération, il remporta Liège-Bastogne-Liège, ou encore Gand-Wevelgem. J''étais... ', 'Vandenbroucke', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (129, 'En 2009, révolution sur la Vuelta, le maillot de Oro est remplacé. Mais quelle est la couleur du nouveau maillot du classement général ?', 'Rouge', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (131, 'Après une suspension en 2008, Alessandro Petacchi revient, en 2009, dans l''équipe des "repentis", où se trouve Di Luca ou encore Savoldelli. Mais quel est le nom de cette équipe ?', 'LPR Brakes', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (132, 'Famille de cyclistes argentins, l''ainé appartenait à la Saxo Bank, avant que son frère, fin 2009, ne le rejoigne. Nous sommes les...', 'Haedo', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (133, 'Cycliste, référence du Cyclo-cross français sur la scène internationale, je me suis imposé progressivement au sein de la Française des Jeux, au point de participer aux trois Grands Tours.', 'Mourey', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (134, 'Jeune Lituanien, ancien coureur du Crédit Agricole, j''ai signé en 2009 chez Cervélo, et ai remporté la même saison, le contre-la-montre final du Giro.', 'Konovalovas', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (130, 'Je suis considéré comme le lieutenant de Valverde. Puncheur de talent, je termine la Vuelta 2009 à la 7ème place.  Je suis...', 'Joaquin Rodriguez', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (135, 'Expérimenté cycliste italien, j''ai des faux airs de M.Pantani, et, en 2009, je remporte le maillot de Meilleur Grimpeur sur le Giro. Je suis...', 'Garzelli', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (136, 'Jeune cycliste français, je remporte la médaille d''or dans la catégorie Espoirs aux championnats du Monde à Mendrisio.', 'Sicard', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (137, 'Grandissime championne néerlandaise, j''ai tout gagné depuis mes débuts, mais échoue, en 2009, pour le troisième fois consécutive, à la deuxième place des Championnats du Monde sur route.', 'Marianne Vos', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (138, 'Cycliste belge, ancien coureur de la Française des Jeux, je remporte, en fin de saison 2009, Paris-Tours et le Tour de Lombardie.', 'Gilbert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (139, 'Cycliste allemand, licencié chez Cervélo, après avoir lancé le sprint de très loin, je me fait sauté sur la ligne par Cavendish sur le Milan-San Remo, puis accumule les places d''honneur durant la saison 2009.', 'Haussler', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (140, 'Cycliste français qui, grâce à mes belles performances sur les classiques, termine Premier français au Classement Pro Tour 2009.', 'Sylvain Chavanel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (113, 'Cycliste français, licencié chez Agritubel, je signe pour la saison 2010 dans l''équipe de Lance Arsmtrong, RadioShack.', 'Lequatre', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (141, 'Cycliste français, chef de file du sprint dans l''Hexagone, je remporte la Coupe de France 2009.', 'Casper', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (143, 'Cycliste hongrois, rouleur et coéquipier hors pair, j''ai remporté de nombreux contre-la-montre, avec le Crédit Agricole, puis en 2009, avec Katusha.', 'Bodrogi', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (144, 'Petit prodige norvégien, aussi bon rouleur que grimpeur, je remporte des succès sur le Giro, et Gand-Wevelgem en 2009, avec Team Columbia, avant de signer en 2010 chez Sky.', 'Boasson Hagen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (145, 'Sprinteur allemand, appartenant à Team Columbia, je survole la Vuelta 2009 avec 4 victoires d''étapes et domine le Classement par Points.', 'Greipel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (146, 'Baroudeur néerlandais prénommé Martijn, spécialiste des classiques flandriennes, après avoir terminé 4ème de Paris-Roubaix l''année précédente, je confirme, en 2009, avec une quatrième place au Tour des Flandres.', 'Maaskant', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (147, 'Quel sauteur à ski est surnommé "l''überflieger" ?', 'Martin Schmitt', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (148, 'Expérimenté sauteur à ski polonais, star et mythe de la discipline, j''ai survolé la discipline pendant plusieurs années, et détient le nombre de victoires en compétition, et je monte encore aujourd''hui sur les podiums à 32 ans.', 'Malysz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (149, 'Sauteur à ski finlandais, de retour à la compétition, en 2009, après une année sabbatique, j''ai remporté cinq fois la tournée des Quatre Tremplins, ce qui fait de moi un des plus grands sauteurs de l''Histoire.', 'Ahonen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (150, 'Sauteur à ski finlandais, on me surnomme "l''Homme qui ne sourit jamais", je suis...', 'Ahonen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (151, 'Sauteur à ski suisse, aux faux airs d''Harry Potter, je reviens en forme en 2009 avec plusieurs succès, mais mon principal fait d''arme reste ma médaille d''or inattendue au J.O d''Hiver en 2002. Je suis...', 'Ammann', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (152, 'Je suis la ville possédant le plus grand Tremplin du Monde, tous les plus beaux records y sont tombés. Je suis le K185 de...', 'Planica', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (153, 'Sauteur à ski autrichien, surnommé "l''étoile du matin", je remporte de nombreuses victoires en fin de saison 2008/09, et suis dans la lignée des grands champions tels que Loitzl, ou autres Widholzl. Je suis...', 'Morgenstern', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (154, 'Prodige du saut à ski autrichien, je remporte mes premières compétitions internationales à seulement 16 ans, et, en 2009, je remporte le Classement général de la Coupe du Monde.', 'Schlirenzauer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (155, 'Le saut à ski est basé sur le saut proprement dit, mai aussi sur la réception, pour optimiser la qualité de la réception, il faut poser le...', 'Telemark', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (156, 'Sauteur à ski norvégien, prénommé Bjorn, je possède, avec mes 239,5m, le record officiel du plus long saut jamais réalisé. Je suis...', 'Romoeren', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (158, 'Sauteur à ski français, en constante progression, je me classe régulièrement dans le Top 15, réussissant même un podium (3ème) en fin d''année 2009.', 'Chedal', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (159, 'Sauteur à ski français qui, malgré des difficultés en 2009, a longtemps été recordman de France avant d''être dépossédé de ce titre par E.Chedal. Je suis David...', 'Lazzaroni', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (160, 'Petite perle de la Mannschaft, et digne successeur de M.Schmitt, je monte, en fin d''année 2009 et à seulement 18 ans, sur un podium en Coupe du Monde. Je suis...', 'Bodmer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (157, 'Compatriote de Simon Ammann, je remporte une médaille d''or inespérée aux Championnats du Monde Grand Tremplin de Liberec en 2009. Je suis...', 'Kuettel', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (161, 'Famille de sauteurs à ski finlandais, Matti, la cadet remporta de nombreux succès, tandis que l''ainé Jussi eu une carrière plus modeste. Nous sommes les...', 'Hautamaki', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (162, 'Sauteur à ski finlandais, digne successeur de J.Ahonen, je compte trois victoires en 2009 dont une mythique sur le tremplin de Planica. Mes bons résultats me permettent de terminer quatrième au classement général de la Coupe du Monde.', 'Olli', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (163, 'Pour tenter de se rapprocher du meilleur niveau mondial, l''Équipe de France de Saut à ski s''attache les services d''un entraineur de renom. Mais quelle est la nationalité de cet entraineur ? ', 'finlandais', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (164, 'En déficit de sauteurs à ski performants pour le concours par équipes 2009, l''Equipe de France s''octroie les services d''un talentueux athlète. Qui est-il ?', 'Lamy-Chappuis', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (165, 'En 2009, l''entraineur adjoint de l''Équipe de France de Saut à ski n''est autre que le dernier vainqueur français en Coupe du Monde. Qui est-il ?', 'Dessum', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (167, 'Sauteur à ski russe, ma régularité me permet de monter sur quelques podiums et de terminer 5ème de la Coupe du Monde 2009, sans jamais remporter le moindre concours au cours de ma carrière. Je suis...', 'Vassiliev', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (168, 'Sauteur à ski japonais, qui en 2009, et à 38 ans, devient le vainqueur d''un concours le plus âgé de l''Histoire. ', 'Okabe', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (166, 'Ensemble de sauteurs à ski classés dans les dix premiers mondiaux, ces derniers privilégient d''une immunité lors des qualifications. Ces sauteurs font partis du groupe des...', 'protégés', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (169, 'Star australienne longtemps pressentie à Bayonne, je signe finalement, fin 2009, pour le Leicester, et vient renforcer leur ligne de trois-quart.', 'Tuqiri', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (170, 'Ancien troisième ligne et capitaine emblématique de Montauban, je succède, en 2009, à L.Travers et L.Labit au poste d''entraineur de Montauban.', 'Marc Raynaud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (171, 'Pilier camerounais, toujours un casque sur la tête, je participe à la finale du Challenge Européen en 2009, et fête une sélection avec les Barbarians la même année. Je suis...', 'Tchougong', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (172, 'Demi de Mêlée formé au RC Metz, je fais mes gammes à Bourgoin Jailleu, avant de taper dans l''œil de Vern Cotter, par ma vivacité et ma qualité de passe. Je suis...', 'Parra', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (173, 'Véritable malédiction perpignanaise, en 2009, joker médical, joueur replacé, titulaire, ou simple remplaçant tous se blessent à un poste clé. Mais lequel ?!', 'demi d''ouverture', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (174, 'Troisième ligne sud-africain, évoluant à Brive, mes remarquables performances en 2009 tapent dans l''oeil de M.Lièvremont qui me voit un avenir en bleu, blanc, rouge. Je suis...', 'Claassen', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (175, 'Centre anglais d''origine néo-zélandaise, je signe, en 2009, à Brive après une saison remarquable avec les Wasps et le XV de la Rose.', 'Flutey', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (176, 'Arrière talentueux mais fragile, après mon départ du Stade Français, je suis longtemps resté sans club, avant de trouver refuge à Brive, fin 2009.', 'Jeanjean', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (177, 'Rugbyman roumain, après plusieurs saisons à Pau, je viens renforcer la ligne arrière d''Albi,fin 2009, qui utilise avant tout ma qualité de jeu au pied, par des drops ou des pénalités.', 'Dumitras', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (178, 'Pilier français formé à Albi, qui après une saison décevante avec le Stade Français, a rejoins son club formateur, en 2009.', 'Correia', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (179, 'Demi de mêlée samoan, qui après l''arrivée de Parra à Clermont en 2009 à fait le chemin inverse pour rejoindre Bourgoin et regagner du temps de jeu. Je suis...', 'John Senio', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (180, 'Meilleur contreur du Top 14, troisième ligne aile français, j''ai quitté Montauban pour rejoindre les rangs du Castres Olympique en 2009. Je suis...', 'Caballero', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (181, 'Jeune troisième ligne français, formé au Stade Toulousain et qui, après une belle saison avec le Stade Montois en Top 14, a rejoint les rangs de Montpellier en 2009.', 'Giraud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (182, 'Famille de rugbymen français, tous deux demi de mêlée, nous sommes, en 2009, l''avenir du Montpellier Herault. Nous sommes les...', 'Tomas', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (183, 'Rugbyman polyvalent capable de couvrir tous les postes dans les lignes arrières, j''ai joué au Stade français plusieurs saisons avant de signer il y a quelques années à Montpellier. Je suis, en 2009, et à 34 ans, un arrière expérimenté.', 'Sarramea', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (184, 'Rugbyman écossais international évoluant au poste d''arrière, je signe, en 2009, à Toulon, après avoir évolué à Sale et Glasgow.', 'Rory Lamont', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (185, 'Jeune international espoir, champion du monde 2006 avec L.Beauxis, après quelques matchs prometteurs à la mêlée en 2009, je signe sur la Rade, pour rejoindre la bande à Saint André. Je suis...', 'Cibray', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (186, 'Trois-quart centre italien, je suis repositionné à l''arrière par N.Mallet en sélection, je tarde à m''imposer après mon transfert de Biarritz au Racing Métro, en 2009.', 'Masi', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (187, 'En 2009, le Racing Métro réussit un gros coup sur le marché des transferts en enrôlant la star sud-africaine : François Steyn. Mais à quel club du Super 14 appartenait-il avant la transaction ?', 'Natal Sharks', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (188, 'Jeune pilier formé au Stade français, je m''exile au Stade Toulousain en 2007, mais mes performances et la concurrence au poste ne me permettent pas d''être, en 2009, un élément incontournable du XV composé par G.Novès.', 'Montes', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (189, 'Brock James termine l''exercice 2008/09 comme meilleur réalisateur du Top 14. Mais quel joueur anglais, plus connu pour son jeu au pied que pour ses relances, prend la deuxième place ? ', 'Goode', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (117, 'Coureur néo-zélandais, ancien poisson pilote d''Hushovd, il fût celui de Farrar pendant les Grands Tours 2009. Je suis...', 'Dean', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (73, 'Quel arrière, buteur régulier, du Castres Olympique est surnommé Robocop ?', 'Teulet', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (190, 'Seul gallois présent dans l''équipe type de la saison 2009 (source : L''Équipe) , on me présente comme le digne successeur de l''ailier S.Williams. Je suis...', 'Halfpenny', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (192, 'L''USAP remporte, en 2009, le titre de Champion de France du Top 14 et est maintenant la 5ème équipe française la plus titrée. Mais avec combien de Bouclier de Brennus ?', '7', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (193, 'Désillusion majeure du rugby français en 2009, L''équipe de France échoue dans sa quête de Grand Chelem lors du Tournoi des VI Nations. Pire, elle s''incline à deux reprises. Mais à quelle place termine-t-elle ?', '3', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (194, 'Troisième ligne castrais présent dans l''équipe type du Top 14 2009 (source : L''Équipe), j''ai renoncé, depuis mon arrivée en France, au maillot all-black. Je suis... ', 'Masoe', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (191, 'Seul français présent dans l''équipe type de la saison 2009 (source : L''Équipe) , je m''inscris dans la lignée des P.De Villiers ou autres C.Califano. Je suis...', 'Barcella', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (195, 'Aux Mondiaux de Val d''Isère 2009, une française crée la sensation en prenant la deuxième place du Super-G derrière L.Vonn. Qui est-elle ?', 'Marchand-Arvier', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (196, 'Aux Mondiaux de Val d''Isère 2009, Julien Lizeroux remporte deux médailles en slalom et super combiné. Mais de quel métal ?', 'argent', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (197, 'Grandissime championne de ski-cross, prénommée Ophélie, je remporte, en 2009, ma sixième Coupe du Monde de la discipline. Je suis...', 'David', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (199, 'Jeune et talentueux fondeur suisse, je remporte, en 2009, le classement général de la Coupe du Monde de Ski de fond. Je suis...', 'Cologna', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (200, 'Fondeuse polonaise, prénommé Justina, je remporte le classement général de la Coupe du Monde 2009, devant la slovène Petra Majdic. Je suis...', 'Kowalczyk', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (201, 'Skieur de fond français, spécialiste du sprint, qui, après une médaille d''argent surprise à Turin en 2006, tarde à m''imposer comme un cador de la discipline. Je suis...', 'Darragon', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (202, 'Skieur de fond français, prénommé Maurice, je monte, fin 2009, sur mon premier podium en Coupe du Monde, lors d''un 15km, à Davos.', 'Manificat', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (203, 'Fin 2009, à Davos, l''Équipe de France de Ski de fond réalise un véritable exploit en plaçant tous ses skieurs dans la Top 10. Mais combien étaient-ils ?', '5', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (204, 'Skieur de fond italien, connu pour mon mon bonnet jaune à pompon, je termine 4ème du classement général de la Coupe du Monde 2009, à plus de 35 ans. Je suis...', 'Piller Cottrer', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (206, 'Fondeuse finlandaise, je remporte le Tour de Ski 2009, après avoir été suspendu deux ans pour dopage. Je suis...', 'Kuitunen', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (207, 'Quel club, fut champion d''hiver de ligue 1 française en cette fin d''année 2009 ?', 'Bordeaux', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (208, 'Dans quel club anglais, Frédéric PIQUIONNE, s''est il relancé ?', 'portsmouth', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (209, 'Quel grand attaquant munichois a reçu un bon de sortie pour le mercato hivernal en cette fin d''année 2009 ?', 'toni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (198, 'Chef de file du ski de fond français, je vis une année 2009 difficile, malgré quelques podiums et une bonne fin de saison. Je suis...', 'Vittoz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (210, 'Entraîneur, j''entraîne successivement : Corée du Sud, Australie et Russie, qui suis je ?', 'hiddink', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (205, 'Skieur de fond, je termine meilleur français du Tour de Ski 2009, à la 6ème place du général. Je suis...', 'Gaillard', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (211, 'Quelle nation, élimine la Russie en barrages de la Coupe du Monde 2010 ? ', 'Slovénie', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (212, 'Parmi ces équipes : Italie, Brésil, Angleterre et France, laquelle se retrouve dans le groupe de la Côte d''Ivoire lors de la Coupe du Monde 2010 ? ', 'Brésil', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (213, 'Dans quel club, évolue depuis le mercato d''été 2009, le français Younes KABOUL ?', 'portsmouth', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (214, 'Quel entraîneur, remplace Mark HUGUES, à la tête de Manchester City ?', 'mancini', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (216, 'Quel joueur, qualifie l''Algérie pour la Coupe du monde 2010 ?', 'Yahia', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (217, 'Dans quel pays, a eu lieu le match décisif entre l''Algérie et l''Egypte en barrages de la Coupe du Monde 2010 ?', 'soudan', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (221, 'Combien de Portugais compte l''effectif du Real Madrid depuis l''été 2009 ?', '2', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (223, 'Combien d''arbitres officiels compte un match d''Europa League ?', '5', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (224, 'Je suis argentin et porte le numéro 22 de l''Internazionale, qui suis-je ?', 'milito', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (227, 'Je suis licencié du poste d''entraîneur au Mans en cette fin d''année 2009 et dirige d''une main de maître l''équipe nationale du Burkina Faso, qui suis-je ?', 'duarte', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (218, 'Ancien madrilène et bordelais, j''étudie, en cette fin d''année 2009, la possibilité de jouer pour l''Algérie, qui suis-je ? ', 'faubert', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (222, 'Combien d''équipes italiennes, participeront à la phase finale de Ligue des Champions 2009/2010 ? ', '3', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (225, 'En 2009, dans quel club, a été prêté Andriy Shevchenko ?', 'dynamo kiev', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (215, 'Quel est l''entraîneur de West Ham depuis l''été 2009 ?', 'zola', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (226, 'Quel joueur autrichien est venu s''ajouter à l''effectif Interiste durant le mercato d''été 2009 ? ', 'arnautovic', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (219, 'Quel est le plus jeune joueur de l''Histoire de Premier League à avoir débuté, en 2009, sa carrière avec le maillot des Blues ?', 'kakuta', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (228, 'Skieur français, prénommé Cyprien, je monte pour la première fois sur un podium en Coupe du Monde, avec une troisième place, fin 2009, à Alta Badia.', 'Richard', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (229, 'Jeune patineur français, je remporte, en 2009, et à 19 ans, les championnats de France devant Y.Ponsero et A.Préaubert. Je suis...', 'Amodio', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (230, 'Champion allemand de bobsleigh, je participe, en fin 2009, et à 36 ans, à ma dernière saison Coupe du Monde, après avoir tout gagné. Je suis...', 'Lange', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (231, 'Skieur polyvalent norvégien, je remporte, en 2009, le grand globe de Cristal, ainsi que le petit globe du Super-G. Je suis...', 'Svindal', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (232, 'Jeune biathlète française, prénommé Marie-Laure. Je monte, en 2009, sur mon premier podium, avec une prometteuse troisième place lors d''une poursuite.', 'Brunet', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (233, 'International gallois, je réalise, en 2009 et à la surprise générale, mon coming-out, en avouant mon homsexualité. Je suis...', 'Gareth Thomas', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (234, 'L''année 2009 a été marquée par la première séance de tirs au but en H-Cup. Mais quel vaillant troisième ligne gallois, prénommé Martyn, manqua le tir au but décisif ?', 'Williams', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (235, 'Talentueux international français évoluant à Perpignan, je remporte, en 2009, l''Oscar Midi Olympique. Je suis...', 'Mermoz', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (236, 'Entraineur français, ayant mené mon équipe au Brennus en 2009, je remporte la même année l''Oscar Midi Olympique du Meilleur Entraîneur. Je suis...', 'Brunel', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (237, 'Équipe de rugby française, je connais une saison 2008/2009 difficile en évitant de peu la relégation, mais arrive, tout de même, en finale du Challenge européen, finale perdue face à Northampton. Je suis...', 'Bourgoin-Jallieu', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (239, 'Cycliste sur piste surpuissant, je remporte la vitesse individuelle aux Championnats du Monde 2009. Je suis...', 'Bauge', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (240, 'Cycliste belge, prénommé Dominique. Après avoir été champion du Monde espoirs du Contre-la-montre, je remporte la médaille de bronze lors de la poursuite aux Championnats du Monde sur piste, en 2009.', 'Cornu', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (241, 'Véritable surprise française aux Championnats du Monde sur piste en 2009, je remporte la médaille d''or du scratch, à seulement 22 ans. Je suis Morgan...', 'Kneisky', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (242, 'Pistarde française de talent, spécialiste de la vitesse et du keirin, je remporte la médaille d''argent dans cette épreve aux Championnats du Monde 2009. Je suis... ', 'Clara Sanchez', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (238, 'Nouvelle équipe sur le circuit Continental, j''impressionne, en 2009, avec mon recrutement labellisé ProTour : Evans, Hincapie, et autres Ballan... Je suis...', 'BMC Racing', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (243, 'Après un passage éclair à Saint Etienne, je signe en faveur du Zénith Saint Pétersbourg, avant de me relancer avec Monaco en cette fin d''année 2009, qui suis-je ?', 'puygrenier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (244, 'Irlandais, je quitte Tottenham pour Liverpool, avant d''y revenir au mercato d''été 2009, qui suis-je ?', 'keane', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (247, 'Ancien marseillais, je suis forcé de quitter Bastia après avoir reçu des menaces de mort du fait des mauvais résultas du club en ligue 2, qui suis-je ? ', 'arrache', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (246, 'Attaquant italien, j''effectue mon retour a San Siro après avoir excellé pendant une saison du coté du Genoa, qui suis-je ? ', 'boriello', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (248, 'Gardien international allemand, décédé le 11 Novembre 2009 dans un accident de train, je suis ...', 'enke', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (249, 'Ballon d''or africain 2009, je suis ..', 'eto''o', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (220, 'Quel équipe surprise, a disputé la finale de la Coupe des Confédérations 2009 face au Brésil ?', 'états unis', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (250, 'Ailier gauche brésilien du championnat français , j''effectue ma première sélection dans un match amical face à l''Angleterre, à Doha, je suis ...', 'bastos', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (251, 'En mal de temps de jeu au LOSC, je me relance du côté de strasbourg en 2009, en ligue 2, qui suis-je ?', 'fauvergue', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (252, 'Prêté à Grenoble pour sa première saison en Ligue 1 par Lyon, il rejoint finalement ce club définitivement au mercato d''été, qui suis-je ?', 'paillot', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (254, 'Capitaine emblématique, je rate la première partie de saison avec Boulogne-sur-Mer, qui suis-je ?', 'thill', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (256, 'Ancien gardien Bordelais, je suis transféré à Toulouse en Décembre 2009, pour pallier aux blessures, qui suis-je?', 'valverde', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (258, 'Dans quel club italien, Simone INZAGHI, a retrouvé du temps de jeu en cette fin d''année 2009 ?', 'lazio', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (259, 'Quelle est la dernière équipe africaine qualifiée pour la Coupe du Monde 2010, en plus de celles ci : Côte d''Ivoire, Algérie, Cameroun, Nigeria et Afrique du Sud ?', 'ghana', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (280, 'Après avoir quitté le SLUC en 2009, dans quel club s''est réfugié TJ Parker ?', 'villeurbanne', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (261, 'Sur quel score, le FC Barcelone bat en finale de Ligue des Champions 2009, le tenant du titre Manchester United ? ', '2-0', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (263, 'Quel fut le meilleur buteur de la Coupe des Confédérations 2009 ?', 'luis fabiano', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (264, 'Lors de la Coupe des confédérations 2009, le groupe A était composé de : Espagne, Afrique du Sud, Nouvelle-Zélande et ...', 'Irak', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (266, 'Pour quel club, Kaba DIAWARA, a t-il signé cet été 2009 ?', 'arles-avignon', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (267, 'Après une saison gâchée par des blessures, dans quel club, John MENSAH, s''est il relancé cet été 2009 ?', 'sunderland', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (268, 'Prêté la saison dernière à la Fiorentina, il revient cet été 2009, et devient le troisième gardien officiel de l''AC Milan, qui est-il ? ', 'storari', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (265, 'Qui est le président de la Fédération Française de Football en 2009 ?', 'escalettes', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (255, 'En mal de temps de jeu au FC Metz, je suis prêté en fin de saison 2008/2009 à Sedan, qui suis-je ?', 'babacar gueye', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (269, 'Ancien défenseur parisien, il se relance lors de la saison 2008/2009, à Hull City, qui est-il ? ', 'bernard mendy', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (257, 'Comment se nomme le président français de la juventus de Turin ?', 'jean-claude blanc', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (245, 'Capitaine de l''équipe de France Espoir, je figure comme un élément défensif indispensable pour le club de la capitale, qui suis-je ?', 'mamadou sakho', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (260, 'Quel est le numéro de maillot de RONALDINHO à l''AC MILAN, durant la saison 2009/2010 ?', '80', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (253, 'Espoir en devenir, je quitte le Rhône pour signer durant l''été 2009 du côté de l''OGC Nice, qui suis-je ?', 'mounier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (262, 'Milieu ghanéen évoluant en Italie, je suis exclu, fin Décembre 2009, du groupe de joueurs, destiné à jouer la Coupe d''Afrique 2010, qui suis-je ?', 'muntari', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (270, 'Quel lieutenant de K.Bryant, considéré comme le meilleur 6ème Homme de la NBA, permet au Lakers de remporter le titre NBA, en 2009 ?', 'Odom', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (271, 'Quel joueur fut, en 2009, élu meilleur étranger de pro A ?', 'nichols', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (272, 'Dans quel club évolue, Austin Nichols lors de la saison 2009/2010 de pro A ?', 'orléans', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (273, 'Quel joueur, a été élu MVP français lors de la saison 2008/2009 de pro A ?', 'koffi', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (274, 'Quel joueur a été élu meilleur espoir de pro A, lors de la saison 2008/2009 ?', 'heurtel', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (275, 'Quel joueur a été élu meilleur défenseur de pro A, lors de la saison 2008/2009 ?', 'dobbins', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (276, 'Quel joueur évoluant en 2009, au Dallas Mavericks, a reçu le titre MIP lors de la saison 2008/2009 de pro A ? ', 'beaubois', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (277, 'Quel est le premier club NBA de Rodrigue Beaubois ?', 'dallas', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (278, 'Dans quel club, Ronny Turiaf, s''est réfugié après avoir quitté les lakers en 2009 ?', 'golden state', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (279, 'Dans quel club évoluait Boris Diaw, avant de rejoindre les Charlotte Bobcats en 2009 ?', 'phoenix suns', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (281, 'Derrière quelle grande star des SPURS, Ian Mahinmi tente-t-il de gagner du temps de jeu au poste de centre lors de la saison 2009 ?  ', 'duncan', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (282, 'Sauteur à ski autrichien, je remporte devant S.Ammann et G.Schlirenzauer, la tournée des 4 Tremplins, au début de l''année 2009. Je suis...', 'Loitzl', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (283, 'Famille de skieurs italiens, le frère est un concurrent direct de J.B. Grange en slalom, tout comme la soeur, spécialiste du slalom géant et du slalom. Nous sommes les...', 'Moelgg', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (284, 'Skieuse française, prénommé Taina, je suis une spécialiste du Géant, et monte sur mon premier podium, fin 2009, à 21 ans.', 'Barioz', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (285, 'Descendeur français, prénommé Johan, je reviens en forme et monte sur le podium à Val Gardena, après une terrible blessure aux deux genoux, au début de l''année 2009. Je suis...', 'Clarey', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (286, 'Descendeur canadien, prénommé John, je remporte à la surprise générale, la médaille d''or lors de la descente des Championnats du Monde à Val d''Isère, en 2009.', 'Kucera', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (287, 'Fin 2009, Julien Dupuy est suspendu pour 6 mois par l''ERC. Mais quel mauvais geste est responsable de cette sanction disciplinaire ?', 'Fourchette', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (289, 'Équipe d''Afrique du Sud, je remporte le Super 14, en 2009, avant de voir ma star, B.Habana, rejoindre les Stormers. ', 'Bulls', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (290, 'Province sud-africaine, qui après avoir recruté Michalak en 2008, se paye les services du magicien, Juan Martin Hernandez, en 2009.', 'Sharks', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (288, 'Après l''éviction de Laurent Seigne, en 2009, je prends seul les commandes de l''entrainement brisviste. Ancien demi de mêlée international, je suis Christophe...', 'Laussucq', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (291, 'Demi de mêlée international argentin, qui malgré les propositions de clubs du Top 14, en 2009, après la relégation de son club, décide de continuer l''aventure avec Dax, en Pro D2.', 'Vergallo', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (292, 'Fantasque joueur fidjien, connu autant pour mon indiscipline que pour ma puissance. Je reviens, en 2009, au niveau qui a fait de moi, le meilleur joueur du Top 14, avec Agen.', 'Caucaunibuca', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (293, 'Cycliste français de la FdJ, ancien puncheur du Crédit Agricole, qui, après une belle 10ème place à Paris-Nice, confirme en terminant 10ème du Tour de France 2009.', 'Le Mevel', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (294, 'Champion de cyclisme sur route finlandais, je participe, en 2009, avec la FdJ au Tour de France, et y porte le maillot de Meilleur Grimpeur.', 'Veikkanen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (295, 'Expérimenté cycliste français, après une belle fin de saison 2009 avec Agritubel, je signe, pour un dernier challenge, à la Caisse d''Epargne. ', 'Moreau', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (296, 'Cycliste irlandais, je suis champion national en 2009. Dans la lignée de mon père Stephen, je termine mon premier Tour de France à la 29ème place. ', 'Nicolas Roche', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (297, 'Prometteur cycliste allemand, prénommé Tony, qui, après de nombreuses places d''honneur, en 2009, remporte la médaille de bronze aux Championnats du Monde de contre-la-montre à Mendrisio.  ', 'Martin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (298, 'Cycliste français, coéquipier modèle en montagne, et capitaine de route d''Ag2r la Mondiale, je mets un terme à ma carrière, en 2009, à 39 ans.', 'Goubert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (299, 'Cycliste belge, prénommé Niels, je remporte, en 2009, devant mon rival, Sven Nys, le titre de Champion du Monde de Cyclo-cross. ', 'Albert', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (300, 'Grandissime champion de Cyclo-cross belge, je survole la discipline depuis plusieurs années et remporte, en 2009, et pour la 5ème fois consécutive le classement de la Coupe du Monde. Je suis...', 'Nys', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (303, 'Ancien rennais, lyonnais mais aussi stéphanois, je prends les commandes de Dijon en tant qu''entraineur durant la saison 2009/2010, qui suis-je ?', 'carteron', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (302, 'Grand espoir anglais, je suis transféré été 2009 du côté de Chelsea, je quitte alors mon club formateur Manchester City, qui suis-je ?', 'sturridge', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (305, 'Milieu offensif tunisien, formé à Amiens, je suis l''un des principaux artisans du bon début de saison 2009 de Valenciennes, qui suis-je ?', 'Ben Khalfallah', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (306, 'Ancien monégasque et caennais, je suis prêté par mon club, au Glasgow Rangers pour la saison 2009/2010, qui suis-je ?', 'rothen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (307, 'Championnats du Monde 2009 à Val d''Isère : la descente femmes est remporté par l''américaine...', 'Vonn', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (309, 'Championnats du Monde 2009 à Val d''Isère : belle performance d''ensemble des françaises en descente, avec, pour point d''orgue, la 4ème place de Marion...', 'Rolland', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (314, 'Skieuse allemande, sœur de Susanne, elle aussi skieuse, je remporte le slalom aux Championnats du Monde 2009 à Val d''Isère.   ', 'Maria Riesch', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (310, 'Prodige suisse, prénommée Lara, je termine 2ème de la descente femme des Championnats du Monde 2009 à Val d''Isère, à seulement 18 ans. Je suis... ', 'Gut', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (315, 'Ailier international français, je rejoins pour la saison 2008/2009, les Trail Blazers de Portland, qui suis-je ?', 'batum', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (316, 'Slalomeur autrichien, prénommé Manfred, ma médaille d''or aux Championnats du Monde à Val d''Isère vient récompenser une belle saison 2009.', 'Pranger', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (317, 'Pivot asiatique, j''entame ma 7 ème saison avec les Houston Rockets en 2009, qui suis-je ?', 'yao ming', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (318, 'Skieur croate, spécialiste du slalom, je termine la saison 2009, en échouant de peu dans la quête du petit Globe de Cristal dans ma discipline de prédilection.', 'Ivica Kostelic', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (308, 'Ancien manager et entraineur, j''occupe en 2009, la place de DTN à la Fédération Française de Football , qui suis-je ?', 'houiller', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (301, 'Attaquant transféré au Mercato hivernal 2009, il quitte le FC Metz pour rejoindre Fribourg, en Allemagne, qui est-il ?', 'papiss cisse', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (312, 'Fils d''un mythique gardien mancunien, je rejoins Notts County en juillet 2009 avec Sol Campbell entre autre, qui suis-je ?', 'kasper schmeichel', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (311, 'Ancien défenseur gunner, je rejoins le club de Notts County en juillet 2009, qui suis-je ? ', 'sol campbell', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (304, 'Attaquant français considéré comme un éternel espoir, je suis transféré au 
Mercato hivernal 2009 de l''Atletico Madrid au Sporting Lisbonne, qui suis-je ?', 'sinama-pongolle', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (320, 'Face à quelle équipe, les grecs du Panathinaïkós Athènes ont il remporté la finale de l''Euroligue 2009 ?', 'Moscou', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (327, 'L''été 2009 est marqué par une affaire entre France et Nouvelle Zélande. Ces rixes sont dus aux mensonges d''un jeune et prometteur français, au gabarit impressionnant. Il se prénomme...', 'Bastareaud', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (321, 'Troisième ligne des London Irish, je fête ma première sélection, avec mon frère Delon, sous le maillot du XV de la Rose, en 2009.', 'Steffon Armitage', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (322, 'Quelle équipe, est en 2009, la plus titrée en Euroligue depuis sa création en 1958 ?', 'real madrid', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (324, 'Meneur serbe du Tau Vitoria, je suis le meilleur marqueur de l''Euroligue 2008/2009 ?', 'Rakocevic', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (323, 'Quelle équipe anglaise à la chance de compter, en 2009, dans ses rangs, les deux frères Armitage, Delon et Steffon ? ', 'London Irish', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (332, 'Ancien ailier de Dax et du Stade français, je suis recruté par le Racing Métro, en 2009, pour mes qualités de vitesse et de finisseur. Je suis...', 'Saubade', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (330, 'Quel ancien international français s''occupe, en 2009, des lignes arrières du XV de France ?', 'N''tamack', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (319, 'Quelle équipe a remporté l''Euroligue 2009, à Berlin, en dominant les russes du CSKA Moscou ?', 'Panathinaikos', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (331, 'Ailier argentin, prénommé Lucas, qui après une saison en demi-teinte à Dax, choisi de rejoindre les rangs d''Albi en 2009.', 'Borges', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (328, 'Meneur grec du Panathinaïkos, je suis élu meilleur défenseur de l''Euroligue, saison 2008/2009, qui suis-je ?', 'Diamantidis', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (333, 'Demi d''ouverture néo-zélandais, qui en rejoignant les Harlequins, lors de la saison 2008/2009, tire un trait sur sa carrière internationale. Je suis...', 'Evans', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (334, 'Arrière serbe, je suis transféré au Real Madrid, après avoir été élu meilleur espoir lors de l''Euroligue 2008/2009, qui suis-je ?', 'velickovic', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (360, 'Équipier modèle, et coureur espagnol expérimenté de Cervélo, je suis, à 40 ans, le cycliste le plus âgé du Tour de France 2009.', 'Cuesta', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (335, 'Ailier anglais des Harlequins, surnommé Moners, je participe, en 2009, à mon premier Tournoi des 6 Nations.', 'Monye', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (326, 'Surnommé la " bomba " au FC Barcelone et ancien joueur de NBA, je suis élu MVP de la saison régulière en Euroligue, saison 2008/2009 ?', 'Juan Carlos Navarro ', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (336, 'Ailier fidjien aux appuis hors norme, je mets un terme à ma carrière internationale pour me consacrer à mon club, Montauban. Je suis...', 'Delasau', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (337, 'Arrière espagnol, formé à Barcelone, je signe à Memphis Grizzlies, en NBA, avant de revenir à mes premiers amours lors de la saison 2008/2009, qui suis-je ? ', 'Juan Carlos Navarro ', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (338, 'Ancien espoir du rugby français prénommé Pierre, j''ai du mal à m''imposer en deuxième ligne au Stade Français, après mon arrivée du Clermont Auvergne en 2008/09.', 'Vigouroux', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (340, 'Grimpeur italien, surnommé "le Cobra", je suis suspendu pour dopage, puis rejoins Ceramica Flaminia, en fin d''année 2009.', 'Ricco', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (341, 'Entraineur de Villeurbanne depuis la saison 2008/2009 de pro A, je prends les rênes de l''équipe de France de Basket ball en 2009, qui suis-je ?', 'collet', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (343, 'Entraineur de Bourges Basket, j''entame ma 7 ème saison avec l''équipe de France féminine de Basket Ball en 2009, qui suis-je ?', 'pierre vincent', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (344, 'Alors qu''il devait signer avec la Quick Step pour 2009 après la dissolution de la Gerolsteiner, un contrôle antidopage positif sur le Tour de France met fin aux rêves de ce rouleur allemand. Mais qui est-ce ?', 'Stefan Schumacher', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (345, 'Combien de grands chelems, comporte le circuit ATP, en 2009 ?', '4', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (346, 'Cycliste britannique, équipier modèle, je signe en 2009, chez Cervélo. Mes qualités sur les pavés m''ont permis de me distinguer dans Paris-Roubaix et Gand-Wevelgem.', 'Hammond', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (348, 'Cycliste australien, ancien du Crédit Agricole, je signe chez Cervélo, en 2009, et remporte, la même année, une étape sur le Giro et une sur la Vuelta.', 'Gerrans', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (347, 'Sur le circuit ATP , deux Indiens figurent dans le Top Ten Mondial de Double en 2009, ils sont : Paes et ...', 'bhupathi', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (349, 'Ancien coureur espagnol de Bouygues Télécom, avec qui j''ai remporté la Classica San Sebastian, je signe, en 2009, chez Cervélo pour mes qualités de puncheur. ', 'Florencio', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (342, 'L''année 2009 est l''opportunité de voir le retour d''un banni, suspendu pour dopage. Surnommé "Chicken Legs", il s''agit bien sûr de...', 'Michael Rasmussen', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (351, 'Gaucher canadien et coéquipier de Nenad Zimonjic en double, en 2009, je me considère comme un réel joueur de Double, qui suis-je ? ', 'nestor', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (352, 'Seul espagnol qui apprécie la pluie et les pavés, ce coureur de classiques confirme sa renommée en prenant la 6ème place de Paris-Roubaix 2009.', 'Flecha', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (350, 'Coéquipier de Nestor en double et droitier serbe, je figure au 3 ème rang Mondial en Double en 2009, qui suis-je ? ', 'zimonjic', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (353, 'Sprinteur baroudeur français, souvent considéré comme le plus petit du peloton, cela ne m''empêche pas de remporter une étape sur le Tour de France en 2009.', 'Dumoulin', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (354, 'Entrainé par Magnus Norman, j''occupe fin d''année 2009, une excellente 8 ème place mondiale, qui suis-je ?', 'soderling', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (355, 'Cycliste français, je préfère les coups d''éclats aux performances régulières. Je confirme mes capacités de grimpeur avec le maillot de Meilleur Grimpeur sur la Vuelta 2009.', 'Moncoutié', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (356, 'Puncheur " colérique " et détenteur de 14 titres sur le circuit ATP, j''obtiens mon meilleur classement en aout 2009, une 2ème place mondiale, qui suis-je ?', 'murray', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (357, 'Surnommé le Mont Chauve, l''année 2009 a vu Garate triompher à mon sommet lors de l''avant dernière étape du Tour de France 2009. Je suis...', 'Mont Ventoux', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (358, 'Ancien directeur de TF1, je prends la présidence de l''Olympique de Marseille, en 2009, qui suis-je ?', 'dassier', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (359, 'Cycliste belge appartenant à Silence-Lotto, après la défaillance de mon leader lors du Tour de France 2009, je prends le leadership et termine à une prometteuse 15ème place.', 'Van den Broeck', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (362, 'Équipe américaine de rouleurs, je présente sur le Tour de France 2009, le champion du Monde contre-la-montre, et les champions d''Australie, d''Allemagne, et du Luxembourg du contre-la-montre.', 'High Road', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (363, 'Le Tour de France 2009 est marqué par la victoire de Contador. Mais lors du podium final, quel pays est mis à l''honneur à la place de l''hymne espagnol ?', 'Danemark', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (364, 'Pour la première fois sur le Tour de France, Quick Step présente deux francais en la personne de S.Chavanel et du puncheur...', 'Jerome Pineau', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (365, 'Prometteur grimpeur français, ancien coureur du Crédit agricole. Je confirme les espoirs placés en moi par Bernaudeau, mon directeur sportif, en terminant 4ème au classement du Meilleur Jeune au Tour de France 2009.', 'Pierre Rolland', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (366, 'Champion de VTT, ou cycliste en devenir, je remporte le championnat de France 2009 du CLM, et représente le France aux Championnats du Monde à Mendrisio, où je prends une belle 12ème place.', 'Peraud', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (367, 'Vainqueur du Super G des Championnats du Monde 2009, j''en deviens le plus vieux vainqueur. Suisse, de 35 ans, je remporte, la même année, le petit globe de Cristal du Géant.', 'Cuche', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (368, 'Polyvalent skieur suisse, je me révèle, en 2009 et du haut des mes 23 ans, avec une médaille d''or aux Championnats du Monde à Val d''Isère 2009 et le petit globe de cristal du combiné.', 'Janka', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (369, 'Cycliste espagnol de la Caisse d''Épargne je remporte le Tour de France 2006, et signe fin 2009 chez Astana, en équipier de Luxe.', 'Oscar Pereiro', 'Cyclisme');
INSERT INTO `qisport_db`.`questions` VALUES (370, 'Le maillot du Stade Français 2009 met en valeur une célèbre reine en la personne de...', 'Blanche de Castille', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (371, 'Skieur autrichien, prénommé Benjamin, ma régularité et ma polyvalence me permettent de terminer, en 2009, sur le podium du Classement général de la Coupe du Monde, pour la 6ème année consécutive.', 'Raich', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (372, 'Grosse désillusion 2009, Championnats du Monde à Val d''Isère, alors qu''il était le grand favori du slalom, il sort lors de la deuxième manche et laisse les honneurs à un autre français, J.Lizeroux.', 'Grange', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (373, 'Famille de rugbymen argentins, l''aîné termine sa carrière du côté de Clermont-Auvergne, tandis que le cadet, revient fin 2009, avec le Stade Français, après un grave blessure. Nous sommes...', 'Ledesma', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (374, 'Révélation du Top 14 2009 au poste d''ouvreur, Jonathan Wisniewski s''impose comme un titulaire en club, et frappe aux portes de l''Équipe de France. Mais quelle  est cette équipe, en 2009, qui l''a révélé ?', 'Racing Métro', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (375, 'Fantasque skieur américain, mon ski tout en risque m''a valu de nombreux succès. Je veux, fin 2009, montrer que ma 15ème place lors du précédent exercice n''était qu''une erreur de parcours.', 'Bode Miller', 'Sports d''Hiver');
INSERT INTO `qisport_db`.`questions` VALUES (376, 'Prometteur arrière français, je prends mes responsabilités en finale du Top 14, en juin 2009. Mes réussites au pied permettent à mon équipe de l''emporter face au Clermont-Auvergne. Je suis...', 'Porical', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (377, 'Demi d''ouverture français au coup de pied surpuissant, je termine meilleur réalisateur français du Top 14, lors de la saison 2008/09.', 'Beauxis', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (378, 'Équipe française, au recrutement ronflant, je remporte, avec 13 points d''avance sur mon dauphin Agen, la Pro D2, en 2009.', 'Racing Métro', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (391, 'Attaquant Islandais, arrivé été 2009 à l'' AS Monaco, je désire quitter la principauté dès le mercato hivernal 2009/2010, qui suis-je ?', 'Gudjohnsen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (379, 'Rugbyman français capable de jouer deuxième ou troisième ligne. Je suis loin d''être un titulaire indiscutable au Stade Toulousain, mais je participe, en 2009, grâce à ma polyvalence, à 26 matchs avec l''équipe de G.Novès.', 'Lamboley', 'Rugby');
INSERT INTO `qisport_db`.`questions` VALUES (381, 'Quelle équipe nationale, titrée à 7 reprises en championnats du Monde en 2009, domine le Basket féminin depuis ses débuts ?   ', 'états unis', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (380, 'Quelle équipe nationale féminine de Basket Ball, est actuelle Championne du Monde, un titre conquis au Brésil, en 2006 face, à la Russie ?', 'Australie', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (382, 'Quelle est la périodicité, en années, des championnats du Monde de Basket Ball féminin ?', '4', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (384, 'Formé à Southampton, avant de rejoindre les Blues et  Stamford Bridge, je me présente, depuis l''été 2009, comme le titulaire indiscutable au poste de défenseur gauche, à Manchester City, qui suis-je ?', 'bridge', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (385, 'Petit feu follet et international anglais, je surprends mes adversaires, par ma vitesse et mes enchainements balle au pied; passé par Chelsea, je figure, indiscutablement, dans le Onze de départ de Manchester City en 2009, qui suis-je ?', 'wright-phillips', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (386, 'Attaquant Sud Américain, passé du côté de l''Alliance Arena, je suis transféré été 2009 en provenance de Blackburn, à Manchester City, et compte, fin 2009, aucune titularisation en Premier League, qui suis-je ?', 'santa cruz', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (383, 'Née le 25 mars 1971 au Texas, et évoluant à Houston, je suis en 2009, la joueuse américaine, la plus titrée dans l''histoire des championnats du Monde, qui suis-je ? ', 'swoopes', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (387, 'Ballon d''or 1991, je prends les rênes, le 30 Décembre 2009, de Châteauroux alors 18ème de Ligue 2, qui suis-je ?', 'papin', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (388, 'Ancienne Numéro 1 Mondiale, je prends ma retraite le 3 décembre 2009, qui suis-je ?', 'mauresmo', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (389, 'Attaquant Hondurien, et bloqué au poste par Milito, Eto''o et Balotelli, je suis prêté à Genoa, fin 2009 pour une durée de 6 mois, qui suis-je ?', 'suazo', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (390, 'Ancien défenseur mythique néerlandais, je fais depuis 2009, les beaux jours de Galatasaray, en tant qu''entraineur, qui suis-je ?', 'rijkaard', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (394, 'Attaquant, je suis présenté comme le futur prodige Américain dans les médias, mais je déçois très vite par mes prestations en Europe, je suis de retour en Décembre 2009 à Benfica,après un prêt stoppé par Belenenses, qui suis-je ?', 'freddy adu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (395, 'Dans un livre autobiographique, sorti fin 2009, j''évoque mon quotidien sportif gâché par la prise de substances illicites, qui suis-je ? ', 'agassi', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (396, 'Attaquant fantaisiste, je suis l''objet d''une vive polémique, en 2009, à la suite de son licenciement par Chelsea, pour cause de dopage, quelques années plus tôt, qui suis-je ?  ', 'mutu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (397, 'Arrière latéral gauche, formé à Sochaux, comptant une sélection en équipe de France A'', je suis transféré été 2009 du côté de l''Espagne et plus précisément à Valence, qui suis-je ?  ', 'jérémy mathieu', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (398, 'Arrivé sous forme de prêt chez les Rossoneri, en Décembre 2009, je n''en finis de surprendre par mon look extravagant, qui prend parfois le dessus sur mes performances footballistiques, qui suis-je ? ', 'beckham', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (399, 'Quelle équipe, les Bleus de Raymond Domenech, affronteront lors de leur premier match, à la Coupe du Monde 2010, qui se déroulera en Afrique du Sud ?', 'uruguay', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (393, 'Attaquant Suisse, je suis transféré été 2009 à Zurich, et suis le plus jeune buteur de l''histoire d''un championnat d''Europe, qui suis-je ?', 'vonlanthen', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (400, 'Arrivé en 2009, du côté de l''ASVEL, quel club de renom, en pro A, Vincent Collet a-t-il entrainé auparavant ?', 'le mans', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (401, 'Milieu de terrain, appartenant à la Lazio de Rome, présenté, il y a encore quelques années, comme le futur " zizou ", j''inaugure ma première sélection avec les fennecs, qui suis-je ? ', 'meghni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (402, 'Grand attaquant italien d''origine Australienne, je joue pour les plus grands clubs européens, et notamment pour l''Internazionale, entre 1999 et 2005, je prends ma retraite le 22 Octobre 2009, qui suis-je ?', 'vieri', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (404, 'Quelle équipe, a établi un nouveau record, qui est de 18 défaites de suite, correspondant donc, au plus mauvais début de saison de l''histoire de la NBA ?  ', 'new jersey', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (405, 'Les Nets ont établi le plus mauvais début de saison de l''histoire de la NBA, mais avec combien de défaites de suite ? ', '18', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (406, 'Milieu de Terrain valenciennois, je décline, fin  décembre 2009, la sélection avec les Aigles de Carthages, et ne disputera donc pas la Coupe d''Afrique des Nations, qui suis-je ?', 'Ben Khalfallah', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (407, 'Titulaire indiscutable, en 2009, à la pointe du Real Madrid, dans quel club, Gonzalo HIGUAIN a-t-il fait ses armes ?', 'River Plate', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (409, 'Verdasco, 9 ème Mondial, a pu participé au Masters de Londres 2009, réunissant les 8 meilleurs joueurs mondiaux, suite à une blessure d''un joueur, mais qui est il ?', 'roddick', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (408, 'Tenant du Titre à Monte Carlo, je remporte une nouvelle fois cette finale, en 2009, face à Djokovic, qui suis-je ?', 'nadal', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (410, 'Attaquant international allemand, je finis 3 ème meilleur buteur du championnat allemand avec Stuttgart lors de la saison 2008/2009, avant de rejoindre Munich l''été qui suit, qui suis-je ?', 'mario gomez', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (411, 'Milieu offensif algérien, formé à Sochaux, je quitte la France pour rejoindre Wolfsburg, en Allemagne, durant l''été 2009, qui suis-je ?', 'karim ziani', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (412, 'Robuste défenseur français, formé au RC France, j''arrive à Bordeaux été 2009, en provenance de Lorient, et me présente comme un titulaire indiscutable dans le Onze type de départ, qui suis-je ?', 'ciani', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (413, 'Champion du monde 2006, je signe à la Roma, au Mercato hivernal 2009, afin de me relancer et de faire partie du groupe Italien qui s''envolera en juin 2010, pour l''Afrique du Sud, qui suis-je ?', 'toni', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (415, 'Présente pour la première fois à Roland Garros 2009, je gagne cette même année l''édition junior, et suis élue fin 2009, à 16 ans, meilleure junior de l''année 2009, qui suis-je ?', 'mladenovic', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (416, 'Défenseur sénégalais, Champion de France 2008/2009, je quitte mes camarades été 2009 pour rejoindre la cité fosséenne , qui suis-je ?
', 'souleymane diawara', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (403, 'Seul joueur du Top Ten en 2009, à ne pas posséder d''équipementier officiel, je suis...', 'davydenko', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (414, 'Ancien parmesan, je suis élu, en Décembre 2009, et pour la deuxième année consécutive, meilleur joueur de la zone AMSUD, qui suis-je ?', 'juan sebastian veron', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (418, 'Ancien défenseur Nancéien, je reviens, fin Décembre 2009, en prêt à Saint-Étienne, pour une durée de 6 mois, qui suis-je ?', 'Diakhate', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (419, 'Ancien Bordelais, je suis prêté, à la surprise générale, en Janvier 2009, du côté de Santiago Bernabeu, qui suis-je ? ', 'faubert', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (420, 'Joueur des Denver Nuggets, je suis Franchise Player de mon équipe et meilleur scorer de la NBA, en 2009, qui suis-je ?', 'carmelo anthony', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (421, 'Quel Sophomore est considéré, en 2009, comme le Franchise Player d''Oklahoma City ?', 'Kevin Durant', 'Basket-Ball');
INSERT INTO `qisport_db`.`questions` VALUES (423, 'Rafael NADAL et son entraineur en 2009, présentent des liens très particuliers, en effet, Toni NADAL est son ...', 'oncle', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (422, 'Roger Federer établit un record en 2009, il devient le seul joueur, a remporté, combien de titres du Grand Chelem ?', '15', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (424, '2009, année de ma consécration, je parviens à me hisser dans le Top Ten, et même à décrocher une place de 5 ème joueur mondial le 6 avril 2009 que j''occuperai    jusqu''à la fin de la saison, qui suis-je ?', 'del potro', 'Tennis');
INSERT INTO `qisport_db`.`questions` VALUES (427, 'Grand attaquant international Tchèque, je signe à l''AS Cannes, au Mercato hivernal 2009/2010, qui suis-je ?', 'koller', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (429, 'Ancien attaquant international francais, presenté à ses débuts, comme le futur Jean Pierre Papin, je mets un terme à ma carrière en 2005 après être passé par Paris, Marseille ou encore le Celta Vigo; je rejoins le 1 er Juillet 2009, la cellule de recrutement de l''OL, qui suis-je ? ', 'Florian Maurice', 'Football');
INSERT INTO `qisport_db`.`questions` VALUES (428, 'Quel fut le joueur, en 2009, élu meilleur espoir masculin français ?', 'mina', 'Tennis');



