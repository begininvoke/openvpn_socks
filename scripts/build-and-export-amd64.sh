#!/usr/bin/env sh
# Build image for linux/amd64, then save to a .tar file for loading on an AMD64 machine.

set -e

IMAGE_NAME="${1:-openvpn-socks:local}"
OUTPUT_TAR="${2:-openvpn-socks-amd64.tar}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$REPO_ROOT"

echo "Building for linux/amd64..."
docker build --platform linux/amd64 -t "$IMAGE_NAME" .

echo "Saving image to $OUTPUT_TAR..."
docker save -o "$OUTPUT_TAR" "$IMAGE_NAME"

echo "Done. To load on an AMD64 machine:"
echo "  docker load -i $OUTPUT_TAR"
echo "Then run with docker-compose or: docker run ... $IMAGE_NAME"
