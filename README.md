# **AudioPsynch**

Audio-triggered & single setup for Psychophysics experiments. 
[Traslational Neuroscience Laboratory](https://www.neurocienciasunam.com/lab-neurociencia-traslacional)
![Laboratory](/Figures/HeaderLab.png)

MATLAB scripts and functinos to record simultaneuosly:
- EEG by Bluetooth, 
- Eyetracking by USB TCP/IP socket, 
- microphone,
- webcam &
- stimuli & answers programmed in Psychtoolbox-3 or [PTB](http://psychtoolbox.org/)

## Brief Hardware Suggestion

These are equipmets required:

* **PC A for Setup A**
  - Windows
  - Webcam & microphone
  - GPU (optional)
  - MATLAB & PTB
  - GazePoint Control
  - Audio 3.5 jack Audio Output
  
* **PC B for Setup B**
  - Windows
  - Webcam & microphone
  - Bluetooth
  - Audio 3.5 jack Input
  - MATLAB & PTB
  - GazePoint Control (only if Setup B)
  
* **[Neurosky](http://neurosky.com/)**
  - Single Channel EEG
  
* **[GazePoint](https://www.gazept.com/)**
  - IR Eye Tracking
  
--
  
## Setup A: Two-PC Audio Triggered system:

This setup, desribed below, also requires a custom audio jack splitter (3.5 hijack) which basically sends audio output of PC A to audio input of PC B

![Setup](/Figures/SetupA.PNG "Setup A")


### Audio splitter

To split audio, it is necessary the know the [TRRS](https://en.wikipedia.org/wiki/Phone_connector_(audio)) configuration of your devices.
For instance, we developed this little hijack to separate audio output and microphone input:

![TRRS Jack](/Figures/HiJackAudio.png "3.5 hijack")

### Audio Trigger for Synchronizated Recordings

* **PC A** sends beep to **PC B**

![Experiment Profile](/Figures/AudioTrigger.png)

* Third Party Software & Sources:
  - [GazePoint API](http://www.gazept.com/dl/Gazepoint_API_v2.0.pdf)
  - [PsychToolbox](http://psychtoolbox.org/)
  - [Neurosky Thinkgear](https://store.neurosky.com/products/thinkgear-connector)
  - [GazePoint data to MATLAB](https://github.com/RingoHHuang/gazepoint-matlab-toolbox)
  
### Example Script

--
 
## Setup B: One-PC & all-in sensors system:

For this setup all sensors are plugged to one single PC.

![Setup](/Figures/SetupB.PNG "Setup B")

### Example Script 
--

## Help & Demos


1 [**Help**](http://htmlpreview.github.io/?https://github.com/vladscript/audiopsynch/blob/master/Scripts/html/USER_GUIDE.html)

2 Stroop