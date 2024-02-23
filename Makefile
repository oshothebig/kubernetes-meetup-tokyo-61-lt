.PHONY: deploy
deploy:
	kind create cluster --config kind-config.yaml
	sudo containerlab deploy
	cilium install --version v1.15.1 --values values.yaml
	cilium status --wait
	kubectl apply -f manifests/cilium-bgp.yaml

.PHONY: destroy
destroy:
	sudo containerlab destroy
	kind delete cluster
