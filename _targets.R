targets::tar_source()
targets::tar_option_set(packges = c("lidR", "terra"))

list(
  targets::tar_target(
    file,
    "NEONDSSampleLiDARPointCloud.las",
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
      lidr::classify_ground(algorithm = lidR::csf())
  ),
  targets::tar_target(
    dem,
    classified |>
      lidR::rasterize_terrain(
        res = 1, 
        algorithm = lidR::tin()
        ) |>
      terra::writeRaster('dem.tif')
  )
)