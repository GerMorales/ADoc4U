from core.pyba_logic import PybaLogic


class AdminLogic(PybaLogic):
    def __init__(self):
        super().__init__()

    def insertAdmin(self, adminName, adminEmail, password, salt):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `heroku_83c89d7d77e295e`.`admin` "
            + "(`id`,`admin_email`,`password`,`salt`) "
            + f"VALUES(0,'{adminName}','{adminEmail}','{password}','{salt}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAdminByEmail(self, adminEmail):
        database = self.createDatabaseObj()
        sql = (
            "SELECT admin_name, admin_email, password, salt "
            + f"FROM heroku_83c89d7d77e295e.admin where admin_email like '{adminEmail}';"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []

    def insertVenta(self, emailDr, idUser, idMedicina, nombreMed, precio, estado):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `heroku_83c89d7d77e295e`.`ventamedicina` "
            + "(`id`, `email_dr`, `id_user`,`id_medicina`,`nombreMed`,`Precio`,`estadoVenta`) "
            + f"VALUES(0,'{emailDr}','{idUser}','{idMedicina}','{nombreMed}','{precio}','{estado}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows
