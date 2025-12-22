# SPDX-License-Identifier: AGPL-3.0-or-later
# Containerfile — estate-ssg container image

FROM docker.io/library/debian:bookworm-slim

LABEL org.opencontainers.image.title="estate-ssg"
LABEL org.opencontainers.image.description="The DEFINITIVE Forth static site generator"
LABEL org.opencontainers.image.source="https://github.com/hyperpolymath/estate-ssg"
LABEL org.opencontainers.image.licenses="AGPL-3.0-or-later"

# Install gforth
RUN apt-get update && \
    apt-get install -y --no-install-recommends gforth && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy Forth source
COPY src/forth-estate.fs /app/src/

# Create volume mount points
VOLUME ["/content", "/output", "/templates"]

# Default command: build site
ENTRYPOINT ["gforth", "/app/src/forth-estate.fs", "-e"]
CMD ["s\" /content\" s\" /output\" build-site bye"]
