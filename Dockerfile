FROM openjdk:8-slim

COPY server.jar /server.jar

RUN groupadd -r minecraft -g 2000
RUN useradd --no-log-init minecraft -u 2000 -g 2000 -m
WORKDIR /mc_data
RUN chown -R minecraft:minecraft .

USER minecraft
# Copy files only if they don't yet exist (server.jar, server.properties, etc) and start the server
CMD java -Xmx"$MAX_RAM"G -Xms"$MIN_RAM"G -jar /server.jar nogui
