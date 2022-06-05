from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired ## Something here 

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class ProjectsForm(FlaskForm):
    title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])

    cost = StringField(label = "Cost", validators = [DataRequired(message = "Cost is a required field.")])

    summary = StringField(label = "Summary", validators = [DataRequired(message = "Summary is a required field.")])

    start_date = StringField(label = "Start_date", validators = [DataRequired(message = "Start_date is a required field.")])

    finish_date = StringField(label = "Finish_date", validators = [DataRequired(message = "Finish_date is a required field.")])

    evaluator_id = StringField(label = "Evaluator_id", validators = [DataRequired(message = "Evaluator_id is a required field.")])

    eval_points = StringField(label = "Eval_points", validators = [DataRequired(message = "Eval_points is a required field.")])

    eval_creation_date = StringField(label = "Evaluator_id", validators = [DataRequired(message = "Evaluator_id is a required field.")])

    exec_id = StringField(label = "Exec_id", validators = [DataRequired(message = "Exec_id is a required field.")])

    prog_id = StringField(label = "Prog_id", validators = [DataRequired(message = "Prog_id is a required field.")])

    org_id = StringField(label = "Org_id", validators = [DataRequired(message = "Org_id is a required field.")])

    mgr_id = StringField(label = "Mgr_id", validators = [DataRequired(message = "Mgr_id is a required field.")])

    submit = SubmitField("Create") 

class OrganisationForm(FlaskForm):
    abbreviation = StringField(label = "Abbreviation", validators = [DataRequired(message = "Abbreviation is a required field.")])

    name = StringField(label = "name", validators = [DataRequired(message = "name is a required field.")])

    street = StringField(label = "street", validators = [DataRequired(message = "street is a required field.")])

    zipcode = StringField(label = "zipcode", validators = [DataRequired(message = "zipcode is a required field.")])

    city = StringField(label = "city", validators = [DataRequired(message = "city is a required field.")])

    category = StringField(label = "category", validators = [DataRequired(message = "category is a required field.")])

    budget = StringField(label = "budget", validators = [DataRequired(message = "budget is a required field.")])

    submit = SubmitField("Create") 

class ResearchersForm(FlaskForm):

    first_name = StringField(label = "first_name", validators = [DataRequired(message = "first_name is a required field.")])

    last_name = StringField(label = "last_name", validators = [DataRequired(message = "last_name is a required field.")])

    gender = StringField(label = "gender", validators = [DataRequired(message = "gender is a required field.")])

    birth_date = StringField(label = "birth_date", validators = [DataRequired(message = "birth_date is a required field.")])

    employment_date = StringField(label = "employment_date", validators = [DataRequired(message = "employment_date is a required field.")])

    org_id = StringField(label = "organisation_id", validators = [DataRequired(message = "organisation_id is a required field.")])

    submit = SubmitField("Create")

class ProgramForm(FlaskForm):
    name = StringField(label = "name", validators = [DataRequired(message = "name is a required field.")])

    address_elidek = StringField(label = "address_elidek", validators = [DataRequired(message = "address_elidek is a required field.")])

    submit = SubmitField("Create")
