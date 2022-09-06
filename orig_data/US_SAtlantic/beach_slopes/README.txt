Description of the two files:
- US_East_coast_slopes_by_beach.geojson
- US_East_coast_slopes_by_transect.geojson

Note that there are more recent updated versions:
- v2 was corrected by directly adjusting the time-series to remove intra-satellite biases.
- v3 was reprocessed with pansharpening switched off (best product)

1. US_East_coast_slopes_by_beach.geojson: contains a geospatial layer with each individual beach/embayment (as a linestring).
Each feature has the following attributes:
  - id: Database id for each beach, e.g., usa_FL_0001,  usa_FL_0002, etc...
  - beach_slope_weighted_average: Average of the beach-face slope at the site, weighted by the width of the confidence bands along each transect, value between 0.01 and 0.2
  - width_ci_average: Average width of confidence band over the comprised transects, value between 0 and 0.19
  - quality_flag: Quality flag indicating the confidence in the slope estimate at this transect (High, Medium or Low)
  - beach_slope_average: Average of the beach-face slope at the site (plain mean)
  - beach_slope_median: Median of the beach-face slope at the site
  - sl_points_average: Average number of datapoints in the shoreline time-series over the comprised transects
  - mstr: Mean Spring Tide Range at the beach calculated from the closest grid point in the FES2014 global tide model
  - hsig_median: Median Significant Wave Height from the closest grid point in the CAWCR re-analysis dataset
  - prc_msrt_obs: percentage of the Mean Spring Tide Range observed by the satellite-derived shorelines
  - min_tide_obs: Lowest tide level observed by the satellite-derived shorelines
  - max_tide_obs: Highest tide level observed by the satellite-derived shorelines
  - easting: easting coodinate of the centroid for the site in EPSG:32617
  - northing: northing coodinate of the centroid for the site in EPSG:32617

2.  US_East_coast_slopes_by_transect.geojson: contains a geospatial layer with cross-shore transects.
Each feature in this layer is a transect (2 point linestring) with the following attributes:
  - id: Database id for each transect, e.g., usa_FL_0001-0000, usa_FL_0001-0001, etc...
  - site_id: Database id for each beach, e.g., usa_FL_0001, usa_FL_0002, etc...
  - beach_slope: estimate of the beach-face slope between Mean Sea Level (MSL) and Mean High Water Springs (MHWS), value between 0.01 and 0.2
  - lower_conf_bound: Lower limit of the confidence band for the slope estimate
  - upper_conf_bound: Upper limit of the confidence band for the slope estimate
  - width_ci: Width of confidence band, value between 0 and 0.19)
  - quality_flag: Quality flag indicating the confidence in the slope estimate at this transect (High, Medium or Low)
  - sl_points: Number of datapoints in the shoreline time-series used for beach-face slope estimation (minimum set to 100)
  - trend: linear trend in the shoreline time-series in metres per year