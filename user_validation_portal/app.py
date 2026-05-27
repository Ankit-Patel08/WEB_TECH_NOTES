from flask import Flask, render_template, request
from datetime import datetime

app = Flask(__name__)


# =====================================================
# HOME PAGE
# =====================================================

@app.route('/')
def home():
    return render_template('index.html')


# =====================================================
# LOGIN VALIDATION
# =====================================================

@app.route('/login', methods=['POST'])
def login():

    user_id = request.form['userid']
    password = request.form['password']
    dob = request.form['dob']

    # EMPTY VALIDATION
    if user_id == "" or password == "" or dob == "":
        return render_template(
            'error.html',
            message="All fields are required"
        )

    # PASSWORD VALIDATION
    if len(password) < 6:
        return render_template(
            'error.html',
            message="Password must contain at least 6 characters"
        )

    # EMAIL VALIDATION
    if "@" not in user_id:
        return render_template(
            'error.html',
            message="User ID must contain @"
        )

    # VALID USER
    if user_id == "admin" and password == "admin123":

        birth_date = datetime.strptime(dob, "%Y-%m-%d")

        today = datetime.today()

        age = today.year - birth_date.year

        if (
            today.month,
            today.day
        ) < (
            birth_date.month,
            birth_date.day
        ):
            age -= 1

        return render_template(
            'success.html',
            userid=user_id,
            dob=dob,
            age=age
        )

    # INVALID USER
    else:

        return render_template(
            'error.html',
            message="Invalid User ID or Password"
        )


# =====================================================
# MAIN
# =====================================================

if __name__ == '__main__':
    app.run(debug=True)