import requests


class MtgRestApi:
    def __init__(self):
        self.base = "https://api-helio.herokuapp.com"
        self.endpoint = ""
        self.params = {}

    def getMedicina(self):
        self.endpoint = "/medicinas"
        response = requests.get(self.base + self.endpoint)
        medicinas = []
        if response.status_code == 200:
            medicinasJson = response.json()
            medicinas = medicinasJson
        return medicinas

    def getMedicinaById(self, id):
        self.endpoint = "/medicinas/"
        response = requests.get(self.base + self.endpoint + id)
        medicina = []
        if response.status_code == 200:
            medicinaJson = response.json()
            medicina = medicinaJson
        return medicina

    def getEmpresas(self):
        self.endpoint = "/empresas"
        response = requests.get(self.base + self.endpoint)
        empresas = []
        if response.status_code == 200:
            empresasJson = response.json()
            empresas = empresasJson
        return empresas

    def getHospitales(self):
        self.endpoint = "/hospitales"
        response = requests.get(self.base + self.endpoint)
        hospitales = []
        if response.status_code == 200:
            hospitalesJson = response.json()
            hospitales = hospitalesJson
        return hospitales
