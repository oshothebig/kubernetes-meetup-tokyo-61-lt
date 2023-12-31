.PHONY: deploy
deploy:
	kind create cluster --config kind-config.yaml
	sudo containerlab deploy
	cilium install --version v1.13.7 --values values.yaml
	cilium status --wait

.PHONY: destroy
destroy:
	sudo containerlab destroy
	kind delete cluster
