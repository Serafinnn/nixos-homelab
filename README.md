# NixOS Homelab

*Infrastructure as Code for my personal homelab.*

## Goal

Goal for this project is to have a declarative and simple way to create, manage and use private machines. Needed services should be stored as modules. If a machine requires docker module present it will be just one import line in *default.nix* inside that hosts directory. Testing and deploying new applications or services should require least possible steps.

Also a learning experience.

When I finish this anyone shuld be able to use this repo to start their own homelab.

## Hosts

Hardware that I can get from random marketplaces/firends/family.

- k72jr
- ideapad

## Road map ish

- [x] Default server config
- [x] Secrets
- [x] Tailscale
- [x] Wifi
- [x] Docker
- [x] Restic
- [ ] Storage
- [ ] Kubernetes
- [ ] GitHub Actions
- [ ] Flux
- [ ] Monitoring
- [ ] Probably something else that I did not think of
