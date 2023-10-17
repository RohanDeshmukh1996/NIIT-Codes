#!/usr/bin/env python
# coding: utf-8

# In[26]:


# task 1
NYC_time=22
time_delay=6
ct_FR=NYC_time+time_delay
ct_FR1=ct_FR-24
print(ct_FR1," next day")

#if ct_FR>24 :(print(ct_FR-24,"Next Day"))


# In[9]:


# task 2
a=500
E_to_D=a*1.1 # CONVERTING EURO TO DOLLAR
servicecharge=E_to_D*(1.75/100) # GETTING SERVICE CHARGE  FOR ABOVE DOLLARS
total=D_to_e+servicecharge # TOTAL AMOUNT NEED TO PAY TO GET 500 EURO
print("For getting ",a," euro he need to give ",servicecharge," so he need to pay ",total," dollars")


# In[10]:


# task 3
b=4000
pd_nyc=b/30 # perday in nyc
pd_fr=pd_nyc+((20/100)*pd_nyc) # since he need 20% extra every day in france
total1=45*pd_fr #getting 45 days worth oh=f money required 
print("He will reqiure ",total1,"dollar extra")


# In[18]:


# task 4
invest=20000
Yield=5/100
profit=invest * Yield
print("profit", profit,"if he invest 20000$")


# In[15]:


# task 5
km_pd=12
m_pd=km_pd*0.602
print("he needs to practice",m_pd,"miles to walk perday in NYC")


# In[16]:


# task 6
c=3328
lap=1.2
km_to_m=c*0.602
total2=km_to_m/lap
print("he need",total2,"laps on practice track")


# In[ ]:


# task 7(optional)


# In[17]:


# task 8
oz1=30
oz_pd=10
ml_pd=10*30
ml_2week=14*ml_pd
no_of_bottle=ml_2week/750
print("matt needs around ",no_of_bottle,"bottle of juice")


# In[ ]:


# task 9
# jupyter notebook 3 different format .py, .html, .ipynb

