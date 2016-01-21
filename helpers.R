# Load raw data
trainraw <- read.csv("Data/train.csv")

# Count daily frequency of each crime
freqByCat <- count(trainraw, c("Dates", "Category"))

plotCrime <- function(category) {
    # Create data frame with only data from Category of ARSON
    dataByCat <- freqByCat[freqByCat$Category == category, c(1, 3)]
    # Extract month and year into new variables
    dataByCat$Month <- as.Date(cut(dataByCat$Dates, breaks = "month"))
    dataByCat$Year <- as.Date(cut(dataByCat$Dates, breaks = "year"))
    
    plotByCategory <- ggplot(data = dataByCat, aes(Month, freq))
    plotByCategory <- plotByCategory +
        stat_summary(fun.y = sum,  # adds up all observations for the month
                     geom = "line")
    plotByCategory <- plotByCategory +
        scale_x_date(labels = date_format("%m/%Y"))  # custom x-axis labels
    plotByCategory <- plotByCategory + ggtitle("Arson by Month")
    return(plotByCategory)
}

# adjusts yahoo finance data with the monthly consumer price index 
# values provided by the Federal Reserve of St. Louis
# historical prices are returned in present values 
adjust <- function(data) {

      latestcpi <- last(.inflation)[[1]]
      inf.latest <- time(last(.inflation))
      months <- split(data)               
      
      adjust_month <- function(month) {               
        date <- substr(min(time(month[1]), inf.latest), 1, 7)
        coredata(month) * latestcpi / .inflation[date][[1]]
      }
      
      adjs <- lapply(months, adjust_month)
      adj <- do.call("rbind", adjs)
      axts <- xts(adj, order.by = time(data))
      axts[ , 5] <- Vo(data)
      axts
}