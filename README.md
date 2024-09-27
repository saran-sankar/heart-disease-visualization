# Heart Disease Visualization

## Overview

This project aims to analyze and visualize heart disease data using R. The dataset includes various attributes related to heart disease, allowing for comprehensive insights into the relationships between different variables and heart health outcomes.

## Dataset

The project uses the **Heart Disease Dataset**, which can be found in the `heart.csv` file. The dataset includes the following columns:

- **age**: Age of the patient
- **sex**: Gender of the patient (1 = male; 0 = female)
- **cp**: Chest pain type (0-3)
- **fbs**: Fasting blood sugar > 120 mg/dl (1 = true; 0 = false)
- **restecg**: Resting electrocardiographic results (0-2)
- **exang**: Exercise induced angina (1 = yes; 0 = no)
- **oldpeak**: ST depression induced by exercise relative to rest
- **slope**: The slope of the peak exercise ST segment (0-2)
- **ca**: Number of major vessels (0-3) colored by fluoroscopy
- **thal**: Thalassemia (1 = normal; 2 = fixed defect; 3 = reversible defect)
- **trestbps**: Resting blood pressure (in mm Hg)
- **chol**: Serum cholesterol in mg/dl
- **thalach**: Maximum heart rate achieved
- **target**: Presence of heart disease (1 = disease; 0 = no disease)

## Installation

To run the visualizations, you need to have R installed on your machine. Follow these steps to set up the project:

1. Clone the repository:
   ```bash
   git clone https://github.com/saran-sankar/heart-disease-visualization.git
   cd heart-disease-visualization

2. Install the required R packages (if not already installed):

    ```r
    install.packages(c("ggplot2", "dplyr", "corrplot", "GGally"))

3. Load the dataset and libraries in your R environment:

    ```r
    library(ggplot2)
    library(dplyr)
    library(corrplot)
    library(GGally)

    heart <- read.csv('heart.csv')
    ```

## Usage

The project consists of various R scripts located in the R Scripts folder, which generate visualizations for different aspects of the heart disease dataset. Some key visualizations include:

- **Age Distribution:** Histogram of age with density curve.
- **Gender Counts:** Bar chart showing counts of male and female patients.
- **Chest Pain Types:** Bar chart visualizing different types of chest pain.
- **Fasting Blood Sugar:** Bar chart for fasting blood sugar levels.
- **Correlation Plot:** Visual representation of correlation between variables.
- **Boxplots:** Boxplots to analyze the distribution of key features based on the presence of heart disease.
- **Density Plots:** Kernel density estimation for various features by target value.

You can run any of the scripts to generate the corresponding visualizations.

## Visualizations

The following visualizations are generated from the dataset:

- **Histograms:** For age, resting blood pressure, cholesterol, and maximum heart rate.
- **Bar Charts:** For categorical variables like gender, chest pain types, and other features.
- **Correlation Matrix:** Shows the relationships between different numerical variables.
- **Boxplots and Violin Plots:** For visualizing the distribution of numerical variables conditioned on heart disease presence.
- **Density Plots:** For exploring the distribution of features like maximum heart rate and ST depression.

## Conclusion

This project provides an insightful analysis of heart disease data, helping to identify significant factors associated with heart health. The visualizations created using R offer a clear understanding of the dataset, making it easier to derive conclusions and make data-driven decisions.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
