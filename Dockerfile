# Stage 1
FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o app

# Stage 2
FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD ["./app"]