ARG NVIDIA_IMAGE_VERSION=1.1
FROM registry.redhat.io/rhelai1/bootc-nvidia-rhel9:${NVIDIA_IMAGE_VERSION}

COPY override.conf /etc/systemd/system/bootc-generic-growpart.service.d/override.conf

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
