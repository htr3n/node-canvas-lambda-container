FROM public.ecr.aws/lambda/nodejs:14

##
# Install necessary packages for building Node.js Canvas
##
#RUN yum -y update \
#&& yum install -y gcc gcc-c++ glibc-devel make \
#    cairo-devel libjpeg-turbo-devel pango-devel giflib-devel zlib-devel librsvg2-devel  \
#    nodejs

RUN yum -y update && yum install -y gcc-c++ cairo-devel pango-devel libjpeg-turbo-devel giflib-devel

COPY *.js package*.json ./

RUN npm install --only=prod

ENV LD_PRELOAD=/var/task/node_modules/canvas/build/Release/libz.so.1

##
# Clean up unnecessary development packages
##
#RUN yum remove -y gcc gcc-c++ cpp glibc-devel make \
#    cairo-devel libjpeg-turbo-devel pango-devel giflib-devel zlib-devel librsvg2-devel \
#    expat-devel fontconfig-devel.x86_64 freetype-devel fribidi-devel gdk-pixbuf2-devel gdk-pixbuf2-devel \
#    glib2-devel glibc-headers graphite2-devel harfbuzz-devel kernel-headers libX11-devel libXau-devel \
#    libXdamage-devel libXfixes-devel libXft-devel libXxf86vm-devel libglvnd-core-devel libglvnd-devel \
#    libpng-devel libuuid-devel libxcb-devel libicu60-devel \
#    mesa-libEGL-devel mesa-libGL-devel pcre-devel xorg-x11-proto-devel

# Set CMD to the Lambda function handler
CMD [ "index.handler" ]
