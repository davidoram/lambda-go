build:
	GOOS=linux GOARCH=amd64 go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o build/bin/app .

init:
	cd infra && terraform init

plan:
	cd infra &&  terraform plan

apply:
	cd infra && terraform apply --auto-approve

destroy:
	cd infra && terraform destroy --auto-approve