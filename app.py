from flask import Flask, render_template, request, redirect, session
from routes.main import MainRoutes
from routes.log_process import LogProcessRoutes
from routes.dashboard import DashboardRoutes
from routes.register import RegisterRoutes
from routes.function_user import FunctionUserRoutes
from routes.function_adm import FunctionAdminRoutes
import bcrypt


app = Flask(__name__)
app.secret_key = "hola_:P"

MainRoutes.configure_routes(app)
LogProcessRoutes.configure_routes(app)
DashboardRoutes.configure_routes(app)
RegisterRoutes.configure_routes(app)
FunctionUserRoutes.configure_routes(app)
FunctionAdminRoutes.configure_routes(app)

if __name__ == "__main__":
    app.run(debug=True)
