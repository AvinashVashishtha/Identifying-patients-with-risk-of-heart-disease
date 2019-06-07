# Identifying-patients-with-risk-of-heart-disease

Problem Statement: Given a population of Medicare Advantage members continuously enrolled in the previous year and with no indication of an AMI, can you predict who is most likely to have an AMI in the next 3 months?

Problem Definition: All the information (all the columns/variables) that was available for Medicare Advantage members was split into three buckets – Patient Attributes, Medical History and Insurance Coverage. Using research, hypotheses were formulated that stated the impact of factors from the three buckets on chances of a person likely to have an AMI in the next 3 months.

Summary : We cleaned the data and removed observations where there were missing values. We also checked the distribution to understand what constitutes as abnormal values for a variable and if there is any outlier removal required to perform for those cases. Next, we did basic EDAs and formulated/validated hypothesis.
As the problem required for us to predict customer who are at potential risk of heart loss, we looked at various techniques like (Classification) gradient boosting, logistic regression but after looking at preliminary results decided to go ahead with Random forest.
We divided our dataset in test and train (randomly keeping AMI flag 1s same) and took a part of the data to train the model. The results were encouraging and later we decided to optimize the threshold to give equal weightage to 0s and 1s in the predictor(AMI flag).
This is what the result we are getting on Train and Test data.


Correct Predictions
50482

True positives %(TPR)
64%

True Negative % (TNR)
64%

Positive Predicted Values
5%

Negative Predicted Values
98%
