FOLDER="${HOME}/bin"

get_latest_release() {
    version=$(curl --silent "https://api.github.com/repos/$1/releases/latest" |
        grep '"tag_name":' |
        sed -E 's/.*"([^"]+)".*/\1/')
    echo https://github.com/$1/releases/download/$version
}

BOOT_2_DOCKER_VERSION="20.10.18"
BOOT_2_DOCKER_ISO="https://github.com/kaosagnt/boot2docker-xfs-ng/releases/download/${BOOT_2_DOCKER_VERSION}/boot2docker.iso"

REPO_DOCKER_MACHINE=$(get_latest_release "docker/machine")
REPO_DOCKER_CLI=$(get_latest_release "StefanScherer/docker-cli-builder")
REPO_DOCKER_COMPOSE=$(get_latest_release "docker/compose")

base=${REPO_DOCKER_MACHINE} &&
    mkdir -p "${FOLDER}" &&
    curl -L $base/docker-machine-Windows-x86_64.exe >"${FOLDER}/docker-machine.exe" &&
    chmod +x "${FOLDER}/docker-machine.exe"

base=${REPO_DOCKER_CLI} &&
    mkdir -p "${FOLDER}" &&
    curl -L $base/docker.exe >"${FOLDER}/docker.exe" &&
    chmod +x "${FOLDER}/docker.exe"

base=${REPO_DOCKER_COMPOSE} &&
    mkdir -p "${FOLDER}" &&
    curl -L $base/docker-compose-Windows-x86_64.exe >"${FOLDER}/docker-compose.exe" &&
    chmod +x "${FOLDER}/docker-compose.exe"

docker-machine create --driver=virtualbox \
--virtualbox-boot2docker-url "${BOOT_2_DOCKER_ISO}" \
--virtualbox-memory 4096 default

docker-machine start default

eval $(docker-machine env default --shell bash)
