# Instahyre Job Analysis

### **INTRODUCTION**

####  Within this repository, you will discover a comprehensive Job analysis of Instahyre, a prominent Job Portal. The project focused on achieving the following objectives:

1. Identifying the most sought-after skills and job roles by analyzing prevailing market trends.
2. Pinpointing locations with the highest number of job openings related to specific skills.
3. Unveiling hidden insights embedded within the dataset.

#### To accomplish these goals, the project employed various methodologies:

1. Web scraping was executed in Python using the Selenium library to collect relevant data.
2. Data analysis and the creation of informative tables were conducted using SQL.
3. Microsoft Power BI was employed for data visualization, enabling clear and insightful presentations of the findings.


<br />

### **TABLE OF CONTENTS**

| Files/Folder | Description |
| -----------  | ----------- |
| Data Tables       | This folder contains cleaned csv data files           |
| Power BI Dashboard    | This folder contains Power BI Dashboard file and PDF      |
| SQL Insights | This folder contains mysql insights file     |
| Web Scraping | This folder contains Jupyter notebook file & Web driver used for Web scraping   |
| Presentation | This is a powerpoint presentation file that contains all major insights and conclusion |


<br />

### **PROJECT ROADMAP**

<img src ="https://github.com/akashhvyas/Job-Analytics-Instahyre/blob/main/Graphics/PowerPoint%20Presentation%20-%20Google%20Chrome%2012-05-2023%2002_38_06.png"  width="1000" height="400" />

<br />

### **WEB SCRAPING**

#### Importing libraries required for web scraping for dynamic websites.
````
import numpy as np
import pandas as pd

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from time import sleep
````

#### Url address for data extraction
````
url = 'https://www.instahyre.com/search-jobs/'
````

#### Initiating webdriver
````
browser = webdriver.Chrome('C:/Users/sheet/OneDrive/Documents/Akash/Web Scraping/chromedriver_win/chromedriver.exe')
````

#### Opening URL and maximizing window
````
browser.get(url)
browser.maximize_window()
````

#### Creating a list for data storage
````
data = []
browser.switch_to.window(browser.window_handles[0])
````

#### Running the code for Web Scraping
````
#Outer loop represents number of pages of website.

for page in range(1,201):

    
    #Inner loop represents number of job posting on each page.
    
    for i in range(1,11):
        try:
            view_path = '(//*[@id="interested-btn"])[1]'
            ii = str([i])
            final =  view_path.replace('[1]',ii)
            view_button = browser.find_element_by_xpath(final)
            view_button.click()
            browser.switch_to.window(browser.window_handles[1])
            sleep(1)


            #Extracting required information from each job posting.

            title = browser.find_element_by_xpath('//*[@id="floating-header"]/div[1]/h1').text
            location = browser.find_element_by_xpath('//*[@id="floating-header"]/div[1]/div/span[1]').text
            company = browser.find_element_by_xpath('//*[@id="floating-header"]/div[1]/h2').text
            founded = browser.find_element_by_xpath('//html/body/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div[1]').text
            emp_count = browser.find_element_by_xpath('//*[@id="employer-profile"]/div[2]/div/div/div[1]/div[2]/div[2]').text
            skills = browser.find_element_by_xpath('//*[@id="job-skills-description"]').text
            hr = browser.find_element_by_xpath('//*[@id="employer-profile"]/div[2]/div/div/div[3]/div[1]/div/span/span[1]').text

            data.append([title,location,company,founded,emp_count,skills,hr])
            
        except NoSuchElementException:
            pass
        
        
        #Closing the browser and switching back to parent window.
        
        browser.close()
        browser.switch_to.window(browser.window_handles[0])
        
        
    #Navigating to next page.
        
    next_page = browser.find_element_by_xpath('//*[@id="job-function-page"]/div[2]/div/div[1]/div[1]/div[11]/li[12]').click()
    sleep(1)
````

#### Storing data as DataFrame
````
pd.DataFrame(data,columns=['Job Title','Location','Company','Founded','Emp_count','Skills','HR'])
````

#### Exporting Data as CSV File
````
pd.DataFrame(data,columns=['Job Title','Location','Company','Founded','Emp_count','Skills','HR']).to_csv("Test_3.csv",index=False)
````


### **LANGUAGES / TOOLS USED**

1. Microsoft Excel
2. Python - Selenium Library
3. SQL - MySQL
4. Microsoft Power BI

<br />

### **SNAPSHOTS**

<img src ="https://github.com/akashhvyas/Job-Analytics-Instahyre/blob/main/Graphics/Presentation1%20-%20PowerPoint%2017-04-2023%2016_50_16.png"  width="688" height="414" />

<br />
<img src ="https://github.com/akashhvyas/Job-Analytics-Instahyre/blob/main/Graphics/Power%20BI%20Desktop%2017-04-2023%2016_46_31.png"  width="800" height="414" />

<br />
<img src ="https://github.com/akashhvyas/Job-Analytics-Instahyre/blob/main/Graphics/Power%20BI%20Desktop%2017-04-2023%2016_35_26.png"  width="750" height="330" />

<br />

### **MICROSOFT POWER BI DASHBOARD**

<img src ="https://github.com/akashhvyas/Job-Analytics-Instahyre/blob/main/Graphics/Power%20BI%20Desktop.png"  width="1000" height="450" />

<br />

### **CHALLENGES FACED**

1. Initially, data scraping using the BeautifulSoup library posed difficulties, leading us to switch to the Selenium Python library for better results.
2. Frequent updates to the website required us to constantly modify our Python code accordingly.
3. Data cleaning proved challenging due to the suboptimal structure of the acquired data.
4. The scarcity of numerical data presented a challenge in generating meaningful insights.
5. The process of splitting tables and creating a suitable schema presented further hurdles during the project.

<br />

### **CONCLUSION**

``` 
1. The market demands Java, Python, and JavaScript as the most sought-after programming languages.
2. Bangalore, known as the IT Hub, offers the highest number of job openings.
3. A prevailing trend among companies is the adoption of Work From Home (WFH) facilities.
4. Companies founded after the year 2010 present 3x more job opportunities compared to others.
```
