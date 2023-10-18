.PHONY: generate
generate: containerlab frr

.PHONY: containerlab
containerlab:
	ansible-playbook --diff -i inventory.yaml containerlab.yaml

.PHONY: frr
frr:
	ansible-playbook --diff -i inventory.yaml frr-config.yaml
