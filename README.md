# The goal of this project is to differentiate the voices of Grey and Brady

In order of usage :
- Downloads all episode (*downloadHI.py*)
- Creation of a file with timestamps when Brady and Grey talk (*createSample.html*)
- Creation of the audio clips of the episode on which the timestamp file has been created (*filesCreation.py*)
- Processing the audio clips and generate mfcc spectrums (*preprocess.py*)
- Train a neural network with these files (*train.py*)
- Generate a Json file with the model that contains the series of probability of being on member of the podcast (*generateStatsFromModel.py*)
- Display the statistics generated with D3 (website/index.html)

![Alt text](result_images/talking_length.png?raw=true "Talking length at any time")
![Alt text](result_images/talking_repartition.png?raw=true "Talking repartition over the episode")
![Alt text](result_images/whoTalksMoreByEpisode.png?raw=true "Who talks more on the episode")
![Alt text](result_images/whoTalksMoreSorted.png?raw=true "Sorted by who talks more")