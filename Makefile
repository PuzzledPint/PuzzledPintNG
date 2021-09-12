
MYSQL_VERSION=5.7
WORDPRESS_VERSION=latest

MYSQL_CONTAINER_NAME=puzzledpintng_db_1
WORDPRESS_CONTAINER_NAME=puzzledpintng_wordpress_1
MYSQL_ROOT_PASSWORD=mypassword

HERE=$(shell PWD)

help:
	@echo ""
	@echo "Build Targets:"
	@echo ""
	@echo "    Bootstrapping::"
	@echo "        bootstrap - Set up Docker services, load DB."
	@echo "        clean - Remove containers and volumes."
	@echo ""
	@echo "    Development Services:"
	@echo "        start - Start the WordPress and MySQL."
	@echo "        stop - Stop them."
	@echo ""
	@echo "    Database Persistence:"
	@echo "        dbsave - Save the current database to database.sql."
	@echo "        dbload - Import the current database from database.sql."
	@echo ""
	@echo "    Advanced:"
	@echo "        dbshell - Bash shell into the MySQL container."
	@echo "        wpshell - Bash shell into the WordPress container."

startdb:
	docker compose start db

startwp:
	docker compose start wordpress

start: startdb startwp

stop:
	docker compose stop

dbsave: startdb
	docker exec -it $(MYSQL_CONTAINER_NAME) bash -c "mysqldump -uroot -p$(MYSQL_ROOT_PASSWORD) wordpress | gzip > /data/database.sql.gz"

dbload: startdb
	docker exec -it $(MYSQL_CONTAINER_NAME) mysql -uroot -p$(MYSQL_ROOT_PASSWORD) --execute "drop database if exists wordpress"
	docker exec -it $(MYSQL_CONTAINER_NAME) mysql -uroot -p$(MYSQL_ROOT_PASSWORD) --execute "create database wordpress"
	docker exec -it $(MYSQL_CONTAINER_NAME) bash -c "zcat /data/database.sql.gz | mysql -uroot -p$(MYSQL_ROOT_PASSWORD) wordpress"

bootstrap:
	docker compose create
	$(MAKE) start
	@echo "Waiting 10 seconds for the system to start and stabilize..."
	@sleep 10
	@echo "Loading archived database..."
	$(MAKE) dbload
	@echo ""
	@echo "You can now connect to WordPress on http://localhost:8080/wp-admin/"
	@echo "Log in with admin/admin"
	@echo ""

clean: stop
	docker compose rm --force
	docker volume rm puzzledpintng_db_data

dbshell: startdb
	docker exec -it $(MYSQL_CONTAINER_NAME) bash

wpshell: start
	docker exec -it $(WORDPRESS_CONTAINER_NAME) bash

