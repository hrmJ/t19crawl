FROM ubuntu:18.04
ENV DOCKER_USER developer

RUN apt-get update && \
    apt-get install -y sudo && \
    adduser --disabled-password --gecos '' "$DOCKER_USER" && \
    adduser "$DOCKER_USER" sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    touch /home/$DOCKER_USER/.sudo_as_admin_successful && \
    rm -rf /var/lib/apt/lists/*

USER "$DOCKER_USER"

WORKDIR "/home/$DOCKER_USER"

RUN sudo apt-get update && \
    sudo apt-get install -y python3.6 && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y python3-pip chromium-browser python3-selenium chromium-chromedriver && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y git && \
    sudo rm -rf /var/lib/apt/lists/*


RUN sudo apt-get update && \
    sudo apt-get install -y python3-yaml && \
    sudo rm -rf /var/lib/apt/lists/*



ENV PATH="/home/$DOCKER_USER/.local/bin:${PATH}"

RUN pip3 install python-dotenv


RUN sudo apt update && \
    sudo apt install -y locales && \
    sudo apt install -y locales-all && \
    sudo rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sudo sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sudo locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

RUN pip3 install ipdb


RUN pip3 install git+https://github.com/tunicorpora/webcorpcrawler && echo "updateds."
