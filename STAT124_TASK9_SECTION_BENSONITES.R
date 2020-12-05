# Members:
# Rosales, Celestine Joy
# Santos, Jhon Benson
# Sta Mina, Christine Isabel

#### Question Number 1 ----

dviolence <- read.csv("dviolence.csv")

# a)
dviolence$SexInter <- rep(NA, nrow(dviolence))

dviolence$SexInter[dviolence$SuspectSex == "Male"
                   & dviolence$VictimSex == "Male"] <- "Male on Male"

dviolence$SexInter[dviolence$SuspectSex == "Male" 
                   & dviolence$VictimSex == "Female"] <- "Male on Female"

dviolence$SexInter[dviolence$SuspectSex == "Female"
                   & dviolence$VictimSex == "Male"] <- "Female on Male"

dviolence$SexInter[dviolence$SuspectSex == "Female" 
                   & dviolence$VictimSex == "Female"] <- "Female on Female"

# b)
dviolence$Relationship2 <- rep(NA, nrow(dviolence))

dviolence$Relationship2[dviolence$Relationship == "Victim was Ex-Spouse" 
                        | dviolence$Relationship == "Victim was Boyfriend/Girlfriend - BG" 
                        | dviolence$Relationship == "Victim was Spouse"] <- "Lover/Ex-lover"

dviolence$Relationship2[dviolence$Relationship == "Victim was Parent" 
              | dviolence$Relationship == "Victim was Child" 
              | dviolence$Relationship == "Victim was Other Family Member"] <- "Family Member"

dviolence$Relationship2[dviolence$Relationship == "Victim was Offender"] <- "Offender"

dviolence$Relationship2[dviolence$Relationship == "Victim was Friend" 
              | dviolence$Relationship == "Victim was Otherwise Known" 
              | dviolence$Relationship == "Victim was Aquaintance"] <- "Others"

dviolence$Relationship2[dviolence$Relationship == "Relationship Unknown"] <- "Unknown"

# c)
dviolence <- subset(dviolence, select = -Relationship)

# Question Number 2 ----

# a)
age_of_others <- dviolence[dviolence$Relationship2 == "Others", c(2,4)]
View(age_of_others)

# b)
underage_victims <- dviolence[dviolence$VictimAge < 18, c(2,4,1,6)]
View(underage_victims)
