from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from elidekdb import app, db ## initially created by __init__.py, need to be used here
from elidekdb.forms import StudentForm ## CHANGE THIS LATER!!!

## THIS IS THE LANDING PAGE! EVERYTHING WILL BE SHOWN HERE!!! I'LL CHANGE LATER 
@app.route("/")
def index():
    try:
        ## create connection to database
        cur = db.connection.cursor()
        ## execute query
        cur.execute("SELECT g.grade, s.name, s.surname FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'DRI' ORDER BY g.grade DESC LIMIT 1")
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        res = dict(zip(column_names, cur.fetchone()))
        best_dribbling_grade = res.get("grade")
        best_dribbler = res.get("name") + " " + res.get("surname")

        cur.execute("SELECT g.grade, s.name, s.surname FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'SHO' ORDER BY g.grade DESC LIMIT 1")
        res = dict(zip(column_names, cur.fetchone()))
        cur.close()
        best_shooting_grade = res.get("grade")
        best_shooter = res.get("name") + " " + res.get("surname")

        return render_template("landing.html",
                               pageTitle = "Landing Page",
                               best_dribbling_grade = best_dribbling_grade,
                               best_dribbler = best_dribbler,
                               best_shooting_grade = best_shooting_grade,
                               best_shooter = best_shooter)
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Landing Page")



## Let's try Q3.2) (fingers_crossed) :)
## 1st VIEW ---> ProjofRes
@app.route("/ProjofRes")
def getProjofRes():

    """
    Retrieve View of projects/researchers from database

    """
    try:
        form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM projectsofResearchers")
        column_names = [i[0] for i in cur.description]
        ProjofRes = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("ProjofRes.html", ProjofRes = ProjofRes, pageTitle = "ProjofRes Page", form = form)
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
        form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM researchersInOrganisation;")
        column_names = [i[0] for i in cur.description]
        resInOrg = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("resInOrg.html", resInOrg = resInOrg, pageTitle = "resInOrg Page", form = form)
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

## Let's try Q3.3) (fingers_crossed) :)
@app.route("/Popular")
def getPopular():

    """
    Retrieve PopularProjects/Researchers from database

    """
    try:
        form = StudentForm() ## CHANGE THIS LATER!!!
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

## Let's try Q3.6) (fingers_crossed) :)
@app.route("/NoDeliverables")
def getNoDeliverables():

    """
    Retrieve Projects with NoDeliverables from database

    """
    try:
        form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT CONCAT(r.first_name, ' ', r.last_name) 'Researcher', COUNT(p.proj_id) 'Number of active Projects' FROM researchers r JOIN works_on wo ON wo.res_id = r.res_id JOIN projects p ON p.proj_id = wo.proj_id WHERE (DATE_SUB(CURRENT_DATE(), INTERVAL 40 YEAR) < birth_date) AND CURRENT_DATE() BETWEEN p.start_date and p.finish_date GROUP BY r.res_id")
        column_names = [i[0] for i in cur.description]
        NoDeliverables = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("NoDeliverables.html", NoDeliverables = NoDeliverables, pageTitle = "NoDeliverables Page", form = form)
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
        form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("SELECT exec_name 'Executive', name 'Organisation', SUM(cost) 'Cost' FROM projects p JOIN executives e ON p.exec_id = e.exec_id JOIN organisations o ON o.org_id = p.org_id WHERE category = 'Company' GROUP BY exec_name, name ORDER BY exec_name, SUM(cost) DESC LIMIT 5;")
        column_names = [i[0] for i in cur.description]
        TopExec = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("TopExec.html", TopExec = TopExec, pageTitle = "TopExec Page", form = form)
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
        form = StudentForm() ## CHANGE THIS LATER!!!
        cur = db.connection.cursor()
        cur.execute("")
        column_names = [i[0] for i in cur.description]
        NoDeliverables = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("NoDeliverables.html", NoDeliverables = NoDeliverables, pageTitle = "NoDeliverables Page", form = form)
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
