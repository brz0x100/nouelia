# Fedora Nouelia &nbsp; [![bluebuild build badge](https://github.com/brz0x100/nouelia/actions/workflows/build.yml/badge.svg)](https://github.com/brz0x100/nouelia/actions/workflows/build.yml)

Fedora Nouelia (`nouelia`) is a custom [bootc](https://docs.fedoraproject.org/en-US/bootc/) image that ships the [Niri](https://github.com/YaLTeR/niri) 
Wayland compositor with [Noctalia](https://noctalia.dev/shell) Shell out of the box.

## Installation

### Rebasing

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing Silverblue/Kinoite/Sericea installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/brz0x100/$IMAGE_NAME:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/brz0x100/$IMAGE_NAME:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

### Post-install

#### Nvidia
If you are using an nvidia image, run this after installation:

```
rpm-ostree kargs \
    --append-if-missing=rd.driver.blacklist=nouveau \
    --append-if-missing=modprobe.blacklist=nouveau \
    --append-if-missing=nvidia-drm.modeset=1 \
    --append-if-missing=nvidia-drm.fbdev=1
```

You may also need this (solves flickering and LUKS issues on some nvidia hardware):
```
rpm-ostree kargs \
    --append-if-missing=initcall_blacklist=simpledrm_platform_driver_init
```

#### Nvidia optimus laptop
If you are using an nvidia image on an optimus laptop, run this after installation:

```
ujust configure-nvidia-optimus
```

#### Secure Boot
Run:

```
ujust enroll-secure-boot-key
```

and then reboot. Follow the text to enroll the key.

#### Locale

Since noctalia-greeter would enters a TTY environment transitorily, the locale forcibly set to en_US.

To set your locale manually, create a service `~/.config/systemd/user/force-locale.service` like this:

```
[Unit]
Description=Force Locale for User Session
Before=graphical-session.target

[Service]
Type=oneshot
ExecStart=/usr/bin/systemctl --user set-environment LANG=YOUR_LOCALE.UTF-8
RemainAfterExit=yes

[Install]
WantedBy=graphical-session.target
```

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/brz0x100/$IMAGE_NAME
```
