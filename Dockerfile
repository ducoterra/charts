FROM openjdk:8-slim

COPY server.jar /server.jar

RUN groupadd -r minecraft && useradd --no-log-init -r -g minecraft minecraft
WORKDIR /mc_data
RUN chown -R minecraft:minecraft .

USER minecraft
# Copy files only if they don't yet exist (server.jar, server.properties, etc) and start the server
CMD java -Xmx"$MAX_RAM"G -Xms"$MIN_RAM"G -jar /server.jar nogui