FROM alpine:latest
RUN apk update && apk add 
ENTRYPOINT ["sh","-c", "rc-status; rc-service sshd start; crond -f"]