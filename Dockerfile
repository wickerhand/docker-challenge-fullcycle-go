FROM golang:alpine3.14 as builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go


## Deploy
## Strach base debian, serve para imagens super mínimas(Que contém apenas um único binários)
FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT ["/main"]