# cloudtodem
Convert a dense point cloud to a DEM.

## Setup
On macOS, needed to install `cmake`, `pkg-config`,`udunits`, and `gdal` using `brew`, e.g...

```bash
brew install cmake
brew install pkg-config
brew install udunits
brew install gdal
```

## Usage
To process a point cloud, simply run the script from the terminal, passing in the point cloud file path as the argument.

```bash
RScript cloudtodem.R NEONDSSampleLiDARPointCloud.las
```

**Note that only `.LAS` and `.LAZ` files are supported**.