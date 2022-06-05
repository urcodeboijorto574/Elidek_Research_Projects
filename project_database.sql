CREATE TABLE organisations (
  org_id INT PRIMARY KEY AUTO_INCREMENT,
  abbreviation VARCHAR(10),
  name VARCHAR(40),
  zipcode INT,
  street VARCHAR(40),
  city VARCHAR(40),
  category VARCHAR(10) NOT NULL,
  capital INT,
  budget_min_ed INT,
  budget_individ INT,
  CHECK (category IN ('R. Center', 'University', 'Company'))
);
CREATE TABLE phone_numbers (
	phone_number VARCHAR(20),
  org_id INT,
  PRIMARY KEY (org_id, phone_number),
	FOREIGN KEY (org_id) REFERENCES organisations (org_id)
);
CREATE TABLE programs (
  prog_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10),
  address_elidek CHAR(20) NOT NULL
);
CREATE TABLE executives (
  exec_id INT PRIMARY KEY AUTO_INCREMENT,
  exec_name VARCHAR(40)
);
CREATE TABLE researchers (
  res_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  gender CHAR(1),
  birth_date DATE,
  org_id INT NOT NULL,
  employment_date DATE,
  FOREIGN KEY (org_id) REFERENCES organisations (org_id) ON DELETE CASCADE,
  CONSTRAINT valid_birth_date
		CHECK (birth_date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 100 YEAR) AND CURRENT_DATE())
);
CREATE TABLE projects (
  proj_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(40),
  cost INT,
  summary TEXT,
  start_date DATE,
  finish_date DATE,
  evaluator_id INT,
  eval_points INT,
  eval_creation_date DATE,
  exec_id INT,
  prog_id INT,
  org_id INT,
  mgr_id INT,
  FOREIGN KEY (evaluator_id) REFERENCES researchers(res_id) ON DELETE SET NULL,
  FOREIGN KEY (exec_id) REFERENCES executives(exec_id) ON DELETE SET NULL,
  FOREIGN KEY (prog_id) REFERENCES programs(prog_id) ON DELETE SET NULL,
  FOREIGN KEY (org_id) REFERENCES organisations(org_id) ON DELETE SET NULL,
  FOREIGN KEY (mgr_id) REFERENCES researchers(res_id) ON DELETE SET NULL,
  CONSTRAINT CostMustBeInGivenSpan
		CHECK (cost >= 100000 AND cost <= 1000000),
  CONSTRAINT StartDateMustBeBeforeFinishDate
		CHECK (start_date < finish_date),
  CONSTRAINT ProjectMustLastFrom1to4Years
		CHECK (DATEDIFF(finish_date, start_date) >= 365 AND DATEDIFF(finish_date, start_date) <= 1464),
	CONSTRAINT evaluatorNotTheManager
		CHECK (evaluator_id <> mgr_id)
);
CREATE TABLE works_on (
	res_id INT,
	proj_id INT,
	PRIMARY KEY (res_id , proj_id),
	FOREIGN KEY (res_id) REFERENCES researchers (res_id) ON DELETE CASCADE,
	FOREIGN KEY (proj_id) REFERENCES projects (proj_id) ON DELETE CASCADE
);
CREATE TABLE deliverables (
  proj_id INT,
  del_id INT,
  title VARCHAR(40),
  summary TEXT,
  delivery_date DATE,
  PRIMARY KEY (proj_id, del_id),
  FOREIGN KEY (proj_id) REFERENCES projects(proj_id) ON DELETE CASCADE
);
CREATE TABLE scientific_fields (
  sfield_id INT PRIMARY KEY AUTO_INCREMENT,
  sfield_name VARCHAR(20)
);
CREATE TABLE belongs_to_field (
  proj_id INT,
  sfield_id INT,
  PRIMARY KEY (proj_id, sfield_id),
  FOREIGN KEY (proj_id) REFERENCES projects (proj_id),
  FOREIGN KEY (sfield_id) REFERENCES scientific_fields (sfield_id) ON DELETE CASCADE
);


/* 3.1 QUERY
	Show all available programs and all projects (projects.start_date, projects.duration, executive.exec_name).
  Then for a specific project show all the researchers that work on it.
*/
SELECT prog.name 'Program', proj.title 'Projects', CONCAT(r.first_name, ' ', r.last_name) 'Researcher'
FROM programs prog JOIN projects proj ON prog.prog_id = proj.prog_id JOIN works_on wo ON proj.proj_id = wo.proj_id
	JOIN researchers r ON r.res_id = wo.res_id JOIN executives ex ON ex.exec_id = proj.exec_id
WHERE start_date = '2015-01-01' -- 'input' : START DATE
  AND EXTRACT(YEAR FROM finish_date) - EXTRACT(YEAR FROM start_date) = 1 -- 'input' : DURATION
  AND ex.exec_name = 'Rogers Killshaw' -- 'input' : EXECUTIVE
ORDER BY prog.name, proj.title, r.last_name;

/* 3.2 QUERY
	Show all the projects in which a researcher is working on, for all the researchers. (VIEW)
  Show (ANOTHER VIEW).
*/
CREATE VIEW projectsOfResearchers AS
	SELECT CONCAT(r.first_name, ' ', r.last_name) 'Researcher', p.title AS 'Project'
  FROM works_on wo JOIN projects p ON p.proj_id = wo.proj_id JOIN researchers r ON r.res_id = wo.res_id
  ORDER BY r.last_name;
CREATE VIEW researchersInOrganisation AS
	SELECT org.name AS 'Organisation', org.abbreviation 'Organisation\'s Abbreviation', CONCAT(res.first_name, ' ', res.last_name) AS 'Researcher'
  FROM organisations org JOIN researchers res ON org.org_id = res.org_id
  ORDER BY org.name, res.last_name, res.first_name;
SELECT * FROM projectsOfResearchers;
SELECT * FROM researchersInOrganisation;

/* 3.3 QUERY
	Show all the projects in a scientific field and all the researchers that are working in a project
	of said scientific field in the last year.
*/
SELECT tt.title 'Project', CONCAT(r.first_name, ' ', r.last_name) 'Researcher'
FROM (
	SELECT DISTINCT pif.title, pif.proj_id, wo.res_id
  FROM (
  	SELECT p.title, p.proj_id
		FROM scientific_fields sf JOIN belongs_to_field bf ON sf.sfield_id = bf.sfield_id JOIN projects p ON p.proj_id = bf.proj_id
		WHERE sf.sfield_name = 'STATISTICS' -- 'input' : SCIENTIFIC FIELD
  ) pif JOIN works_on wo ON pif.proj_id = wo.proj_id
) tt JOIN researchers r ON tt.res_id = r.res_id;

/* 3.4 QUERY
	Show all the organisations that took on the same number of projects in 2 consecutive years
  with at least 10 projects per year.
*/
SELECT o.org_id, name, num_of_proj
FROM organisations o JOIN (
	SELECT p2.org_id, COUNT(DISTINCT p1.proj_id) num_of_proj
	FROM projects p1 JOIN projects p2 ON p1.org_id = p2.org_id
	WHERE p1.proj_id != p2.proj_id
		AND EXTRACT(YEAR FROM p2.start_date) - EXTRACT(YEAR FROM p1.start_date) BETWEEN 0 AND 1
	GROUP BY p2.org_id
	HAVING COUNT(DISTINCT p1.proj_id) >= 10
	ORDER BY p2.org_id
) tt ON tt.org_id = o.org_id;

/* 3.5 QUERY
	Show the top 3 combinations of scientific fields that had the most projects belonged to them.
  (sfield_id 1, sfield_name 1, sfield_id 2, sfield_name 2)
*/
WITH iniTable AS ( /* Scientific Fields of each Project */
	SELECT temp.proj_id, temp.sfield_name
	FROM (
		SELECT sf.sfield_id, sf.sfield_name, p.proj_id, p.title
		FROM projects p JOIN belongs_to_field btf ON p.proj_id = btf.proj_id JOIN scientific_fields sf ON btf.sfield_id = sf.sfield_id
	) temp
  GROUP BY temp.proj_id, temp.sfield_name
)
SELECT field1 'Scientific Field 1', field2 'Scientific Field 2', Projects 'Number of Projects', rnk 'Rank'
FROM (
	SELECT t1.sfield_name field1, t2.sfield_name field2, COUNT(*) 'Projects', Rank() OVER (ORDER BY COUNT(*) DESC) rnk
  FROM iniTable t1 JOIN iniTable t2 ON t1.sfield_name < t2.sfield_name AND t1.proj_id = t2.proj_id
  GROUP BY 1,2
) finTable
WHERE rnk BETWEEN 1 and 3
ORDER BY rnk;
/* Number of projects in each Scientific Field
SELECT sf.sfield_id, sf.sfield_name, COUNT(p.proj_id) '# of Projects in Scientific Field' -- p.proj_id, p.title, sf.sfield_id, sf.sfield_name
FROM projects p JOIN belongs_to_field btf ON p.proj_id = btf.proj_id JOIN scientific_fields sf ON btf.sfield_id = sf.sfield_id
GROUP BY sf.sfield_id
ORDER BY COUNT(p.proj_id) DESC;
*/

/* 3.6 QUERY
	Show all the researchers under 40-year-old age who work on the most projects and
  the number of those projects.
*/
SELECT CONCAT(r.first_name, ' ', r.last_name) 'Researcher', COUNT(p.proj_id) 'Number of active Projects'
FROM researchers r JOIN works_on wo ON wo.res_id = r.res_id JOIN projects p ON p.proj_id = wo.proj_id
WHERE (DATE_SUB(CURRENT_DATE(), INTERVAL 40 YEAR) < birth_date) AND CURRENT_DATE() BETWEEN p.start_date and p.finish_date
GROUP BY r.res_id;

/* 3.7 QUERY
	Show the top 5 executives that have sponsored the largest amount in a Company.
  (SELECT (executive.exec_name, organisation.name, projects.cost) ... )
*/
SELECT exec_name 'Executive', name 'Organisation', SUM(cost) 'Cost'
FROM projects p JOIN executives e ON p.exec_id = e.exec_id JOIN organisations o ON o.org_id = p.org_id
WHERE category = 'Company'
GROUP BY exec_name, name
ORDER BY exec_name, SUM(cost) DESC
LIMIT 5;

/* 3.8 QUERY
	Show all the researchers who work on at least 5 projects that don't have deliverables, as well as the number of projects of each of them.
  (SELECT researchers.first_name, researchers.last_name, [number of projects] ... )
*/
SELECT r.res_id AS 'Researcher\'s ID', CONCAT(r.first_name, ' ', r.last_name) AS 'Researcher', COUNT(DISTINCT p.proj_id) AS 'Number of Projects'
FROM researchers r JOIN works_on wo ON r.res_id = wo.res_id JOIN projects p ON wo.proj_id = p.proj_id
WHERE p.proj_id NOT IN (SELECT DISTINCT proj_id FROM deliverables)
GROUP BY r.res_id
HAVING COUNT(DISTINCT p.proj_id) >= 5;

DELIMITER $$
CREATE TRIGGER evaluatorNotTheManager
	BEFORE INSERT ON projects FOR EACH ROW
  BEGIN
		DECLARE msg VARCHAR(128);
    IF NEW.evaluator_id = NEW.mgr_id THEN
			SET msg = CONCAT('MyTriggerError: Trying to insert a project whose manager is its evaluator: researcher_id = ', CAST(mgr_id as CHAR));
      SIGNAL SQLSTATE '45000' SET message_text = msg;
		END IF;
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER evaluatorShouldNotWorkOnProject_Insert
	BEFORE INSERT ON works_on FOR EACH ROW
  BEGIN
		DECLARE msg VARCHAR(128);
		IF NOT EXISTS (
			SELECT p.proj_id, p.evaluator_id, wo.res_id FROM projects p JOIN works_on wo ON p.proj_id = wo.proj_id
      WHERE p.evaluator_id <> wo.res_id
		) THEN
			SET msg = CONCAT('MyTriggerError: Trying to insert a works-on-project relation between an evaluator and the project he evaluates: Researcher\'s ID = ', CAST(res_id AS CHAR));
      SIGNAL SQLSTATE '45002' SET message_text = msg;
		END IF;
  END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER evaluatorShouldNotWorkOnProject_Update
	BEFORE UPDATE ON works_on FOR EACH ROW
  BEGIN
		DECLARE msg VARCHAR(128);
    IF EXISTS (
			SELECT p.proj_id, evaluator_id, wo.res_id FROM projects p JOIN works_on wo ON p.proj_id = wo.proj_id
      WHERE evaluator_id = NEW.res_id
    ) THEN
			SET msg = CONCAT('MyTriggerError: Trying to update a works-on-project relation between an evaluator and the project he evaluates: Researcher\'s ID = ', CAST(NEW.res_id AS CHAR));
		END IF;
  END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER ResearcherShouldWorkAtOrganisationThatOwnsTheProject_Insert
	BEFORE INSERT ON works_on FOR EACH ROW
  BEGIN
		DECLARE msg VARCHAR(128);
		IF EXISTS (
			SELECT p.org_id, r.org_id
      FROM projects p JOIN works_on wo ON p.proj_id = wo.proj_id JOIN researchers r ON wo.res_id = r.res_id
			WHERE NEW.proj_id = p.proj_id AND NEW.res_id = r.res_id AND p.org_id <> r.org_id
    ) THEN
			SET msg = CONCAT('MyTriggerError: Trying to insert a works-on-project relation between a researcher and a project of which the organisation ID differs.');
			SIGNAL SQLSTATE '45002' SET message_text = msg;
		END IF;
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER ResearcherShouldWorkAtOrganisationThatOwnsTheProject_Update
	BEFORE INSERT ON works_on FOR EACH ROW
  BEGIN
		DECLARE msg VARCHAR(128);
		IF EXISTS (
			SELECT p.org_id, r.org_id
      FROM projects p JOIN works_on wo ON p.proj_id = wo.proj_id JOIN researchers r ON wo.res_id = r.res_id
			WHERE NEW.proj_id = p.proj_id AND NEW.res_id = r.res_id AND p.org_id <> r.org_id
    ) THEN
			SET msg = CONCAT('MyTriggerError: Trying to insert a works-on-project relation between a researcher and a project of which the organisation ID differs.');
			SIGNAL SQLSTATE '45002' SET message_text = msg;
		END IF;
	END$$
DELIMITER ;

/* ======================================== INDICES ======================================== */

CREATE INDEX idx_org_id ON researcher(org_id);
CREATE INDEX idx_proj_id ON works_on(proj_id);
CREATE INDEX idx_res_id ON works_on(res_id);
CREATE INDEX idx_program_id ON project(prog_id);
CREATE INDEX idx_ex_id ON project(exec_id);
CREATE INDEX idx_sfield_id ON belongs_to_field(sfield_id);

