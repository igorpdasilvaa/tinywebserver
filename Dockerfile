# build stage
FROM golang:1.12-alpine AS build-env
ADD . /src
RUN cd /src && go build -o goapp

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/goapp /app/
EXPOSE 3000
ENTRYPOINT ./goapp
