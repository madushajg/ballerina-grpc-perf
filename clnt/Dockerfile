FROM openjdk:8
WORKDIR /home/ballerina
ADD ./target/bin/client.jar /home/ballerina
#ADD ./ballerina.conf /home/ballerina

EXPOSE  9092

CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=3 -jar client.jar \
    || cat ballerina-internal.log
