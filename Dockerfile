FROM continuumio/miniconda3

RUN apt-get update && apt-get -y install \ 
    libgl1-mesa-glx \
	&& rm -rf /var/lib/apt/lists/*

ENV CONDA_ENV /home/occ/env
RUN mkdir -p $CONDA_ENV
WORKDIR /home/occ/env

COPY environment.yml .
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "occ-env", "/bin/bash", "-c"]

WORKDIR /home/occ/data
COPY /data/test.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "occ-env", "python"]
CMD ["-c","import OCC; print('OCC VERSION:'+ OCC.VERSION);"]