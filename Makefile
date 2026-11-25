ENV_FILE := /home/mcoreai/.config/mcore/predictive-ais001.env
up:
	docker compose --env-file $(ENV_FILE) up -d --build
down:
	docker compose --env-file $(ENV_FILE) down
test:
	pytest -v test_memory_security.py
verify:
	@test ! -f .env
	@git fetch origin main --quiet
	@test "$$(git rev-parse HEAD)" = "$$(git rev-parse origin/main)"
	@echo "STATUS: VERIFIED — Local and Remote SHA Match."
