from core.pyba_logic import PybaLogic


class FormLogic(PybaLogic):
    def __init__(self):
        super().__init__()

    def insertForm(
        self, userEmail, date, address, birthdate, sex, status, postal, tel, cel
    ):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `heroku_83c89d7d77e295e`.`forms` "
            + "(`id`,`user_email`,`date`,`address`,`birthdate`,`sex`,`status`,`postal`,`tel`,`cel`) "
            + f"VALUES(0,'{userEmail}','{date}','{address}','{birthdate}','{sex}','{status}','{postal}', '{tel}', '{cel}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getFormByEmail(self, userEmail):
        database = self.createDatabaseObj()
        sql = (
            "SELECT user_email, date, address, birthdate, sex, status, postal, tel, cel "
            + f"FROM heroku_83c89d7d77e295e.forms where user_email like '{userEmail}';"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []

    def getAllForms(self):
        database = self.createDatabaseObj()
        sql = "SELECT * " + f"FROM heroku_83c89d7d77e295e.forms;"
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result
        else:
            return []
