FROM golang:1.22-bookworm

WORKDIR /app

COPY . .

RUN go build -o server .

EXPOSE 8080

CMD ["./server"]