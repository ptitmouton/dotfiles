import sys
from typing import Any, Callable, Generic, Optional, TypeVar

_T = TypeVar('_T')

class CallableProxyType(object):  # "weakcallableproxy"
    def __getattr__(self, attr: str) -> Any: ...

class ProxyType(object):  # "weakproxy"
    def __getattr__(self, attr: str) -> Any: ...

class ReferenceType(Generic[_T]):
    if sys.version_info >= (3, 4):
        __callback__: Callable[[ReferenceType[_T]], Any]
    def __init__(self, o: _T, callback: Callable[[ReferenceType[_T]],
                                                 Any] = ...) -> None: ...
    def __call__(self) -> Optional[_T]: ...
    def __hash__(self) -> int: ...

ref = ReferenceType

def getweakrefcount(object: Any) -> int: ...
def getweakrefs(object: Any) -> int: ...
def proxy(object: _T, callback: Callable[[_T], Any] = ...) -> ref[_T]: ...