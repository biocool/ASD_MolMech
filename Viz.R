
library(circlize)


# grid.col = c(WWW = "gray", Sulindac = "gray", Buspirone = "gray", Sertraline = "gray", Methylphenidate = "gray", 
#              Retinoic_acid = "gray", Rapamycin = "gray", Cannabidiol = "gray", Curcumin = "gray", 
#              Luteolin = "gray", Sulforaphane = "gray", RQG = "gray", Atomoxetine = "gray", Risperidone = "gray", 
#              Aripiprazole = "gray", Fluoxetine = "gray", Clonazepam = "gray", Everolimus = "gray", 
#              Tideglusib = "gray", Dapt = "gray", EGCG = "gray", S3I_201 = "gray", AG126 = "gray", 
#              Pioglitazone = "gray", Mirdametinib = "gray", SL327 = "gray", Tomivosertib = "gray", 
#              Romidepsin = "gray", Vorinostat = "gray", Metformin = "gray", Lenalidomide = "gray", 
#              ICRF_187 = "gray", IGF_1 = "gray", Guanfacine = "gray", Melatonin = "gray", NAC = "gray", 
#              Vitamin_D = "gray", Oxytocin = "gray", Bumetanide = "gray", Lovastatin = "gray", 
#              Arbaclofen = "gray", Trofinetide = "gray", BPN14770 = "gray", Anavex = "gray", 
#              Atosiban = "gray", Cariprazine = "gray", Memantine = "gray", Acamprosate = "gray", PUR = "gray")
# 





# chor diagram for drug target========
drug_target_pathway <- 
  read.csv("./Data/filetered_drug_table.csv")
dim(drug_target_pathway) #58  3


drug_target_pathway_4chord <-
  data.frame(from = drug_target_pathway$Drug,
                to = drug_target_pathway$Target.pathway,
                value = drug_target_pathway$Weight,
                stringsAsFactors = FALSE)

pdf("./Viz/chord_drug_pathway2.pdf")
# setting the font size 
par(cex = 0.7, mar = c(0, 0, 0, 0))
chordDiagram(drug_target_pathway_4chord, annotationTrack = "grid", preAllocateTracks = 1,
             link.sort = TRUE, link.decreasing = TRUE)

circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + .1, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
  #circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.2, sector.index = sector.name, track.index = 2)
}, bg.border = NA)
dev.off()

