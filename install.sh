#!/usr/bin/env bash
# Installs the latest Claude Desktop .rpm from this repo's GitHub Releases.
set -euo pipefail

REPO="youseefsamamrah/claude-desktop-fedora"

if ! command -v dnf >/dev/null; then
	echo "This installer requires dnf (Fedora/RHEL)." >&2
	exit 1
fi

if [ "$(uname -m)" != "x86_64" ]; then
	echo "Only x86_64 is supported right now." >&2
	exit 1
fi

echo "Finding the latest release..."
url=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" |
	grep -o '"browser_download_url": *"[^"]*\.x86_64\.rpm"' |
	head -1 | sed 's/.*"\(https[^"]*\)"/\1/')

if [ -z "$url" ]; then
	echo "Could not find an .rpm in the latest release." >&2
	exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "Downloading ${url##*/}..."
curl -fL --progress-bar "$url" -o "$tmp/${url##*/}"

echo "Installing (you may be asked for your password)..."
sudo dnf install -y "$tmp/${url##*/}"

echo "Done! Open 'Claude' from your app menu."
