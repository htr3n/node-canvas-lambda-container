FROM public.ecr.aws/lambda/nodejs:14

##
# Install necessary package for building Node.js Canvas
##
RUN yum -y update \
&& yum -y groupinstall "Development Tools" \
&& yum install -y nodejs gcc-c++ cairo-devel libjpeg-turbo-devel pango-devel giflib-devel zlib-devel librsvg2-devel

COPY *.js package* ./

RUN npm install

ENV LD_PRELOAD=/var/task/node_modules/canvas/build/Release/libz.so.1

RUN yum remove -y cairo-devel libjpeg-turbo-devel pango-devel giflib-devel zlib-devel librsvg2-devel

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "index.handler" ]