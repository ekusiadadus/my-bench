FROM golang:1.19
WORKDIR /app
COPY . .
RUN go install github.com/codesenberg/bombardier@latest && \
    apt update && \
    apt install apache2-utils && \
    chmod +x bench.sh
CMD [ "./bench.sh" ]