FROM jupyter/base-notebook:584f43f06586

# Copy the repository into the container
COPY --chown=${NB_UID} . /opt/filteradapt

# Build and install the project
RUN python -m pip install /opt/filteradapt

# Make JupyterLab the default for this application
ENV JUPYTER_ENABLE_LAB=yes

# Copy all the notebook files into the home directory
RUN rm -rf ${HOME}/work && \
    cp /opt/filteradapt/jupyter/* ${HOME}