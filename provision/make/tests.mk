test.help:
	@echo '    Tests:'
	@echo ''
	@echo '        test                      show help'
	@echo '        test run={module}         Run module test'
	@echo '        test.all   	             Run all module test'
	@echo '        test.picked               run test only commit'
	@echo '        test.lint                 Run all pre-commit'
	@echo '        test.lint.docker          Run all pre-commit in docker'
	@echo '        test.syntax               Run all syntax in code'
	@echo '        test.validate             Run all validation fixture dead in code'
	@echo ''

test:
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	@if [ -z "${run}" ]; then \
		make test.help;\
	fi
	@if [ -n "${run}" ]; then \
		$(docker-test-run) bash -c "$(PIPENV_RUN) pytest ${run}";\
	fi

test.all:
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	$(docker-test-run) bash -c "$(PIPENV_RUN) pytest"

test.picked:
	$(docker-test-run) bash -c "$(PIPENV_RUN) pytest --picked"

test.validate:
	@echo $(MESSAGE) Running tests validation fixture $(END)
	$(docker-test-run) bash -c "$(PIPENV_RUN) pytest --dead-fixtures"

test.lint:
	$(PIPENV_RUN) pre-commit run --all-files --verbose

test.lint.docker:
	$(docker-dev-run) check sh -c "$(PIPENV_RUN) pre-commit run --all-files --verbose"

test.syntax:
	@echo $(MESSAGE) Running tests $(END)
