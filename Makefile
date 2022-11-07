init:
	@make remove
	@make up
	@make dependencies

dependencies:
	@make import-db
	@make composer
	@make fix-perms
	@make frontend
	@make deactivate-imageoptimizer

up:
	@ddev start

down:
	@ddev stop

restart:
	@ddev restart

remove:
	@make down
	@ddev remove

ssh:
	@ddev ssh

composer-update:
	@ddev composer update
	@make deactivate-imageoptimizer

composer:
	@ddev composer install
	@make deactivate-imageoptimizer

import-db:
	@ddev db-restore

export-db:
	@ddev db-backup

frontend:
	@ddev warmup-frontend

grunt-dist:
	@ddev grunt dist

grunt-watch:
	@ddev grunt watch

tcc:
	@ddev t3cache

grunt:
	ddev grunt dist

grunt-watch:
	ddev grunt watch

logs:
	@ddev logs

help:
	@ddev help

xdebug-enable:
	ddev exec enable_xdebug

xdebug-disable:
	ddev exec disable_xdebug

test:
	ddev test-acceptance

fix-perms:
	ddev exec sudo chmod -R 0777 /var/www/html/var

deactivate-imageoptimizer:
	@ddev typo3 extensionmanager:extension:uninstall imageoptimizer


