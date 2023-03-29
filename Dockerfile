# syntax=docker/dockerfile:1
FROM golang:1.20-alpine

LABEL org.opencontainers.image.source=https://github.com/rzauls/pingpong
LABEL org.opencontainers.image.description="Hello world of github actions, with a container image"

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY main.go ./

RUN go build -o /pingpong-server

CMD [ "/pingpong-server" ]
