MODULE=github.com/jan-g/proto
TOPDIR=$(shell echo "$(MODULE)" | sed -e 's|/.*$$||')

.PHONY: clean
clean:
	rm -rf d1/model/github.com d2/model/github.com
	rm -rf d1/model/foo.pb.go d2/model/bar.pb.go
	rm -rf d1/model/d1 d2/model/d2

.PHONY: proto
proto: clean d1/model/foo.pb.go d2/model/bar.pb.go

%.pb.go: %.proto
	$(GO) protoc --proto_path=. --proto_path=./vendor --go_out=plugins=grpc:$(@D) $<
	mv $(@D)/$(MODULE)/$(@) $(@D)
	rm -r $(@D)/$(TOPDIR)

test:
	go run main.go
