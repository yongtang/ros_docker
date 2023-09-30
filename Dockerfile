FROM ros:foxy-ros1-bridge

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
        git \
        curl \
        gpsd \
        udev \
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
        ros-noetic-urg-node \
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
        ros-noetic-image-transport-plugins \
        ros-noetic-nmea-msgs \
        ros-noetic-roslint \
        ros-noetic-tf2 && \
    DEBIAN_FRONTEND=noninteractive apt-get -y -q upgrade && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Slamtec/rplidar_sdk.git /opt/rplidar_sdk && (cd /opt/rplidar_sdk && make)

RUN mkdir -p /opt/ros_catkin && \
    git clone https://github.com/osrf/autodock.git /opt/ros_catkin/src/autodock && \
    git clone https://github.com/jackal/jackal_robot.git -b noetic-devel /opt/ros_catkin/src/jackal_robot && \
    sed -i.bak 's/115200/57600/g' /opt/ros_catkin/src/jackal_robot/jackal_base/src/jackal_base.cpp
RUN bash -x -e -c '. /opt/ros/noetic/setup.bash && cd /opt/ros_catkin && catkin_make_isolated --install --ignore-pkg autodock_examples autodock_sim --cmake-args -DCMAKE_BUILD_TYPE=Release'

RUN python3 -m pip install -U pip -vvv
RUN python3 -m pip install -r requirements.txt
