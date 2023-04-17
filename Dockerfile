# syntax=docker/dockerfile:1
FROM python:3.7
WORKDIR /app
COPY . .

# Install Pytorch
RUN pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html

# Install Detectron2
RUN python -m pip install detectron2==0.5 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html

# Install remaining libraries
RUN pip install -r requirements.txt

# Download checkpoints with model weights
WORKDIR checkpoints
RUN python download.py
WORKDIR ..

# Install libgl
RUN apt update
RUN apt install -y libgl1
