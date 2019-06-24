#
# See ./CONTRIBUTING.rst
#
.PHONY: utils.help

utils.help:
	@echo '    utils:'
	@echo ''
	@echo '        utils                      help utils'
	@echo '        utils.generate             generate key ssh by env'
	@echo '        utils.convert              convert id_rsa to pem by env'
	@echo ''

utils: clean
	make utils.help

utils.generate: clean
	ssh-keygen -t rsa -b 4096 -C "admin@${PROJECT}-${env}.com"

utils.convert: clean
	openssl rsa -in "${PROJECT}-${env}" -outform pem > "${PROJECT}-${env}".pem
	chmod 0400 "${PROJECT}-${env}".pem
