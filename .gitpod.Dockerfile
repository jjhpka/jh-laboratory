FROM gitpod/workspace-python-3.13

USER gitpod

# Install uv for faster Python package management
RUN pip install uv

# Install system dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y \
    git \
    curl \
    build-essential \
    && sudo rm -rf /var/lib/apt/lists/*

# Set up Python environment
ENV PYTHONPATH=/workspace
ENV JUPYTER_ENABLE_LAB=yes

# Pre-install common packages to speed up workspace startup
RUN pip install --user \
    jupyter \
    jupyterlab \
    ipykernel \
    notebook \
    matplotlib \
    numpy \
    pandas \
    seaborn \
    plotly \
    scikit-learn

# Configure Jupyter
RUN jupyter lab --generate-config && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.open_browser = False" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_root = True" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.port = 8888" >> ~/.jupyter/jupyter_lab_config.py

WORKDIR /workspace