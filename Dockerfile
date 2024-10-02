FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o fullcycle home.go

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]