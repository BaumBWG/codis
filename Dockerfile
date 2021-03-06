FROM golang:1.6

RUN apt-get update -y

# Add codis
Add . /go/src/github.com/CodisLabs/codis/
WORKDIR /go/src/github.com/CodisLabs/codis/

# Install dependency
RUN ./bootstrap.sh
WORKDIR /go/src/github.com/CodisLabs/codis/sample

# Expose ports
EXPOSE 19000
EXPOSE 11000
EXPOSE 18087

CMD ./startall.sh && tail -f log/*
