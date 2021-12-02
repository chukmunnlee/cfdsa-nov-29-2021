package main

# should not deploy to default namespace
warn[msg] {
	not input.metadata.namespace
	msg := sprintf("%s %s is deployed to default namespace", [ input.kind, input.metadata.name ])
}

warn[msg] {
	"default" = input.metadata.namespace
	msg := sprintf("%s %s is deployed to default namespace", [ input.kind, input.metadata.name ])
}

# should never user latest tag
deny[msg] {
	"Deployment" = input.kind
	endswith(input.spec.template.spec.containers[_].image, ":latest")
	msg := sprintf("%s %s is using latest tag", [ input.kind, input.metadata.name ])

}

# deploy should select proper pod labels
deny[msg] {
	some key
		i = input.spec.selector.matchLabels[key]
		not i = input.spec.template.metadata.labels[key]
	msg := sprintf("%s %s selectors does not match pod", [ input.kind, input.metadata.name ])
}
