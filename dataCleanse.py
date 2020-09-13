#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import numpy as np

#import csv
df = pd.read_csv("datasets_51153_95503_AmesHousing.csv")
df.columns = df.columns.str.replace(' ','')

#print row/column size
df.shape
numerics = ['int16', 'int32', 'int64', 'float16', 'float32', 'float64']

#fill NAs in numerical columns with average (int)
df.fillna((df.select_dtypes(include=numerics)).mean().astype(int), inplace=True)

df[df["Exterior2nd"] == "PreCast"]
df = df[df["Exterior2nd"] != "PreCast"]
df.shape
df = df.select_dtypes(include=numerics)
df.shape


df.to_csv("Ames_num.csv")

