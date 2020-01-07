FROM openjdk:8-slim

WORKDIR /mc_server
COPY ./server .
WORKDIR /mc_data

# Copy files only if they don't yet exist (server.jar, server.properties, etc) and start the server
CMD for file in $(ls /mc_server); do if test ! -s $file; then echo "copying $file" && cp -r /mc_server/$file .; fi; done && java -Xmx"$MAX_RAM"G -Xms"$MIN_RAM"G -jar server.jar nogui