---
output: 
  html_document: 
    keep_md: yes
---

This applet allows users to see that a linear model will be drastically
different with different terms in it. A confidence interval is only
applicable to its own model or hypothesis test, it is not universally valid.

A model is created from the data set and the model given
by `expr`. This is the way you specify "reality" for the purpose of the app.

Using the check boxes, you can add new terms or delete terms from the model, producing a model that deviates from the reality you created.   The "real" model coefficient is
plotted as a dotted line on each number line. The  confidence
interval and coefficient for the model indicated by the check-boxed terms is plotted in red. 

The user may vary the confidence
level and may vary the number of data points resampled to change the
placement and size of the confidence intervals. There is also a original
data checkbox which disables the n points to sample slider, as original data
is used. When original data is checked as well as only the terms in the
original model, the confidence intervals should align with the original
predictions. There is a random seed slider to set the random seed. By
default its initial value is random.

