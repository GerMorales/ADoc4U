from flask import request, render_template, redirect, flash
from logic.user_logic import UserLogic
import bcrypt


class RegisterRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/register", methods=["GET", "POST"])
        def register():
            if request.method == "GET":
                flash(
                    "Registrate para poder hacer uso de nuestros servicios médicos en línea",
                    "login",
                )
                return render_template("register.html")
            elif request.method == "POST":
                if (
                    request.form["name"] == ""
                    or request.form["email"] == ""
                    or request.form["password"] == ""
                    or request.form["confpassword"] == ""
                ):
                    flash("Por favor introduzca todos los datos solicitados", "error")
                    return redirect("register")
                else:
                    logic = UserLogic()
                    name = request.form["name"]
                    email = request.form["email"]
                    password = request.form["password"]
                    confpassword = request.form["confpassword"]
                    if password == confpassword:
                        salt = bcrypt.gensalt(rounds=14)
                        strSalt = salt.decode("utf-8")
                        encPasswd = password.encode("utf-8")
                        hashPasswd = bcrypt.hashpw(encPasswd, salt)
                        strPasswd = hashPasswd.decode("utf-8")
                        rows = logic.insertUser(name, email, strPasswd, strSalt)
                        flash(
                            "Se ha registrado exitosamente, ya puede iniciar sesión",
                            "login",
                        )
                        return redirect("login")
                    else:
                        flash(
                            "Por favor verificar que las contraseñas coincidan", "error"
                        )
                        return redirect("register")