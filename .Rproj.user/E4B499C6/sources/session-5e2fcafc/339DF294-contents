
library(circlize)


mat = matrix(1:9, 3)
rownames(mat) = letters[1:3]
colnames(mat) = LETTERS[1:3]
chordDiagram(mat)

df = data.frame(from = rep(rownames(mat), times = ncol(mat)),
                to = rep(colnames(mat), each = nrow(mat)),
                value = as.vector(mat),
                stringsAsFactors = FALSE)
df
chordDiagram(df)



grid.col = c(S1 = "red", S2 = "green", S3 = "blue",
             E1 = "grey", E2 = "grey", E3 = "grey", E4 = "grey", E5 = "grey", E6 = "grey")
chordDiagram(mat, grid.col = grid.col)
chordDiagram(t(mat), grid.col = grid.col)


