init:
	pip install -e .

.PHONY: help
help:
	@echo "clean - remove build artifacts"
	@echo "lint  - check style with flake8"
	@echo "test  - runs tests with pytest"
	@echo "dev   - installs dev dependencies"

.PHONY: clean
clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr contract_data/
	rm -fr *.egg-info
	rm -fr .pytest_cache

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '*pycache__' -exec rm -rf {} +

.PHONY: lint
lint:
	flake8 plasma plasma_core testlang tests

.PHONY: test
test:
	python -m pytest tests/contracts/root_chain/test_submit_block.py
	rm -fr .pytest_cache

.PHONY: test_quick
test_quick:
	python -m pytest -m "not slow" -n auto
	rm -fr .pytest_cache

.PHONY: conctest
conctest:
	python -m pytest -n auto
	rm -fr .pytest_cache

.PHONY: runslow
runslow:
	python -m pytest -m "slow" 
	rm -fr .pytest_cache

.PHONY: dev
dev:
	pip install -e .[dev]
