FROM openjdk:8-slim

WORKDIR /mc_server
COPY ./server .

RUN groupadd -r minecraft && useradd --no-log-init -r -g minecraft minecraft
USER minecraft
WORKDIR /mc_data
# Copy files only if they don't yet exist (server.jar, server.properties, etc) and start the server
CMD for file in $(ls /mc_server); do if test ! -s $file; then echo "copying $file" && cp -r /mc_server/$file .; fi; done && \
java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads="$THREADS" -XX:+AggressiveOpts -Xmx"$MAX_RAM"G -Xms"$MIN_RAM"G -jar server.jar nogui