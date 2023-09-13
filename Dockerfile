FROM golang:1.20 as build

COPY ./ /go/src/bitbucket.code.company-name.com.au/scm/code/
WORKDIR /go/src/bitbucket.code.company-name.com.au/scm/code/

RUN go build main.go
FROM scratch 
WORKDIR /
COPY --from=build /go/src/bitbucket.code.company-name.com.au/scm/code/main /main
user nonroot:nonroot
EXPOSE 8000
ENTRYPOINT ["/main"]
