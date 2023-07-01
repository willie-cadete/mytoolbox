.PHONY: install lint docs servedocs clean clean-test clean-docs clean-build test build

install: clean
	flit install --symlink

lint:
	black src/mytoolbox tests --check
	isort src/mytoolbox tests --check-only
	flake8 src/mytoolbox
	mypy src/mytoolbox

docs:
	mkdocs build

servedocs: docs
	mkdocs serve

clean: clean-pyc clean-test clean-docs clean-build

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	rm -rf .mypy_cache/

clean-test:
	rm -rf .pytest_cache/

clean-docs:
	rm -rf site/

clean-build:
	rm -rf dist/

test:
	pytest -v

build: clean
	flit build --format wheel
	ls -l dist
