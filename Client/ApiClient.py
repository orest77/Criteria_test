import json
import asyncio
import requests
from requests.auth import HTTPBasicAuth


class ClientCriteria(object):
    def __init__(self, password="", auth_header="Authorization", api_host="http://localhost:8000",
                 api_version="0", loop=asyncio.get_event_loop()):
        self.password = password
        self._auth = auth_header
        self.api_host = api_host
        self.api_version = api_version
        self.loop = loop
        self.url = api_host + "/api/" + api_version + "/"
        self.headers.update({self._auth: f"Token {password}",
                            'content-type': 'application/json'})

    #######Method GET####################

    def get_criteria(self, path="", criteria_id=None):
        if isinstance(criteria_id,  type(None)):
            url = self.url + path
        else:
            url = self.url + path + criteria_id
        headers = self.headers
        auth = HTTPBasicAuth(self.username, self.password)
        return requests.get(url, auth, headers)

    ######Method POST########################

    def create_criteria(self, path="", data={}):
        url = self.url + path
        headers = self.headers
        auth = HTTPBasicAuth(self.username, self.password)
        data = json.dumps(data)
        return requests.post(url, auth, data, headers)

    ##############Method PATCH#############

    def update_criteria(self, criteria_id, path="", data={}):
        url = self.url + path + criteria_id + '/',
        auth = HTTPBasicAuth(self._username, self._password),
        headers = self.headers,
        return requests.patch(url, auth, headers, data)

    ##########Method DELETE###################

    def delete_criteria(self, criteria_id, path=""):
        url = self.url + path + criteria_id,
        auth = HTTPBasicAuth(self._username, self._password),
        headers = self.headers
        return requests.delete(url, auth, headers)
