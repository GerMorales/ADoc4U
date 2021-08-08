from flask import session, request, render_template, flash
from logic.form_logic import FormLogic
from logic.appointment_logic import AppointmentLogic


class FunctionUserRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/initialForm", methods=["GET", "POST"])
        def initialForm():
            name = session.get("user")
            if request.method == "GET":
                return render_template("initialForm.html", name=name)
            elif request.method == "POST":
                if (
                    request.form["date"] == ""
                    or request.form["address"] == ""
                    or request.form["datebirth"] == ""
                    or request.form["sex"] == ""
                    or request.form["civil"] == ""
                    or request.form["cp"] == ""
                    or request.form["tel"] == ""
                    or request.form["cel"] == ""
                ):
                    flash(
                        "Por favor complete todos los datos",
                        "succes",
                    )
                    return render_template("initialForm.html", name=name)
                else:
                    logic = FormLogic()
                    userEmail = session.get("login_email_client")
                    date = request.form["date"]
                    address = request.form["address"]
                    birthdate = request.form["datebirth"]
                    sex = request.form["sex"]
                    status = request.form["civil"]
                    postal = request.form["cp"]
                    tel = request.form["tel"]
                    cel = request.form["cel"]
                    rows = logic.insertForm(
                        userEmail,
                        date,
                        address,
                        birthdate,
                        sex,
                        status,
                        postal,
                        tel,
                        cel,
                    )
                    flash(
                        "Sus datos han sido completados satisfactoriamente, continue disfrutando de nuestros servicios",
                        "succes",
                    )
                    return render_template("initialForm.html", name=name)

        @app.route("/cataloge")
        def cataloge():
            name = session.get("user")
            return render_template("cataloge.html", name=name)

        @app.route("/appointment", methods=["GET", "POST"])
        def appointment():
            name = session.get("user")
            userEmail = session.get("login_email_client")
            if request.method == "GET":
                logic = AppointmentLogic()
                appointments = logic.getAppointmentByEmail(userEmail)
                return render_template(
                    "appointment.html", appointments=appointments, name=name
                )
            elif request.method == "POST":
                if (
                    request.form["date1"] == ""
                    or request.form["hour"] == ""
                    or request.form["reason"] == ""
                ):
                    logic = AppointmentLogic()
                    appointments = logic.getAppointmentByEmail(userEmail)
                    flash("Por favor ingrese todos sus datos", "succes")
                    return render_template(
                        "appointment.html", appointments=appointments, name=name
                    )
                else:
                    logic = AppointmentLogic()
                    date = request.form["date1"]
                    time = request.form["hour"]
                    specialty = request.form["especialidad"]
                    doctor = request.form["doctores"]
                    reason = request.form["reason"]
                    rows = logic.insertAppointment(
                        userEmail, date, time, specialty, doctor, reason
                    )
                    flash("Su cita a sido agendada exitosamente", "succes")
                    logic = AppointmentLogic()
                    appointments = logic.getAppointmentByEmail(userEmail)
                    return render_template(
                        "appointment.html", appointments=appointments, name=name
                    )
