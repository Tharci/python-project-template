from src.project_name import Module


def test_module() -> None:
    x = Module().x()
    assert x == 1
