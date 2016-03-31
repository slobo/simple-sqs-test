```
docker build -t slobo/simple-sqs-request .
docker run -it --rm slobo/simple-sqs-request /src/sqs-request.pl http://192.1.2.34:6789
# or, with debugging
docker run -it --rm -e DEBUG=1 slobo/simple-sqs-request /src/sqs-request.pl http://192.1.2.34:6789
```

