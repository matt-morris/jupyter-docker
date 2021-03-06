FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends build-essential r-base r-cran-randomforest python3.9 python3-pip python3-setuptools python3-dev
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
RUN Rscript -e "install.packages('data.table')"
COPY . /app
CMD jupyter-lab --no-browser --ip=0.0.0.0 --allow-root
