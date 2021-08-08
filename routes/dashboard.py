from flask import session, render_template, redirect


class DashboardRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/add_client")
        def add_client():
            if session.get("loggedIn"):
                name = session.get("user")
                return render_template("add_client.html", name=name)
            else:
                return redirect("login")

        @app.route("/add_adm")
        def add_adm():
            if session.get("loggedIn"):
                email = session.get("login_email_admin")
                return render_template("add_adm.html", email=email)
            else:
                return redirect("login")
