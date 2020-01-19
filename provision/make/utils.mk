#
# See ./CONTRIBUTING.rst
#
.PHONY: utils.help

utils.help:
	@echo '    utils:'
	@echo ''
	@echo '        utils                      help utils'
	@echo '        utils.generate             generate key ssh by stage'
	@echo ''

utils:
	make utils.help

utils.generate:
	ssh-keygen -q -m PEM -t rsa -b 4096 -C "admin@${PROJECT}-${stage}.com" -f ${PROJECT}-${stage} -P ""
	openssl rsa -in ${PROJECT}-${stage} -outform pem > ${PROJECT}-${stage}.pem
	chmod 0600 ${PROJECT}-${stage}.pem
	cp -rf ${PROJECT}-${stage}.pem ${KEYS_PEM_DIR}
	cp -rf ${PROJECT}-${stage}.pub ${KEYS_PUB_DIR}
	cp -rf ${PROJECT}-${stage}.pub ${KEYS_PRIVATE_DIR}
	cp -rf ${PROJECT}-${stage} ${KEYS_PRIVATE_DIR}
