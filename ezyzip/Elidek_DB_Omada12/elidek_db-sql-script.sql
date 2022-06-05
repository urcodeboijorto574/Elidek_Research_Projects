-- ----------------------------
-- Create database
-- ----------------------------

CREATE SCHEMA elidek_db;
USE elidek_db;

-- ----------------------------
-- Table structure for organisations
-- ----------------------------

-- DROP TABLE IF EXISTS `organisations`;
CREATE TABLE `organisations` (
  `org_id` INT PRIMARY KEY AUTO_INCREMENT,
  `abbreviation` VARCHAR(10),
  `name` VARCHAR(40),
  `zipcode` INT,
  `street` VARCHAR(40),
  `city` VARCHAR(40),
  `category` VARCHAR(10) NOT NULL,
  `capital` INT,
  `budget_min_ed` INT,
  `budget_individ` INT,
  CHECK (`category` IN ('R. Center', 'University', 'Company'))
);

-- ----------------------------
-- Records of organisations
-- ----------------------------

INSERT INTO `organisations`(`org_id`,`abbreviation`,`name`,`zipcode`,`street`,`city`,`category`,`capital`,`budget_min_ed`,`budget_individ`) VALUES
 (1101,'ATOI','AIR GROUP',91867,'93 Cleveland Street','Chicago','Company',345888,NULL,NULL)
,(1102,'ACE','SPACEVILLE',23403,'49 Rosewood St.','Houston','R. Center',NULL,37210,848753)
,(1103,'BNT','BIONTECH',47753,'181 Clay Dr.','Montreal','Company',459219,NULL,NULL)
,(1104,'STF','STANFORD',27810,'609 Saxon Street','California','University',NULL,107373,NULL)
,(1105,'EMP','METSOVIO',12737,'20 Green Lake St.','Athens','University',NULL,68436,NULL)
,(1106,'KGR','K GROUP',33354,'567 Hudson St.','Illinois','Company',540569,NULL,NULL)
,(1107,'SM','SMENT',42365,'141 Selby Drive','Seoul','Company',937924,NULL,NULL)
,(1108,'KQ','KQ GROUP',57258,'8 Old York St.','San Francisco','Company',512220,NULL,NULL)
,(1109,'BGHE','BIGHITENT',95816,'9 Young Ave.','Los Angeles','Company',536892,NULL,NULL)
,(1110,'JYP','JYPENT',97532,'13 Yukon St.','Milwaukee','Company',563585,NULL,NULL)
,(1111,'HRVRD','HARVARD',65484,'413 Water Ave.','Massachusetts','University',NULL,197781,NULL)
,(1112,'CHMX','CHEMEX',60223,'87 Gregory Ave.','Boston','R. Center',NULL,221015,690654)
,(1113,'CJ','CJENT',77908,'851 Beaver Ridge','Seattle','R. Center',NULL,49538,255659)
,(1114,'YNS','YONSEI UNI',42625,'02 Jones Road','Seoul','University',NULL,54981,NULL)
,(1115,'SLU','SEOUL UNI',54215,'383 Liberty Street','Seoul','University',NULL,182008,NULL)
,(1116,'HMC','HUMANRES',19010,'40 St Paul Lane','New York','R. Center',NULL,202628,418831)
,(1117,'MIT','MAS INSTITUTE',33496,'613 Alton St.','Massachusetts','R. Center',NULL,55037,120877)
,(1118,'CMB','CAMBRIDGE',14843,'118 Summer Lane','Cambridge','University',NULL,175548,NULL)
,(1119,'ICAR','GUWATIRES',74954,'96 Aspen Street','Guwati','R. Center',NULL,183376,142289)
,(1120,'CLMTR','CLIMATERES',77955,'772 Bayport St.','New Delhi','R. Center',NULL,19834,771513)
,(1121,'HSTR','HISTORRES',61805,'577 53rd Ave.','Cairo','R. Center',NULL,36268,633624)
,(1122,'INLVS','INTELLIVISION',52308,'94 Stanley Road','Texas','Company',144297,NULL,NULL)
,(1123,'OMN','OMNILERT',21909,'60 Church Street','Washington','Company',886353,NULL,NULL)
,(1124,'CLU','CALI UNI',30922,'05 Fawn Drive','California','University',NULL,215640,NULL)
,(1125,'ENRG','ENRGHEX',52758,'14 Beech St.','London','Company',712346,NULL,NULL)
,(1126,'SHFLDM','SHEFFIELD UNI',10169,'68 Kings Road','Sheffield','University',NULL,107103,NULL)
,(1127,'RBT','ROBOTICSCO',55900,'49 Sussex Rd.','Sussex','R. Center',NULL,263973,133020)
,(1128,'TXT','TIMEXTECH',45794,'74 Iroquois St.','Oklahoma','Company',952017,NULL,NULL)
,(1129,'SGR','S GROUP',23216,'10 Albany St.','Torronto','Company',968092,NULL,NULL)
,(1130,'GTOP','GOTOP',84122,'580 Prince St.','Singapore','Company',417364,NULL,NULL);


-- ----------------------------
-- Table structure for phone_numbers
-- ----------------------------

-- DROP TABLE IF EXISTS `phone_numbers`; 
CREATE TABLE `phone_numbers` (
  `phone_number` VARCHAR(20),
  `org_id` INT,
  PRIMARY KEY (`org_id`, `phone_number`),
  FOREIGN KEY (`org_id`) REFERENCES `organisations` (`org_id`)
);

-- ----------------------------
-- Records of phone_numbers
-- ----------------------------

INSERT INTO `phone_numbers`(`phone_number`,`org_id`) VALUES
 ('760-377-8651',1101)
,('765-342-5297',1101)
,('598-127-5169',1102)
,('749-710-5571',1102)
,('855-169-1421',1102)
,('587-836-4467',1103)
,('762-903-2907',1103)
,('846-531-6309',1104)
,('830-273-5635',1104)
,('884-458-6909',1105)
,('213-752-6794',1105)
,('394-327-6975',1106)
,('811-827-0566',1106)
,('876-600-1079',1106)
,('944-250-6216',1107)
,('839-717-1380',1107)
,('878-956-6641',1107)
,('508-748-8464',1107)
,('389-630-3937',1108)
,('550-197-1701',1108)
,('828-468-8267',1108)
,('264-685-3002',1109)
,('138-372-6705',1109)
,('928-690-9111',1110)
,('326-541-8376',1110)
,('998-370-6091',1111)
,('736-810-4835',1111)
,('602-811-6479',1111)
,('737-210-0926',1112)
,('398-569-7316',1112)
,('864-674-5324',1112)
,('994-344-5179',1113)
,('269-720-0170',1113)
,('652-250-5317',1114)
,('293-654-7893',1114)
,('461-234-6177',1114)
,('893-933-0376',1114)
,('410-783-6847',1115)
,('521-980-2606',1115)
,('159-189-8204',1115)
,('538-393-5407',1116)
,('657-615-6199',1116)
,('457-565-2744',1116)
,('496-475-6726',1117)
,('806-252-8134',1117)
,('423-951-8364',1118)
,('876-314-3929',1118)
,('949-290-7881',1118)
,('740-414-5314',1119)
,('754-402-8895',1119)
,('523-191-5524',1120)
,('855-485-5896',1120)
,('401-118-7129',1120)
,('414-649-0917',1121)
,('664-512-3733',1121)
,('358-355-8650',1122)
,('394-385-3497',1122)
,('322-938-4043',1122)
,('831-652-7017',1123)
,('615-569-4999',1123)
,('373-647-9170',1124)
,('957-140-1618',1124)
,('197-635-0550',1125)
,('228-875-0309',1125)
,('751-863-5291',1125)
,('312-939-7569',1126)
,('908-200-2349',1126)
,('408-145-8100',1127)
,('963-912-4696',1127)
,('436-325-9268',1128)
,('523-762-6821',1128)
,('742-101-1334',1128)
,('736-994-2662',1129)
,('997-891-7991',1129)
,('487-530-7642',1129)
,('960-520-9700',1130)
,('449-391-6883',1130);

-- ----------------------------
-- Table structure for programs
-- ----------------------------

-- DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs` (
  `prog_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(10),
  `address_elidek` CHAR(20) NOT NULL
);

-- ----------------------------
-- Records of programs
-- ----------------------------

INSERT INTO `programs`(`prog_id`,`name`,`address_elidek`) VALUES
 (2001,'PR1','ADR4')
,(2002,'PR2','ADR3')
,(2003,'PR3','ADR10')
,(2004,'PR4','ADR9')
,(2005,'PR5','ADR10')
,(2006,'PR6','ADR10')
,(2007,'PR7','ADR7')
,(2008,'PR8','ADR9')
,(2009,'PR9','ADR5')
,(2010,'PR10','ADR10')
,(2011,'PR11','ADR3')
,(2012,'PR12','ADR2')
,(2013,'PR13','ADR7')
,(2014,'PR14','ADR5')
,(2015,'PR15','ADR2')
,(2016,'PR16','ADR6')
,(2017,'PR17','ADR6')
,(2018,'PR18','ADR4')
,(2019,'PR19','ADR6')
,(2020,'PR20','ADR10')
,(2021,'PR21','ADR8')
,(2022,'PR22','ADR6')
,(2023,'PR23','ADR8')
,(2024,'PR24','ADR4')
,(2025,'PR25','ADR5')
,(2026,'PR26','ADR10')
,(2027,'PR27','ADR6')
,(2028,'PR28','ADR6')
,(2029,'PR29','ADR7')
,(2030,'PR30','ADR9')
,(2031,'PR31','ADR2')
,(2032,'PR32','ADR6')
,(2033,'PR33','ADR10')
,(2034,'PR34','ADR5')
,(2035,'PR35','ADR3');

-- ----------------------------
-- Table structure for executives
-- ----------------------------

-- DROP TABLE IF EXISTS `executives`;
CREATE TABLE `executives` (
  `exec_id` INT PRIMARY KEY AUTO_INCREMENT,
  `exec_name` VARCHAR(40)
);

-- ----------------------------
-- Records of executives
-- ----------------------------

INSERT INTO `executives`(`exec_id`,`exec_name`) VALUES
 (2201,'Rogers Killshaw')
,(2202,'Gerrie Dudhill')
,(2203,'Loella Dispencer')
,(2204,'Alden Crosham')
,(2205,'Randi Capehorn')
,(2206,'Reagen Kleewein')
,(2207,'Hermann Darrow')
,(2208,'Abner Fay')
,(2209,'Tann Slaght')
,(2210,'Whittaker Betty');

-- ----------------------------
-- Table structure for researchers
-- ----------------------------

-- DROP TABLE IF EXISTS `researchers`;
CREATE TABLE `researchers` (
  `res_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(20),
  `last_name` VARCHAR(20),
  `gender` CHAR(1),
  `birth_date` DATE,
  `org_id` INT NOT NULL,
  `employment_date` DATE,
  FOREIGN KEY (`org_id`) REFERENCES `organisations` (`org_id`) ON DELETE CASCADE/*
  CONSTRAINT valid_birth_date
		CHECK (`birth_date` < CURDATE() AND `birth_date` > DATE_SUB(CURRENT_DATE(), INTERVAL 100 YEAR))*/
);

-- ----------------------------
-- Records of researchers
-- ----------------------------

INSERT INTO `researchers`(`res_id`,`first_name`,`last_name`,`gender`,`birth_date`,`org_id`,`employment_date`) VALUES
 (1001,'Boot','McIlmorie','M','1965-03-18',1101,'2006-06-03')
,(1002,'Carolann','Lindley','F','1966-03-24',1101,'2004-12-08')
,(1003,'Purcell','Boatright','M','1969-04-07',1102,'2005-01-12')
,(1004,'Dinnie','Shillington','F','1977-02-24',1102,'2001-07-06')
,(1005,'Ashely','Holttom','F','1961-03-26',1103,'2002-05-30')
,(1006,'Mose','Priestner','M','1969-10-24',1104,'2007-03-12')
,(1007,'Carlynne','Lesek','F','1976-01-28',1105,'2009-04-28')
,(1008,'Francklin','Hay','M','1972-02-10',1105,'2007-10-26')
,(1009,'Brenda','Filchakov','F','1967-03-07',1105,'2008-02-15')
,(1010,'Raimund','Nevet','M','1970-07-05',1106,'2006-07-02')
,(1011,'Rolph','Andrioletti','M','1977-04-26',1106,'2006-04-18')
,(1012,'Stacy','Woof','M','1979-03-31',1107,'2006-08-31')
,(1013,'Barnett','Goodyer','M','1968-01-15',1107,'2007-10-01')
,(1014,'Cody','Domegan','M','1963-08-23',1107,'2007-08-27')
,(1015,'Sergei','Ritchie','M','1977-08-25',1108,'2001-03-25')
,(1016,'Ebenezer','Tackell','M','1974-01-05',1108,'2001-06-30')
,(1017,'Giavani','Linklater','M','1964-12-02',1109,'2004-04-02')
,(1018,'Oberon','Cawthorne','M','1964-03-03',1109,'2002-09-15')
,(1019,'Pauletta','Daouse','F','1976-09-02',1110,'2004-11-15')
,(1020,'Lauree','Flucker','F','1960-08-06',1110,'2004-09-09')
,(1021,'Alexis','Caunce','F','1974-06-03',1110,'2003-04-20')
,(1022,'Garvey','Cornew','M','1962-08-06',1106,'2001-09-05')
,(1023,'Aldridge','Beaumont','M','1960-06-27',1111,'2002-05-10')
,(1024,'Bentlee','Haldon','M','1976-11-03',1111,'2009-07-03')
,(1025,'Mano','Betancourt','M','1962-10-27',1112,'2004-03-17')
,(1026,'Domingo','Stangoe','M','1976-11-15',1112,'2004-11-26')
,(1027,'Shellie','Heatlie','F','1964-03-16',1112,'2001-09-20')
,(1028,'Ladonna','Tunny','F','1969-10-23',1113,'2010-03-13')
,(1029,'Yul','Helstrom','M','1967-07-25',1113,'2010-01-24')
,(1030,'Emelyne','Ivasechko','F','1966-02-16',1113,'2001-08-24')
,(1031,'Dev','Scamerdine','M','1990-06-22',1114,'2007-05-09')
,(1032,'Robyn','Elbourne','F','1978-02-05',1114,'2003-08-01')
,(1033,'Emmalyn','Pellett','F','1973-06-17',1114,'2000-07-24')
,(1034,'Korry','MacCall','F','1963-12-11',1115,'2004-08-08')
,(1035,'Igor','Bayldon','M','1978-04-19',1115,'2001-10-04')
,(1036,'Nanine','Dulwitch','F','1966-10-18',1115,'2006-05-03')
,(1037,'Kelbee','Ommundsen','M','1979-11-28',1115,'2001-11-29')
,(1038,'Madlen','Ellwell','F','1970-08-19',1115,'2005-12-01')
,(1039,'Nerti','Mithan','F','1973-01-02',1115,'2001-08-25')
,(1040,'Wes','Torresi','M','1990-06-27',1115,'2001-12-15')
,(1041,'Gilburt','Godlee','M','1963-06-14',1108,'2006-02-27')
,(1042,'Ilyse','Hallgate','F','1966-04-23',1115,'2010-01-19')
,(1043,'Renault','Duthy','M','1979-05-12',1115,'2002-08-12')
,(1044,'Emilee','Dodsley','F','1973-06-22',1116,'2006-06-20')
,(1045,'Simmonds','Brimson','M','1972-07-18',1116,'2009-03-02')
,(1046,'Jessee','Gai','M','1971-11-25',1116,'2004-07-16')
,(1047,'Ree','Bryan','F','1975-08-20',1117,'2004-10-26')
,(1048,'Stormi','Fitzsimons','F','1963-02-17',1117,'2005-11-04')
,(1049,'Devon','Rosiello','F','1999-09-03',1118,'2007-02-27')
,(1050,'Ranique','Cattermull','F','1962-07-17',1118,'2003-05-23')
,(1051,'Bobbe','Silverthorne','F','1973-02-05',1119,'2005-08-07')
,(1052,'Reynolds','Laxon','M','1973-07-07',1119,'2010-01-02')
,(1053,'Tilly','Clynter','F','1985-08-14',1119,'2004-02-08')
,(1054,'Jerrylee','Rowter','F','1969-11-27',1101,'2009-05-30')
,(1055,'Benson','Willmont','M','1979-12-19',1101,'2009-05-17')
,(1056,'Ciro','Hurton','M','1966-05-28',1120,'2007-10-21')
,(1057,'Ursuline','Ovitz','F','1979-02-05',1120,'2000-06-21')
,(1058,'Audy','Vargas','F','1970-05-19',1120,'2002-11-01')
,(1059,'Nobe','Wynett','M','1972-09-14',1102,'2004-09-22')
,(1060,'Barri','D''eath','M','1976-02-04',1102,'2002-12-02')
,(1061,'Renate','O''Doogan','F','1967-05-21',1121,'2009-10-13')
,(1062,'Mariejeanne','Gitsa','F','1971-05-14',1121,'2005-08-01')
,(1063,'Marten','Glasard','M','1962-12-29',1121,'2003-08-02')
,(1064,'Shae','Willmetts','M','1961-07-19',1122,'2007-07-03')
,(1065,'Guthrey','Bissatt','M','1968-04-27',1122,'2009-09-03')
,(1066,'Claudia','Cockin','F','1961-12-31',1122,'2007-11-20')
,(1067,'Lenee','Reilly','F','1970-06-22',1123,'2009-10-26')
,(1068,'Clarie','Frogley','F','1973-02-11',1123,'2009-02-07')
,(1069,'Yetta','Coleshill','F','1963-08-19',1123,'2003-01-21')
,(1070,'Jacqui','Boyall','F','1966-09-11',1124,'2004-04-14')
,(1071,'Claire','Creelman','F','1963-01-12',1124,'2002-01-17')
,(1072,'Ogdan','Toffoloni','M','1966-01-26',1125,'2002-05-06')
,(1073,'Nikolos','Fawbert','M','1963-07-06',1125,'2002-02-03')
,(1074,'Katha','Pietruszewicz','F','1974-05-20',1126,'2009-09-01')
,(1075,'Jocelyn','Pardoe','F','1964-12-01',1126,'2008-03-18')
,(1076,'Ema','Tilne','F','1974-09-16',1126,'2005-11-11')
,(1077,'Luce','Lill','M','1970-02-28',1127,'2010-03-21')
,(1078,'Renell','Bricknell','F','1961-07-07',1109,'2006-01-30')
,(1079,'Barnie','Mepsted','M','1972-09-06',1111,'2003-03-14')
,(1080,'Minda','Korejs','F','1979-01-05',1118,'2006-01-10')
,(1081,'Kingsly','Fenich','M','1977-02-02',1128,'2007-11-06')
,(1082,'Estell','Soughton','F','1964-06-12',1128,'2006-01-25')
,(1083,'Briney','Bricklebank','F','1962-12-31',1128,'2008-10-13')
,(1084,'Costa','Laden','M','1976-10-29',1129,'2007-01-14')
,(1085,'Suzie','Surcomb','F','1968-05-07',1129,'2005-07-16')
,(1086,'Guido','Sebrens','M','1970-02-01',1129,'2001-07-24')
,(1087,'Gawain','Pie','M','1974-10-04',1124,'2009-09-08')
,(1088,'Werner','Parry','M','1968-02-08',1130,'2003-12-15')
,(1089,'Ivor','Cawthery','M','1973-09-07',1130,'2005-08-05')
,(1090,'Edgard','Gerritzen','M','1972-10-07',1130,'2008-03-26')
,(1091,'Gray','Levey','M','1960-12-10',1125,'2005-06-27')
,(1092,'Margarethe','Dosdill','F','1970-06-26',1130,'2000-08-10')
,(1093,'Lisetta','Ratter','F','1974-12-02',1130,'2005-02-25')
,(1094,'Cos','Jepp','M','1963-05-10',1130,'2006-08-09')
,(1095,'Carleen','Hadye','F','1977-09-08',1130,'2004-09-14')
,(1096,'Jerome','Heathfield','M','1963-12-12',1130,'2008-02-15')
,(1097,'Keen','Baulch','M','1969-07-23',1130,'2008-11-25')
,(1098,'Dacia','De Ferrari','F','1970-10-08',1130,'2009-08-17')
,(1099,'Linzy','Coppenhall','F','1966-12-15',1130,'2006-10-13')
,(1100,'Pierre','Geldart','M','1971-06-06',1117,'2002-06-15');

-- ----------------------------
-- Table structure for projects
-- ----------------------------

-- DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `proj_id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(40),
  `cost` INT,
  `summary` TEXT,
  `start_date` DATE,
  `finish_date` DATE,
  `evaluator_id` INT,
  `eval_points` INT,
  `eval_creation_date` DATE,
  `exec_id` INT,
  `prog_id` INT,
  `org_id` INT,
  `mgr_id` INT,
  FOREIGN KEY (`evaluator_id`) REFERENCES `researchers`(`res_id`) ON DELETE SET NULL,
  FOREIGN KEY (`exec_id`) REFERENCES `executives`(`exec_id`) ON DELETE SET NULL,
  FOREIGN KEY (`prog_id`) REFERENCES `programs`(`prog_id`) ON DELETE SET NULL,
  FOREIGN KEY (`org_id`) REFERENCES `organisations`(`org_id`) ON DELETE SET NULL,
  FOREIGN KEY (`mgr_id`) REFERENCES `researchers`(`res_id`) ON DELETE SET NULL,
  CONSTRAINT CostMustBeInGivenSpan
		CHECK (`cost` >= 100000 AND `cost` <= 1000000),
  CONSTRAINT StartDateMustBeBeforeFinishDate
		CHECK (`start_date` < `finish_date`),
  CONSTRAINT ProjectMustLastFrom1to4Years
		CHECK (DATEDIFF(`finish_date`, `start_date`) >= 365 AND DATEDIFF(`finish_date`, `start_date`) <= 1464)
);

-- ----------------------------
-- Records of projects
-- ----------------------------

INSERT INTO `projects`(`proj_id`,`title`,`cost`,`summary`,`start_date`,`finish_date`,`evaluator_id`,`eval_points`,`eval_creation_date`,`exec_id`,`prog_id`,`org_id`,`mgr_id`) VALUES
 (1201,'Goscientific',981963,'Nam nec venenatis felis. In posuere volutpat dolor, ut suscipit risus vestibulum non. Maecenas eget semper ante. Curabitur luctus sapien eget lectus iaculis, sit amet imperdiet ligula sollicitudin. Nunc ornare nunc in aliquam aliquet. Morbi eleifend quam non nibh hendrerit finibus. Nam diam odio, convallis suscipit aliquam non, ultricies in dui. Vestibulum gravida molestie ligula at vehicula. Fusce in aliquet diam. Suspendisse potenti. Duis consequat quam massa, nec facilisis ipsum pulvinar sed.','2019-06-20','2022-05-03',1089,81,'2019-05-25',2210,2001,1130,1088)
,(1202,'Roboteable',152620,'Vestibulum iaculis lacus non lacus cursus molestie. Nullam suscipit tempor imperdiet. Nam fermentum porta velit vitae consectetur. Duis eget feugiat elit, id pharetra justo. Ut sit amet consectetur lectus. Nam eleifend interdum accumsan. Nam non auctor leo. Cras et odio eu libero pellentesque bibendum sit amet in magna.','2019-03-06','2021-11-23',1092,90,'2019-02-06',2204,2004,1130,1090)
,(1203,'Enscience',142354,'Sed luctus dolor libero, eu cursus lacus condimentum eget. Fusce consequat nec metus a ullamcorper. Pellentesque venenatis viverra sapien, ac feugiat velit elementum et. Phasellus molestie urna mi, at tristique neque interdum non. Curabitur elementum cursus magna, quis sodales diam condimentum vitae. Mauris id elit augue. Sed arcu justo, commodo eget turpis at, accumsan laoreet purus. Integer volutpat consequat mauris vitae placerat. Praesent vel ex sapien. Pellentesque accumsan, mi in rutrum finibus, ligula lacus interdum enim, ac bibendum mi dui ac nisi. Vivamus ligula mi, dignissim ac tempus vitae, dapibus ornare sapien. Curabitur ornare nibh in lorem porttitor euismod. Cras commodo libero nec suscipit condimentum. Nulla facilisi. Nulla consequat interdum augue. Nam cursus ex lectus, non dapibus turpis ultricies vitae.','2011-03-05','2013-06-22',1082,74,'2011-02-05',2205,2004,1128,1081)
,(1204,'Goresearch',375372,'Donec pellentesque id nunc sodales elementum. Nulla a facilisis massa. Mauris vel lacus sed lacus sollicitudin placerat quis quis neque. Nulla tincidunt dui quis elit viverra, congue consectetur est euismod. Proin eu tempus tellus. Praesent tincidunt mollis luctus. Donec quis interdum dolor.','2019-08-11','2022-09-08',1035,90,'2019-07-11',2202,2005,1115,1034)
,(1205,'Mechanicsician',450738,'Vivamus et vehicula libero, at volutpat erat. Donec laoreet vel elit non ultrices. Curabitur vestibulum posuere venenatis. Quisque et risus ut elit gravida ultricies. Vivamus efficitur a risus eu ultricies. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean sem odio, dictum at feugiat ac, vestibulum ac tortor. Curabitur maximus sodales lacus quis aliquet. Suspendisse aliquam eros dolor, eget sodales elit semper at.','2019-08-21','2021-12-11',1093,81,'2019-07-21',2203,2001,1130,1092)
,(1206,'Labs Dash',843323,'Sed ac pretium enim. Donec in fringilla tellus. Aliquam vel odio nec mauris egestas placerat a id leo. Praesent at nibh nec arcu rhoncus laoreet. Ut ligula mi, porta in pretium quis, iaculis et metus. Suspendisse vitae sem efficitur, ornare lectus vel, sagittis magna. Ut ante odio, malesuada ut ipsum sed, interdum convallis enim. Cras eu velit rhoncus, congue leo nec, cursus enim. Nullam leo mauris, ultrices ac maximus nec, euismod vel libero. Duis faucibus pharetra elit ac facilisis. Nunc in blandit magna, quis ullamcorper lacus. Nullam vel ultrices dui. Phasellus massa nunc, dignissim sit amet volutpat a, tempus id ipsum. Ut scelerisque velit est, ut dignissim sem imperdiet ac. Phasellus tincidunt est mauris, quis ornare magna finibus non.','2019-05-19','2022-10-22',1095,86,'2019-04-19',2207,2002,1130,1094)
,(1207,'Spacefer',821936,'Ut a dignissim dolor. Fusce auctor orci massa, at dignissim ex molestie in. Donec laoreet eget sem at ornare. Fusce rutrum diam sed risus laoreet sodales. Vivamus nec malesuada nisi. Suspendisse mattis urna magna, ac mollis magna finibus eget. Duis risus dui, bibendum accumsan elit ac, euismod aliquam nisl. In pharetra elementum odio sit amet venenatis. Phasellus sem erat, ornare a turpis vitae, imperdiet tempor diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec at sagittis turpis. Nunc ullamcorper mi et velit pulvinar, ut tempus lorem congue. Aenean lobortis urna quis semper tempor. Vivamus egestas efficitur ligula fringilla ornare. Nunc venenatis ultricies lectus id lacinia. Morbi pretium magna id sem vulputate, quis laoreet dolor elementum.','2019-08-04','2022-08-24',1037,65,'2019-07-04',2203,2002,1115,1036)
,(1208,'Artificial Atlas',590111,'Sed ipsum ex, consequat vel nisi et, condimentum finibus risus. Sed vel rhoncus risus. Quisque sed quam et elit egestas mattis nec eget eros. Phasellus eu dictum augue, non porta ex. Etiam vel lacinia felis. Quisque eu justo ac erat porttitor ornare in ut libero. Sed tristique sodales dui at pellentesque. Nulla magna ex, pellentesque tempor lectus quis, auctor mattis dolor.','2019-02-27','2022-07-22',1039,97,'2019-01-27',2205,2003,1115,1038)
,(1209,'Techdot',507587,'Donec mattis consequat laoreet. Donec tincidunt ex quis bibendum posuere. Quisque hendrerit egestas est ac hendrerit. Curabitur sagittis enim orci, eget ultricies elit ornare ac. Morbi congue tristique ligula, in suscipit ante porta lacinia. Nam vitae velit eget elit fringilla posuere id at dolor. Morbi ullamcorper euismod vestibulum. Phasellus pretium arcu et ligula efficitur cursus. Duis sit amet volutpat orci. Etiam venenatis odio libero, ac interdum risus rutrum non. Nam venenatis, sem nec laoreet consequat, odio arcu cursus elit, at mollis tellus dui id lectus. Donec imperdiet porta tortor, sit amet ultrices ex. Mauris metus eros, posuere eu magna non, porttitor egestas ex. Fusce egestas volutpat ipsum sed vehicula. Donec convallis odio viverra purus mollis tempus. Nullam hendrerit velit id nunc viverra facilisis.','2018-05-08','2021-01-06',1042,68,'2018-04-08',2209,2005,1115,1040)
,(1210,'Historical Rise',557972,'Integer in turpis vel urna ullamcorper egestas sit amet a nisl. Proin at dictum dolor, et luctus odio. Duis bibendum massa nec dui dictum volutpat vitae eu nibh. Suspendisse potenti. Suspendisse laoreet ex dui, sed convallis nulla dapibus at. Mauris hendrerit laoreet nibh dictum efficitur. Proin non diam turpis. Cras ligula ligula, sodales eu enim sed, lobortis aliquet purus. Integer bibendum pharetra mauris. Aliquam eu justo a est auctor accumsan vel quis arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec non bibendum lorem. Morbi magna massa, suscipit at auctor a, accumsan a ipsum. Cras varius, ex vitae lobortis accumsan, urna odio laoreet felis, nec vestibulum arcu orci at justo.','2014-07-10','2017-09-22',1002,80,'2014-06-10',2201,2003,1101,1001)
,(1211,'Zen Space',880327,'Nam consectetur purus vel nisl tincidunt, quis aliquet erat iaculis. Etiam posuere elit tortor, sit amet placerat nunc ullamcorper ac. Vestibulum at lobortis felis. Fusce at dictum est. Proin et ultrices ex. Integer maximus nunc et fringilla scelerisque. Nullam vehicula euismod enim quis convallis. Nullam tempus ex et tortor lacinia, in sodales libero egestas. In a dolor eu lorem blandit interdum. Vestibulum non orci dolor. Integer rhoncus hendrerit ligula, non laoreet metus posuere at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elementum eget purus eget dapibus. Duis lorem mi, tincidunt sed venenatis at, lobortis ut nibh.','2012-07-02','2014-09-04',1004,98,'2012-06-02',2210,2005,1102,1003)
,(1212,'Uptech',253864,'Mauris in mattis nisl. Nulla id bibendum orci. Nullam blandit aliquam sollicitudin. Ut diam magna, placerat placerat scelerisque id, semper auctor mi. Curabitur scelerisque, felis vel tempus tempor, augue diam euismod lorem, nec volutpat eros ipsum ut nunc. Maecenas lorem nibh, porttitor sed sagittis ut, ornare et mauris. Sed tincidunt tristique ex, id luctus nibh rutrum at. Sed suscipit purus at lacus fermentum eleifend. Ut luctus velit sed tortor maximus vulputate. Donec quis vulputate tortor. In lacinia risus ut lorem mattis faucibus. Donec fermentum tortor posuere odio auctor, at semper sem tincidunt. Sed semper vehicula diam et sagittis. Praesent nisi nibh, accumsan in nisl et, scelerisque sollicitudin urna. Nulla mollis magna at varius accumsan. Integer posuere consequat convallis.','2019-05-27','2022-05-04',1097,58,'2019-04-27',2204,2004,1130,1096)
,(1213,'Biosciencefed',435424,'Maecenas molestie massa ut nunc finibus, id auctor metus lobortis. Nulla a sapien metus. Maecenas tincidunt lectus a turpis blandit convallis. Ut non lobortis nisl, vel bibendum ante. Mauris urna erat, scelerisque sit amet efficitur in, tincidunt quis enim. In vitae ligula nec neque faucibus rhoncus id a neque. Nulla eleifend commodo nibh, sed pulvinar ipsum mollis nec. Fusce pellentesque facilisis justo, in euismod ex blandit non. Nam lorem nulla, posuere ac euismod sit amet, porta in velit. Phasellus quis est eu quam placerat bibendum et vitae lorem. Praesent mollis fringilla magna, sit amet dapibus lacus sagittis cursus. Vivamus venenatis arcu eget ante pulvinar posuere. Integer vitae ligula ut purus pulvinar sodales in sit amet enim. Aenean leo tortor, egestas id velit eu, tempor interdum libero. Mauris ultricies ultricies sem, id aliquet velit porta ac. Fusce id fringilla ante, non tincidunt ipsum.','2014-05-19','2017-10-22',1045,60,'2014-04-19',2208,2003,1116,1044)
,(1214,'Hyper Metrics',212189,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus lacus ipsum, vehicula et ipsum eget, condimentum placerat nibh. Aliquam tempus dui eget arcu dignissim tempor. Aliquam sed interdum sem. Nulla rhoncus lectus nec magna interdum posuere. Sed ac commodo dui. Donec neque ligula, rutrum sit amet maximus vitae, accumsan in magna. Duis porta consequat enim, quis auctor massa. Mauris vitae erat metus. Nullam ultrices id libero at interdum. Fusce dignissim ante tortor. Proin scelerisque convallis risus in congue. Nullam lacinia gravida leo cursus sollicitudin. Nulla facilisi. Curabitur eu metus at metus tempor congue quis sit amet urna. Nullam non euismod arcu, vel molestie felis.','2018-07-05','2021-09-22',1050,50,'2018-06-05',2208,2001,1118,1049)
,(1215,'Sync Focus',531582,'Maecenas ultricies volutpat molestie. Suspendisse potenti. Nulla facilisi. Curabitur ac enim ut elit tempor pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae consequat lorem, at tincidunt urna. Aliquam viverra neque vel ante tempor blandit. Nullam id finibus velit. Fusce eu cursus erat. Etiam feugiat gravida ultricies. Nullam sed iaculis felis. Nullam dignissim aliquet ex, ut eleifend mi mollis a.','2015-11-14','2017-08-12',1026,60,'2015-10-14',2209,2004,1112,1025)
,(1216,'Mechanics Saga',635157,'Duis sagittis in odio eu commodo. Fusce a nisi auctor, euismod elit id, tincidunt dolor. Nam id blandit leo, non interdum ipsum. Phasellus neque mauris, mattis sed neque sit amet, pulvinar blandit felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales elit pulvinar enim tincidunt feugiat. Sed non mi id ipsum accumsan faucibus. Pellentesque dignissim imperdiet est, tristique pulvinar dolor faucibus sit amet. Maecenas dapibus, est vitae venenatis ultrices, ipsum nisi bibendum lacus, quis tempus augue dui quis nunc. Donec volutpat libero sed magna pharetra feugiat. Sed suscipit volutpat congue. In non maximus elit, ac euismod diam. In ultricies id leo finibus tincidunt. Praesent accumsan, nibh nec vestibulum accumsan, nibh libero dignissim risus, eget semper elit orci vitae eros.','2015-05-30','2018-10-22',1032,72,'2015-04-30',2207,2005,1114,1031)
,(1217,'Eneconomy',520063,'Suspendisse cursus sapien eget lacus laoreet, posuere faucibus turpis facilisis. Suspendisse potenti. Cras posuere massa vel sapien hendrerit fringilla. Curabitur mollis nec nunc vitae euismod. In eu consequat dolor. Curabitur dignissim, mi at maximus porta, metus magna egestas urna, eget placerat nisl eros quis velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;','2020-12-25','2022-07-22',1020,100,'2020-11-25',2205,2004,1110,1019)
,(1218,'Robotfer',246290,'Proin eget magna et libero consequat tempor. Suspendisse malesuada sapien sit amet elementum posuere. Nullam consectetur orci tempor auctor rhoncus. Quisque quis ultricies dolor, at fringilla elit. Quisque non leo luctus elit aliquam vulputate nec ac nunc. Nulla facilisi. Donec mauris elit, vestibulum ac varius nec, ultrices vel mauris. In sodales laoreet justo, et dignissim urna condimentum eu. Donec commodo vulputate lacinia. Fusce maximus nibh et velit semper maximus. Proin vulputate massa eu nunc bibendum auctor. Maecenas rutrum id velit sed pretium. Mauris pellentesque ex augue, ultricies iaculis lorem accumsan id. Pellentesque malesuada, dui ut tempus mollis, nibh augue fermentum justo, ut ornare mi neque ultricies nisi. In hac habitasse platea dictumst.','2016-04-29','2019-08-03',1075,67,'2016-03-29',2206,2004,1126,1074)
,(1219,'Historical Click',556982,'Maecenas aliquet turpis ut odio porttitor gravida. Nam felis lacus, ultricies quis suscipit vel, iaculis vitae urna. Pellentesque felis felis, consequat eget tortor vel, iaculis rutrum diam. Fusce porttitor quam non sagittis semper. Nunc mattis finibus est. Nam mauris tellus, egestas sit amet laoreet sit amet, varius ac arcu. Nullam condimentum sapien metus.','2020-10-31','2022-09-22',1082,77,'2020-09-30',2205,2003,1128,1083)
,(1220,'Metricsify',604967,'Mauris a nulla vitae ligula gravida varius. Nulla congue luctus justo, vestibulum laoreet libero accumsan non. Fusce a leo massa. Morbi ullamcorper feugiat metus, at pretium metus convallis at. Cras odio turpis, ultricies eu erat a, bibendum sagittis leo. Donec sed hendrerit magna. Sed et eleifend ipsum, et pharetra urna. Nulla malesuada, quam non vehicula congue, diam sem pulvinar quam, ac tempor erat augue nec libero. In non tempor ante. Nunc venenatis tristique augue non congue. Donec egestas velit eget tincidunt tincidunt.','2020-11-01','2022-06-26',1099,87,'2020-10-01',2208,2001,1130,1098)
,(1221,'Timeried',950446,'Aenean eu lacus finibus, tristique libero sed, efficitur enim. Vestibulum pulvinar tempor sodales. Ut gravida enim elit, nec commodo neque consequat quis. Ut vehicula eget urna ac suscipit. Fusce rhoncus lobortis nulla, congue lacinia purus aliquet non. Etiam vitae dui finibus, lobortis magna nec, sagittis purus. Ut eleifend lorem efficitur fringilla interdum. Donec interdum arcu id laoreet imperdiet. Vivamus efficitur sed mauris non varius. Duis sed consectetur risus. Fusce molestie, odio fringilla tempor sodales, tortor urna malesuada tellus, at luctus velit ante vel felis. Vestibulum a scelerisque lorem. Praesent lorem leo, condimentum a viverra ac, efficitur ut risus. Donec ac euismod arcu.','2020-05-16','2022-10-22',1069,78,'2020-04-16',2206,2002,1123,1068)
,(1222,'Ecology Sync',161220,'Etiam odio dolor, aliquet vitae lectus sit amet, pharetra fringilla mauris. Phasellus sit amet luctus sapien. Nunc tellus sem, vestibulum ac est eget, vestibulum condimentum nisi. Proin vel ex ac ipsum ultricies malesuada. Cras justo lacus, ornare et dolor et, accumsan feugiat arcu. Donec dictum vehicula accumsan. Aliquam eu tincidunt nisi. Cras efficitur lacus nec lectus interdum, posuere pharetra ipsum vulputate. Pellentesque leo est, tempus non sagittis ac, iaculis non turpis. Nulla mi risus, malesuada congue metus at, rutrum iaculis ligula.','2019-05-18','2021-10-20',1043,94,'2019-04-18',2208,2005,1115,1042)
,(1223,'Future Plus',154965,'Aenean rutrum a risus rhoncus pretium. Fusce pretium massa ligula, sit amet faucibus nibh vehicula a. Maecenas a lorem hendrerit, sodales libero eu, fermentum ante. Nam dictum eleifend dictum. Vestibulum in tincidunt ante, sit amet posuere nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dictum arcu in dignissim iaculis. Phasellus dictum justo in tortor posuere, in eleifend quam aliquam.','2015-03-21','2018-06-22',1018,70,'2015-02-21',2203,2001,1109,1017)
,(1224,'Health Connection',133308,'Nunc quis urna sed metus pulvinar blandit. Maecenas rutrum massa nisl, at mattis ante sodales nec. Morbi ex est, ultricies at dolor in, iaculis pulvinar tellus. Vivamus porta massa ut felis euismod tincidunt. Fusce non nibh quis ipsum lobortis fringilla. Integer dictum sed augue non pretium. Sed tincidunt, enim a scelerisque laoreet, lectus risus suscipit libero, sit amet pellentesque eros nulla in est. Maecenas sit amet sem nec neque sodales blandit vitae porttitor nunc. In ultricies tempus porttitor. Maecenas vitae orci ut purus bibendum fringilla. Donec nec ligula vitae diam ornare consequat nec vitae magna. Phasellus dignissim lobortis justo, non congue elit tempor posuere. Cras aliquam porttitor nisl. Nunc cursus scelerisque convallis. Quisque non rhoncus purus. Sed consequat, sapien non laoreet semper, sapien quam eleifend quam, sit amet suscipit augue erat sed eros.','2014-04-02','2017-09-05',1085,74,'2014-03-02',2205,2005,1129,1084)
,(1225,'Healthens',519554,'Maecenas posuere, nunc non vestibulum cursus, lectus sem euismod metus, quis bibendum nisl dui id nulla. Ut ut magna laoreet, suscipit orci hendrerit, fringilla eros. Mauris a euismod nisl, quis rhoncus nisi. Aenean non ipsum sit amet dui vehicula molestie. Etiam eget pharetra mi, nec facilisis ante. Praesent pretium sed felis at maximus. Nulla convallis ultrices lacus nec mattis. Sed condimentum aliquam augue vitae blandit.','2019-03-07','2022-07-02',1034,66,'2019-02-07',2201,2005,1115,1035)
,(1226,'Biotech Snap',986249,'In ut tortor vehicula, suscipit diam in, interdum nulla. Vivamus lacinia dui vitae gravida commodo. Mauris commodo id magna sed tristique. Cras vitae elit elit. Morbi id ullamcorper purus, non rhoncus massa. Donec vehicula facilisis lorem, eu suscipit turpis maximus non. Ut molestie leo non aliquam imperdiet.','2010-10-12','2012-12-22',1049,94,'2010-09-12',2202,2003,1118,1050)
,(1227,'Progress Snap',285824,'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce sollicitudin nibh et eleifend condimentum. Vestibulum quis blandit odio. Vestibulum tincidunt, sapien id fermentum ornare, purus quam euismod magna, non porta mi nibh sit amet libero. Ut scelerisque tempus est eu porta. Vivamus fermentum fringilla accumsan. Vestibulum a mollis est.','2018-10-06','2021-09-22',1008,91,'2018-09-06',2201,2004,1105,1007)
,(1228,'Future Boost',893631,'Mauris in mi vehicula, mollis lacus id, placerat metus. Aenean malesuada bibendum metus a cursus. Curabitur consequat nec nisl eget tincidunt. Duis nec urna ac justo tincidunt feugiat mattis sed sem. Nunc ut nisl a sapien egestas cursus. Quisque tellus erat, dignissim hendrerit pellentesque ac, aliquet in tortor. Donec ut mattis turpis, non convallis justo.','2017-03-24','2020-02-21',1062,72,'2017-02-24',2206,2002,1121,1061)
,(1229,'Enpro',110531,'Quisque non facilisis dui. Morbi iaculis dictum tortor eget dignissim. Aliquam enim lectus, mollis id egestas sit amet, scelerisque nec ipsum. Maecenas sodales eros lorem, nec tempor nisl dapibus eget. Praesent commodo ex turpis, sit amet auctor eros commodo id. Etiam aliquet metus quis consequat aliquam. Nam ornare velit sed leo luctus sodales. Integer ornare, diam at sodales sagittis, sapien tortor blandit nulla, sed cursus dolor felis non felis. Duis faucibus, justo vitae congue finibus, tellus libero molestie neque, a facilisis lorem risus vel mauris. Aenean mi sapien, porttitor in sapien ac, semper molestie risus.','2016-04-21','2019-05-19',1083,59,'2016-03-21',2204,2003,1128,1082)
,(1230,'Hyper Future',919820,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam hendrerit aliquet sapien, ut consequat odio. Pellentesque non ullamcorper neque, ut porttitor quam. Nullam efficitur arcu vel tortor aliquam, nec faucibus enim imperdiet. Proin commodo quis tellus non sagittis. Curabitur at eleifend ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur quis felis auctor justo mollis placerat. Nunc massa nisi, euismod sed pellentesque at, tincidunt eu quam. Mauris maximus laoreet justo, at mollis quam semper id. Donec mattis augue tortor, posuere mattis enim feugiat sed. Cras a ex odio.','2016-03-11','2019-09-06',1011,93,'2016-02-11',2209,2004,1106,1010)
,(1231,'Space Scout',932199,'Aenean eu metus et diam faucibus rhoncus. Vivamus ac dolor nec diam luctus porta eget ut urna. Morbi quis nunc vulputate, pharetra est at, bibendum lorem. Proin purus nisi, placerat cursus mollis at, scelerisque et libero. Quisque egestas pulvinar risus non blandit. Nullam at tortor accumsan, pellentesque tortor ut, euismod lectus. Praesent luctus sem eget est pellentesque, nec sodales arcu elementum. In pharetra in est quis consequat. Aenean aliquet ornare nisi dictum bibendum. Pellentesque pellentesque lorem quis augue convallis, vel cursus lectus dictum. Pellentesque sit amet magna et felis interdum tincidunt in in sem. Nullam molestie, dui eget consequat mattis, lorem justo suscipit justo, id faucibus nunc nunc dapibus neque. Aenean mattis cursus aliquam.','2019-05-16','2022-02-22',1013,89,'2019-04-16',2210,2001,1107,1012)
,(1232,'Ecology Vibe',295492,'Duis consequat facilisis turpis sit amet dictum. Morbi in tristique diam, vel tincidunt nibh. Pellentesque eget tincidunt magna. Etiam tellus magna, tristique ut eleifend fermentum, ultricies ut arcu. Aliquam non leo pulvinar, vulputate ante vitae, laoreet justo. Maecenas eget lorem sed nulla mattis imperdiet at ac neque. Cras quis augue sem. Aenean volutpat sem a eros porta suscipit. Praesent sit amet enim hendrerit, lobortis erat a, vulputate nibh. Praesent imperdiet nulla eu lacus consequat ultrices. Etiam at neque ac risus consectetur scelerisque. Pellentesque dignissim porta dictum.','2017-08-13','2020-07-10',1049,97,'2017-07-13',2207,2002,1118,1050)
,(1233,'Med Kit',398172,'Fusce pretium lorem dolor, vitae mollis eros pulvinar a. Etiam pharetra mauris nec dui fermentum, venenatis convallis turpis egestas. Praesent imperdiet sit amet magna ac molestie. Mauris interdum ut justo et scelerisque. Fusce porta, leo sit amet accumsan sodales, metus erat egestas neque, et molestie nulla ligula sed augue. Sed laoreet in lorem non commodo. Suspendisse vitae hendrerit mauris. Maecenas augue eros, volutpat consectetur ornare ut, euismod in arcu. Nam efficitur nisi eros, in ullamcorper dui pretium ac. Quisque suscipit posuere tincidunt. Cras eget turpis nunc. Aliquam vestibulum auctor lacus, a suscipit risus aliquet iaculis. Nam quis lectus ullamcorper, auctor mi vitae, vulputate felis.','2019-07-15','2021-06-10',1099,100,'2019-06-15',2205,2003,1130,1098)
,(1234,'Chip Drop',883245,'Vivamus molestie sem augue, in consequat ante cursus sit amet. Phasellus non metus at ex mattis porta pharetra a arcu. Phasellus iaculis posuere lacus, in pharetra nunc suscipit nec. Nulla commodo lobortis gravida. Mauris bibendum ipsum nec lacinia porttitor. Aenean faucibus iaculis dui at dictum. Integer a mi massa.','2019-10-04','2021-02-28',1045,53,'2019-09-04',2205,2003,1116,1046)
,(1235,'Electrons Ship',302828,'Nam enim tortor, feugiat euismod tincidunt venenatis, sodales id sapien. Proin at pretium augue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam ornare ligula non arcu elementum fringilla. Nullam tincidunt dolor eget erat fermentum mattis. Nulla facilisi. Nam viverra tellus a fermentum ullamcorper. Donec volutpat diam sed metus finibus aliquam. In id pharetra magna, in posuere diam. Vestibulum condimentum tortor nec lacus venenatis vestibulum. Ut cursus euismod ipsum a fringilla. Donec eros metus, dignissim vitae egestas sed, tincidunt a dui.','2017-05-24','2020-01-09',1069,61,'2017-04-24',2202,2003,1123,1068)
,(1236,'Hacking Crew',938866,'Nullam vel nisi ex. Etiam nec fringilla tortor, sit amet volutpat felis. Sed ut sapien felis. Ut mollis sem justo, id consequat odio tristique et. Fusce sit amet risus eget justo gravida scelerisque. Nulla faucibus dictum elementum. Nunc interdum ante at convallis finibus. Maecenas sodales ac leo vel tincidunt. Suspendisse enim nisi, scelerisque sit amet nibh id, consequat rhoncus quam. Integer ac fermentum velit. Proin interdum magna vel efficitur semper. Nunc tempus nibh sit amet lorem tempor, nec faucibus leo tempus. Vivamus lobortis tortor a urna hendrerit, ac ultricies libero fringilla. Nam vitae ligula quis risus eleifend ullamcorper. Vivamus vitae libero sit amet felis elementum tincidunt sit amet id eros. Integer mi lectus, feugiat ac diam vitae, venenatis faucibus tellus.','2018-06-26','2020-09-01',1071,55,'2018-05-26',2207,2005,1124,1070)
,(1237,'Digitalus',292470,'Proin iaculis, odio in ultrices aliquet, mi erat volutpat nulla, at semper lectus velit ac magna. Integer mauris nisl, scelerisque eu vulputate sit amet, condimentum condimentum quam. Ut fermentum odio euismod viverra luctus. Proin nec condimentum ligula, eu consectetur nisi. In tellus tortor, molestie at vehicula vel, sodales in mauris. Nulla tempor id urna vel pretium. Curabitur quis rhoncus metus. Donec venenatis augue vel metus euismod, ac ornare arcu fermentum. In hac habitasse platea dictumst. Praesent feugiat tortor magna, sit amet placerat enim hendrerit ac. Aliquam dapibus eu arcu ut lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.','2019-03-16','2022-08-22',1052,61,'2019-02-16',2201,2001,1119,1051)
,(1238,'Artificy',761668,'Nam sem purus, varius et maximus sit amet, ultricies a enim. In malesuada enim ultricies elit malesuada aliquam. Integer accumsan finibus tellus a feugiat. Curabitur in faucibus leo, a tempus mauris. Nulla eu sapien vehicula, pulvinar sapien in, euismod ligula. Suspendisse tempus nulla nulla, ut imperdiet ipsum volutpat a. Morbi sed egestas magna, at dapibus nisl. Sed nibh felis, lacinia a dui at, suscipit auctor nisl.','2019-05-26','2022-07-22',1062,59,'2019-04-26',2207,2003,1121,1063)
,(1239,'Meta Tech',709324,'Sed convallis turpis eget accumsan venenatis. Praesent bibendum ultricies purus eget tristique. Donec dignissim nulla sit amet dolor dictum, eu eleifend leo tincidunt. Nam orci felis, tincidunt ac libero sed, rhoncus pulvinar lacus. Praesent venenatis magna eget nunc gravida facilisis. Sed luctus fringilla consectetur. Aenean blandit feugiat posuere. Curabitur libero massa, pellentesque ut porttitor at, faucibus non erat. Sed dignissim feugiat ligula ac iaculis. Nulla fringilla euismod enim, faucibus consequat est.','2019-12-31','2022-08-22',1070,100,'2018-11-30',2208,2005,1124,1071)
,(1240,'Biotech Space',432827,'Vestibulum eu condimentum est. Sed bibendum euismod dui. Nunc accumsan pellentesque metus et euismod. Aliquam a arcu at diam consequat tempor vehicula scelerisque eros. Praesent enim nulla, finibus in leo et, malesuada mollis metus. Aenean molestie, tortor vitae pretium feugiat, nisi urna interdum metus, vel semper magna sapien a lectus. Quisque vel nisl id eros mattis semper. Proin placerat nunc diam, nec fringilla nulla bibendum quis. Duis placerat rhoncus quam. Nulla ac hendrerit ligula. Proin suscipit a tortor vitae bibendum. Nunc purus nisl, accumsan sed libero sit amet, laoreet vehicula felis. Aliquam a lacus quam. Curabitur tincidunt tellus ex, ut molestie velit porta et.','2018-08-18','2021-07-29',1009,62,'2018-07-18',2207,2004,1105,1008)
,(1241,'Future Shack',284869,'Cras sagittis et dui quis vehicula. Phasellus dignissim ligula sed est porta, in sollicitudin erat dictum. Maecenas mattis, quam at lacinia aliquet, risus elit tempor diam, ac pretium mi ipsum eget enim. Curabitur at nisi odio. Etiam vehicula, erat in fringilla gravida, libero tellus facilisis urna, in molestie libero erat non libero. Mauris et pharetra sapien, et euismod erat. Donec enim libero, varius eget facilisis sed, sagittis quis nisl. Mauris sit amet molestie nibh. Morbi bibendum pharetra urna vel semper. Nam lobortis maximus nunc eu molestie. Nunc ultricies quis ante in mattis. Praesent a tristique lectus, eget pharetra tellus. Nunc vitae enim in tellus gravida faucibus. Curabitur sagittis tristique enim fringilla ultrices. Mauris bibendum sit amet nisl quis rutrum.','2018-07-21','2021-12-27',1017,77,'2018-06-21',2210,2001,1109,1018)
,(1242,'Ecologiness',598590,'Nulla laoreet lectus velit, molestie rhoncus nunc mattis at. Fusce sit amet est at lectus interdum aliquam ac tincidunt metus. Quisque lacus mauris, pellentesque id ante ut, luctus convallis velit. Etiam sem ligula, faucibus nec efficitur eleifend, lobortis non leo. Maecenas lobortis tristique nibh, eget auctor sapien egestas nec. Sed sed interdum ex. Sed sit amet mauris mauris. Suspendisse fermentum eleifend gravida. Cras aliquam pretium ornare. Nullam feugiat tellus bibendum, egestas dolor sit amet, aliquet sem. Donec purus sem, pharetra et neque eu, euismod rutrum velit.','2017-11-10','2020-03-17',1048,93,'2017-10-10',2206,2003,1117,1047)
,(1243,'Intelligence Most',983104,'Suspendisse suscipit placerat viverra. Curabitur non ipsum quis justo hendrerit malesuada. Donec at odio dapibus tellus consectetur ullamcorper. Donec maximus vel metus vitae faucibus. Nam sed metus bibendum, fermentum ipsum eu, interdum ex. Duis varius mi est, tristique cursus leo pellentesque ac. Nullam elementum lacus enim, ut tempor velit interdum sed. Donec vel cursus diam.','2018-03-28','2021-07-12',1029,69,'2018-02-28',2207,2003,1113,1028)
,(1244,'Start Engineer',195347,'Duis eget turpis est. Mauris sodales porta magna, non iaculis tortor finibus ut. Ut vehicula dictum finibus. Curabitur urna orci, pretium ac rutrum in, sodales a nunc. Maecenas non neque turpis. Proin dictum metus sit amet libero luctus, vel scelerisque mi facilisis. Fusce eu semper enim, vel sodales eros. Nam egestas magna at nunc venenatis sodales. In hac habitasse platea dictumst. Nam at mi eget nunc sodales aliquam eget eu ante. Cras id ipsum dictum, placerat felis eget, egestas arcu. Suspendisse mattis, felis non sodales ullamcorper, nunc libero tristique enim, ut egestas velit est ut massa.','2019-01-08','2021-10-21',1096,99,'2015-12-08',2206,2001,1130,1095)
,(1245,'The Go Project',699393,'Maecenas id arcu vitae velit posuere vehicula. Maecenas iaculis lorem nibh, vitae tempus augue tristique vitae. Suspendisse et ullamcorper neque. Integer erat metus, porttitor sed laoreet nec, laoreet non diam. Nullam eu finibus elit, vel mollis ligula. Vivamus id dui non ligula porta vestibulum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin velit mauris, dictum vel enim eget, interdum porttitor velit. In molestie massa non tellus sollicitudin pharetra. Sed blandit est vel neque pellentesque mattis. Sed fringilla cursus risus in ultricies. Proin feugiat nibh urna, nec sagittis ex egestas ut.','2019-01-12','2021-01-15',1037,83,'2018-12-12',2203,2003,1115,1038)
,(1246,'Telecomly',447549,'Ut et nunc lobortis, lobortis nunc eu, auctor nunc. Sed vitae leo malesuada, congue mi id, condimentum erat. Etiam eget consectetur sem. Ut pharetra sapien sed feugiat vestibulum. Maecenas quis scelerisque est. Vivamus mattis, neque at euismod lacinia, nisi ante tempus nisi, at volutpat nisl purus quis lacus. Aliquam ac nunc ut mi feugiat elementum. Morbi velit metus, efficitur quis magna et, tempus tincidunt dui. Nam ut ex in dui semper sodales. Suspendisse elementum lectus et lectus vehicula, quis interdum tellus tincidunt. In consectetur aliquam tempus. Donec quis odio enim. Aliquam ac aliquam dolor.','2019-08-21','2022-06-22',1073,79,'2019-07-21',2204,2002,1125,1072)
,(1247,'Gotech',238631,'Aliquam rhoncus sit amet arcu eget consectetur. In vitae ante quis sem mattis fringilla. Sed cursus cursus est nec sagittis. Suspendisse potenti. Donec at mi arcu. Aliquam dignissim a ex eu cursus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras malesuada, tortor ut sollicitudin dignissim, velit libero luctus ipsum, id tincidunt purus mauris quis tellus. Aliquam molestie augue eu turpis aliquam, in porttitor diam finibus. Sed pulvinar urna enim, id ultrices ante vestibulum vitae. Aliquam nec tempor nunc. Donec feugiat bibendum leo nec tristique. Nullam in neque purus.','2018-10-17','2021-08-06',1042,63,'2018-09-17',2201,2001,1115,1043)
,(1248,'Progressism',496080,'Nam finibus commodo risus eu semper. Duis ornare libero vel aliquet tempus. Praesent dictum elit ac arcu condimentum, eget mattis turpis sagittis. Curabitur interdum justo orci, in ullamcorper nibh dignissim a. Nam consectetur magna at orci bibendum volutpat. Nam lacinia ultricies turpis sit amet tempor. Praesent sodales, erat quis vehicula tincidunt, diam enim pretium turpis, placerat rhoncus mi nunc sit amet augue. Vestibulum feugiat orci felis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum cursus faucibus lacus, sit amet dignissim felis tincidunt et. Vivamus hendrerit fringilla leo, nec laoreet risus condimentum sed. Nullam pretium malesuada ante. Pellentesque est nibh, molestie et ante in, iaculis imperdiet sapien. In rhoncus scelerisque eleifend. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.','2019-04-20','2021-07-06',1039,100,'2019-03-20',2210,2003,1115,1040)
,(1249,'Artificial Dash',734625,'Maecenas a facilisis risus. Pellentesque dapibus mauris sed massa vestibulum hendrerit. Nam at lorem lacus. Etiam eu nunc mattis, dictum arcu et, congue sapien. Morbi facilisis, metus ut aliquam lacinia, felis est ultricies nunc, non scelerisque sem lacus vitae augue. Aenean eget diam vel magna aliquam iaculis nec eget arcu. Duis dignissim, eros ac facilisis elementum, quam lectus ullamcorper metus, vitae cursus sapien elit suscipit nulla. Cras suscipit purus vitae egestas accumsan. Cras ultrices enim pharetra odio dignissim laoreet. Cras pellentesque, quam vel dignissim ultrices, turpis elit aliquet leo, ut dignissim augue purus vel mauris. Donec aliquet tempus sapien ut tempor. Integer a ultricies elit, ac lobortis diam. Vestibulum eu felis dolor. Aenean sapien mauris, cursus eget volutpat quis, maximus in erat. Mauris luctus sapien nec volutpat imperdiet.','2019-04-07','2022-06-22',1093,89,'2019-03-07',2210,2001,1130,1094)
,(1250,'Biotechist',340069,'Nullam et consequat orci, vitae commodo lorem. Nunc elementum euismod orci non pellentesque. Fusce posuere arcu sed aliquam placerat. Vivamus velit dui, fermentum quis suscipit vel, laoreet id erat. Aenean semper ornare dignissim. Sed massa elit, aliquet et dui eu, congue iaculis mauris. Etiam malesuada metus et nisl venenatis efficitur. Nulla sed dapibus risus. Donec mattis viverra hendrerit. Quisque cursus, sem vestibulum faucibus sollicitudin, est tellus efficitur lacus, non sagittis urna eros id libero. Etiam semper, magna lobortis rutrum mattis, quam libero scelerisque lectus, in vehicula elit nunc ut ligula. Praesent sit amet ornare nibh, ac congue neque. Sed ut tincidunt urna.','2020-05-21','2022-10-25',1047,98,'2020-04-21',2208,2005,1117,1048)
,(1251,'Mathematico',146133,'Donec sed nunc vitae nisi posuere lobortis. Duis tristique finibus erat, sed bibendum mauris ultrices at. Donec ac risus venenatis, pulvinar mi vel, vulputate nibh. Suspendisse sem velit, cursus nec magna scelerisque, tempor ornare lacus. Nam posuere, ante vel molestie aliquam, mauris diam auctor nisi, eget volutpat risus dui tempor lacus. Suspendisse imperdiet sed metus sit amet mollis. Cras justo mi, interdum quis quam sit amet, consequat tempor sem. Phasellus in fringilla nibh.','2010-11-25','2013-12-14',1016,96,'2010-10-25',2207,2004,1108,1015)
,(1252,'Geogeo Pro',792754,'Morbi rhoncus a enim eu mollis. Donec sit amet ante ex. Nulla volutpat, urna vitae semper rhoncus, neque sapien facilisis nisi, et rhoncus eros felis nec enim. Nam tortor ex, sagittis quis sodales malesuada, rutrum quis dui. Pellentesque fringilla ex sit amet lacus tristique ullamcorper. Vestibulum feugiat lectus sollicitudin porta scelerisque. Sed gravida purus at pharetra lobortis. Praesent orci neque, porttitor in nulla at, accumsan dignissim ante. Proin pulvinar neque non enim tempus pharetra. Aenean purus velit, laoreet non justo vitae, rhoncus hendrerit urna. Morbi suscipit porta orci. Pellentesque accumsan tempor lorem.','2019-10-30','2022-10-22',1065,79,'2019-09-30',2209,2002,1122,1064)
,(1253,'Satellite Prima',323675,'Maecenas egestas lectus quis erat pharetra iaculis. Phasellus libero felis, convallis dapibus leo et, ullamcorper pretium magna. Proin nisl dui, facilisis id posuere id, mollis a eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce suscipit et justo a sagittis. Curabitur molestie odio eget libero fermentum, vel commodo arcu auctor. Vivamus facilisis sem at diam euismod, nec interdum massa volutpat. Curabitur sit amet pulvinar nisi, ac venenatis sapien.','2012-04-27','2015-01-12',1057,79,'2012-03-27',2210,2002,1120,1056)
,(1254,'Engine On',198205,'Vestibulum vestibulum sapien eu massa accumsan, eget tincidunt est mollis. Phasellus varius dolor ut aliquam scelerisque. Fusce ut faucibus tellus. Curabitur a sem dictum, imperdiet elit nec, dignissim metus. Cras leo mi, faucibus nec ipsum suscipit, tempor consequat odio. Sed hendrerit vulputate diam, eu cursus libero dictum faucibus. Aliquam dignissim nisl id augue gravida faucibus.','2019-11-17','2022-07-22',1090,100,'2019-10-17',2206,2003,1130,1089)
,(1255,'AR future',501558,'Duis elit purus, suscipit id commodo in, imperdiet quis enim. Pellentesque vel erat lacus. Nam et ligula at mi fermentum placerat. Nulla sed ante metus. Sed laoreet neque sed felis molestie, non luctus arcu mattis. Nullam malesuada eleifend justo. Sed arcu nisl, venenatis quis efficitur in, feugiat eu dolor. Mauris auctor orci ac nisl ultricies eleifend at in nunc. Curabitur vitae lacinia nunc, ac porta erat. Aenean placerat sem sit amet odio imperdiet viverra. Ut porta quis ligula eget dignissim. Nulla eu elit at felis maximus rutrum vitae sit amet lectus. Aenean consectetur quam nec gravida fringilla. Proin vitae tincidunt nisi, et hendrerit leo.','2019-08-09','2022-06-11',1088,83,'2019-07-09',2202,2004,1130,1089)
,(1256,'Code Plus',995982,'Nam viverra vestibulum libero, sit amet eleifend risus accumsan a. Suspendisse est quam, accumsan a lectus id, pharetra pellentesque sem. Fusce porttitor hendrerit pellentesque. Donec sit amet enim sed ante varius fermentum. Donec pellentesque nisl quis eros condimentum, a aliquet dui commodo. Nam blandit ut quam in lobortis. Nulla eget eros risus. Vivamus laoreet leo ac sapien interdum maximus. Maecenas ultricies ligula vitae feugiat sodales.','2018-02-07','2021-02-04',1018,76,'2018-01-07',2201,2001,1109,1017)
,(1257,'Quantum Plus',434434,'Cras nisl diam, luctus id erat dignissim, tristique lacinia sapien. In hac habitasse platea dictumst. Nulla convallis maximus neque, at dapibus nunc venenatis eu. Mauris viverra posuere posuere. Nunc euismod blandit sapien, quis sagittis orci laoreet at. Donec ac dolor et orci eleifend luctus. Morbi nec pulvinar arcu. Sed rhoncus id magna eget pretium. In ut aliquam enim, eu consequat turpis. Nam et imperdiet augue. In turpis neque, hendrerit ac nisi eu, dapibus suscipit mauris. Cras vitae faucibus eros, ac malesuada orci. Mauris nec lacinia nisi, sit amet eleifend nunc.','2019-10-27','2022-06-23',1032,76,'2019-09-27',2207,2004,1114,1033)
,(1258,'Statistics Up',710971,'Donec urna diam, rutrum eu facilisis a, laoreet sodales est. Praesent semper, nibh quis tempus bibendum, tellus mi porta tellus, nec feugiat arcu sapien vitae tortor. Suspendisse non mauris a magna tristique feugiat. Etiam libero nunc, vehicula non quam sit amet, auctor fermentum lacus. Nunc pretium justo et urna rhoncus, ut faucibus ligula posuere. Aenean consequat vitae justo nec finibus. Duis rutrum tortor urna, ac auctor quam fermentum sit amet.','2019-12-24','2022-10-22',1024,68,'2019-11-24',2202,2002,1111,1023)
,(1259,'Start Up',734665,'Sed a sapien at risus malesuada dignissim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis ut convallis justo. Aenean porta aliquam erat. Donec a purus non nunc consequat hendrerit. Nam vel faucibus est, id pretium massa. Nulla facilisi. Morbi aliquam eget dui a lobortis. Aenean quam metus, posuere ut ipsum id, hendrerit dictum eros. Aenean molestie in ipsum et eleifend. In a imperdiet mi, eget viverra ante. Suspendisse egestas dignissim tortor, quis scelerisque ipsum efficitur a.','2019-07-27','2021-07-15',1036,88,'2019-06-27',2201,2002,1115,1035)
,(1260,'Power Up',300956,'Mauris commodo consequat volutpat. Vestibulum ac lectus non erat auctor facilisis vel eget magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse potenti. Proin sed felis lacus. Ut dignissim quis leo vitae bibendum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla facilisi. Sed eu rhoncus tortor. Maecenas vitae ligula eu dui viverra rutrum. Aenean tempus mauris vulputate magna fermentum, ac interdum nisl vulputate.','2019-02-01','2022-08-22',1097,99,'2019-01-01',2203,2003,1130,1092);

-- ----------------------------
-- Table structure for works_on
-- ----------------------------

-- DROP TABLE IF EXISTS `works_on`;
CREATE TABLE `works_on` (
	`res_id` INT,
	`proj_id` INT,
	PRIMARY KEY (`res_id` , `proj_id`),
	FOREIGN KEY (`res_id`) REFERENCES `researchers` (`res_id`) ON DELETE CASCADE,
	FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`) ON DELETE CASCADE
);

-- ----------------------------
-- Records of works-on
-- ----------------------------

INSERT INTO `works_on`(`proj_id`,`res_id`) VALUES
 (1201,1088)
,(1202,1090)
,(1203,1081)
,(1204,1034)
,(1205,1092)
,(1206,1094)
,(1207,1036)
,(1208,1038)
,(1209,1040)
,(1210,1001)
,(1211,1003)
,(1212,1096)
,(1213,1044)
,(1214,1049)
,(1215,1025)
,(1216,1031)
,(1217,1019)
,(1218,1074)
,(1219,1083)
,(1220,1098)
,(1221,1068)
,(1222,1042)
,(1223,1017)
,(1224,1084)
,(1225,1035)
,(1226,1050)
,(1227,1007)
,(1228,1061)
,(1229,1082)
,(1230,1010)
,(1231,1012)
,(1232,1050)
,(1233,1098)
,(1234,1046)
,(1235,1068)
,(1236,1070)
,(1237,1051)
,(1238,1063)
,(1239,1071)
,(1240,1008)
,(1241,1018)
,(1242,1047)
,(1243,1028)
,(1244,1095)
,(1245,1038)
,(1246,1072)
,(1247,1043)
,(1248,1040)
,(1249,1094)
,(1250,1048)
,(1251,1015)
,(1252,1064)
,(1253,1056)
,(1254,1089)
,(1255,1089)
,(1256,1017)
,(1257,1033)
,(1258,1023)
,(1259,1035)
,(1260,1092)
,(1201,1090)
,(1202,1088)
,(1203,1082)
,(1204,1036)
,(1205,1090)
,(1206,1090)
,(1207,1042)
,(1208,1036)
,(1209,1034)
,(1210,1054)
,(1211,1060)
,(1212,1090)
,(1213,1046)
,(1214,1080)
,(1215,1027)
,(1216,1033)
,(1217,1021)
,(1218,1076)
,(1219,1081)
,(1220,1090)
,(1221,1067)
,(1222,1036)
,(1223,1078)
,(1224,1086)
,(1225,1036)
,(1226,1080)
,(1227,1009)
,(1228,1063)
,(1229,1081)
,(1230,1022)
,(1231,1014)
,(1232,1080)
,(1233,1090)
,(1234,1044)
,(1235,1067)
,(1236,1087)
,(1237,1053)
,(1238,1061)
,(1239,1087)
,(1240,1007)
,(1241,1078)
,(1242,1100)
,(1243,1030)
,(1244,1088)
,(1245,1036)
,(1246,1091)
,(1247,1037)
,(1248,1038)
,(1249,1095)
,(1250,1100)
,(1251,1041)
,(1252,1066)
,(1253,1058)
,(1254,1097)
,(1255,1092)
,(1256,1078)
,(1257,1031)
,(1258,1079)
,(1259,1040)
,(1260,1089);

-- ----------------------------
-- Table structure for deliverables
-- ----------------------------

-- DROP TABLE IF EXISTS `deliverables`;
CREATE TABLE `deliverables` (
  `proj_id` INT,
  `del_id` INT,
  `title` VARCHAR(40),
  `summary` TEXT,
  `delivery_date` DATE,
  PRIMARY KEY (`proj_id`, `del_id`),
  FOREIGN KEY (`proj_id`) REFERENCES `projects`(`proj_id`) ON DELETE CASCADE
);

-- ----------------------------
-- Records of deliverables
-- ----------------------------

INSERT INTO `deliverables`(`proj_id`,`del_id`,`title`,`summary`,`delivery_date`) VALUES
 (1203,10,'proin risus','Nullam vel cursus ipsum. Aliquam at dolor non justo vulputate placerat at ac orci. Sed vitae magna non tellus pulvinar condimentum. Donec diam massa, viverra quis est vitae, luctus eleifend augue. Maecenas interdum varius libero quis scelerisque. Pellentesque malesuada sapien tellus, ac condimentum neque vehicula sed. Duis varius congue elit fermentum lacinia. Nam eu dolor vel lectus tempor imperdiet at nec dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam rhoncus lorem odio, at sollicitudin tortor sollicitudin sit amet. Ut vel commodo odio. In et augue tristique, imperdiet turpis ac, consectetur nulla. Cras at dui orci. Pellentesque maximus odio sapien, sit amet dictum dolor condimentum vel. Cras enim lorem, laoreet a tempor sed, lacinia nec nunc. Duis vitae consectetur arcu, posuere sodales libero.','2010-06-06')
,(1210,11,'metus arcu','Integer ut sapien ligula. Mauris pulvinar sem id lectus ullamcorper suscipit. Maecenas dignissim dui elementum turpis vehicula, ut imperdiet velit euismod. Maecenas sed pellentesque metus. Etiam rutrum, arcu in porta euismod, mi erat ullamcorper arcu, id feugiat nibh libero vel enim. Nunc convallis ultricies efficitur. Donec quis suscipit mi. Nullam sollicitudin venenatis felis nec bibendum. Donec tincidunt mi purus, quis placerat est malesuada sed. Maecenas cursus metus justo, vitae tincidunt nisi fermentum et. Vestibulum a porta purus, et malesuada velit. Morbi sodales tortor dolor, a egestas urna ullamcorper sed. Nam dignissim nibh id nisi sodales, vulputate fringilla tortor ornare. Cras efficitur sit amet erat id molestie. Morbi rutrum, libero ac tempor posuere, quam justo faucibus enim, non venenatis ante urna nec ex. Nulla velit tortor, posuere sit amet aliquet vitae, auctor non lorem.','2015-09-23')
,(1211,12,'tortor sollin','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ligula lorem, aliquam id enim non, consectetur fringilla urna. Ut congue placerat enim, accumsan luctus ipsum finibus quis. Nullam pellentesque, justo cursus dapibus congue, nibh felis molestie nibh, id viverra mauris nulla quis libero. Pellentesque ultricies scelerisque elit, ut elementum velit semper sit amet. Vivamus facilisis ut enim ut tincidunt. Cras a cursus lorem. Ut ultricies tellus non ligula volutpat, a pharetra leo malesuada. Fusce vulputate sapien nunc, quis finibus tellus pharetra vel. Ut at turpis volutpat, commodo est at, lobortis diam. Quisque at justo dignissim, rutrum tortor eu, porttitor augue. Aliquam faucibus massa magna, non hendrerit neque lobortis vitae. Etiam risus ex, dignissim molestie dolor sit amet, dictum dignissim lorem.','2013-09-04')
,(1216,13,'curae duis','Phasellus maximus ipsum ut accumsan lobortis. Fusce molestie lacinia est, ac faucibus felis euismod quis. In hac habitasse platea dictumst. Praesent laoreet ultrices enim, nec molestie arcu sagittis quis. Curabitur non tellus ac nisi euismod interdum. Mauris sed tellus vitae tellus mattis dapibus a eget tellus. Mauris efficitur ultrices lectus, nec suscipit metus posuere ac. Vivamus nulla sapien, aliquam eget metus nec, suscipit bibendum orci. Curabitur justo magna, commodo eget justo vel, fringilla facilisis erat. Aliquam aliquet sapien non placerat tincidunt. Nullam feugiat in purus a condimentum. Vestibulum quam arcu, pretium at tortor quis, volutpat sodales est. Nulla facilisi. In id quam lacinia, pretium sapien nec, dictum risus.','2017-05-30')
,(1216,25,'nulla ut','Vestibulum congue dui sem, sed hendrerit turpis interdum auctor. Etiam a risus ipsum. Praesent commodo nulla in tincidunt condimentum. Sed gravida dolor lectus, efficitur semper tellus aliquam in. Aenean eu velit id leo pellentesque venenatis pretium eget eros. Etiam molestie diam nibh, sed iaculis metus blandit ut. In feugiat dignissim lacus, a varius ligula semper nec. In dapibus pulvinar sodales. Vivamus a tellus dignissim, tristique nibh eget, convallis orci. Cras eu justo non ligula fermentum venenatis sed nec metus. Nunc arcu metus, facilisis vulputate blandit vitae, mattis imperdiet mauris.','2017-05-30')
,(1217,14,'nec molestie','Integer vel nisl et lorem luctus eleifend. Aliquam est nunc, pellentesque in ullamcorper sit amet, gravida ac nulla. Cras sagittis velit diam, vitae rhoncus mi consectetur nec. In quis mi vestibulum, interdum mi vitae, lobortis nisl. In vestibulum augue pharetra elit efficitur, et varius leo ultricies. Nullam dolor justo, mattis iaculis porta quis, cursus et leo. Donec rhoncus lectus odio, ac facilisis massa sodales in. Nullam faucibus lobortis ligula, a sollicitudin felis sagittis eget.','2021-12-25')
,(1217,26,'est quam','Sed fermentum accumsan auctor. Vivamus condimentum molestie orci, in pretium nunc aliquet a. Nullam et ante id quam accumsan volutpat in ut nibh. Curabitur eget neque ultricies, hendrerit arcu finibus, sodales libero. Nulla lobortis eu mauris et sodales. Integer orci turpis, rutrum eu sollicitudin dictum, eleifend at massa. Curabitur viverra, turpis eu pretium feugiat, erat dolor hendrerit massa, non maximus massa erat feugiat orci. Quisque tincidunt et est sed iaculis. Mauris auctor velit lectus, ut condimentum magna porttitor ut. Nam cursus tristique nisl. Donec suscipit arcu sit amet dolor ullamcorper, a facilisis velit ornare. Nulla sit amet leo cursus, consectetur nibh id, fermentum odio. Vivamus mauris diam, sodales vel sapien in, varius ultrices purus. Curabitur eu faucibus turpis. Aenean aliquet, diam id ornare vestibulum, ligula est convallis justo, non aliquet massa massa vel eros.','2021-09-21')
,(1217,32,'at lorem','Pellentesque non mi eu augue pretium pharetra. Etiam consectetur aliquet nisi, ultricies consectetur tellus commodo sed. Aliquam suscipit iaculis tempor. Nulla id purus elit. Aliquam ultrices eleifend laoreet. Vestibulum et accumsan dolor. In at urna sed elit convallis egestas sit amet vitae quam. Pellentesque odio dolor, suscipit sed orci vitae, vehicula consequat dolor. Sed porttitor odio gravida, varius felis eget, gravida augue. Donec sit amet libero semper, congue sapien sit amet, tincidunt magna. Praesent sit amet est consectetur, finibus metus vel, dignissim enim. Nulla sollicitudin, nunc ac sollicitudin consequat, ligula purus dapibus neque, ultricies dapibus ipsum augue quis turpis. Vestibulum massa enim, gravida aliquam ex a, porta mollis magna. Proin ut diam elit. Fusce laoreet, ante nec bibendum auctor, purus mauris malesuada mauris, eget luctus nisi est eget lacus.','2022-01-21')
,(1218,15,'vestibulum','Mauris nec viverra mauris. Nunc iaculis libero metus, sed ultricies neque iaculis ut. Mauris eget aliquet elit, id facilisis diam. Fusce nunc dolor, hendrerit sit amet mi sed, faucibus fringilla quam. Etiam interdum sagittis ipsum vestibulum tempor. Donec sed eleifend risus. Nulla quis maximus elit.','2017-06-03')
,(1218,27,'ullamcorper','Sed in ligula sit amet neque condimentum pretium. Vestibulum efficitur neque non ornare ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent efficitur cursus bibendum. Suspendisse et gravida tortor, ut interdum tortor. Curabitur lectus mauris, lobortis nec urna vitae, convallis mattis ante. Vivamus pulvinar massa sed justo finibus, in congue erat laoreet. Integer suscipit mi non ornare lobortis. Etiam dapibus posuere lectus, eu rutrum ante dictum ac. Praesent imperdiet ut nulla ut ornare. Donec volutpat nunc et interdum fermentum. Aliquam laoreet at purus ac ultrices.','2018-09-29')
,(1219,16,'mauris morbi','Fusce sed semper justo. Etiam quis condimentum tellus, ut commodo lectus. Donec at ipsum ligula. Sed quis ex dictum, pretium est sit amet, aliquet dolor. Pellentesque nulla massa, blandit in leo lobortis, vestibulum cursus neque. Suspendisse luctus orci turpis, varius bibendum est ultrices at. In hac habitasse platea dictumst. Donec dapibus vestibulum orci, vitae scelerisque erat tincidunt sed. Proin aliquam fringilla diam, id vehicula odio vehicula eget. In mollis ac nisl a facilisis. Suspendisse eleifend nunc quis metus interdum malesuada. Suspendisse cursus arcu erat, eget commodo dui faucibus vel. Pellentesque ut mi eros. Proin in lacus lacinia, gravida nisi non, venenatis turpis. Sed volutpat nibh a dolor consequat tincidunt.','2021-11-30')
,(1219,28,'proin leo odio','Nullam eleifend pulvinar rutrum. Vivamus commodo arcu eu venenatis tincidunt. Praesent vulputate pharetra libero. Phasellus consectetur tempus rutrum. Curabitur id neque vel libero imperdiet feugiat ut a lacus. Phasellus posuere odio felis, ac scelerisque ante lobortis in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas ipsum a ex convallis consequat.','2021-03-10')
,(1221,17,'sed sagittis','Phasellus ornare faucibus ipsum at convallis. Aenean dapibus commodo mi sed fringilla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam vulputate a leo vitae maximus. Aliquam quis lacinia purus, cursus convallis justo. Integer suscipit lacinia magna, sed condimentum nulla tristique at. Integer sollicitudin condimentum turpis eget rutrum. In eget interdum augue. Aenean eu faucibus justo. Sed varius vehicula condimentum. Sed id faucibus mauris. Curabitur ac orci ante.','2021-02-26')
,(1221,29,'morbi quis','Donec commodo elit vestibulum, auctor eros vel, viverra est. Cras venenatis, diam semper convallis molestie, arcu ante eleifend sapien, sit amet accumsan tortor sapien sit amet erat. Morbi non facilisis libero, nec elementum nisl. In fringilla arcu vel nulla pretium, eget suscipit nisi hendrerit. Fusce at porttitor magna, vel elementum eros. Mauris ullamcorper ullamcorper turpis sit amet vestibulum. Vestibulum at turpis velit. Mauris ornare arcu et vehicula viverra. Quisque laoreet elit ac orci varius faucibus. Suspendisse malesuada tellus non nunc feugiat, et efficitur lectus faucibus. Nam id placerat velit.','2021-10-16')
,(1223,18,'primis faucibus','Sed vitae accumsan leo, quis imperdiet turpis. Fusce eu velit mauris. Praesent fringilla ligula vel orci accumsan, eget lacinia ante pretium. Curabitur sit amet neque egestas ex tristique congue. Mauris lectus felis, dapibus id purus non, dictum viverra libero. Proin euismod tellus a congue vulputate. In accumsan sapien leo, pharetra convallis dolor congue et.','2018-03-21')
,(1223,30,'in consequat ut','Curabitur lacinia, velit in rhoncus fermentum, nisi magna efficitur velit, at iaculis ipsum tellus at sapien. Maecenas et lacus tempor, volutpat sem eget, facilisis mauris. Quisque nec consectetur risus. Sed nec volutpat diam, ac vehicula odio. Donec vulputate metus ac lacus lobortis viverra. Cras a cursus magna. In sit amet magna sed eros gravida sodales et a nunc. Integer et consectetur ipsum. Donec faucibus eros lectus, at hendrerit lectus ullamcorper nec. Duis pellentesque, nunc in tempor lobortis, odio magna sagittis velit, eget interdum tortor augue in nibh. Vivamus vel sapien sit amet dolor pharetra suscipit in et felis. Duis pharetra dui eget arcu mollis facilisis. Ut vel sapien id arcu aliquet commodo in et purus.','2017-07-18')
,(1228,19,'semper rutrum','In commodo pellentesque risus in interdum. Aliquam ultricies, diam vel pellentesque interdum, libero magna ornare est, nec condimentum massa erat eget sem. Sed congue ipsum dui, in pretium odio elementum non. Mauris vulputate felis vitae ullamcorper ultricies. Vestibulum venenatis mauris justo, nec interdum felis gravida quis. Duis purus libero, lacinia in placerat a, aliquet non libero. Etiam lacinia commodo sapien ac faucibus. Aliquam ac leo nisl. Vestibulum a tempor quam. Suspendisse vel interdum nunc, at dignissim nunc. Sed gravida ac mi sit amet commodo. Phasellus posuere gravida sem, non dignissim libero efficitur eu. Proin vitae rhoncus leo. Duis lacinia egestas felis, nec condimentum purus tempor sit amet.','2019-03-24')
,(1228,31,'ut massa quis','Proin accumsan mauris ut ante sodales, sit amet interdum massa ultricies. Mauris ac lectus iaculis, pulvinar orci a, viverra lorem. Aliquam eu nisi dolor. Donec sit amet ante ante. Nulla quis faucibus nisi, id ornare risus. Duis et laoreet nisl. Sed bibendum purus id condimentum vehicula. Fusce blandit diam justo, et euismod diam fermentum vitae. Sed vulputate nulla ut libero egestas tincidunt. Morbi magna enim, scelerisque non venenatis id, lacinia a ipsum. Quisque ut porta magna, mattis dictum dolor. Nullam sit amet ante vel risus eleifend vehicula vitae in velit. Aliquam ultrices sit amet nibh ut auctor. Nullam auctor ante nibh, a maximus erat molestie quis. Quisque consequat pellentesque molestie. Sed lobortis laoreet sem, ut commodo lectus tempus et.','2018-10-24')
,(1231,20,'turpis sed','Maecenas eu pellentesque diam. Nam elit odio, tincidunt ut cursus eget, tempus et dolor. Proin tincidunt eros quis magna laoreet suscipit. In mollis ipsum eget dui vehicula tristique. Ut sed ultricies magna. Aliquam sit amet euismod nisl. Mauris euismod vitae ante id lacinia. Suspendisse maximus id magna eget mattis. Fusce non leo sed magna volutpat dictum eu in ex. Maecenas malesuada, lectus non commodo commodo, nisi libero sodales orci, a tincidunt odio tellus non lectus. Fusce posuere tincidunt nunc, vel aliquam massa tincidunt quis. Cras at dignissim quam. Nunc nisi velit, ullamcorper in ipsum quis, elementum lacinia nisi. Etiam tempus diam non augue fermentum varius. Integer sit amet porta nibh.','2020-01-22')
,(1232,21,'vivamus vel','Sed non elit vitae justo laoreet ornare. Vivamus eu lorem a odio commodo commodo. Fusce sit amet euismod ligula. Nunc tempus porttitor urna a consectetur. Suspendisse eget erat pharetra, hendrerit risus vitae, convallis massa. Maecenas gravida eget nisi non cursus. Nam iaculis ex velit, ac scelerisque neque egestas id. In maximus tellus ac purus efficitur dictum. Nulla ut urna porta, interdum dolor quis, maximus eros. Suspendisse ac augue eget ipsum fringilla placerat. Phasellus et gravida ipsum. Duis libero lacus, varius id vestibulum eget, elementum et libero. Phasellus vel tellus erat. Aliquam nec aliquam nisi, nec varius tellus. Pellentesque egestas ultrices dolor at fermentum.','2018-08-13')
,(1236,22,'magnis dis','Proin lacus magna, luctus eget cursus nec, molestie vel metus. Praesent a nibh sit amet est consectetur posuere ac et dolor. Donec ipsum risus, euismod ac tellus quis, placerat pellentesque mauris. Nullam sed facilisis risus. Duis condimentum velit mollis tortor iaculis, id egestas tellus luctus. Nam eleifend varius lorem vitae consectetur. Suspendisse velit ligula, semper nec hendrerit sed, congue et mi.','2019-05-01')
,(1238,23,'tempor turpis','Nam ante lectus, lobortis nec rutrum in, laoreet in mi. Donec purus nisi, interdum vel tellus sed, condimentum mollis odio. Pellentesque maximus leo at lorem consectetur mattis. Donec iaculis mi sed orci aliquet vulputate. Nunc mi ligula, tristique sed dapibus nec, cursus et magna. Maecenas dictum leo at augue tincidunt, id scelerisque erat dignissim. Curabitur in libero egestas, ornare sapien eget, gravida nunc. Curabitur vel efficitur elit. Duis quis dui at augue venenatis rhoncus in in urna. Sed luctus, orci in tempus vulputate, magna arcu lacinia arcu, vel sodales nisl velit non arcu. Sed aliquet tempus lectus maximus consequat. Curabitur a nunc ac elit fermentum fringilla.','2020-05-26')
,(1239,24,'lectus pellentes','Etiam nec molestie tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam luctus tempor arcu a tristique. Nulla aliquet sit amet nibh vitae ullamcorper. In hac habitasse platea dictumst. Fusce id pharetra urna. In in eros fermentum, tristique justo quis, ullamcorper tortor. Fusce felis metus, vestibulum at ante id, bibendum convallis magna. Aliquam egestas imperdiet ex at dignissim.','2020-12-31');

-- ----------------------------
-- Table structure for scientific-fields
-- ----------------------------

-- DROP TABLE IF EXISTS `scientific-fields`;
CREATE TABLE `scientific_fields` (
  `sfield_id` INT PRIMARY KEY AUTO_INCREMENT,
  `sfield_name` VARCHAR(20)
);

-- ----------------------------
-- Records of `scientific_fields`
-- ----------------------------

INSERT INTO `scientific_fields`(`sfield_id`,`sfield_name`) VALUES
 (201,'SCIENCE')
,(202,'ENGINEERING')
,(203,'BIOLOGY')
,(204,'STATISTICS')
,(205,'PHYSICS')
,(206,'ROBOTICS')
,(207,'MECHANICS')
,(208,'ECOLOGY')
,(209,'TECHNOLOGY')
,(210,'ECONOMICS');

-- ----------------------------
-- Table structure for belongs_to_field
-- ----------------------------

-- DROP TABLE IF EXISTS `belongs_to_fields`;
CREATE TABLE `belongs_to_field` (
  `proj_id` INT,
  `sfield_id` INT,
  PRIMARY KEY (`proj_id`, `sfield_id`),
  FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`),
  FOREIGN KEY (`sfield_id`) REFERENCES `scientific_fields` (`sfield_id`) ON DELETE CASCADE
);

-- ----------------------------
-- Records of belongs_to_fields
-- ----------------------------

INSERT INTO `belongs_to_field`(`proj_id`,`sfield_id`) VALUES
 (1201,205)
,(1201,202)
,(1201,208)
,(1202,206)
,(1202,203)
,(1202,210)
,(1203,205)
,(1203,209)
,(1203,203)
,(1204,207)
,(1204,208)
,(1204,204)
,(1205,208)
,(1205,207)
,(1205,206)
,(1206,202)
,(1206,210)
,(1206,209)
,(1207,202)
,(1207,201)
,(1207,208)
,(1208,205)
,(1208,210)
,(1208,207)
,(1209,202)
,(1209,206)
,(1209,209)
,(1210,201)
,(1210,207)
,(1210,206)
,(1211,209)
,(1211,210)
,(1211,204)
,(1212,202)
,(1212,210)
,(1212,204)
,(1213,203)
,(1213,204)
,(1213,209)
,(1214,201)
,(1214,210)
,(1214,204)
,(1215,209)
,(1215,208)
,(1215,206)
,(1216,203)
,(1216,207)
,(1216,210)
,(1217,206)
,(1217,210)
,(1217,202)
,(1218,205)
,(1218,201)
,(1218,203)
,(1219,203)
,(1219,209)
,(1219,202)
,(1220,210)
,(1220,204)
,(1220,205)
,(1221,205)
,(1221,202)
,(1221,206)
,(1222,204)
,(1222,201)
,(1222,210)
,(1223,206)
,(1223,205)
,(1223,208)
,(1224,205)
,(1224,208)
,(1224,204)
,(1225,201)
,(1225,203)
,(1225,205)
,(1226,201)
,(1226,203)
,(1226,205)
,(1227,210)
,(1227,207)
,(1227,204)
,(1228,209)
,(1228,205)
,(1228,204)
,(1229,201)
,(1229,206)
,(1229,209)
,(1230,202)
,(1230,204)
,(1230,209)
,(1231,210)
,(1231,206)
,(1231,204)
,(1232,209)
,(1232,204)
,(1232,202)
,(1233,201)
,(1233,204)
,(1233,205)
,(1234,204)
,(1234,207)
,(1234,206)
,(1235,210)
,(1235,209)
,(1235,202)
,(1236,208)
,(1236,204)
,(1236,202)
,(1237,201)
,(1237,210)
,(1237,202)
,(1238,205)
,(1238,210)
,(1238,204)
,(1239,209)
,(1239,210)
,(1239,206)
,(1240,206)
,(1240,207)
,(1240,202)
,(1241,204)
,(1241,210)
,(1241,206)
,(1242,207)
,(1242,204)
,(1242,203)
,(1243,210)
,(1243,207)
,(1243,201)
,(1244,210)
,(1244,202)
,(1244,207)
,(1245,205)
,(1245,203)
,(1245,201)
,(1246,205)
,(1246,203)
,(1246,206)
,(1247,201)
,(1247,210)
,(1247,209)
,(1248,206)
,(1248,202)
,(1248,201)
,(1249,208)
,(1249,204)
,(1249,210)
,(1250,207)
,(1250,201)
,(1250,210)
,(1251,207)
,(1251,210)
,(1251,204)
,(1252,208)
,(1252,206)
,(1252,203)
,(1253,201)
,(1253,207)
,(1253,203)
,(1254,209)
,(1254,210)
,(1254,208)
,(1255,209)
,(1255,208)
,(1255,202)
,(1256,202)
,(1256,209)
,(1256,210)
,(1257,206)
,(1257,204)
,(1257,208)
,(1258,209)
,(1258,207)
,(1258,204)
,(1259,201)
,(1259,206)
,(1259,210)
,(1260,205)
,(1260,203)
,(1260,208);

DELIMITER $$
CREATE TRIGGER evaluatorNotTheManager
	BEFORE INSERT ON projects FOR EACH ROW BEGIN
		DECLARE msg VARCHAR(128);
    IF NEW.evaluator_id = NEW.mgr_id THEN
			SET msg = CONCAT('MyTriggerError: Trying to insert a project whose manager is its evaluator: researcher_id = ', CAST(mgr_id as CHAR));
      SIGNAL SQLSTATE '45000' SET message_text = msg;
		END IF;
	END$$
DELIMITER ;


/* 3.1 QUERY -- OK
	Show all available programs and all projects (projects.start_date, projects.duration, executive.exec_name).
  Then for a specific project show all the researchers that work on it.
*/
SELECT prog.name "Program", proj.title 'Projects', r.first_name 'Researcher\'s Forname', r.last_name 'Researcher\'s Surname'
FROM programs prog JOIN projects proj ON prog.prog_id = proj.prog_id JOIN works_on wo ON proj.proj_id = wo.proj_id
	JOIN researchers r ON r.res_id = wo.res_id JOIN executives ex ON ex.exec_id = proj.exec_id
WHERE start_date between '2015-01-01' and '2020-01-01' -- "input"
  AND FLOOR(DATEDIFF(finish_date, start_date)/365) = 1 -- "input"
  AND ex.exec_name= 'Rogers Killshaw' -- "input"
ORDER BY prog.name, proj.title, r.last_name;


/* 3.2 QUERY -- OK
	Show all the projects in which a researcher is working on, for all the researchers. (VIEW)
  Show (ANOTHER VIEW).
*/
CREATE VIEW projectsOfResearchers AS
	SELECT r.first_name AS 'Researcher\'s Forename', r.last_name AS 'Researcher\'s Surname', p.title AS 'Project\'s Title'
  FROM works_on wo JOIN projects p ON p.proj_id = wo.proj_id JOIN researchers r ON r.res_id = wo.res_id;
CREATE VIEW researchersInOrganisation AS
	SELECT org.name AS 'Organisation', res.first_name AS 'Researcher\'s Forename', res.last_name AS 'Researcher\'s Surname'
  FROM organisations org JOIN researchers res ON org.org_id = res.org_id
  ORDER BY org.name, res.last_name, res.first_name;
SELECT * FROM projectsOfResearchers;
SELECT * FROM researchersInOrganisation; 