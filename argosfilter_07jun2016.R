library(dplyr)

# make sure that this the wd setwd("/sdb/gst/hr_analysis2016")

#getwd()
#list.files()
#ls()
rm(list = ls())  #clears all vectors in environment

#load pre data and create vectors for each pre tag

tag37616 <-read.csv("/Users/colleennell/Documents/R/suz/pre/37616.csv",na.strings = "NA")
tag37623 <-read.csv("/Users/colleennell/Documents/R/suz/pre/37623.csv",na.strings = "NA")
tag44366 <-read.csv("/Users/colleennell/Documents/R/suz/pre/44366.csv",na.strings = "NA")
tag52674 <-read.csv("/Users/colleennell/Documents/R/suz/pre/52674.csv",na.strings = "NA")
tag52675 <-read.csv("/Users/colleennell/Documents/R/suz/pre/52675.csv",na.strings = "NA")
tag78500 <-read.csv("/Users/colleennell/Documents/R/suz/pre/78500.csv",na.strings = "NA")
tag79786 <-read.csv("/Users/colleennell/Documents/R/suz/pre/79786.csv",na.strings = "NA")

#str(tag37616)
#str(tag44366)
# View(tag44366)
# View(tag37616)

#create vector to combine LC 1,2,3 for filtering

nums2<-c("1","2","3")

#filters each Argos tag for nums (LC 1,2,3) and GPS, which eliminates Argos A,B,Z,0
## | represents or

tag37616_locfilter<-filter(tag37616, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS")
tag37623_locfilter<-filter(tag37623, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS") #warning
tag44366_locfilter<-filter(tag44366, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS") #warning
tag52674_locfilter<-filter(tag52674, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS")
tag52675_locfilter<-filter(tag52675, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS")
tag78500_locfilter<-filter(tag78500, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS")
tag79786_locfilter<-filter(tag79786, LC == nums2[1] |
                             LC == nums2[2] |
                             LC == nums2[3] | Message_Type=="GPS") #warning

# View(tag37616_locfilter)
# View(tag37623_locfilter)
# View(tag44366_locfilter)
# View(tag52674_locfilter)
# View(tag52675_locfilter)
# View(tag78500_locfilter)
# View(tag79786_locfilter)

#Create a vector that binds all pre tag data into one dataframe

Pre.all <- rbind(tag37616_locfilter,
                 tag37623_locfilter,
                 tag44366_locfilter,
                 tag52674_locfilter,
                 tag52675_locfilter,
                 tag78500_locfilter,
                 tag79786_locfilter)

# View(Pre.all)

#Load Post Data
tag126071june <-read.csv("/Users/colleennell/Documents/R/suz/post/126071_june.csv")
tag126071july <-read.csv("/Users/colleennell/Documents/R/suz/post/126071_july.csv")
tag126070 <-read.csv("/Users/colleennell/Documents/R/suz/post/126070.csv")
tag126069may <-read.csv("/Users/colleennell/Documents/R/suz/post/126069_may.csv")
tag126069july <-read.csv("/Users/colleennell/Documents/R/suz/post/126069_july.csv")
tag126068 <-read.csv("/Users/colleennell/Documents/R/suz/post/126068.csv")
tag126067 <-read.csv("/Users/colleennell/Documents/R/suz/post/126067.csv")
tag126066 <-read.csv("/Users/colleennell/Documents/R/suz/post/126066.csv")
tag126065 <-read.csv("/Users/colleennell/Documents/R/suz/post/126065.csv")
tag126064 <-read.csv("/Users/colleennell/Documents/R/suz/post/126064.csv")

# View(tag126064)
# View(tag126071june)

#create vector to combine LC 1,2,3 for filtering

## because these should be levels within a factor variable,
## I changed them to characters from numbers
nums2<-c("1","2","3")

#Filter out Argos A,B,Z,0 for post tag data
## can't do LC == nums2 because you can't compare multiple lines with
## multiple possibilities.
tag126071june_locfilter<-filter(tag126071june,
                                LC == nums2[1] |
                                  LC == nums2[2] |
                                  LC == nums2[3] | Message_Type=="GPS")

tag126071july_locfilter<-filter(tag126071july,
                                LC == nums2[1] |
                                  LC == nums2[2] |
                                  LC == nums2[3] | Message_Type=="GPS")

tag126070_locfilter <-filter(tag126070,
                             LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")

tag126069may_locfilter <-filter(tag126069may, LC == nums2[1] |
                                  LC == nums2[2] |
                                  LC == nums2[3] | Message_Type=="GPS")
tag126069july_locfilter <-filter(tag126069july, LC == nums2[1] |
                                   LC == nums2[2] |
                                   LC == nums2[3] | Message_Type=="GPS")
tag126068_locfilter <-filter(tag126068, LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")
tag126067_locfilter <-filter(tag126067, LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")
tag126066_locfilter <-filter(tag126066, LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")
tag126065_locfilter <-filter(tag126065, LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")
tag126064_locfilter <-filter(tag126064, LC == nums2[1] |
                               LC == nums2[2] |
                               LC == nums2[3] | Message_Type=="GPS")

# View(tag126064_locfilter)
# View(tag126071june_locfilter)


#Create a vector that binds all post tag data into one dataframe

Post.all <- rbind(tag126071june_locfilter,
                  tag126071july_locfilter,
                  tag126070_locfilter,
                  tag126069may_locfilter,
                  tag126069july_locfilter,
                  tag126068_locfilter,
                  tag126067_locfilter,
                  tag126066_locfilter,
                  tag126065_locfilter,
                  tag126064_locfilter)
#View(Post.all)

#dayNight, classify each relocation as day or night

# this one is for getting sun rise and sunset time
install.packages("StreamMetabolism")
library(StreamMetabolism)

# finds day/night of each data point for pre closure

datPre <- Pre.all
#View(datPre)

#need to add code for column merging
#want to merge columns so that LC and residual can be added in as a column for GIS metadata 
#if LC is blank, want to merge with data found in Message_Type
#if Residual is blank, want to merge with data found in Message_Type

##I am guessing the issue you had is because oyu are trying to mix
##vector types (numeric and factor) into a string which R does not like
##the easiest solution I have is to call them all characters and then do the replacement
##LC also had blanks instead of NA's so first I convert those to NA's
##this can also be done by including 'na.strings = "NA"' after 'write.csv' calls

#looking at what kind type of variables the columns are
str(datPre)
str(datPre$LC) #this one seems to have hidden levels
##even though LC should be numeric it is registering as a factor
##what are they?
levels(datPre$LC)
#""  "0" "1" "2" "3" "A" "B" "Z"
##this next step gets rid of those hidden levels and puts in NA
##if you dont want that then this isnt the right way to do this
levels(datPre$LC)[levels(datPre$LC) %in% c("","A","B","Z")]<-NA
##convert all variables of interest to same type (character)
datPre$Message_Type<-as.character(datPre$Message_Type)
datPre$Residual<-as.character(datPre$Residual)
datPre$LC<-as.character(datPre$LC)
##now replace NA's with Message_Type
datPre$Residual[is.na(datPre$Residual)]<-datPre$Message_Type[is.na(datPre$Residual)]
datPre$LC[is.na(datPre$LC)]<-datPre$Message_Type[is.na(datPre$LC)]


# combine them together 

#code below runs but fails for sunrise_set calculations because of the blanks in LC and Residual

Pre.all1 <- subset(Pre.all,
                   select = c("ArgosID", 
                              "Message_Type",
                              "TransmissionDateTime", 
                              "LC",
                              "Residual",
                              "Lat1", "Lon1"))

Pre.all1$Date <- as.POSIXct(strptime(Pre.all1$TransmissionDateTime,
                                     "%m-%d-%Y %H:%M:%S"))

# finds day/night of each data point for post closure

Post.all1 <- subset(Post.all, select = c("ArgosID",
                                         "Message_Type",
                                         "TransmissionDateTime",
                                         "LC",
                                         "Residual",
                                         "Lat1", "Lon1"))
Post.all1$Date <- as.POSIXct(strptime(Post.all1$TransmissionDateTime,
                                      "%m-%d-%Y %H:%M:%S"))

#View(Post.all1)

dat <- na.omit(rbind(Pre.all1, Post.all1))

#View(dat)

rise <- set <- vector(mode = "numeric", length = dim(dat)[1])

#dim(dat)[1]
for (k in 1:dim(dat)[1]){
  tmp <- sunrise.set(dat[k,"Lat1"], dat[k, "Lon1"],
                     dat[k, "Date"],
                     timezone = "America/Los_Angeles")

  rise[k] <- tmp$sunrise
  set[k] <- tmp$sunset
}

dat$sunrise <- as.POSIXct(x=rise, origin = "1970-01-01 00:00.00 UTC")
dat$sunset <- as.POSIXct(x=set, origin = "1970-01-01 00:00.00 UTC")

dat$daynight <- ifelse((dat$Date>dat$sunrise & dat$Date < dat$sunset),
                       1, 2)

uniqIDs <- unique(dat$ArgosID)

for (k in 1:length(uniqIDs)){
  outfile <- paste0(uniqIDs[k], 'DayNight',
                    format(Sys.Date(), "_%Y-%m-%d"), '.csv')
  datTmp <- dat[dat$ArgosID == uniqIDs[k],]
  write.csv(datTmp, file = outfile, quote = F, row.names=F)
}












