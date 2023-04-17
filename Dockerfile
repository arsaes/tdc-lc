# syntax=docker/dockerfile:1
FROM python:3.7
WORKDIR /usr/src/app
COPY . .

# Install Pytorch
RUN pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html

# Install Detectron2
RUN git clone https://github.com/facebookresearch/detectron2.git
RUN python -m pip install -e detectron2

# Install remaining libraries
RUN pip install -r requirements.txt

