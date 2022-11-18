docs:
	terraform-docs markdown --output-file README.md --output-mode inject .

test:
	cd test && go test . -v
