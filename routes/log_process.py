from flask import request, render_template, redirect, session, flash
from logic.user_logic import UserLogic
from logic.admin_logic import AdminLogic
from tools.recaptcha import RecaptchaHelper
import bcrypt


class LogProcessRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/login", methods=["GET", "POST"])
        def login():
            data = {}
            if request.method == "GET":
                flash("Bienvenido a nuestros servicios médicos en línea", "login")
                return render_template("login.html")
            elif request.method == "POST":
                recHelper = RecaptchaHelper(request)
                if recHelper.validateRecaptcha():
                    logic = UserLogic()
                    userEmail = request.form["email"]
                    password = request.form["password"]
                    userDict = logic.getUserByEmail(userEmail)

                    if request.form["email"] == "" or request.form["password"] == "":
                        flash(
                            "Por favor llenar todos los campos para continuar o registrarse si no se tiene cuenta",
                            "error",
                        )
                        return redirect("login")
                    else:
                        if userDict == []:
                            logic = AdminLogic()
                            adminEmail = request.form["email"]
                            password = request.form["password"]
                            adminDict = logic.getAdminByEmail(adminEmail)
                            if adminDict == []:
                                flash("No pudimos verificar las credenciales", "error")
                                flash(
                                    "Asegurate de usar un usuario y una contraseña correctas",
                                    "error",
                                )
                                return render_template("login.html")
                            else:
                                salt = adminDict["salt"].encode("utf-8")
                                hashPasswd = bcrypt.hashpw(
                                    password.encode("utf-8"), salt
                                )
                                dbPasswd = adminDict["password"].encode("utf-8")
                        else:
                            salt = userDict["salt"].encode("utf-8")
                            hashPasswd = bcrypt.hashpw(password.encode("utf-8"), salt)
                            dbPasswd = userDict["password"].encode("utf-8")

                        if hashPasswd == dbPasswd:
                            if userDict == []:
                                session["login_email_admin"] = adminEmail
                                session["loggedIn"] = True
                                return redirect("add_adm")
                            else:
                                session["login_email_client"] = userEmail
                                session["user"] = userDict["user_name"]
                                session["loggedIn"] = True
                                return redirect("add_client")
                        else:
                            flash("Datos incorrectos", "error")
                            return redirect("login")
                else:
                    flash("Por favor complete la caja de seguridad", "error")
                    return redirect("login")

        @app.route("/logout")
        def logout():
            if (
                session.get("loggedIn")
                and session.get("login_email_client") is not None
            ):
                session.pop("login_email_client")
                session.pop("loggedIn")
                return redirect("login")
            elif (
                session.get("loggedIn") and session.get("login_email_admin") is not None
            ):
                session.pop("login_email_admin")
                session.pop("loggedIn")
                return redirect("login")
            else:
                return redirect("login")
