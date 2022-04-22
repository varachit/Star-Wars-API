
CREATE SCHEMA IF NOT EXISTS starwars;
USE starwars;

CREATE TABLE IF NOT EXISTS api_starship (
	id						integer PRIMARY KEY AUTO_INCREMENT,
	name					varchar(128) NOT NULL,
	model					varchar(64) NOT NULL,
	starship_class			varchar(64) NOT NULL,
	manufacturer			varchar(128),
	cost_in_credits			varchar(255) NOT NULL,
	length					varchar(255) NOT NULL,
	crew					varchar(255) NOT NULL,
	passengers				varchar(255) NOT NULL,
	max_atmosphering_speed	varchar(255) NOT NULL,
	hyperdrive_rating		varchar(255) NOT NULL,
	MGLT					varchar(255) NOT NULL,
	cargo_capacity			varchar(255) NOT NULL,
	consumables				varchar(255) NOT NULL,
	created					datetime NOT NULL,
	modified				datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS api_person (
	id			integer PRIMARY KEY AUTO_INCREMENT,
	name		varchar(64) NOT NULL,
	birth_year	varchar(7) NOT NULL,
	eye_color	varchar(128) NOT NULL,
	gender		varchar(16) NOT NULL,
	hair_color	varchar(128) NOT NULL,
	height		varchar(16) NOT NULL,
	mass		varchar(16) NOT NULL,
	skin_color	varchar(128) NOT NULL,
	created		datetime NOT NULL,
	modified	datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS api_planet (
	id				integer PRIMARY KEY AUTO_INCREMENT,
	name			varchar(64) NOT NULL,
	diameter 		varchar(255) NOT NULL,
	rotation_period	varchar(255) NOT NULL,
	orbital_period	varchar(255) NOT NULL,
	population		varchar(255) NOT NULL,
	climate			varchar(128) NOT NULL,
	terrain			varchar(128) NOT NULL,
	surface_water	varchar(64) NOT NULL,
	created			datetime NOT NULL,
	modified		datetime NOT NULL,
	gravity			varchar(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS api_planet_residents (
	id			integer PRIMARY KEY AUTO_INCREMENT,
	planet_id	integer NOT NULL,
	person_id	integer NOT NULL,
	FOREIGN KEY(planet_id) REFERENCES api_planet(id),
	FOREIGN KEY(person_id) REFERENCES api_person(id)
);

CREATE TABLE IF NOT EXISTS api_person_homeworld (
	id			integer PRIMARY KEY AUTO_INCREMENT,
	person_id	integer NOT NULL,
	planet_id	integer NOT NULL,
	FOREIGN KEY(planet_id) REFERENCES api_planet(id),
	FOREIGN KEY(person_id) REFERENCES api_person(id)
);

CREATE TABLE IF NOT EXISTS api_person_starships (
	id			integer PRIMARY KEY AUTO_INCREMENT,
	person_id	integer NOT NULL,
	starship_id	integer NOT NULL,
	FOREIGN KEY(person_id) REFERENCES api_person(id),
	FOREIGN KEY(starship_id) REFERENCES api_starship(id)
);

INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (6,'CR90 corvette','CR90 corvette','corvette','Corellian Engineering Corporation','3500000','150','30-165','600','950','2.0','60','3000000','1 year','2022-04-15 08:02:09.945852','2022-04-15 08:02:09.945852');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (7,'Star Destroyer','Imperial I-class Star Destroyer','Star Destroyer','Kuat Drive Yards','150000000','1,600','47,060','n/a','975','2.0','60','36000000','2 years','2022-04-15 08:03:20.899798','2022-04-15 08:03:20.899798');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (8,'Sentinel-class landing craft','Sentinel-class landing craft','landing craft','Sienar Fleet Systems, Cyngus Spaceworks','240000','38','5','75','1000','1.0','70','180000','1 month','2022-04-15 08:04:07.121842','2022-04-15 08:04:07.121842');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (9,'Death Star','DS-1 Orbital Battle Station','Deep Space Mobile Battlestation','Imperial Department of Military Research, Sienar Fleet Systems','1000000000000','120000','342,953','843,342','n/a','4.0','10','1000000000000','3 years','2022-04-15 08:05:13.713786','2022-04-15 08:05:13.713786');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (10,'Millennium Falcon','YT-1300 light freighter','Light freighter','Corellian Engineering Corporation','100000','34.37','4','6','1050','0.5','75','100000','2 months','2022-04-15 08:06:01.759335','2022-04-15 08:06:01.759335');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (11,'Y-wing','BTL Y-wing','assault starfighter','Koensayr Manufacturing','134999','14','2','0','1000km','1.0','80','110','1 week','2022-04-15 08:06:59.665862','2022-04-15 08:06:59.665862');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (12,'X-wing','T-65 X-wing','Starfighter','Incom Corporation','149999','12.5','1','0','1050','1.0','100','110','1 week','2022-04-15 08:07:44.494768','2022-04-15 08:07:44.494768');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (13,'TIE Advanced x1','Twin Ion Engine Advanced x1','Starfighter','Sienar Fleet Systems','unknown','9.2','1','0','1200','1.0','105','150','5 days','2022-04-15 08:08:26.596846','2022-04-15 08:08:26.596846');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (14,'Executor','Executor-class star dreadnought','Star dreadnought','Kuat Drive Yards, Fondor Shipyards','1143350000','19000','279,144','38000','n/a','2.0','40','250000000','6 years','2022-04-15 08:09:20.235820','2022-04-15 08:09:20.235820');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (15,'Rebel transport','GR-75 medium transport','Medium transport','Gallofree Yards, Inc.','unknown','90','6','90','650','4.0','20','19000000','6 months','2022-04-15 08:10:44.211890','2022-04-15 08:10:44.211890');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (16,'Slave 1','Firespray-31-class patrol and attack','Patrol craft','Kuat Systems Engineering','unknown','21.5','1','6','1000','3.0','70','70000','1 month','2022-04-15 08:11:45.691872','2022-04-15 08:11:45.692847');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (17,'Imperial shuttle','Lambda-class T-4a shuttle','Armed government transport','Sienar Fleet Systems','240000','20','6','20','850','1.0','50','80000','2 months','2022-04-15 08:12:34.881308','2022-04-15 08:12:34.881308');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (18,'EF76 Nebulon-B escort frigate','EF76 Nebulon-B escort frigate','Escort ship','Kuat Drive Yards','8500000','8500000','854','75','800','2.0','40','6000000','2 years','2022-04-15 08:13:30.901702','2022-04-15 08:13:30.901702');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (19,'Calamari Cruiser','MC80 Liberty type Star Cruiser','Star Cruiser','Mon Calamari shipyards','104000000','1200','5400','1200','n/a','1.0','60','unknown','2 years','2022-04-15 08:14:50.286351','2022-04-15 08:14:50.286351');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (20,'A-wing','RZ-1 A-wing Interceptor','Starfighter','Alliance Underground Engineering, Incom Corporation','175000','9.6','1','0','1300','1.0','120','40','1 week','2022-04-15 08:15:44.157939','2022-04-15 08:15:44.157939');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (21,'B-wing','A/SF-01 B-wing starfighter','Assault Starfighter','Slayn & Korpil','220000','16.9','1','0','950','2.0','91','45','1 week','2022-04-15 08:43:47.575934','2022-04-15 08:43:47.575934');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (22,'Republic Cruiser','Consular-class cruiser','Space cruiser','Corellian Engineering Corporation','unknown','115','9','16','900','2.0','unknown','unknown','unknown','2022-04-15 08:44:42.231626','2022-04-15 08:44:42.231626');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (23,'Drid control ship','Lucrehulk-class Drid Control Ship','Drid control ship','Hoersch-Kessel Drive, Inc.','unknown','3170','175','139000','n/a','2.0','unknown','4000000000','500 days','2022-04-15 08:45:38.346096','2022-04-15 08:45:38.346096');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (24,'Naboo fighter','N-1 starfighter','Starfighter','Theed Palace Space Vessel Engineering Corps','Theed Palace Space Vessel Engineering Corps','11','1','0','1100','1.0','unknown','65','7 days','2022-04-15 08:46:43.141021','2022-04-15 08:46:43.141021');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (25,'Naboo Royal Starship','J-type 327 Nubian royal starship','yacht','Theed Palace Space Vessel Engineering Corps, Nubia Star Drives','unknown','76','8','unknown','920','1.8','unknown','unknown','unknown','2022-04-15 08:47:50.901796','2022-04-15 08:47:50.901796');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (26,'Scimitar','Star Courier','Space Transport','Republic Sienar Systems','55000000','26.5','1','6','1180','1.5','unknown','2500000','30 days','2022-04-15 08:48:44.428092','2022-04-15 08:48:44.428092');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (27,'J-type diplomatic barge','J-type diplomatic barge','Diplomatic barge','Theed Palace Space Vessel Engineering Corps, Nubia Star Drives','2000000','39','5','10','2000','0.7','unknown','unknown','1 year','2022-04-15 08:49:35.450319','2022-04-15 08:49:35.450319');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (28,'AA-9 Coruscant freighter','Botajef AA-9 Freighter-Liner','freighter','Botajef Shipyards','unknown','390','unknown','30000','unknown','unknown','unknown','unknown','unknown','2022-04-15 08:50:55.045838','2022-04-15 08:50:55.045838');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (29,'Jedi starfighter','Delta-7 Aethersprite-class interceptor','Starfighter','Kuat Systems Engineering','180000','8','1','0','1150','1.0','unknown','60','7 days','2022-04-15 08:51:55.912361','2022-04-15 08:51:55.912361');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (30,'H-type Nubian yacht','H-type Nubian yacht','yacht','Theed Palace Space Vessel Engineering Corps','unknown','47.9','4','unknown','8000','0.9','unknown','unknown','unknown','2022-04-15 08:52:40.419226','2022-04-15 08:52:40.419226');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (31,'Republic Assault ship','Acclamator I-class assault ship','assault ship','Rothana Heavy Engineering','unknown','752','700','16000','unknown','0.6','unknown','11250000','2 years','2022-04-15 08:53:33.408149','2022-04-15 08:53:33.408149');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (32,'Solar Sailer','Punworcca 116-class interstellar sloop','yacht','Huppla Pasa Tisc Shipwrights Collective','35700','15.2','3','11','1600','1.5','unknown','240','7 days','2022-04-15 08:54:26.630226','2022-04-15 08:54:26.630226');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (33,'Trade Federation cruiser','Proidence-class carrier/destroyer','capital ship','Rendili StarDrive, Free Dac Volunteers Engineering corps.','125000000','1088','600','48247','1050','1.5','unknown','50000000','4 years','2022-04-15 08:55:22.970027','2022-04-15 08:55:22.970027');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (34,'Theta-class T-2c shuttle','Theta-class T-2c shuttle','transport','Cygnus Spaceworks','1000000','18.5','5','16','2000','1.0','unknown','50000','56 days','2022-04-15 08:56:06.133322','2022-04-15 08:56:06.133322');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (35,'Republic attack cruiser','Senator-class Star Destroyer','star destroyer','Kuat Drive Yards, Allanteen Six shipyards','59000000','1137','7400','2000','975','1.0','unknown','20000000','2 years','2022-04-15 08:56:59.456645','2022-04-15 08:56:59.456645');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (36,'Naboo star skiff','J-type star skiff','yacht','Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated','unknown','29.2','3','3','1050','0.5','unknown','unknown','unknown','2022-04-15 08:57:55.615372','2022-04-15 08:57:55.615372');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (37,'Jedi Interceptor','Eta-2 Actis-class light interceptor','starfighter','Kuat Systems Engineering','320000','5.47','1','0','1500','1.0','unknown','60','2 days','2022-04-15 08:58:41.345085','2022-04-15 08:58:41.345085');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (38,'arc-170','Aggressive Reconnaissance-170 starfighte','starfighter','Incom Corporation, Subpro Corporation','155000','14.5','3','0','1000','1.0','100','110','5 days','2022-04-15 08:59:22.698066','2022-04-15 08:59:22.698066');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (39,'Banking clan frigte','Munificent-class star frigate','cruiser','Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries','57000000','825','200','unknown','unknown','1.0','unknown','40000000','2 years','2022-04-15 09:00:02.915628','2022-04-15 09:00:02.915628');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (40,'Belbullab-22 starfighter','Belbullab-22 starfighter','starfighter','Feethan Ottraw Scalable Assemblies','168000','6.71','1','0','1100','6','unknown','140','7 days','2022-04-15 09:03:08.774256','2022-04-15 09:03:08.774256');
INSERT INTO api_starship (id ,name ,model ,starship_class ,manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, MGLT, cargo_capacity, consumables, created, modified) VALUES (41,'V-wing','Alpha-3 Nimbus-class V-wing starfighter','starfighter','Kuat Systems Engineering','102500','7.9','1','0','1050','1.0','unknown','60','15 hours','2022-04-15 09:03:53.606996','2022-04-15 09:03:53.606996');


INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (1,'Luke Skywalker','19BBY','blue','male','blond','172','77','fair','2022-04-15 09:52:30.663166','2022-04-15 10:34:04.105606');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (2,'C-3PO','112BBY','yellow','n/a','n/a','167','75','gold','2022-04-15 09:59:54.936728','2022-04-16 16:10:39.495512');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (3,'R2-D2','33BBY','red','n/a','n/a','96','32','white, blue','2022-04-15 10:00:10.559782','2022-04-16 16:10:50.461595');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (4,'Darth Vader','41.9BBY','yellow','male','none','202','136','white','2022-04-15 10:00:18.187156','2022-04-16 16:11:25.275718');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (5,'Leia Organa','19BBY','brown','female','brown','150','49','light','2022-04-15 10:00:26.999676','2022-04-16 16:11:38.080419');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (6,'Owen Lars','52BBY','blue','male','brown, grey','178','120','light','2022-04-15 10:00:34.743605','2022-04-16 16:11:44.567651');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (7,'Beru Whitesun lars','47BBY','blue','female','brown','165','75','light','2022-04-15 10:00:41.196304','2022-04-16 16:11:51.449281');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (8,'R5-D4','unknown','red','n/a','n/a','97','32','white, red','2022-04-15 10:00:48.694118','2022-04-16 16:12:02.354202');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (9,'Biggs Darklighter','24BBY','brown','male','black','183','84','light','2022-04-15 10:00:56.473517','2022-04-16 16:12:31.396273');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (10,'Obi-Wan Kenobi','57BBY','blue-gray','male','auburn, white','182','77','fair','2022-04-15 10:01:02.423800','2022-04-16 16:12:48.719316');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (11,'Anakin Skywalker','41.9BBY','blue','male','blond','188','84','fair','2022-04-15 10:01:10.493705','2022-04-16 16:13:24.819892');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (12,'Wilhuff Tarkin','64BBY','blue','male','auburn, grey','180','unknown','fair','2022-04-15 10:01:16.610630','2022-04-16 16:14:04.199815');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (13,'Chewbacca','200BBY','blue','male','brown','228','112','unknown','2022-04-15 10:01:24.478182','2022-04-16 16:13:56.570286');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (14,'Han Solo','29BBY','brown','male','brown','180','80','fair','2022-04-15 10:01:31.726385','2022-04-16 16:14:19.013196');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (15,'Greedo','44BBY','black','male','n/a','173','74','green','2022-04-15 10:01:39.518996','2022-04-16 16:14:34.415660');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (16,'Jabba Desilijic Tiure','600BBY','orange','hermaphrodite','n/a','175','1,358','green-tan, brown','2022-04-15 10:01:46.069315','2022-04-16 16:14:49.814909');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (17,'Wedge Antilles','21BBY','hazel','male','brown','170','77','fair','2022-04-15 10:04:43.069406','2022-04-16 16:15:07.211869');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (18,'Jek Tono Porkins','unknown','blue','male','brown','180','110','fair','2022-04-15 10:04:55.260981','2022-04-16 16:15:45.129522');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (19,'Yoda','896BBY','brown','male','white','66','17','green','2022-04-15 10:05:01.871518','2022-04-16 16:15:55.236301');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (20,'Palpatine','82BBY','yellow','male','grey','170','75','pale','2022-04-15 10:05:08.151044','2022-04-16 16:16:02.692679');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (21,'Boba Fett','31.5BBY','brown','male','black','183','78.2','fair','2022-04-15 10:05:16.408398','2022-04-16 16:16:14.967815');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (22,'IG-88','15BBY','red','none','none','200','140','metal','2022-04-15 10:05:22.848456','2022-04-16 16:16:39.462332');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (23,'Bossk','53BBY','red','male','none','190','113','green','2022-04-15 10:05:28.467874','2022-04-16 16:17:37.772629');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (24,'Lando Calrissian','31BBY','brown','male','black','177','79','dark','2022-04-15 10:05:38.376176','2022-04-16 16:17:47.543690');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (25,'Lobot','37BBY','blue','male','none','175','79','light','2022-04-15 10:05:44.838824','2022-04-16 16:17:55.661456');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (26,'Ackbar','41BBY','orange','male','none','180','83','brown mottle','2022-04-15 10:05:51.451758','2022-04-16 16:18:02.125391');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (27,'Mon Mothma','48BBY','blue','female','auburn','150','unknown','fair','2022-04-15 10:05:58.477812','2022-04-16 16:18:12.651651');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (28,'Arvel Crynyd','unknown','brown','male','brown','unknown','unknown','fair','2022-04-15 10:06:05.735353','2022-04-16 16:18:39.452152');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (29,'Wicket Systri Warrick','8BBY','brown','male','brown','88','20','brown','2022-04-15 10:06:20.346443','2022-04-16 16:18:48.246968');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (30,'Nien Nunb','unknown','black','male','none','160','68','grey','2022-04-15 10:06:28.089888','2022-04-16 16:18:58.426342');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (31,'Qui-Gon Jinn','92BBY','blue','male','brown','193','89','fair','2022-04-15 10:06:34.367504','2022-04-16 16:19:07.699547');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (32,'Nute Gunray','unknown','red','male','none','191','90','mottled green','2022-04-15 10:06:45.504868','2022-04-16 16:19:17.622156');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (33,'Finis Valorum','91BBY','blue','male','blond','170','unknown','fair','2022-04-15 10:06:53.756607','2022-04-16 16:19:27.541240');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (34,'Padmé Amidala','46BBY','brown','female','brown','185','45','light','2022-04-15 10:07:08.857950','2022-04-16 16:20:11.820232');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (35,'Jar Jar Binks','52BBY','orange','male','none','196','66','orange','2022-04-15 10:07:16.841245','2022-04-16 16:20:20.991164');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (36,'Roos Tarpals','unknown','orange','male','none','224','82','grey','2022-04-15 10:07:24.931843','2022-04-16 16:20:28.775654');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (37,'Rugor Nass','unknown','orange','male','none','206','unknown','green','2022-04-15 10:07:32.805778','2022-04-16 16:20:42.331708');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (38,'Ric Olié','unknown','blue','male','brown','183','unknown','fair','2022-04-15 10:07:49.279959','2022-04-16 16:20:54.938133');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (39,'Watto','unknown','yellow','male','black','137','unknown','blue, grey','2022-04-15 10:08:02.282571','2022-04-16 16:21:04.109101');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (40,'Sebulba','unknown','orange','male','none','112','40','grey, red','2022-04-15 10:08:08.914358','2022-04-16 16:21:18.379693');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (41,'Quarsh Panaka','62BBY','brown','male','black','183','unknown','dark','2022-04-15 10:08:15.943796','2022-04-16 16:21:25.508530');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (42,'Shmi Skywalker','72BBY','brown','female','black','163','unknown','fair','2022-04-15 10:08:23.364235','2022-04-16 16:21:55.697567');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (43,'Darth Maul','54BBY','yellow','male','none','175','80','red','2022-04-15 10:08:34.484821','2022-04-16 16:22:03.539972');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (44,'Bib Fortuna','unknown','pink','male','none','180','unknown','pale','2022-04-15 10:08:41.817247','2022-04-16 16:22:15.834052');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (45,'Ayla Secura','48BBY','hazel','female','none','178','55','blue','2022-04-15 10:08:47.628732','2022-04-16 16:22:28.271855');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (46,'Ratts Tyerel','unknown','unknown','male','none','79','15','grey, blue','2022-04-15 10:08:56.237556','2022-04-16 16:22:34.376983');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (47,'Dud Bolt','unknown','yellow','male','none','94','45','blue, grey','2022-04-15 10:09:03.243573','2022-04-16 16:22:40.604406');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (48,'Gasgano','unknown','black','male','none','122','unknown','white, blue','2022-04-15 10:15:47.594707','2022-04-16 16:22:47.059259');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (49,'Ben Quadinaros','unknown','orange','male','none','163','65','grey, green, yellow','2022-04-15 10:15:52.792621','2022-04-16 16:22:53.490739');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (50,'Mace Windu','72BBY','brown','male','none','188','84','dark','2022-04-15 10:15:57.749826','2022-04-16 16:23:03.444878');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (51,'Ki-Adi-Mundi','92BBY','yellow','male','white','198','82','pale','2022-04-15 10:16:03.531998','2022-04-16 16:23:09.864634');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (52,'Kit Fisto','unknown','black','male','none','196','87','green','2022-04-15 10:16:09.344071','2022-04-16 16:23:17.882814');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (53,'Eeth Koth','unknown','brown','male','black','171','unknown','brown','2022-04-15 10:16:15.752318','2022-04-16 16:23:28.797474');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (54,'Adi Gallia','unknown','blue','female','none','184','50','dark','2022-04-15 10:16:31.542732','2022-04-16 16:23:35.082713');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (55,'Saesee Tiin','unknown','orange','male','none','188','unknown','pale','2022-04-15 10:16:37.176451','2022-04-16 16:23:42.994782');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (56,'Yarael Poof','unknown','yellow','male','none','264','unknown','white','2022-04-15 10:16:41.660798','2022-04-16 16:24:08.636998');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (57,'Plo Koon','22BBY','black','male','none','188','80','orange','2022-04-15 10:16:46.629576','2022-04-16 16:24:02.390852');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (58,'Mas Amedda','unknown','blue','male','none','196','unknown','blue','2022-04-15 10:16:51.062269','2022-04-16 16:24:19.820445');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (59,'Gregar Typho','unknown','brown','male','black','185','85','dark','2022-04-15 10:16:56.548263','2022-04-16 16:24:25.839737');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (60,'Cordé','unknown','brown','female','brown','157','unknown','light','2022-04-15 10:17:01.868892','2022-04-16 16:24:32.919946');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (61,'Cliegg Lars','82BBY','blue','male','brown','183','unknown','fair','2022-04-15 10:17:06.757609','2022-04-16 16:24:40.286375');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (62,'Poggle the Lesser','unknown','yellow','male','none','183','80','green','2022-04-15 10:17:12.180198','2022-04-16 16:24:47.799920');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (63,'Luminara Unduli','58BBY','blue','female','black','170','56.2','yellow','2022-04-15 10:17:16.826875','2022-04-16 16:24:56.431582');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (64,'Barriss Offee','40BBY','blue','female','black','166','50','yellow','2022-04-15 10:17:23.870470','2022-04-16 16:25:02.474125');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (65,'Dormé','unknown','brown','female','brown','165','unknown','light','2022-04-15 10:17:29.108285','2022-04-16 16:25:08.814339');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (66,'Dooku','102BBY','brown','male','white','193','80','fair','2022-04-15 10:17:34.173653','2022-04-16 16:25:14.848221');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (67,'Bail Prestor Organa','67BBY','brown','male','black','191','unknown','tan','2022-04-15 10:17:38.991047','2022-04-16 16:25:22.651351');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (68,'Jango Fett','66BBY','brown','male','black','183','79','tan','2022-04-15 10:17:44.884152','2022-04-16 16:25:34.942762');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (69,'Zam Wesell','unknown','yellow','female','blonde','168','55','fair, green, yellow','2022-04-15 10:17:49.773992','2022-04-16 16:25:41.691854');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (70,'Dexter Jettster','unknown','yellow','male','none','198','102','brown','2022-04-15 10:17:54.409592','2022-04-16 16:25:52.395920');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (71,'Lama Su','unknown','black','male','none','229','88','grey','2022-04-15 10:18:02.034987','2022-04-16 16:25:58.691521');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (72,'Taun We','unknown','black','female','none','213','unknown','grey','2022-04-15 10:18:06.632664','2022-04-16 16:26:03.303566');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (73,'Jocasta Nu','unknown','blue','female','white','167','unknown','fair','2022-04-15 10:18:11.847018','2022-04-16 16:26:12.812996');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (74,'R4-P17','unknown','red, blue','female','none','96','unknown','silver, red','2022-04-15 10:18:17.535018','2022-04-16 16:26:22.242911');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (75,'Wat Tambor','unknown','unknown','male','none','193','48','green, grey','2022-04-15 10:18:23.385303','2022-04-16 16:26:26.666302');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (76,'San Hill','unknown','gold','male','none','191','unknown','grey','2022-04-15 10:18:28.633931','2022-04-16 16:26:31.441133');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (77,'Shaak Ti','unknown','black','female','none','178','57','red, blue, white','2022-04-15 10:18:32.953056','2022-04-16 16:26:36.302847');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (78,'Grievous','unknown','green, yellow','male','none','216','159','brown, white','2022-04-15 10:18:37.120714','2022-04-16 16:26:43.886735');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (79,'Tarfful','unknown','blue','male','brown','234','136','brown','2022-04-15 10:18:42.663174','2022-04-16 16:26:48.782017');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (80,'Raymus Antilles','unknown','brown','male','brown','188','79','light','2022-04-15 10:18:47.191142','2022-04-16 16:26:54.795650');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (81,'Sly Moore','unknown','white','female','none','178','48','pale','2022-04-15 10:18:51.214903','2022-04-16 16:26:59.317810');
INSERT INTO api_person (id, name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, created, modified) VALUES (82,'Tion Medon','unknown','black','male','none','206','80','grey','2022-04-15 10:18:58.054145','2022-04-16 16:27:05.098272');


INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (1,'Tatooine','10465','23','304','200000','arid','desert','1','2022-04-15 09:50:09.084201','2022-04-15 11:33:35.376448','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (2,'Alderaan','12500','24','364','2000000000','temperate','grasslands, mountains','40','2022-04-15 11:18:29.615884','2022-04-15 11:34:35.363603','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (3,'Yavin IV','10200','24','4818','1000','temperate, tropical','jungle, rainforests','8','2022-04-15 11:18:44.162843','2022-04-15 12:02:19.147457','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (4,'Hoth','7200','23','549','unknown','frozen','tundra, ice caves, mountain ranges','100','2022-04-15 11:18:47.845642','2022-04-15 12:02:10.052940','1.1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (5,'Dagobah','8900','23','341','unknown','murky','swamp, jungles','8','2022-04-15 11:18:51.247425','2022-04-15 12:01:59.680251','N/A');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (6,'Bespin','118000','12','5110','6000000','temperate','gas giant','0','2022-04-15 11:19:30.426289','2022-04-15 11:35:48.586587','1.5 (surface), 1 standard (Cloud City)');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (7,'Endor','4900','18','402','30000000','temperate','forests, mountains, lakes','8','2022-04-15 11:19:38.643151','2022-04-15 11:37:03.458185','0.85 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (8,'Naboo','12120','26','312','4500000000','temperate','grassy hills, swamps, forests, mountains','12','2022-04-15 11:19:42.948640','2022-04-15 11:38:02.592428','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (9,'Coruscant','12240','24','368','1000000000000','temperate','cityscape, mountains','unknown','2022-04-15 11:19:47.040526','2022-04-15 11:38:44.143856','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (10,'Kamino','19720','27','463','1000000000','temperate','ocean','100','2022-04-15 11:19:51.929261','2022-04-15 11:39:20.130558','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (11,'Geonosis','11370','30','256','100000000000','temperate, arid','rock, desert, mountain, barren','5','2022-04-15 11:20:05.618140','2022-04-15 11:39:51.880686','0.9 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (12,'Utapau','12900','27','351','95000000','temperate, arid, windy','scrublands, savanna, canyons, sinkholes','0.9','2022-04-15 11:20:10.100511','2022-04-15 11:40:08.493350','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (13,'Mustafar','4200','36','412','20000','hot','volcanoes, lava rivers, mountains, caves','0','2022-04-15 11:20:17.158527','2022-04-15 12:01:07.873967','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (14,'Kashyyyk','12765','26','381','45000000','tropical','jungle, forests, lakes, rivers','60','2022-04-15 11:20:21.426430','2022-04-15 11:40:37.175279','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (15,'Polis Massa','0','24','590','1000000','artificial temperate','airless asteroid','0','2022-04-15 11:20:24.950748','2022-04-15 12:00:49.561483','0.56 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (16,'Mygeeto','10088','12','167','19000000','frigid','glaciers, mountains, ice canyons','unknown','2022-04-15 11:20:28.549781','2022-04-15 12:00:35.739886','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (17,'Felucia','9100','34','231','8500000','hot, humid','fungus forests','unknown','2022-04-15 11:20:31.336446','2022-04-15 12:00:20.407143','0.75 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (18,'Cato Neimoidia','0','25','278','10000000','temperate, moist','mountains, fields, forests, rock arches','unknown','2022-04-15 11:20:35.375130','2022-04-15 11:41:04.695763','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (19,'Saleucami','14920','26','392','1400000000','hot','caves, desert, mountains, volcanoes','unknown','2022-04-15 11:20:40.401249','2022-04-15 11:59:57.509852','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (20,'Stewjon','0','unknown','unknown','unknown','temperate','grass','unknown','2022-04-15 11:20:43.375852','2022-04-15 11:41:25.582750','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (21,'Eriadu','13490','24','360','22000000000','polluted','cityscape','unknown','2022-04-15 11:20:47.279158','2022-04-15 11:41:51.653077','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (22,'Corellia','11000','25','329','3000000000','temperate','plains, urban, hills, forests','70','2022-04-15 11:20:51.886190','2022-04-15 11:43:19.133351','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (23,'Rodia','7549','29','305','1300000000','hot','jungles, oceans, urban, swamps','60','2022-04-15 11:20:56.353277','2022-04-15 11:59:25.811734','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (24,'Nal Hutta','12150','87','413','7000000000','temperate','urban, oceans, swamps, bogs','unknown','2022-04-15 11:21:00.277878','2022-04-15 11:43:57.063395','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (25,'Dantooine','9830','25','378','1000','temperate','oceans, savannas, mountains, grasslands','unknown','2022-04-15 11:21:04.360160','2022-04-15 11:59:02.998142','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (26,'Bestine IV','6400','26','680','62000000','temperate','rocky islands, oceans','98','2022-04-15 11:21:07.976083','2022-04-15 11:44:11.569573','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (27,'Ord Mantell','14050','26','334','4000000000','temperate','plains, seas, mesas','10','2022-04-15 11:21:11.509775','2022-04-15 11:58:39.974834','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (28,'unknown','0','0','unknown','unknown','unknown','unknown','unknown','2022-04-15 11:21:52.434781','2022-04-15 11:44:38.976519','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (29,'Trandosha','0','25','371','42000000','arid','mountains, seas, grasslands, deserts','unknown','2022-04-15 11:21:56.738521','2022-04-15 11:44:53.481133','0.62 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (30,'Socorro','0','20','326','300000000','arid','deserts, mountains','unknown','2022-04-15 11:21:59.954630','2022-04-15 11:45:07.572336','1 standard');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (31,'Mon Cala','11030','21','398','27000000000','temperate','oceans, reefs, islands','100','2022-04-15 11:22:03.102512','2022-04-15 11:45:35.323953','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (32,'Chandrila','13500','20','368','1200000000','temperate','plains, forests','40','2022-04-15 11:22:06.300513','2022-04-15 11:45:52.351155','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (33,'Sullust','12780','20','263','18500000000','superheated','mountains, volcanoes, rocky deserts','5','2022-04-15 11:22:10.280949','2022-04-15 11:46:12.003841','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (34,'Toydaria','7900','21','184','11000000','temperate','swamps, lakes','unknown','2022-04-15 11:22:13.348182','2022-04-15 11:46:26.150497','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (35,'Malastare','18880','26','201','2000000000','arid, temperate, tropical','swamps, deserts, jungles, mountains','unknown','2022-04-15 11:22:16.337601','2022-04-15 11:46:37.481816','1.56');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (36,'Dathomir','10480','24','491','5200','temperate','forests, deserts, savannas','unknown','2022-04-15 11:22:19.205631','2022-04-15 11:46:51.043614','0.9');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (37,'Ryloth','10600','30','305','1500000000','temperate, arid, subartic','mountains, valleys, deserts, tundra','5','2022-04-15 11:22:22.533758','2022-04-15 11:47:07.332002','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (38,'Aleen Minor','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2022-04-15 11:22:25.427252','2022-04-15 11:47:23.846432','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (39,'Vulpter','14900','22','391','421000000','temperate, artic','urban, barren','unknown','2022-04-15 11:22:28.891035','2022-04-15 11:47:39.594540','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (40,'Troiken','unknown','unknown','unknown','unknown','unknown','desert, tundra, rainforests, mountains','unknown','2022-04-15 11:22:33.132622','2022-04-15 11:48:10.294296','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (41,'Tund','12190','48','1770','0','unknown','barren, ash','unknown','2022-04-15 11:22:36.889791','2022-04-15 11:49:06.650413','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (42,'Haruun Kal','10120','25','383','705300','temperate','toxic cloudsea, plateaus, volcanoes','unknown','2022-04-15 11:22:40.267641','2022-04-15 11:49:22.260410','0.98');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (43,'Cerea','unknown','27','386','450000000','temperate','verdant','20','2022-04-15 11:22:43.637482','2022-04-15 11:49:35.322709','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (44,'Glee Anselm','15600','33','206','500000000','tropical, temperate','lakes, islands, swamps, seas','80','2022-04-15 11:22:46.655593','2022-04-15 11:50:31.389088','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (45,'Iridonia','unknown','29','413','unknown','unknown','rocky canyons, acid pools','unknown','2022-04-15 11:22:49.927469','2022-04-15 11:50:48.158013','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (46,'Tholoth','unknown','unknown','','unknown','unknown','unknown','unknown','2022-04-15 11:22:53.694824','2022-04-15 11:22:53.694824','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (47,'Iktotch','unknown','22','481','unknown','arid, rocky, windy','rocky','unknown','2022-04-15 11:22:57.734636','2022-04-15 11:50:58.697561','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (48,'Quermia','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2022-04-15 11:23:00.713312','2022-04-15 11:51:10.200530','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (49,'Dorin','13400','22','409','unknown','temperate','unknown','unknown','2022-04-15 11:23:04.573819','2022-04-15 11:51:24.441122','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (50,'Champala','unknown','27','318','3500000000','temperate','oceans, rainforests, plateaus','unknown','2022-04-15 11:23:08.861669','2022-04-15 11:51:45.440331','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (51,'Mirial','unknown','unknown','unknown','unknown','unknown','deserts','unknown','2022-04-15 11:23:12.472419','2022-04-15 11:52:07.318347','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (52,'Serenno','unknown','unknown','unknown','unknown','unknown','rainforests, rivers, mountains','unknown','2022-04-15 11:23:16.339303','2022-04-15 11:52:23.008419','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (53,'Concord Dawn','unknown','unknown','unknown','unknown','unknown','jungles, forests, deserts','unknown','2022-04-15 11:23:20.426150','2022-04-15 11:52:40.060225','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (54,'Zolan','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2022-04-15 11:23:23.523116','2022-04-15 11:52:55.010127','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (55,'Ojom','unknown','unknown','unknown','500000000','frigid','oceans, glaciers','100','2022-04-15 11:23:26.554598','2022-04-15 11:53:09.529065','unknown');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (56,'Skako','unknown','27','384','500000000000','temperate','urban, vines','unknown','2022-04-15 11:23:29.490443','2022-04-15 11:53:19.329027','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (57,'Muunilinst','13800','28','412','5000000000','temperate','plains, forests, hills, mountains','25','2022-04-15 11:23:33.021614','2022-04-15 11:53:29.764915','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (58,'Shili','unknown','unknown','unknown','unknown','temperate','cities, savannahs, seas, plains','unknown','2022-04-15 11:23:38.209381','2022-04-15 11:53:47.692504','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (59,'Kalee','13850','23','378','4000000000','arid, temperate, tropical','rainforests, cliffs, canyons, seas','unknown','2022-04-15 11:23:41.702850','2022-04-15 11:53:57.868841','1');
INSERT INTO api_planet (id, name, diameter, rotation_period, orbital_period, population, climate, terrain, surface_water, created, modified, gravity) VALUES (60,'Umbara','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2022-04-15 11:23:46.259606','2022-04-15 11:54:09.827721','unknown');


INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (1,1,1);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (2,1,2);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (3,1,4);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (4,1,6);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (5,1,7);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (6,1,8);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (7,1,9);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (8,1,42);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (9,1,11);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (10,1,61);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (11,2,80);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (12,2,67);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (13,2,5);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (14,6,25);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (15,7,29);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (16,8,65);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (17,8,34);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (18,8,35);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (19,8,3);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (20,8,36);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (21,8,37);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (22,8,38);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (23,8,41);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (24,8,20);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (25,8,59);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (26,8,60);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (27,9,73);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (28,9,33);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (29,9,54);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (30,10,72);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (31,10,21);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (32,10,71);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (33,11,62);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (34,12,82);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (35,14,13);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (36,14,79);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (37,18,32);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (38,20,10);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (39,21,12);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (40,22,17);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (41,22,14);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (42,23,15);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (43,24,16);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (44,26,18);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (45,28,74);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (46,28,19);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (47,28,22);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (48,28,28);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (49,28,31);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (50,29,23);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (51,30,24);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (52,31,26);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (53,32,27);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (54,33,30);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (55,34,39);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (56,35,40);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (57,36,43);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (58,37,44);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (59,37,45);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (60,38,46);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (61,39,47);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (62,40,48);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (63,41,49);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (64,42,50);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (65,43,51);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (66,44,52);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (67,45,53);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (68,47,55);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (69,48,56);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (70,49,57);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (71,50,58);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (72,51,64);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (73,51,63);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (74,52,66);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (75,53,68);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (76,54,69);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (77,55,70);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (78,56,75);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (79,57,76);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (80,58,77);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (81,59,78);
INSERT INTO api_planet_residents (id, planet_id, person_id) VALUES (82,60,81);


INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (1,1,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (2,14,22);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (3,42,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (4,2,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (5,3,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (6,4,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (7,5,2);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (8,6,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (9,7,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (10,8,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (11,9,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (12,10,20);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (13,11,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (14,12,21);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (15,13,14);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (16,15,23);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (17,16,24);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (18,17,22);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (19,18,26);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (20,19,28);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (21,20,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (22,21,10);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (23,22,28);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (24,23,29);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (25,24,30);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (26,26,31);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (27,25,6);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (28,27,32);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (29,28,28);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (30,29,7);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (31,30,33);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (32,31,28);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (33,32,18);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (34,33,9);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (35,34,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (36,35,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (37,36,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (38,37,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (39,38,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (40,39,34);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (41,40,35);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (42,41,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (43,43,36);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (44,44,37);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (45,45,37);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (46,46,38);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (47,47,39);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (48,48,40);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (49,49,41);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (50,50,42);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (51,51,43);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (52,52,44);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (53,53,45);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (54,54,9);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (55,55,47);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (56,56,48);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (57,57,49);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (58,58,50);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (59,59,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (60,60,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (61,61,1);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (62,62,11);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (63,63,51);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (64,64,51);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (65,65,8);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (66,66,52);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (67,67,2);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (68,68,53);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (69,69,54);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (70,70,55);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (71,71,10);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (72,72,10);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (73,73,9);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (74,74,28);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (75,75,56);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (76,76,57);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (77,77,58);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (78,78,59);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (79,79,14);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (80,80,2);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (81,81,60);
INSERT INTO api_person_homeworld (id, person_id, planet_id) VALUES (82,82,12);

INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (1,1,17);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (2,1,12);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (3,4,13);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (4,9,12);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (5,10,33);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (6,10,36);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (7,10,37);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (8,10,40);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (9,10,29);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (10,11,24);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (11,11,33);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (12,11,37);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (13,13,17);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (14,13,10);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (15,17,12);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (16,18,12);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (17,21,16);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (18,24,10);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (19,28,20);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (20,30,10);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (21,34,24);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (22,34,36);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (23,34,30);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (24,38,25);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (25,43,26);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (26,57,29);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (27,59,24);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (28,78,40);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (29,14,17);
INSERT INTO api_person_starships (id, person_id, starship_id) VALUES (30,14,10);


CREATE UNIQUE INDEX api_planet_residents_planet_id_person_id_2f76da9b_uniq ON api_planet_residents (
	planet_id,
	person_id
);

CREATE INDEX api_planet_residents_planet_id_b8745345 ON api_planet_residents (
	planet_id
);

CREATE INDEX api_planet_residents_person_id_313d0b1d ON api_planet_residents (
	person_id
);

CREATE UNIQUE INDEX api_person_homeworld_person_id_planet_id_f32fbee1_uniq ON api_person_homeworld (
	person_id,
	planet_id
);

CREATE INDEX api_person_homeworld_person_id_f22acee4 ON api_person_homeworld (
	person_id
);

CREATE INDEX api_person_homeworld_planet_id_8b6abb10 ON api_person_homeworld (
	planet_id
);

CREATE UNIQUE INDEX api_person_starships_person_id_starship_id_9c79be15_uniq ON api_person_starships (
	person_id,
	starship_id
);

CREATE INDEX api_person_starships_person_id_de6ade1e ON api_person_starships (
	person_id
);

CREATE INDEX api_person_starships_starship_id_57e6d6a2 ON api_person_starships (
	starship_id
);
