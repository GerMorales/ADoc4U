from flask import session, render_template
from logic.form_logic import FormLogic
from logic.appointment_logic import AppointmentLogic


class FunctionAdminRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/appointments")
        def appointments():
            email = session.get("login_email_admin")
            logic = AppointmentLogic()
            appointmentsUsers = logic.getAllApointments()
            return render_template(
                "appointments.html", appointmentsUsers=appointmentsUsers, email=email
            )

        @app.route("/patients")
        def patients():
            email = session.get("login_email_admin")
            logic = FormLogic()
            infoPatients = logic.getAllForms()
            return render_template(
                "patients.html", infoPatients=infoPatients, email=email
            )
