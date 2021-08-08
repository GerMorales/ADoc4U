from core.pyba_logic import PybaLogic


class AppointmentLogic(PybaLogic):
    def __init__(self):
        super().__init__()

    def insertAppointment(self, userEmail, date, time, specialty, doctor, reason):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `heroku_83c89d7d77e295e`.`appointment` "
            + "(`id`,`user_email`,`date`,`time`,`specialty`,`doctor`,`reason`) "
            + f"VALUES(0,'{userEmail}','{date}','{time}','{specialty}','{doctor}','{reason}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAppointmentByEmail(self, userEmail):
        database = self.createDatabaseObj()
        sql = (
            "SELECT * "
            + f"FROM heroku_83c89d7d77e295e.appointment where user_email like '{userEmail}';"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result
        else:
            return []

    def getAllApointments(self):
        database = self.createDatabaseObj()
        sql = "SELECT * " + f"FROM heroku_83c89d7d77e295e.appointment;"
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result
        else:
            return []
