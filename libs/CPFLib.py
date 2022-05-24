from requests import post
from requests.structures import CaseInsensitiveDict

__version__ = '1.0'
__scope__ = 'GLOBAL'


class CPFLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    def get_random_cpf(self) -> str:
        url = "https://www.4devs.com.br/ferramentas_online.php"
        headers = CaseInsensitiveDict()
        headers["content-type"] = "application/x-www-form-urlencoded; charset=UTF-8"
        data = "acao=gerar_cpf&pontuacao=S&cpf_estado="
        cpf = post(url, headers=headers, data=data).text
        return str(cpf)
