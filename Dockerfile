FROM golang

FROM golang:latest AS builder

WORKDIR /go/src
COPY . .
RUN go build

FROM scratch

COPY --from=builder /go/src/hello .
ENTRYPOINT [ "./hello" ]