FROM golang:1.22-bookworm AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o server .

FROM scratch

COPY --from=builder /app/server /server

COPY --from=builder /app/templates /templates

EXPOSE 8080

CMD ["./server", "serve"]