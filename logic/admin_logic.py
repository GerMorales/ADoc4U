from core.pyba_logic import PybaLogic


class AdminLogic(PybaLogic):
    def __init__(self):
        super().__init__()

    def insertAdmin(self, adminName, adminEmail, password, salt):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `doctorbd`.`admin` "
            + "(`id`,`admin_email`,`password`,`salt`) "
            + f"VALUES(0,'{adminName}','{adminEmail}','{password}','{salt}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAdminByEmail(self, adminEmail):
        database = self.createDatabaseObj()
        sql = (
            "SELECT admin_name, admin_email, password, salt "
            + f"FROM doctordb.admin where admin_email like '{adminEmail}';"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []
