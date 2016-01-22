
# Load packages
Installed <- require("plyr")
if (!Installed) {
    install.packages("plyr")
    library("plyr")
}

Installed <- require("ggplot2")
if (!Installed) {
    install.packages("ggplot2")
    library("ggplot2")
}

Installed <- require("scales")
if (!Installed) {
    install.packages("scales")
    library("scales")
}

# Load raw data
trainraw <- read.csv("Data/train.csv")
# Convert categories to lower case except for first letter
levels(trainraw$Category) <- paste(
    substring(levels(trainraw$Category), 1, 1),
    tolower(substring(levels(trainraw$Category), 2)),
    sep = "")

# Convert Dates variable from factor to date
trainraw$Dates <- as.Date(trainraw$Dates)
# Count daily frequency of each crime
freqByCat <- count(trainraw, c("Dates", "Category"))

dataSeparate <- function(category) {
    # Create data frame with only data from chosen category
    dataByCateg <- freqByCat[freqByCat$Category == category, c(1, 3)]
    # Extract month and year into new variables
    dataByCateg$Month <- as.Date(cut(dataByCateg$Dates, breaks = "month"))
    dataByCateg$Year <- as.Date(cut(dataByCateg$Dates, breaks = "year"))
    return(dataByCateg)
}

plotCrime <- function(data, time, category) {
    plotByCategory <- ggplot(data = data, aes_string(time, "freq"))
    plotByCategory <- plotByCategory +
        stat_summary(fun.y = sum,  # adds up all observations for the timeframe
                     geom = "line")
    plotByCategory <- plotByCategory +
        scale_x_date(labels = date_format("%m/%Y")) +  # custom x-axis labels
        ggtitle(paste(category, "by", time)) +
        theme_bw()
    return(plotByCategory)
}