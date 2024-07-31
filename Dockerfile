FROM ubuntu:latest as build

# Set the working directory
WORKDIR /wisecowapp

# Install the application dependencies
RUN apt-get update -y && \
    apt-get install -y git cowsay fortune netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the application script
COPY wisecow.sh /wisecowapp/wisecow.sh

# Make the script executable
RUN chmod +x /wisecowapp/wisecow.sh

# Multistage
FROM ubuntu:latest

# Set the working directory
WORKDIR /wisecowapp

# Set environment variables
ENV PATH="$PATH:/usr/games"

# Copy the necessary files from the build
COPY --from=build /wisecowapp/wisecow.sh /wisecowapp/wisecow.sh

# Install runtime dependencies only
RUN apt-get update -y && \
    apt-get install -y cowsay fortune netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV PATH="$PATH:/usr/games"
# Expose the application port
EXPOSE 4499

# Set the entry point for the container
CMD ["./wisecow.sh"]
