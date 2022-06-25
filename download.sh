PROJECT="Help for this script:\n\
-setvm - Setting VM
-pb - Sync ProjectBlaze\n\
-evo-elle - Sync EvoX A11\n\
-evo-snow - Sync EvoX A12\n\
-arrow-9 - Sync ArrowOS A9\n\
-arrow-10 - Sync ArrowOS A10\n\
-arrow-11 - Sync ArrowOS A11\n\
-arrow-12 - Sync ArrowOS A12\n\
-pe-pie - Sync PE+ A9\n\
-pe-ten - Sync PE+ A10\n\
-pe-eleven - Sync PE+ A11\n\
-pe-twelve - Sync PE+ A12\n\
-los16 - Sync LOS 16\n\
-los17 - Sync LOS 17.1\n\
-los18 - Sync LOS 18.1\n\
-los19 - Sync LOS 19.1\n\
-komodo11 - Sync KomodoOS 11\n\
-komodo12 - Sync KomodoOS 12.1\n\
\n\
By @ShelbyHell"

if [ $1 = "-help" ]; then
    echo -e $PROJECT
fi

if [ $1 = "-setvm" ]; then
sudo apt-get update -q -y && sudo apt-get install -q -y --no-install-recommends \
    apt-utils apt-transport-https python3-apt \
    git ffmpeg maven nodejs ca-certificates-java pigz tar rsync rclone aria2 adb autoconf automake axel bc bison build-essential ccache lsb-core lsb-security ca-certificates systemd udev \
    git curl wget wput axel rsync \
    binutils coreutils bsdmainutils util-linux patchutils libc6-dev sudo \
    ssh openssl libssl-dev sshpass gnupg2 gpg \
    android-sdk-platform-tools adb fastboot squashfs-tools \
    openjdk-8-jdk ca-certificates-java \
    maven nodejs \
    python-all-dev python3-dev python3-requests \
    zip unzip lzip lzop zlib1g-dev xzdec xz-utils pixz p7zip-full p7zip-rar zstd libzstd-dev lib32z1-dev \
    build-essential gcc gcc-multilib g++ g++-multilib \
    clang llvm lld cmake automake autoconf \
    libxml2 libxml2-utils xsltproc expat re2c \
    ncurses-bin libncurses5-dev lib32ncurses5-dev bc libreadline-gplv2-dev libsdl1.2-dev libtinfo5 python-is-python2 ninja-build libcrypt-dev\
    file gawk xterm screen rename tree schedtool software-properties-common \
    dos2unix jq flex bison gperf exfat-utils exfat-fuse libb2-dev pngcrush imagemagick optipng advancecomp kmod

mkdir -p extra && cd extra \
  && wget -q https://ftp.gnu.org/gnu/make/make-4.3.tar.gz \
  && tar xzf make-4.3.tar.gz \
  && cd make-*/ \
  && ./configure && bash ./build.sh 1>/dev/null && install ./make /usr/local/bin/make \
  && cd .. \
  && git clone https://github.com/ccache/ccache.git \
  && cd ccache && git checkout -q v4.2 \
  && mkdir build && cd build \
  && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. \
  && make -j8 && make install \
  && cd ../../.. \
  && rm -rf extra

set -xe \
  && curl --create-dirs -sL -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules \
  && chmod 644 /etc/udev/rules.d/51-android.rules \
  && chown root /etc/udev/rules.d/51-android.rules

sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo
fi


if [ $1 = "-pb" ]; then
    echo "Start sync ProjectBlaze"
    mkdir pb; cd pb
    repo init --depth=1 -u https://github.com/ProjectBlaze/manifest.git -b 12.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

################################## EvolutionX
if [ $1 = "-evo-elle" ]; then
    echo "Start sync EvolutionX A11"
    mkdir evo-elle; cd evo-elle
    repo init --depth=1 -u https://github.com/Evolution-X/manifest -b elle
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-evo-snow" ]; then
    echo "Start sync EvolutionX A12"
    mkdir evo-snow; cd evo-snow
    repo init --depth=1 -u https://github.com/Evolution-X/manifest -b snow
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi
####################################################################################################

################################## ArrowOS
if [ $1 = "-arrow-9" ]; then
    echo "Start sync ArrowOS A9"
    mkdir arrow9; cd arrow9
    repo init --depth=1 -u https://github.com/ArrowOS/android_manifest.git -b arrow-9.x
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-arrow-10" ]; then
    echo "Start sync ArrowOS A10"
    mkdir arrow10; cd arrow10
    repo init --depth=1 -u https://github.com/ArrowOS/android_manifest.git -b arrow-10.0
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-arrow-11" ]; then
    echo "Start sync ArrowOS A11"
    mkdir arrow11; cd arrow11
    repo init --depth=1 -u https://github.com/ArrowOS/android_manifest.git -b arrow-11.0
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-arrow-12" ]; then
    echo "Start sync ArrowOS A12"
    mkdir arrow12; cd arrow12
    repo init --depth=1 -u https://github.com/ArrowOS/android_manifest.git -b arrow-12.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi
####################################################################################################

################################## PixelExperience
if [ $1 = "-pe-pie" ]; then
    echo "Start sync PixelExperience Plus A9"
    mkdir pe9; cd pe9
    repo init --depth=1 -u https://github.com/PixelExperience/manifest -b pie-plus
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-pe-ten" ]; then
    echo "Start sync PixelExperience Plus A10"
    mkdir pe10; cd pe10
    repo init --depth=1 -u https://github.com/PixelExperience/manifest -b ten-plus
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-pe-eleven" ]; then
    echo "Start sync PixelExperience Plus A11"
    mkdir pe11; cd pe11
    repo init --depth=1 -u https://github.com/PixelExperience/manifest -b eleven-plus
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-pe-twelve" ]; then
    echo "Start sync PixelExperience Plus A12"
    mkdir pe12; cd pe12
    repo init --depth=1 -u https://github.com/PixelExperience/manifest -b twelve
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi
####################################################################################################

################################## LineageOS
if [ $1 = "-los16" ]; then
    echo "Start sync LineageOS 16"
    mkdir los16; cd los16
    repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-16.0
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-los17" ]; then
    echo "Start sync LineageOS 17.1"
    mkdir los17; cd los17
    repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-17.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-los18" ]; then
    echo "Start sync LineageOS 18.1"
    mkdir los18; cd los18
    repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-18.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-los19" ]; then
    echo "Start sync LineageOS 19.1"
    mkdir los19; cd los19
    repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-19.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi
####################################################################################################

################################## KomodoOS
if [ $1 = "-komodo11" ]; then
    echo "Start sync KomodoOS 11"
    mkdir komodo11; cd komodo11
    repo init --depth=1 -u https://github.com/Komodo-OS/manifest -b 11
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi

if [ $1 = "-komodo12" ]; then
    echo "Start sync KomodoOS 12.1"
    mkdir komodo12; cd komodo12
    repo init --depth=1 -u https://github.com/Komodo-OS/manifest -b 12.1
    repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune
fi
####################################################################################################
