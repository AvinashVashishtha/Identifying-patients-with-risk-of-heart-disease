#Code
install.packages("randomForest")
require("randomForest")
library(caTools)
setwd("C:/Univ of Cincinnati/Misc/HUMANA")
training_data<-read.table("Clean.csv", header = TRUE, sep = ",")
summary(training_data)

#Train And Test data
ind<-sample.split(Y = training_data$AMI_FLAG,SplitRatio=0.7)
training_data$CON_VISIT_01=training_data$CON_VISIT_01_Q01+training_data$CON_VISIT_01_Q02+training_data$CON_VISIT_01_Q03+training_data$CON_VISIT_01_Q04
training_data$CON_VISIT_02=training_data$CON_VISIT_02_Q01+training_data$CON_VISIT_02_Q02+training_data$CON_VISIT_02_Q03+training_data$CON_VISIT_02_Q04
training_data$CON_VISIT_03=training_data$CON_VISIT_03_Q01+training_data$CON_VISIT_03_Q02+training_data$CON_VISIT_03_Q03+training_data$CON_VISIT_03_Q04
training_data$CON_VISIT_04=training_data$CON_VISIT_04_Q01+training_data$CON_VISIT_04_Q02+training_data$CON_VISIT_04_Q03+training_data$CON_VISIT_04_Q04
training_data$CON_VISIT_05=training_data$CON_VISIT_05_Q01+training_data$CON_VISIT_05_Q02+training_data$CON_VISIT_05_Q03+training_data$CON_VISIT_05_Q04
training_data$CON_VISIT_06=training_data$CON_VISIT_06_Q01+training_data$CON_VISIT_06_Q02+training_data$CON_VISIT_06_Q03+training_data$CON_VISIT_06_Q04
training_data$CON_VISIT_07=training_data$CON_VISIT_07_Q01+training_data$CON_VISIT_07_Q02+training_data$CON_VISIT_07_Q03+training_data$CON_VISIT_07_Q04
training_data$CON_VISIT_08=training_data$CON_VISIT_08_Q01+training_data$CON_VISIT_08_Q02+training_data$CON_VISIT_08_Q03+training_data$CON_VISIT_08_Q04
training_data$CON_VISIT_09=training_data$CON_VISIT_09_Q01+training_data$CON_VISIT_09_Q02+training_data$CON_VISIT_09_Q03+training_data$CON_VISIT_09_Q04
training_data$CON_VISIT_10=training_data$CON_VISIT_10_Q01+training_data$CON_VISIT_10_Q02+training_data$CON_VISIT_10_Q03+training_data$CON_VISIT_10_Q04
training_data$CON_VISIT_11=training_data$CON_VISIT_11_Q01+training_data$CON_VISIT_11_Q02+training_data$CON_VISIT_11_Q03+training_data$CON_VISIT_11_Q04
training_data$CON_VISIT_12=training_data$CON_VISIT_12_Q01+training_data$CON_VISIT_12_Q02+training_data$CON_VISIT_12_Q03+training_data$CON_VISIT_12_Q04
training_data$CON_VISIT_13=training_data$CON_VISIT_13_Q01+training_data$CON_VISIT_13_Q02+training_data$CON_VISIT_13_Q03+training_data$CON_VISIT_13_Q04
training_data$CON_VISIT_14=training_data$CON_VISIT_14_Q01+training_data$CON_VISIT_14_Q02+training_data$CON_VISIT_14_Q03+training_data$CON_VISIT_14_Q04
training_data$CON_VISIT_15=training_data$CON_VISIT_15_Q01+training_data$CON_VISIT_15_Q02+training_data$CON_VISIT_15_Q03+training_data$CON_VISIT_15_Q04
training_data$CON_VISIT_16=training_data$CON_VISIT_16_Q01+training_data$CON_VISIT_16_Q02+training_data$CON_VISIT_16_Q03+training_data$CON_VISIT_16_Q04
training_data$CON_VISIT_17=training_data$CON_VISIT_17_Q01+training_data$CON_VISIT_17_Q02+training_data$CON_VISIT_17_Q03+training_data$CON_VISIT_17_Q04
training_data$CON_VISIT_18=training_data$CON_VISIT_18_Q01+training_data$CON_VISIT_18_Q02+training_data$CON_VISIT_18_Q03+training_data$CON_VISIT_18_Q04
training_data$CON_VISIT_19=training_data$CON_VISIT_19_Q01+training_data$CON_VISIT_19_Q02+training_data$CON_VISIT_19_Q03+training_data$CON_VISIT_19_Q04
training_data$CON_VISIT_20=training_data$CON_VISIT_20_Q01+training_data$CON_VISIT_20_Q02+training_data$CON_VISIT_20_Q03+training_data$CON_VISIT_20_Q04
training_data$CON_VISIT_21=training_data$CON_VISIT_21_Q01+training_data$CON_VISIT_21_Q02+training_data$CON_VISIT_21_Q03+training_data$CON_VISIT_21_Q04
training_data$CON_VISIT_22=training_data$CON_VISIT_22_Q01+training_data$CON_VISIT_22_Q02+training_data$CON_VISIT_22_Q03+training_data$CON_VISIT_22_Q04
training_data$CON_VISIT_23=training_data$CON_VISIT_23_Q01+training_data$CON_VISIT_23_Q02+training_data$CON_VISIT_23_Q03+training_data$CON_VISIT_23_Q04
training_data$CON_VISIT_24=training_data$CON_VISIT_24_Q01+training_data$CON_VISIT_24_Q02+training_data$CON_VISIT_24_Q03+training_data$CON_VISIT_24_Q04
training_data$CON_VISIT_25=training_data$CON_VISIT_25_Q01+training_data$CON_VISIT_25_Q02+training_data$CON_VISIT_25_Q03+training_data$CON_VISIT_25_Q04
training_data$CON_VISIT_26=training_data$CON_VISIT_26_Q01+training_data$CON_VISIT_26_Q02+training_data$CON_VISIT_26_Q03+training_data$CON_VISIT_26_Q04
training_data$CON_VISIT_27=training_data$CON_VISIT_27_Q01+training_data$CON_VISIT_27_Q02+training_data$CON_VISIT_27_Q03+training_data$CON_VISIT_27_Q04
training_data$CON_VISIT_28=training_data$CON_VISIT_28_Q01+training_data$CON_VISIT_28_Q02+training_data$CON_VISIT_28_Q03+training_data$CON_VISIT_28_Q04
#training_data$CON_VISIT_29=training_data$CON_VISIT_29_Q01+training_data$CON_VISIT_29_Q02+training_data$CON_VISIT_29_Q03+training_data$CON_VISIT_29_Q04
training_data$CON_VISIT_30=training_data$CON_VISIT_30_Q01+training_data$CON_VISIT_30_Q02+training_data$CON_VISIT_30_Q03+training_data$CON_VISIT_30_Q04
training_data$CON_VISIT_31=training_data$CON_VISIT_31_Q01+training_data$CON_VISIT_31_Q02+training_data$CON_VISIT_31_Q03+training_data$CON_VISIT_31_Q04
training_data$CON_VISIT_32=training_data$CON_VISIT_32_Q01+training_data$CON_VISIT_32_Q02+training_data$CON_VISIT_32_Q03+training_data$CON_VISIT_32_Q04
training_data$CON_VISIT_33=training_data$CON_VISIT_33_Q01+training_data$CON_VISIT_33_Q02+training_data$CON_VISIT_33_Q03+training_data$CON_VISIT_33_Q04
#training_data$CON_VISIT_99=training_data$CON_VISIT_99_Q01+training_data$CON_VISIT_99_Q02+training_data$CON_VISIT_99_Q03+training_data$CON_VISIT_99_Q04

training_data$POT_VISIT_01=training_data$POT_VISIT_01_Q01+training_data$POT_VISIT_01_Q02+training_data$POT_VISIT_01_Q03+training_data$POT_VISIT_01_Q04
#training_data$POT_VISIT_02=training_data$POT_VISIT_02_Q01+training_data$POT_VISIT_02_Q02+training_data$POT_VISIT_02_Q03+training_data$POT_VISIT_02_Q04
#training_data$POT_VISIT_03=training_data$POT_VISIT_03_Q01+training_data$POT_VISIT_03_Q02+training_data$POT_VISIT_03_Q03+training_data$POT_VISIT_03_Q04
#training_data$POT_VISIT_04=training_data$POT_VISIT_04_Q01+training_data$POT_VISIT_04_Q02+training_data$POT_VISIT_04_Q03+training_data$POT_VISIT_04_Q04
#training_data$POT_VISIT_05=training_data$POT_VISIT_05_Q01+training_data$POT_VISIT_05_Q02+training_data$POT_VISIT_05_Q03+training_data$POT_VISIT_05_Q04
#training_data$POT_VISIT_06=training_data$POT_VISIT_06_Q01+training_data$POT_VISIT_06_Q02+training_data$POT_VISIT_06_Q03+training_data$POT_VISIT_06_Q04
training_data$POT_VISIT_07=training_data$POT_VISIT_07_Q01+training_data$POT_VISIT_07_Q02+training_data$POT_VISIT_07_Q03+training_data$POT_VISIT_07_Q04
#training_data$POT_VISIT_08=training_data$POT_VISIT_08_Q01+training_data$POT_VISIT_08_Q02+training_data$POT_VISIT_08_Q03+training_data$POT_VISIT_08_Q04
#training_data$POT_VISIT_09=training_data$POT_VISIT_09_Q01+training_data$POT_VISIT_09_Q02+training_data$POT_VISIT_09_Q03+training_data$POT_VISIT_09_Q04
#training_data$POT_VISIT_10=training_data$POT_VISIT_10_Q01+training_data$POT_VISIT_10_Q02+training_data$POT_VISIT_10_Q03+training_data$POT_VISIT_10_Q04
training_data$POT_VISIT_11=training_data$POT_VISIT_11_Q01+training_data$POT_VISIT_11_Q02+training_data$POT_VISIT_11_Q03+training_data$POT_VISIT_11_Q04
training_data$POT_VISIT_12=training_data$POT_VISIT_12_Q01+training_data$POT_VISIT_12_Q02+training_data$POT_VISIT_12_Q03+training_data$POT_VISIT_12_Q04
training_data$POT_VISIT_13=training_data$POT_VISIT_13_Q01+training_data$POT_VISIT_13_Q02+training_data$POT_VISIT_13_Q03+training_data$POT_VISIT_13_Q04
training_data$POT_VISIT_14=training_data$POT_VISIT_14_Q01+training_data$POT_VISIT_14_Q02+training_data$POT_VISIT_14_Q03+training_data$POT_VISIT_14_Q04
training_data$POT_VISIT_15=training_data$POT_VISIT_15_Q01+training_data$POT_VISIT_15_Q02+training_data$POT_VISIT_15_Q03+training_data$POT_VISIT_15_Q04
training_data$POT_VISIT_16=training_data$POT_VISIT_16_Q01+training_data$POT_VISIT_16_Q02+training_data$POT_VISIT_16_Q03+training_data$POT_VISIT_16_Q04
training_data$POT_VISIT_17=training_data$POT_VISIT_17_Q01+training_data$POT_VISIT_17_Q02+training_data$POT_VISIT_17_Q03+training_data$POT_VISIT_17_Q04
#training_data$POT_VISIT_18=training_data$POT_VISIT_18_Q01+training_data$POT_VISIT_18_Q02+training_data$POT_VISIT_18_Q03+training_data$POT_VISIT_18_Q04
training_data$POT_VISIT_19=training_data$POT_VISIT_19_Q01+training_data$POT_VISIT_19_Q02+training_data$POT_VISIT_19_Q03+training_data$POT_VISIT_19_Q04
training_data$POT_VISIT_20=training_data$POT_VISIT_20_Q01+training_data$POT_VISIT_20_Q02+training_data$POT_VISIT_20_Q03+training_data$POT_VISIT_20_Q04
training_data$POT_VISIT_21=training_data$POT_VISIT_21_Q01+training_data$POT_VISIT_21_Q02+training_data$POT_VISIT_21_Q03+training_data$POT_VISIT_21_Q04
training_data$POT_VISIT_22=training_data$POT_VISIT_22_Q01+training_data$POT_VISIT_22_Q02+training_data$POT_VISIT_22_Q03+training_data$POT_VISIT_22_Q04
training_data$POT_VISIT_23=training_data$POT_VISIT_23_Q01+training_data$POT_VISIT_23_Q02+training_data$POT_VISIT_23_Q03+training_data$POT_VISIT_23_Q04
training_data$POT_VISIT_24=training_data$POT_VISIT_24_Q01+training_data$POT_VISIT_24_Q02+training_data$POT_VISIT_24_Q03+training_data$POT_VISIT_24_Q04
#training_data$POT_VISIT_25=training_data$POT_VISIT_25_Q01+training_data$POT_VISIT_25_Q02+training_data$POT_VISIT_25_Q03+training_data$POT_VISIT_25_Q04
#training_data$POT_VISIT_26=training_data$POT_VISIT_26_Q01+training_data$POT_VISIT_26_Q02+training_data$POT_VISIT_26_Q03+training_data$POT_VISIT_26_Q04
#training_data$POT_VISIT_27=training_data$POT_VISIT_27_Q01+training_data$POT_VISIT_27_Q02+training_data$POT_VISIT_27_Q03+training_data$POT_VISIT_27_Q04
#training_data$POT_VISIT_28=training_data$POT_VISIT_28_Q01+training_data$POT_VISIT_28_Q02+training_data$POT_VISIT_28_Q03+training_data$POT_VISIT_28_Q04
#training_data$POT_VISIT_29=training_data$POT_VISIT_29_Q01+training_data$POT_VISIT_29_Q02+training_data$POT_VISIT_29_Q03+training_data$POT_VISIT_29_Q04
#training_data$POT_VISIT_30=training_data$POT_VISIT_30_Q01+training_data$POT_VISIT_30_Q02+training_data$POT_VISIT_30_Q03+training_data$POT_VISIT_30_Q04
training_data$POT_VISIT_31=training_data$POT_VISIT_31_Q01+training_data$POT_VISIT_31_Q02+training_data$POT_VISIT_31_Q03+training_data$POT_VISIT_31_Q04
training_data$POT_VISIT_32=training_data$POT_VISIT_32_Q01+training_data$POT_VISIT_32_Q02+training_data$POT_VISIT_32_Q03+training_data$POT_VISIT_32_Q04
training_data$POT_VISIT_33=training_data$POT_VISIT_33_Q01+training_data$POT_VISIT_33_Q02+training_data$POT_VISIT_33_Q03+training_data$POT_VISIT_33_Q04
training_data$POT_VISIT_99=training_data$POT_VISIT_99_Q01+training_data$POT_VISIT_99_Q02+training_data$POT_VISIT_99_Q03+training_data$POT_VISIT_99_Q04






trainDF<-training_data[ind,]
testDF<-training_data[!ind,]



total<-testDF
str(total)
dim(total)
summary(total)





str(total)
m1 <- randomForest(
  formula = AMI_FLAG ~ RX_THER_44_YR2016+RECON_MA_RISK_SCORE_NBR+RECON_RX_RISK_SCORE_NBR
                      +RX_THER_57_YR2016+AGE+RX_THER_21_YR2016+RX_THER_32_YR2016+RX_THER_22_YR2016+
                      CON_VISIT_01+RX_THER_49_YR2016+CON_VISIT_24+CON_VISIT_17+CON_VISIT_06+RX_THER_97_YR2016+
                      RX_THER_11_YR2016+RX_THER_36_YR2016+CON_VISIT_02+CON_VISIT_23+RX_THER_17_YR2016+
                      RX_THER_60_YR2016+RX_THER_58_YR2016+RES_COPD+CON_VISIT_33+CON_VISIT_21+RX_THER_33_YR2016+
                      CON_VISIT_26+RX_THER_24_YR2016+RX_THER_65_YR2016+RX_THER_72_YR2016+CON_VISIT_31+
                      RX_THER_39_YR2016+CDC_EYE_GAP+RX_THER_66_YR2016+CV_CAD+CDC+RX_THER_02_YR2016+CON_VISIT_05+
                      RX_THER_03_YR2016+CON_VISIT_19+RX_THER_27_YR2016+PREDIABETES+CON_VISIT_09+HYPERTENSION+
                      RX_THER_52_YR2016+RX_THER_12_YR2016+RX_THER_42_YR2016+CON_VISIT_32+CON_VISIT_08+
                      RX_THER_85_YR2016+CDC_HBAPOOR_GAP+CON_VISIT_04+RX_THER_34_YR2016+ARTH+RX_THER_37_YR2016+
                      OSTEO+RX_THER_82_YR2016+RX_THER_94_YR2016+COL_GAP+CON_VISIT_25+CON_VISIT_10+
                      RX_THER_30_YR2016+CV_HDZ+RX_THER_16_YR2016+Diab_Complications+CV_CHF+SEX_CD
    
    
    
    
    
    
    
    
            #AGE+SEX_CD+RECON_MA_RISK_SCORE_NBR+RECON_RX_RISK_SCORE_NBR+
            #CV_CAD+CV_CHF+CV_CIR+CV_CER+CV_HDZ+CV_SNS+CV_PVD+RES_ALG+RES_AST+RES_COPD+
            #RES_FAIL+RES_INF+DIABETES+Diab_Type+Diab_Complications+PREDIABETES+HYPERTENSION+
            #HYPERLIPID+RENAL+CKD+ESRD+MUSCUL_OTH+MUSCUL_BN+OSTEO+ARTH+ACE_ELIG+DIAB_ELIG+STATIN_ELIG+
            #ACE_PASS+DIAB_PASS+STATIN_PASS+CDC+CDC_NPH_GAP+CDC_EYE_GAP+CDC_HBATEST_GAP+CDC_HBAPOOR_GAP+
              #CDC_LDL100_GAP+
            #BCS+BCS_GAP+COL+COL_GAP+AMM+AMM_GAP+
            #CON_VISIT_04+CON_VISIT_21+CON_VISIT_03+CON_VISIT_05+CON_VISIT_09+CON_VISIT_10+CON_VISIT_18+CON_VISIT_19+CON_VISIT_23+CON_VISIT_24+CON_VISIT_30+CON_VISIT_32+CON_VISIT_33+CON_VISIT_06+CON_VISIT_08+CON_VISIT_11+CON_VISIT_25+CON_VISIT_27+CON_VISIT_31+CON_VISIT_07+CON_VISIT_01+CON_VISIT_02+CON_VISIT_17+CON_VISIT_26+CON_VISIT_15+CON_VISIT_20+CON_VISIT_22+CON_VISIT_28+CON_VISIT_14+CON_VISIT_16+CON_VISIT_12+CON_VISIT_13+
               #POT_VISIT_11+POT_VISIT_81+POT_VISIT_21+POT_VISIT_23+POT_VISIT_22+POT_VISIT_12+POT_VISIT_19+POT_VISIT_20+POT_VISIT_41+POT_VISIT_31+POT_VISIT_32+POT_VISIT_51+POT_VISIT_24+POT_VISIT_53+POT_VISIT_01+POT_VISIT_17+POT_VISIT_50+POT_VISIT_72+POT_VISIT_15+POT_VISIT_99+POT_VISIT_34+POT_VISIT_42+POT_VISIT_61+POT_VISIT_49+POT_VISIT_02+POT_VISIT_60+POT_VISIT_33+POT_VISIT_13+POT_VISIT_65+POT_VISIT_71+POT_VISIT_16+POT_VISIT_14+POT_VISIT_52+POT_VISIT_54+POT_VISIT_04+POT_VISIT_62+POT_VISIT_09+POT_VISIT_05+POT_VISIT_07+POT_VISIT_26+POT_VISIT_55+POT_VISIT_03+POT_VISIT_57+POT_VISIT_56+POT_VISIT_18+POT_VISIT_25+
            #RX_THER_17_YR2016+RX_THER_36_YR2016+RX_THER_42_YR2016+RX_THER_44_YR2016+RX_THER_58_YR2016+RX_THER_65_YR2016+RX_THER_90_YR2016+RX_THER_01_YR2016+RX_THER_05_YR2016+RX_THER_22_YR2016+RX_THER_37_YR2016+RX_THER_39_YR2016+RX_THER_43_YR2016+RX_THER_49_YR2016+RX_THER_57_YR2016+RX_THER_60_YR2016+RX_THER_28_YR2016+RX_THER_27_YR2016+RX_THER_34_YR2016+RX_THER_16_YR2016+RX_THER_41_YR2016+RX_THER_02_YR2016+RX_THER_18_YR2016+RX_THER_50_YR2016+RX_THER_97_YR2016+RX_THER_61_YR2016+RX_THER_66_YR2016+RX_THER_56_YR2016+RX_THER_03_YR2016+RX_THER_75_YR2016+RX_THER_72_YR2016+RX_THER_79_YR2016+RX_THER_12_YR2016+RX_THER_86_YR2016+RX_THER_32_YR2016+RX_THER_33_YR2016+RX_THER_21_YR2016+RX_THER_46_YR2016+RX_THER_62_YR2016+RX_THER_68_YR2016+RX_THER_94_YR2016+RX_THER_04_YR2016+RX_THER_59_YR2016+RX_THER_69_YR2016+RX_THER_85_YR2016+RX_THER_11_YR2016+RX_THER_30_YR2016+RX_THER_54_YR2016+RX_THER_31_YR2016+RX_THER_83_YR2016+RX_THER_13_YR2016+RX_THER_35_YR2016+RX_THER_89_YR2016+RX_THER_78_YR2016+RX_THER_53_YR2016+RX_THER_77_YR2016+RX_THER_88_YR2016+RX_THER_23_YR2016+RX_THER_52_YR2016+RX_THER_73_YR2016+RX_THER_99_YR2016+RX_THER_82_YR2016+RX_THER_07_YR2016+RX_THER_93_YR2016+RX_THER_74_YR2016+RX_THER_55_YR2016+RX_THER_24_YR2016+RX_THER_67_YR2016+RX_THER_64_YR2016+RX_THER_87_YR2016+RX_THER_47_YR2016+RX_THER_38_YR2016+RX_THER_40_YR2016+RX_THER_09_YR2016+RX_THER_51_YR2016+RX_THER_26_YR2016+RX_THER_25_YR2016+RX_THER_81_YR2016+RX_THER_48_YR2016+RX_THER_95_YR2016+RX_THER_45_YR2016+RX_THER_76_YR2016+RX_THER_80_YR2016+RX_THER_15_YR2016+RX_THER_19_YR2016+RX_THER_96_YR2016+RX_THER_92_YR2016+RX_THER_98_YR2016+RX_THER_84_YR2016+RX_THER_08_YR2016
  ,
    data    = total
)

m1
importance(m1)
varImpPlot(m1)

predictionwithclass<-predict(m1,total,type='class')
predictionwithclass2<-ifelse((predictionwithclass<0.150),0,1)
t<-table(predictions=predictionwithclass2,actual=total$AMI_FLAG)
sum(diag(t)/sum(t))
t



predictionwithclass<-predict(m1,trainDF,type='class')
predictionwithclass2<-ifelse((predictionwithclass<0.0235),0,1)
t<-table(predictions=predictionwithclass2,actual=trainDF$AMI_FLAG)
sum(diag(t)/sum(t))
t

summary(predictionwithclass)

predictionwithclass<-predict(m1,trainDF,type='class')
predictionwithclass2<-ifelse((predictionwithclass<0.150),0,1)
t<-table(predictions=predictionwithclass2,actual=trainDF$AMI_FLAG)
sum(diag(t)/sum(t))
t

summary(predictionwithclass)


##############################Till here
library(pROC)
PredictionsWithProbs<-predict(m1,total,type='prob')
auc<-auc(total$churn,PredictionsWithProbs[,2])
plot(total$churn,PredictionsWithProbs[,2])

library(Hmisc)
cor(total$AMI_FLAG,total$AGE)
cor(total[7:8])

