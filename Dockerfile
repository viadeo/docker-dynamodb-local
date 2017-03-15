FROM openjdk:7

WORKDIR /dynamodb

# Curl
RUN apt-get update && \
  apt-get -y install curl && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Download DynamoDB local
RUN curl -L https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz | tar xz

EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]

CMD ["-help"]
