# my-bench

This is a simple benchmarking tool for comparing the performance a web application.

**Note:** Do not use this tool for DOS attacks. This tool is only for benchmarking purposes.

## Requirements

- [Apache Bench](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [Bombardier](https://github.com/codesenberg/bombardier)

## Installation

```bash
$ sudo apt install apache2-utils
$ go install github.com/codesenberg/bombardier@latest
```

## Usage

```bash
$ ./bench.sh [ab|bombardier] [target_url]
```

## Example

```bash
$ ./bench.sh ab http://localhost:8080
```

## Docker

```bash
$ docker build -t my-bench .
$ docker run -it --rm my-bench bombardier http://localhost:8080
```

## License

MIT
