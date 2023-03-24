# syntax=docker/dockerfile:1

FROM golang:1.20-alpine


WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY main.go ./

RUN go build -o /pingpong-server

CMD [ "/pingpong-server" ]
