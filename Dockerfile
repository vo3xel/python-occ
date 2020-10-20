FROM conda/miniconda3:latest

WORKDIR /data

# Install conda packages
RUN conda list 
#RUN conda update -n base -c defaults conda
RUN conda install -c dlr-sc pythonocc-core

COPY /data .

ENTRYPOINT ["python3"]

CMD ["-c","import OCC; print('OCC VERSION:'+ 'OCC.VERSION');"]