IMAGE=docker-registry.apps.eformat.nz/openshift/piccaport
IMAGE_OS=172.30.150.212:5000/openshift/piccaport

.PHONY: build clean push deploy destroy local

build:
	docker build -t piccaport .

clean:
	docker rmi piccaport

push: build
	docker tag -f piccaport $(IMAGE)
	docker push $(IMAGE)

deploy: push template.yaml
	oc process -f template.yaml -v IMAGE=$(IMAGE_OS) > template.active
	oc create -f template.active

destroy: template.active
	oc delete -f template.active
	rm template.active

local: build
	docker run --rm -p 8080:8080 piccaport
