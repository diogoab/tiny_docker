# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o hello.go

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/hello.go /app/
ENTRYPOINT ./hello.go
