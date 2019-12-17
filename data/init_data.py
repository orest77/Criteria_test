#!/usr/bin/python
from munch import munchify


def data_for_criteria():
    return munchify(
        {
            "name": "Name",
            "nameEng": "Name eng",
            "classification": {
                "id": "92350000-9",
                "scheme": "ДК021",
                "description": "Послуги гральних закладів і тоталізаторів"
            },
            "additionalClassification": {
                "id": "03114100-4",
                "scheme": "ДК021",
                "description": "Солома"
            },
            "minValue": "11",
            "maxValue": "22",
            "dataType": "number",
            "unit": {
                "name": "millilitre of water",
                "code": "WW"
            }
        }
    )

def munch_dict(arg=None, data=False):
    if arg is None:
        arg = {}
    if data:
        arg['data'] = {}
    return munchify(arg)