#!/bin/sh
URL=$(jupyter notebook list)
URL=$(echo $URL | cut -d' ' -f4)
FILE=$(echo Programming/CSE/Projects/Workspace/Heart\ Disease\ Visualization/Sophisticated\ Visualizations.ipynb)
python -mwebbrowser $(echo $URL)
URL=$(echo $URL | cut -d'?' -f1)
URL=$($URL$FILE)
python -mwebbrowser $(echo $URL)
