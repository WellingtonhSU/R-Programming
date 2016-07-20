# K-Mean Demonstration

AAPL = read.csv("AAPL.csv")
result = kmeans(AAPL[1:100,2], 4)
plot(AAPL[1:100,2], result$cluster)
points(result$cluster, col = 1:4, pch = 8)

mat = matrix(unlist(result))
