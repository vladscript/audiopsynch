# **AudioPsynch**

Audio triggered setup for Psychophysics experiments. 
[Tralational Neuroscience Laboratory](https://www.neurocienciasunam.com/lab-neurociencia-traslacional)
![Laboratory](/Figures/HeaderLab.png)

MATLAB scripts to record 
- EEG Bluetooth, 
- Eyetracking USB IP, 
- audio built-in and 
- video of webcam &
- Tests in [Psychtoolbox-3](http://psychtoolbox.org/)

## Setup A: Two-PC Audio Triggered system:

![Setup](/Figures/SetupA.png)

## Setup B: One-PC & all-in sensors system:

![Setup](/Figures/SetupB.png)

### Experiment Profile:
* Neurophysiological and behavioral data in stimuli-response paradigms
* Stimuli: audio, images, video
* For instance: Stroop Effect et al

## Brief Hardware Suggestion

* **PC A**
  - Windows
  - GPU (optional)
* **PC B**
  - Windows
  - Bluetooth
  - 3.5 Audio jack Input
* **[Neurosky](http://neurosky.com/)**
  - Single Channel EEG
* **[GazePoint](https://www.gazept.com/)**
  - IR Eye Tracking
    

## Audio Trigger for Synchronizated Recordings

* **PC A** sends beep to **PC B**

![Experiment Profile](/Figures/AudioTrigger.png)

* Third Party Software & Sources:
  - [GazePoint API](http://www.gazept.com/dl/Gazepoint_API_v2.0.pdf)
  - [PsychToolbox](http://psychtoolbox.org/)
  - [Neurosky Thinkgear](https://store.neurosky.com/products/thinkgear-connector)
  - [GazePoint data to MATLAB](https://github.com/RingoHHuang/gazepoint-matlab-toolbox)
  
--
 
## Help & Demos


1 [**Help**](http://htmlpreview.github.io/?https://https://github.com/vladscript/audiopsynch/blob/master/Scripts/html/USER_GUIDE.html)

2 Stroop