# -*- coding: utf-8 -
import os
import random
import hashlib
from datetime import timedelta
from tempfile import NamedTemporaryFile
from uuid import uuid4
from faker import Factory
from faker.providers.company.en_US import Provider as CompanyProviderEnUs
from faker.providers.company.ru_RU import Provider as CompanyProviderRuRu
from munch import munchify
from data.op_faker.op_faker import OP_Provider

fake_en = Factory.create(locale='en_US')
fake_ru = Factory.create(locale='ru_RU')
fake_uk = Factory.create(locale='uk_UA')
fake_uk.add_provider(OP_Provider)
fake = fake_uk
used_identifier_id = []
mode_open =     ["belowThreshold", "aboveThresholdUA", "aboveThresholdEU",
                "aboveThresholdUA.defense", "competitiveDialogueUA", "competitiveDialogueEU", "esco"]
mode_limited =  ["reporting", "negotiation.quick", "negotiation"]
violationType = ["corruptionDescription", "corruptionProcurementMethodType", "corruptionChanges",
                "corruptionPublicDisclosure", "corruptionBiddingDocuments", "documentsForm",
                "corruptionAwarded", "corruptionCancelled", "corruptionContracting"]

# This workaround fixes an error caused by missing "catch_phrase" class method
# for the "ru_RU" locale in Faker >= 0.7.4
fake_ru.add_provider(CompanyProviderEnUs)
fake_ru.add_provider(CompanyProviderRuRu)


def create_fake_sentence():
    return fake.sentence(nb_words=10, variable_nb_words=True)


def create_fake_funder():
    return fake.funders_data()


def get_fake_funder_scheme():
    return fake.funder_scheme()


def create_fake_amount(award_amount):
    return round(random.uniform(1, award_amount), 2)


def create_fake_number(min_number, max_number):
    return random.randint(int(min_number), int(max_number))


def create_fake_title():
    return u"[ТЕСТУВАННЯ] {}".format(fake.title())


def create_fake_date():
    return get_now().isoformat()


def create_fake_period(days=0, hours=0, minutes=0):
    data = {
        "startDate": get_now().isoformat(),
        "endDate": (get_now() + timedelta(days=days, hours=hours, minutes=minutes)).isoformat()
    }
    return data


def subtraction(value1, value2):
    if "." in str (value1) or "." in str (value2):
        return (float (value1) - float (value2))
    else:
        return (int (value1) - int (value2))


def create_fake_value_amount():
    return fake.random_int(min=1)

def get_number_of_minutes(days, accelerator):
    return 1440 * int(days) / accelerator

def field_with_id(prefix, sentence):
    return u"{}-{}: {}".format(prefix, fake.uuid4()[:8], sentence)


def translate_country_en(country):
    if country == u"Україна":
        return "Ukraine"
    else:
        raise Exception(u"Cannot translate country to english: {}".format(country))


def convert_amount(amount):
    return  (("{:,}".format(float (amount))).replace(',',' ').replace('.',','))


def translate_country_ru(country):
    if country == u"Україна":
        return u"Украина"
    else:
        raise Exception(u"Cannot translate country to russian: {}".format(country))


def create_fake_doc():
    content = fake.text()
    suffix = fake.random_element(('.doc', '.docx', '.pdf'))
    prefix = "{}-{}{}".format("d", fake.uuid4()[:8], fake_en.word())
    tf = NamedTemporaryFile(delete=False, suffix=suffix, prefix=prefix)
    tf.write(content)
    tf.close()
    return tf.name.replace('\\', '\\\\'), os.path.basename(tf.name), content


def create_fake_IsoDurationType(
        years=0, months=0, days=0,
        hours=0, minutes=0, seconds=0):
    return u"P{}Y{}M{}DT{}H{}M{}S".format(
        years, months, days,
        hours, minutes, seconds
    )


def data_for_criteria():
    return munchify(
        {
            "name": create_fake_title(),
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


def data_for_edit():
    return munchify(
        {
            "name": "Name123",
            "minValue": "11",
            "maxValue": "23",
            "status": "active"
        }
    )

def munch_dict(arg=None, data=False):
    if arg is None:
        arg = {}
    if data:
        arg['data'] = {}
    return munchify(arg)