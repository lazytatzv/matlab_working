FROM mathworks/matlab:r2025a

ARG MATLAB_RELEASE=R2025a
ARG MATLAB_INSTALL_LOCATION=/opt/matlab/R2025a
ARG ADDITIONAL_PRODUCTS="Statistics_and_Machine_Learning_Toolbox Deep_Learning_Toolbox"

USER root
RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm \
    && chmod +x mpm \
    && HOME=/home/matlab ./mpm install \
        --release=${MATLAB_RELEASE} \
        --destination=${MATLAB_INSTALL_LOCATION} \
        --products ${ADDITIONAL_PRODUCTS} \
    || (echo "MPM Installation Failure. See below for more information:" && cat /tmp/mathworks_root.log && false) \
    && rm -f ${MATLAB_INSTALL_LOCATION}/sys/os/glnxa64/libstdc++.* \
    && rm -f mpm /tmp/mathworks_root.log \
    && chown -R matlab:matlab /home/matlab

USER matlab
WORKDIR /home/matlab/Documents/MATLAB/
