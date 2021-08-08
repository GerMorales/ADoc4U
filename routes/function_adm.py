from flask import session, render_template, request, flash
from logic.form_logic import FormLogic
from logic.appointment_logic import AppointmentLogic
from logic.api_logic import MtgRestApi
from logic.user_logic import UserLogic
from logic.admin_logic import AdminLogic


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

        # Me faltan bucles y crear BDs
        @app.route("/receta_adm", methods=["GET", "POST"])
        def receta_adm():
            if request.method == "GET":
                email = session.get("login_email_admin")
                logic = MtgRestApi()
                infoMedicina = logic.getMedicina()
                return render_template(
                    "receta_adm.html",
                    infoMedicina=infoMedicina,
                    email=email,
                )
            elif request.method == "POST":
                #  Obteninedo datos de el form
                id_paciente = request.form.get("id_cita")
                medicinaToUser = request.form.getlist("medicinas")
                # Bucle por si no agregan nada
                if id_paciente == "" or medicinaToUser == []:
                    email = session.get("login_email_admin")
                    logic = MtgRestApi()
                    infoMedicina = logic.getMedicina()
                    flash(
                        f"Por favor llene todos los campos y seleccione las medicinas",
                        "succes",
                    )
                    return render_template(
                        "receta_adm.html",
                        infoMedicina=infoMedicina,
                        email=email,
                    )
                else:
                    session["medicinas"] = medicinaToUser
                    email = session.get("login_email_admin")
                    # LLamando los logic
                    logic = MtgRestApi()
                    idLogic = UserLogic()
                    ventaLogic = AdminLogic()
                    # Buscando el usuario por el id en la BDs
                    usuario = idLogic.getUserById(id_paciente)
                    if usuario == []:
                        email = session.get("login_email_admin")
                        logic = MtgRestApi()
                        infoMedicina = logic.getMedicina()
                        flash(
                            f"Este usuario no existe, verifique la información",
                            "succes",
                        )
                        return render_template(
                            "receta_adm.html",
                            infoMedicina=infoMedicina,
                            email=email,
                        )
                    elif len(medicinaToUser) > 4:
                        email = session.get("login_email_admin")
                        logic = MtgRestApi()
                        infoMedicina = logic.getMedicina()
                        flash(
                            f"Solo se pueden asignar 4 medicamentos a la vez",
                            "succes",
                        )
                        return render_template(
                            "receta_adm.html",
                            infoMedicina=infoMedicina,
                            email=email,
                        )
                    else:
                        email = session.get("login_email_admin")
                        logic = MtgRestApi()
                        infoMedicina = logic.getMedicina()
                        usuarioName = usuario["user_name"]
                        # Llamando info de la api para el form
                        infoMedicina = logic.getMedicina()
                        # guardando los datos de las medicinas al usuario en la BDs
                        for x in medicinaToUser:
                            medicina = logic.getMedicinaById(x)
                            idMedicina = int(medicina["idmedicinas"])
                            nombreMed = medicina["nombremed"]
                            precioMed = str(medicina["preciosmed"])
                            venta = ventaLogic.insertVenta(
                                email,
                                id_paciente,
                                idMedicina,
                                nombreMed,
                                precioMed,
                                "Pendiente",
                            )
                        flash(
                            f"Todo se guardo con exito para la receta de {usuarioName}",
                            "succes",
                        )
                        return render_template(
                            "receta_adm.html",
                            medicinaToUser=medicinaToUser,
                            email=email,
                            infoMedicina=infoMedicina,
                        )

        @app.route("/prov")
        def prov():
            email = session.get("login_email_admin")
            logic = MtgRestApi()
            empresas = logic.getEmpresas()
            return render_template("prov.html", empresas=empresas, email=email)
