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
