# OneKVM wireguard extension

Installs wireguard-tools and onekvm-kernel-module-wireguard. WireGuard interfaces stay in OneKVM network settings; this package does not run a resident service.

The manifest, health command, assets, and payload installation rules belong to
this repository. `oe-recipes/` contains its OpenEmbedded layer; the distro pins
both source and layer with `kas/components.lock`.

Build the IPK from `onekvm-distro`:

```sh
make ONEKVM_MACHINE=onekvm-nanokvm build extension wireguard
```

To stage the payload locally:

```sh
make install DESTDIR=/tmp/onekvm-wireguard-stage PREFIX=/data/onekvm/apps/wireguard/0.1.0 VERSION=0.1.0 ARCH=riscv64
```

The extension remains disabled by default. OneKVM settings own configuration;
the health command does not change network interfaces or firewall policy.

License: `MIT` for the extension; MIT for OE layer metadata.
