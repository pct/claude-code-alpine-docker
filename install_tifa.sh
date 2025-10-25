#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing Tifa..."

echo "Building Docker image..."
docker build -t tifa "$SCRIPT_DIR" 2>/dev/null || {
    echo "Failed to build Docker image"
    exit 1
}

echo "Creating tifa command..."
cat > /tmp/tifa << 'EOF'
#!/bin/sh
docker run --rm -it -v "$(pwd):/work" -w /work tifa "$@"
EOF

echo "Installing tifa to /usr/local/bin..."
sudo mv /tmp/tifa /usr/local/bin/tifa
sudo chmod +x /usr/local/bin/tifa

echo "Tifa installed successfully!"
echo "You can now use 'tifa' command from any directory"