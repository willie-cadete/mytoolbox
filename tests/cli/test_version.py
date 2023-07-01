import pytest
from typer.testing import CliRunner

from mytoolbox import __app_name__, __version__, cli

runner = CliRunner()


@pytest.mark.parametrize("command", ["-V", "--version"])
def test_version(command):
    result = runner.invoke(cli.app, command)
    assert result.exit_code == 0
    assert f"{__app_name__} v{__version__}\n" in result.stdout
