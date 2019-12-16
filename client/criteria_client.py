#!/usr/bin/python
import json
import os
import asyncio
import requests
from requests.auth import HTTPBasicAuth


class C(object):
    def __init__(self, username='', password='', auth_header='Authorization', api_host='http://localhost:8000',
                 api_version='0', loop=asyncio.get_event_loop()):
        self._username = username
        self._password = password
        self._auth_header = auth_header
        self.api_host = api_host
        self.api_version = api_version
        self.loop = loop
        self.url = api_host + '/api/' + api_version + '/'
        self.headers = {'Content-Type': 'application/json'}

    #######Method GET####################

    def get_criteria(self, path='', criteria_id=None):
        if isinstance(criteria_id, type(None)):
            response = requests.get(
                url=self.url + path + '/',
                auth=HTTPBasicAuth(self._username, self._password),
                headers=self.headers
            )
        else:
            response = requests.get(
                url=self.url + path + '/' + criteria_id + '/',
                auth=HTTPBasicAuth(self._username, self._password),
                headers=self.headers,
            )
        return response

    ######Method POST########################

    def create_criteria(self, path='', data={}):
        response = requests.post(
            url=self.url + path + '/',
            auth=HTTPBasicAuth(self._username, self._password),
            data=json.dumps(data),
            headers=self.headers
        )
        return response

    ##############Method PATCH#############

    def update_criteria(self, criteria_id, path='', data={}):
        response = requests.patch(
            url=self.url + path + '/' + criteria_id + '/',
            auth=HTTPBasicAuth(self._username, self._password),
            headers=self.headers,
            data=json.dumps(data)
        )
        return response

    ##########Method DELETE###################

    def delete_criteria(self, criteria_id, path=''):
        response = requests.delete(
            url=self.url + path + '/' + criteria_id + '/',
            auth=HTTPBasicAuth(self._username, self._password),
            headers=self.headers
        )
        return response
