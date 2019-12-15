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