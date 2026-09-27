# Claude Desktop for Fedora

Run **Claude Desktop**, Anthropic's AI assistant app, natively on Fedora Linux.

Anthropic only ships Claude Desktop for Linux as a `.deb` package (Debian/Ubuntu). This repo provides a ready-to-install **`.rpm`** so Fedora users can install it like any other app — with a menu launcher, system tray icon, and the global quick-entry hotkey (**Ctrl+Alt+Space**).

> **Unofficial.** This package is not made, endorsed, or supported by Anthropic. The app inside is Anthropic's official Claude Desktop, unmodified except for a few small Linux compatibility fixes, and is subject to [Anthropic's Consumer Terms](https://www.anthropic.com/legal/consumer-terms).

## Download & install

### Option 1 — one command

```bash
curl -fsSL https://raw.githubusercontent.com/youseefsamamrah/claude-desktop-fedora/main/install.sh | bash
```

This downloads the latest `.rpm` from the [Releases page](https://github.com/youseefsamamrah/claude-desktop-fedora/releases/latest) and installs it with `dnf` (you'll be asked for your password).

### Option 2 — manual

1. Go to the [latest release](https://github.com/youseefsamamrah/claude-desktop-fedora/releases/latest).
2. Download the file ending in `.x86_64.rpm`.
3. Install it:
   ```bash
   sudo dnf install ./claude-desktop-unofficial-*.x86_64.rpm
   ```

## Usage

Open **Claude** from your app menu (press the Super key and type "Claude"), then sign in with your Claude account.

From a terminal:

```bash
claude-desktop-unofficial            # start the app
claude-desktop-unofficial --doctor   # diagnose problems
```

## Update

Run the install command again — it always fetches the newest release.

## Uninstall

```bash
sudo dnf remove claude-desktop-unofficial
```

Your settings are kept in `~/.config/Claude`; delete that folder too for a full cleanup.

## Requirements

- Fedora (tested on Fedora 44), x86_64
- A Claude account

## Credits & license

The package is built with the open-source build scripts from [aaddrick/claude-desktop-debian](https://github.com/aaddrick/claude-desktop-debian), dual-licensed under [MIT](LICENSE-MIT) and [Apache 2.0](LICENSE-APACHE).

Claude Desktop itself is © Anthropic and subject to [Anthropic's Consumer Terms](https://www.anthropic.com/legal/consumer-terms).
