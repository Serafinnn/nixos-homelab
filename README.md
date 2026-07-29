# NixOS Homelab

*Infrastructure as Code for my personal homelab.*

## Goal

Goal for this project is to have a declarative and simple way to create, manage and use private machines. Needed services should be stored as modules. If a machine requires docker module present it will be just one import line in *default.nix* inside that hosts directory. Testing and deploying new applications or services shloud require least possible steps.

Also a learning experience.

When I finish this anyone shuld be able to use this repo to start their own homelab.

## Hosts

Laptops that I can get from random marketplaces for less than 100PLN. At least 4GB RAM. Preferably with a hard drive present.

- k72jr (old ASUS laptop)

## Road map ish

- [x] Default server config
- [x] Secrets
- [x] Tailscale
- [ ] Docker
- [ ] Kubernetes
- [ ] GitHub Actions
- [ ] Flux
- [ ] Monitoring
- [ ] Restic
- [ ] Probably something else that I did not think of
