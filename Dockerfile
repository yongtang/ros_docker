FROM ros:foxy-ros1-bridge

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
        git \
        gpsd \
        potrace \
        dmidecode \
        imagemagick\
        python3-pip \
        ros-foxy-gpsd-client \
        ros-foxy-teleop-twist-joy \
        ros-foxy-robot-localization \
        ros-noetic-gpsd-client \
        ros-noetic-teleop-twist-joy \
        ros-noetic-jackal-msgs \
        ros-noetic-jackal-description \
        ros-noetic-rosserial-python \
        ros-noetic-microstrain-3dmgx2-imu \
        ros-noetic-joint-state-publisher \
        ros-noetic-navigation && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q upgrade && rm -rf /var/lib/apt/lists/*
