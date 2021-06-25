# AudioPsynch

## MATLAB scripts to record EEG, Eyetracking audio and webcam while running tests in [Psychtoolbox-3](http://psychtoolbox.org/)

### Two-PCs Audio Triggered:
![Setup](/Figures/SetupA.png)

### One-PC Integered
![Setup](/Figures/SetupB.png)

### Experiment Profile:
* Neurophysiological and behavioral data in stimuli-response paradigms
* Stimuli: audio, images, video
* For instance: Stroop Efect, 

## Brief Hardware Description
* **PC A**
  - Windows
  - GPU
* **PC B**
  - Windows  
  - Standard Laptop
* **[Neurosky](http://neurosky.com/)**
  - Single Channel EEG
* **[GazePoint](https://www.gazept.com/)**
  - IR Eye Tracking
    
## Fast examples


### Audio Trigger for Synchronizated Recordings
* **PC A** sende beep to **PC B**
![Experiment Profile](/Figures/AudioTrigger.png)

* Third Party Software & Sources:
  - [GazePoint API](http://www.gazept.com/dl/Gazepoint_API_v2.0.pdf)
  - [PsychToolbox](http://psychtoolbox.org/)
  - [Neurosky Thinkgear](https://store.neurosky.com/products/thinkgear-connector)
  - [GazePoint data to MATLAB](https://github.com/RingoHHuang/gazepoint-matlab-toolbox)
  
