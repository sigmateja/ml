import pandas as pd 
import numpy as np 
import seaborn as sns 
import matplotlib.pyplot as plt 
 
print("Implementing Find-S algorithm...") 

def find_s_algorithm(csv_file): 
    # Load the dataset 
    dataset = pd.read_csv(csv_file) 
    attributes = dataset.iloc[:, :-1].values 
    labels = dataset.iloc[:, -1].values 
 
    for i, label in enumerate(labels): 
        if label == 'Yes':  # First positive example found 
            hypothesis = list(attributes[i]) 
            break  # Stop after finding the first "Yes" 
 
    for i in range(len(labels)): 
        if labels[i] == 'Yes':  # Only process positive examples 
            for j in range(len(hypothesis)): 
                if hypothesis[j] != attributes[i][j]: 
                    hypothesis[j] = '?'  # Generalize 
 
    return hypothesis 
 
csv_file = "/content/find_s_example.csv"  # Provide the path to your CSV file 
final_hypothesis = find_s_algorithm(csv_file) 
print("Final Hypothesis:", final_hypothesis) 
