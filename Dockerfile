FROM debian:bullseye-slim
WORKDIR /workspace 
RUN apt-get update && \
    apt-get install -y \
    libfreetype6-dev ca-certificates wget curl git nano
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh -O miniconda.sh
RUN chmod u+x miniconda.sh 
RUN bash ./miniconda.sh -b -f -p /opt/miniconda
ENV PATH="${PATH}:/opt/miniconda/bin"

RUN conda create -n python python=3.8 -y && \
conda init bash
# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "python", "/bin/bash", "-c"]
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.6 -c pytorch -c conda-forge -y
#Install apex (gpu) and fairly standard dependencies (use nvidia-apex for cpu training/inference)
RUN conda install -c conda-forge nvidia-apex-proc librosa scipy jupyter -y
#Install repo specific python dependencies (and glibc)
RUN conda install matplotlib numpy inflect resampy=0.3.1 glow gcc=12.1.0 -c conda-forge -y
RUN pip install git+https://github.com/NVIDIA/dllogger#egg=dllogger
COPY ./scripts/go /

ENTRYPOINT ["/bin/bash"]