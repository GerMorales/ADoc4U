from core.pyba_logic import PybaLogic


class UserLogic(PybaLogic):
    def __init__(self):
        super().__init__()

    def insertUser(self, userName, userEmail, password, salt):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `doctordb`.`user` "
            + "(`id`,`user_name`,`user_email`,`password`,`salt`) "
            + f"VALUES(0,'{userName}','{userEmail}','{password}','{salt}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getUserByEmail(self, userEmail):
        database = self.createDatabaseObj()
        sql = (
            "SELECT id, user_name, user_email, password, salt "
            + f"FROM doctordb.user where user_email like '{userEmail}';"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []

    def getUserById(self, userId):
        database = self.createDatabaseObj()
        sql = f"SELECT user_name FROM doctordb.user where id like '{userId}';"
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []

    def getRecetaByUser(self, userId, estado):
        database = self.createDatabaseObj()
        sql = f"SELECT * FROM doctordb.ventamedicina where id_user like '{userId}' and estadoVenta like '{estado}';"
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result
        else:
            return []

    def getRecetaCuenta(self, userId, estado):
        database = self.createDatabaseObj()
        sql = f"SELECT sum(Precio) as Total FROM doctordb.ventamedicina  where id_user like '{userId}' and estadoVenta like '{estado}' group by id_user;"
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result[0]
        else:
            return []

    def updateRecetaCuenta(self, userId, estado, newEstado):
        database = self.createDatabaseObj()
        sql = f"UPDATE `doctordb`.`ventamedicina` SET `estadoVenta` = '{newEstado}' WHERE `id_user` = '{userId}' and `estadoVenta` = '{estado}';"
        rows = database.executeNonQueryRows(sql)
        return rows

    def deleteRecetaCuenta(self, userId, estado):
        database = self.createDatabaseObj()
        sql = f"DELETE FROM `doctordb`.`ventamedicina` WHERE `id_user` = '{userId}' and `estadoVenta` = '{estado}';"
        rows = database.executeNonQueryRows(sql)
        return rows
