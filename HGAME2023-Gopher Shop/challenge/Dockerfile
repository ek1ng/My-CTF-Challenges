FROM golang:alpine as builder

WORKDIR /app
ADD . .
ENV GOPROXY=https://goproxy.cn,direct
RUN go build ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main /app/
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/config.toml /app/

ENTRYPOINT ["/app/main"]
