# pros_dabai_camera

This repository is based on[pros_AI_image](https://github.com/otischung/pros_AI_image/tree/master).

The Docker image is based on  `ghcr.io/otischung/pros_ai_image:1.3.6`

## How to use

To set up the camera bridge, run the following script:

```
./ros_camera_dabai_setup
```

You can use the Docker network `scripts_my_bridge_network` to retrieve camera information.

To use the ROS bridge, run the following script:
```
./ros_bridge_setup
```