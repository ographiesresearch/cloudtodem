targets::tar_source()
targets::tar_option_set(packages = c("lidR", "terra"))

input_path <- Sys.getenv("INPUT_PATH")

output_path <- paste(
  tools::file_path_sans_ext(input_path),
  "tif",
  sep = "."
  )

list(
  targets::tar_target(
    file,
    input_path,
    format = "file"
  ),
  targets::tar_target(
    data,
    lidR::readLAS(file)
  ),
  targets::tar_target(
    classified,
    data |>
      lidR::classify_noise(lidR::ivf(res = 3, n = 10)) |>
      lidR::filter_poi(Classification != LASNOISE) |>
      lidR::classify_ground(algorithm = lidR::csf())
  ),
  targets::tar_target(
    dem,
    classified |>
      lidR::rasterize_terrain(
        res = 1, 
        algorithm = lidR::tin()
        ) |>
      terra::writeRaster(output_path)
  )
)