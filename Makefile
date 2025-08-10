rails:
	docker compose run --rm trading_api rails $(CMD)

migrate:
	docker compose run --rm trading_api rails db:migrate
