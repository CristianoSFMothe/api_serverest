from faker import Faker

fake = Faker()


def factory_auth_user():
    user_auth = {
        "email": "fulano@qa.com",
        "password": "teste"
    }

    return user_auth


def factory_login_invalid_user_or_password():
    invalid_user_or_pass = {
        "email": "fulano@qa2.com",
        "password": "teste"
    }

    return invalid_user_or_pass


def factory_create_user():
    nome = fake.name()
    email = fake.email()
    password = fake.password()

    user_create = {
        "nome": nome,
        "email": email,
        "password": password,
        "administrador": "true"
    }

    return user_create
