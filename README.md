# Breast Cancer Analysis  

## Overview  
This project focuses on **predicting breast cancer** using machine learning techniques. The goal is to classify tumors as **malignant or benign** based on various cell features extracted from biopsy samples.  

## Dataset  
The dataset consists of various cell nucleus features, including:  
- **Radius** – Mean distance from center to perimeter  
- **Texture** – Standard deviation of gray-scale values  
- **Perimeter, Area, and Compactness**  
- **Concavity and Symmetry**  
- **Fractal Dimension**  

## Objectives  
- Perform **Exploratory Data Analysis (EDA)** to understand data distribution.  
- Apply **classification models** to predict breast cancer.  
- Evaluate model performance to ensure high accuracy.  

## Methodology  

### 1. **Data Preprocessing**  
- Handling missing values and data imbalances.  
- Feature scaling and selection.  

### 2. **Exploratory Data Analysis (EDA)**  
- Distribution analysis of tumor features.  
- Correlation heatmaps to identify feature importance.  

### 3. **Machine Learning Models**  
- **Logistic Regression**  
- **Support Vector Machine (SVM)**  
- **Random Forest Classifier**  
- **K-Nearest Neighbors (KNN)**  

### 4. **Model Evaluation**  
- Comparison of actual vs. predicted classifications.  
- Analysis of confusion matrices and classification reports.  

## Outputs  

### 1. Key Insights  
- Certain features like **radius, concavity, and perimeter** were highly correlated with malignancy.  
- **Support Vector Machine (SVM) performed well**, achieving high accuracy in classification.  
- Feature scaling improved model performance significantly.  

## Technologies Used  
- Python  
- Pandas, NumPy, Matplotlib, Seaborn  
- Scikit-learn  
- Jupyter Notebook  

## Conclusion  
This project demonstrates how **machine learning can effectively classify breast cancer** based on biopsy features. The results highlight the importance of feature selection and scaling in improving predictive accuracy.  

## Future Enhancements  
- Implement **deep learning models** for improved classification.  
- Optimize feature selection using **Principal Component Analysis (PCA)**.  
- Deploy the model as a **web-based diagnostic tool**.  
