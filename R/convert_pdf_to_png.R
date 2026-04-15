# Install required package if not already installed
if (!require(pdftools)) {
  install.packages("pdftools")
  library(pdftools)
}

# Input and output directories
input_dir <- "img/stepbystep"
output_dir <- "img/stepbystep"

# Create output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Get list of all PDF files
pdf_files <- list.files(input_dir, pattern = "\\.pdf$", full.names = TRUE)

# Loop through each PDF
for (pdf in pdf_files) {
  
  # Get base filename without extension
  base_name <- tools::file_path_sans_ext(basename(pdf))
  
  # Convert PDF to PNG (one file per page)
  png_files <- pdf_convert(
    pdf,
    format = "png",
    filenames = file.path(output_dir, paste0(base_name, "_page_%d.png"))
  )
  
  cat("Converted:", pdf, "->", length(png_files), "pages\n")
}

cat("All PDFs converted successfully!\n")