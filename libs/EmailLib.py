from requests import get
from robot.api.deco import keyword


__version__ = '1.0'
__scope__ = 'GLOBAL'


class EmailLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    @keyword
    def get_random_email(self) -> str:
        email = get(
            "https://www.1secmail.com/api/v1/?action=genRandomMailbox&count=1").json()[0]
        print("EMAIL CRIADO: "+email)
        return email
