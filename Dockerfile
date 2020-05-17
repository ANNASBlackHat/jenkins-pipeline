# build stage
FROM golang:alpine AS builder
#RUN apk --no-cache add build-base git bzr mercurial gcc
WORKDIR /src
COPY go.mod .
COPY go.sum .
RUN GO111MODULE=on go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app server.go

#final stage
FROM alpine
COPY config/ /config
COPY .env .
COPY --from=builder src/app ./
ENTRYPOINT ["./app"]
