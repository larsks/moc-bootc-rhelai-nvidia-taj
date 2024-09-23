To generate a qcow2 image from this repository:

1. Build the container image:

    ```
    sudo podman build -t rhelai-nvidia:1.1 .
    ```

    You need to build the image as root because the following
    `bootc-image-builder` step must run as `root`, and it won't be able to see
    the image if you built it as an unprivileged user.

2. Use [`bootc-image-builder`](https://github.com/osbuild/bootc-image-builder)
   to generate the qcow2 image:

    ```
    mkdir -p output
    sudo podman run \
      --rm \
      -it \
      --privileged \
      --pull=newer \
      --security-opt label=type:unconfined_t \
      -v "$PWD:/output" \
      -v /var/lib/containers/storage:/var/lib/containers/storage \
      "quay.io/centos-bootc/bootc-image-builder:latest" \
      --type qcow2 \
      --local \
      localhost/moc-rhelai-nvidia:1.1
    ```

    When the process completes, you will find the disk image in `output/qcow2/disk.qcow2`.
