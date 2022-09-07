# Overview

This container is ready to run Nvidia's implementation of a Tacotron2+Waveglow neural network based Text to Speech (TTS) engine.  The container sets up pytorch, conda, apex, gcc, and various python dependencias from a debian-slim base.

## Setup

1. Clone Nvidia's deep learning repo:
[Github - NVIDIA/DeepLearningExamples(https://github.com/NVIDIA/DeepLearningExamples)
2. Download the Trained models below, and add them to a folder at 'PyTorch/SpeechSynthesis/Tacotron2/models'.

##Inference
1. Put text that you would like to perform TTS on in a file called speak1.txt in the Tacotron2 folder we've been working from.
2. Start a container from the 'PyTorch/SpeechSynthesis/Tacotron2' folder.

```   
docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it -v ${PWD}:/workspace  --rm sdshooter/tacotron2-runner:latest
```

3. Run '/go' to begin inference using the text and models provided. 

Synthesized wav files will show up in the 'result' folder.

Optional:  
You can modify the entrypoint to perform inference automatically by adding --entrypoint 'bash /go' to your Docker run command.

Additional details are available from the source:
Nvidia's Tacotron2 repo documentation (https://github.com/NVIDIA/DeepLearningExamples/blob/master/PyTorch/SpeechSynthesis/Tacotron2/README.md)

Trained models:
[Trained Tacotron2 based model from Nvidia](https://catalog.ngc.nvidia.com/orgs/nvidia/models/tacotron2pyt_fp16/files)
[Waveglow model](https://catalog.ngc.nvidia.com/orgs/nvidia/models/waveglow256pyt_fp16/files)

## Credits
* a modified Tacotron 2 model from Nvidia based on  [Natural TTS Synthesis by Conditioning WaveNet on Mel Spectrogram Predictions](https://arxiv.org/abs/1712.05884)
* a flow-based neural network model from Nvidia [WaveGlow: A Flow-based Generative Network for Speech Synthesis](https://arxiv.org/abs/1811.00002)

[Voice recordings and text annotations used to train the model are from the LJ Speech Dataset](https://keithito.com/LJ-Speech-Dataset/)


## No - Warranty
The provider is not liable for any damages resulting from the use of this Docker image.  No steps have been taken to strengthen the image.  It makes use of docker hub, conda-forge, and debian GNU/Linux distribution sources, which are outside of my control.  This container image has not been locked down in any way.