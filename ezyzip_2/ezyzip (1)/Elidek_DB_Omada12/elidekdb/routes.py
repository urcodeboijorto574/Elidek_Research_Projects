from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from elidekdb import app, db ## initially created by __init__.py, need to be used here
from elidekdb.forms import Belongs_to_fieldForm, DeliverablesForm, ExecutiveForm, OrganisationForm, Phone_NumbersForm, ProgramForm, ProjectForm, ResearchersForm, SfieldForm, Works_onForm ## CHANGE THIS LATER!!!

## THIS IS THE LANDING PAGE! EVERYTHING WILL BE SHOWN HERE!!! I'LL CHANGE LATER 
@app.route("/")
def index():
    try:
        ## create connection to database
        cur = db.connection.cursor()
        ## execute query
        
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
    
        return render_template("landing.html")
                            
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Landing Page")

"""
## Let's try Q3.1) (fingers_crossed) :)
@app.route("/Database")
def getDatabase():

    
    3.1 QUERY -- OK OK 
	Show all available programs and all projects (projects.start_date, projects.duration, executive.exec_name).
    Then for a specific project show all the researchers that work on it.

    
    try:
        form = Query1() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT prog.name 'Program', proj.title 'Projects', CONCAT(r.first_name, ' ' , r.last_name) 'Researcher' FROM programs prog JOIN projects proj ON prog.prog_id = proj.prog_id JOIN works_on wo ON proj.proj_id = wo.proj_id JOIN researchers r ON r.res_id = wo.res_id JOIN executives ex ON ex.exec_id = proj.exec_id WHERE start_date between '2015-01-01' and '2020-01-01' -- 'input' AND FLOOR(DATEDIFF(finish_date, start_date)/365) = 1 -- 'input' AND ex.exec_name= 'Rogers Killshaw' -- 'input' ORDER BY prog.name, proj.title, r.last_name")
        column_names = [i[0] for i in cur.description]
        Database = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("Database.html", Database = Database, pageTitle = "Database Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

"""   

## Let's try Q3.2) (fingers_crossed) :)
## 1st VIEW ---> ProjofRes
@app.route("/ProjofRes")
def getProjofRes():

    """
    Retrieve View of projects/researchers from database

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM projectsofResearchers")
        column_names = [i[0] for i in cur.description]
        ProjofRes = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("ProjofRes.html", ProjofRes = ProjofRes, pageTitle = "ProjofRes Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
    
##2nd VIEW ---> resInOrg
@app.route("/resInOrg")
def getresInOrg():

    """
    Retrieve View of researchers/organisations from database

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM researchersInOrganisation;")
        column_names = [i[0] for i in cur.description]
        resInOrg = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("resInOrg.html", resInOrg = resInOrg, pageTitle = "resInOrg Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

"""
## Let's try Q3.3) (fingers_crossed) :)
@app.route("/Popular")
def getPopular():

   
    Retrieve PopularProjects/Researchers from database

  
    try:
        form = SfieldForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT tt.title 'Project', CONCAT(r.first_name, ' ', r.last_name) 'Researcher' FROM (SELECT DISTINCT pif.title, pif.proj_id, wo.res_id FROM (SELECT p.title, p.proj_id FROM scientific_fields sf JOIN belongs_to_field bf ON sf.sfield_id = bf.sfield_id JOIN projects p ON p.proj_id = bf.proj_id WHERE sf.sfield_name = '"+FIELD+"') pif JOIN works_on wo ON pif.proj_id = wo.proj_id) tt JOIN researchers r ON tt.res_id = r.res_id;")
        column_names = [i[0] for i in cur.description]
        Popular = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("Popular.html", Popular  = Popular, pageTitle = "Popular Projects with their Researchers Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
"""

## Let's try Q3.5) (fingers_crossed) :)
@app.route("/Fields")
def getFields():

    """
    Show the top 3 combinations of scientific fields that had the most projects belonged to them.
    (sfield_id 1, sfield_name 1, sfield_id 2, sfield_name 2)

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("WITH iniTable AS (SELECT temp.proj_id, temp.sfield_name FROM (SELECT sf.sfield_id, sf.sfield_name, p.proj_id, p.title FROM projects p JOIN belongs_to_field btf ON p.proj_id = btf.proj_id JOIN scientific_fields sf ON btf.sfield_id = sf.sfield_id) temp GROUP BY temp.proj_id, temp.sfield_name ) SELECT field1 'Scientific Field 1', field2 'Scientific Field 2', Projects 'Number of Projects', rnk 'Rank' FROM ( SELECT t1.sfield_name field1, t2.sfield_name field2, COUNT(*) 'Projects', Rank() OVER (ORDER BY COUNT(*) DESC) rnk FROM iniTable t1 JOIN iniTable t2 ON t1.sfield_name < t2.sfield_name AND t1.proj_id = t2.proj_id GROUP BY 1,2 ) finTable WHERE rnk BETWEEN 1 and 3 ORDER BY RNK")
        column_names = [i[0] for i in cur.description]
        Fields = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("Fields.html", NoDeliverables = Fields, pageTitle = "Fields Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

## Let's try Q3.6) (fingers_crossed) :)
@app.route("/YoungRes")
def getYoungRes():

    """
    Show all the researchers under 40-year-old age who work on the most projects and
    the number of those projects.

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT CONCAT(r.first_name, ' ', r.last_name) 'Researcher', COUNT(p.proj_id) 'Number of active Projects' FROM researchers r JOIN works_on wo ON wo.res_id = r.res_id JOIN projects p ON p.proj_id = wo.proj_id WHERE (DATE_SUB(CURRENT_DATE(), INTERVAL 40 YEAR) < birth_date) AND CURRENT_DATE() BETWEEN p.start_date and p.finish_date GROUP BY r.res_id")
        column_names = [i[0] for i in cur.description]
        YoungRes = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("YoungRes.html", YoungRes = YoungRes, pageTitle = "YoungRes Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

## Let's try Q3.7) (fingers_crossed) :)
@app.route("/TopExec")
def getTopExec():

    """
    Retrieve Top 5 Executives with lots of money for Companies from database

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT exec_name 'Executive', name 'Organisation', SUM(cost) 'Cost' FROM projects p JOIN executives e ON p.exec_id = e.exec_id JOIN organisations o ON o.org_id = p.org_id WHERE category = 'Company' GROUP BY exec_name, name ORDER BY exec_name, SUM(cost) DESC LIMIT 5;")
        column_names = [i[0] for i in cur.description]
        TopExec = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("TopExec.html", TopExec = TopExec, pageTitle = "TopExec Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

## Let's try Q3.8) (fingers_crossed) :)
@app.route("/NoDeliverables")
def getNoDeliverables():

    """
    Retrieve View of NoDeliverables & their Projects from database

    """
    try:
        ## form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("")
        column_names = [i[0] for i in cur.description]
        NoDeliverables = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("NoDeliverables.html", NoDeliverables = NoDeliverables, pageTitle = "NoDeliverables Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

"""
CRUD
"""
@app.route("/researchers/create", methods = ["GET", "POST"]) ## "GET" by default
def createResearcher():
    """
    Create new researcher in the database
    """
    form = ResearchersForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newResearcher = form.__dict__
        query = "INSERT INTO `researchers`(`first_name`,`last_name`,`gender`,`birth_date`,`org_id`,`employment_date`) VALUES ('{}', '{}', '{}', {}, {}, {});".format(newResearcher['first_name'].data, newResearcher['last_name'].data, newResearcher['gender'].data, newResearcher['birth_date'].data, newResearcher['org_id'].data, newResearcher['employment_date'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Researcher inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_researcher.html", pageTitle = "Create Researcher", form = form)

@app.route("/researchers/delete/<int:res_id>", methods = ["POST"])
def deleteGrade(res_id):
    """
    Delete grade by id from database
    """
    query = f"DELETE FROM grades WHERE id = {res_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Researcher deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

@app.route("/organisations/create", methods = ["GET", "POST"]) ## "GET" by default
def createOrganisations():
    """
    Create new organisations in the database
    """
    form = OrganisationForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newOrganisation = form.__dict__
        query = "INSERT INTO `organisations`(`abbreviation`,`name`,`zipcode`,`street`,`city`,`category`,`capital`,`budget_min_ed`,`budget_individ`) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(newOrganisation['abbreviation'].data, newOrganisation['name'].data, newOrganisation['zipcode'].data, newOrganisation['street'].data, newOrganisation['city'].data, newOrganisation['category'].data, newOrganisation['capital'].data, newOrganisation['budget_min_ed'].data, newOrganisation['budget_individ'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Organisation inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_organisation.html", pageTitle = "Create Organisation", form = form)

@app.route("/organisation/delete/<int:org_id>", methods = ["POST"])
def deleteOrganisation(org_id):
    """
    Delete organisation by id from database
    """
    query = f"DELETE FROM organisations WHERE id = {org_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Organisation deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

@app.route("/programs/create", methods = ["GET", "POST"]) ## "GET" by default
def createPrograms():
    """
    Create new programs in the database
    """
    form = ProgramForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newProgram = form.__dict__
        query = "INSERT INTO `programs`(`name`,`address_elidek`) VALUES ('{}', '{}');".format(newProgram['name'].data, newProgram['adress_elidek'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Program inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_program.html", pageTitle = "Create Program", form = form)

@app.route("/program/delete/<int:org_id>", methods = ["POST"])
def deleteProgram(prog_id):
    """
    Delete program by id from database
    """
    query = f"DELETE FROM programs WHERE id = {prog_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Program deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

@app.route("/phone_numbers/create", methods = ["GET", "POST"]) ## "GET" by default
def createPhone_Numbers():
    """
    Create new phone numbers in the database
    """
    form = Phone_NumbersForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newPhone_Number = form.__dict__
        query = "INSERT INTO `phone_numbers`(`phone_number`,`org_id`) VALUES ('{}', '{}');".format(newPhone_Number['phone_number'].data, newPhone_Number['org_id'].data )
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("New Phone_Number inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_phone_numbers.html", pageTitle = "Create Phone_Numbers", form = form)

@app.route("/phone_numbers/delete/<int:org_id>", methods = ["POST"])
def deletePhone_Numbers(org_id):
    """
    Delete phone_number by id from database
    """
    query = f"DELETE FROM phone_numbers WHERE id = {org_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Phone_Number deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500

@app.route("/executive/create", methods = ["GET", "POST"]) ## "GET" by default
def createExecutive():
    
    form = ExecutiveForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newExecutive = form.__dict__
        query = "INSERT INTO `executives`(`exec_name`) VALUES ('{}');".format(newExecutive['exec_name'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Executive inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_executive.html", pageTitle = "Create Executive", form = form)

@app.route("/executive/delete/<int:exec_id>", methods = ["POST"])
def deleteExecutive(exec_id):
    
    query = f"DELETE FROM executive WHERE id = {exec_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Executive deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.route("/project/create", methods = ["GET", "POST"]) ## "GET" by default
def createProject():
    
    form = ProjectForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newProject = form.__dict__
        query = "INSERT INTO `projects`(`proj_id`,`title`,`cost`,`summary`,`start_date`,`finish_date`,`evaluator_id`,`eval_points`,`eval_creation_date`,`exec_id`,`prog_id`,`org_id`,`mgr_id`) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}'};".format(newProject['title'].data, newProject['cost'].data, newProject['summary'].data, newProject['start_date'].data, newProject['finish_date'].data, newProject['org_id'].data, newProject['evaluator_id'].data, newProject['prog_id'].data, newProject['exec_id'].data, newProject['mgr_id'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Project inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_project.html", pageTitle = "Create Project", form = form)

@app.route("/projects/delete/<int:proj_id>", methods = ["POST"])
def deleteProject(proj_id):
   
    query = f"DELETE FROM project WHERE id = {proj_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Project deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.route("/sfield/create", methods = ["GET", "POST"]) ## "GET" by default
def createSfield():
    
    form = SfieldForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newSfield = form.__dict__
        query = "INSERT INTO `scientific_fields`(`sfield_name`) VALUES ('{}', '{}');".format(newSfield['sfield_name'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Scientific field inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_sfield.html", pageTitle = "Create Scientific field", form = form)

@app.route("/sfield/delete/<int:sfield_id>", methods = ["POST"])
def deleteSfield(sfield_id):
    
    query = f"DELETE FROM sfield WHERE id = {sfield_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Scientific field deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.route("/deliverables/create", methods = ["GET", "POST"]) ## "GET" by default
def createDeliverables():
  
    form = DeliverablesForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newDeliverables = form.__dict__
        query = "INSERT INTO `deliverables`(`proj_id`,`title`,`summary`,`delivery_date`) VALUES ('{}', '{}', '{}', '{}');".format(newDeliverables['proj_id'].data, newDeliverables['title'].data, newDeliverables['summary'].data, newDeliverables['delivery_date'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Deliverable inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_deliverable.html", pageTitle = "Create Deliverable", form = form)

@app.route("/deliverables/delete/<int:del_id>", methods = ["POST"])
def deleteDeliverables(del_id):
    
    query = f"DELETE FROM deliverables WHERE id = {del_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Deliverables deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.route("/belongs_to_field/create", methods = ["GET", "POST"]) ## "GET" by default
def createBelongs_to_field():
  
    form = Belongs_to_fieldForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newBelongs_to_field = form.__dict__
        query = "INSERT INTO `belongs_to_field`(`proj_id`,`sfield_id`) VALUES ('{}', '{}');".format(newBelongs_to_field['proj_id'].data, newBelongs_to_field['sfield_id'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Belongs_to_Field inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_belongs_to_field.html", pageTitle = "Create Belongs_to_field", form = form)

@app.route("/belongs_to_field/delete/<int:del_id>", methods = ["POST"])
def deletbelongs_to_field(proj_id):
    
    query = f"DELETE FROM deliverables WHERE id = {proj_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Belongs_to_field deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))

@app.route("/works_on/create", methods = ["GET", "POST"]) ## "GET" by default
def createWorks_on():
  
    form = Works_onForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newWorks_on = form.__dict__
        query = "INSERT INTO `belongs_to_field`(`proj_id`,`res_id`) VALUES ('{}', '{}');".format(newWorks_on['proj_id'].data, newWorks_on['res_id'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Works_on inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_works_on.html", pageTitle = "Create Works_on", form = form)

@app.route("/works_on/delete/<int:del_id>", methods = ["POST"])
def deletworks_on(proj_id):
    
    query = f"DELETE FROM works_on WHERE id = {proj_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Works_on deleted successfully")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("getDatabase"))
