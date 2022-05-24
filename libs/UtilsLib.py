from time import time


__version__ = '1.0'
__scope__ = 'GLOBAL'


class UtilsLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    def get_current_date(self) -> str:
        return str(int(time()))