FROM ros:foxy-ros1-bridge

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
        git \
        curl \
        gpsd \
        potrace \
        dmidecode \
        imagemagick\
        gpsd-clients \
        ffmpeg \
        python3-pip \
        ros-foxy-gpsd-client \
        ros-foxy-teleop-twist-joy \
        ros-foxy-robot-localization \
        ros-noetic-cv-camera \
        ros-noetic-gpsd-client \
        ros-noetic-teleop-twist-joy \
        ros-noetic-rplidar-ros \
        ros-noetic-jackal-msgs \
        ros-noetic-jackal-control \
        ros-noetic-jackal-description \
        ros-noetic-rosserial-python \
        ros-noetic-rosserial-server \
        ros-noetic-microstrain-3dmgx2-imu \
        ros-noetic-microstrain-inertial-driver \
        ros-noetic-joint-state-publisher \
        ros-noetic-robot-state-publisher \
        ros-noetic-robot-localization \
        ros-noetic-navigation \
        ros-noetic-ros-control \
        ros-noetic-slam-gmapping \
        ros-noetic-nmea-msgs \
        ros-noetic-roslint \
        ros-noetic-tf2 && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q upgrade && rm -rf /var/lib/apt/lists/*
