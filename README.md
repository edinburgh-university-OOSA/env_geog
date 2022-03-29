# Environmental Geography

This is the code for the University of Edinburgh's [Environmental Geography](http://www.drps.ed.ac.uk/21-22/dpt/cxgegr08013.htm) module, for second year undergraduates. It will cover:

* Regional mapping with remote sensing data
* Know how to “upscale” ground data in R and QGIS
* Plan ground data collection
* Accuracy quantification to assess suitability for applications

Code is primarily in R, with some preparation scripts in Python.


## Regional mapping workflow
The suggested workflow to combine diameter at breast height (DBH) data with airborne laser scanning derived digital surface models (DSMs) and digital terrain models (DTMs) to map biomass.  This combines the scripts used during all three weeks.

* Process ground data to above-ground biomass density with [processGround.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week2/processGround.R)
* Add coordinates to ground data with [addCoords.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week3/addCoords.R)
* Batch process lidar tiles to CHMs with [batchCHM.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week2/batchCHM.R)
* Merge CHM tiles to single geotiff [mergeCHM.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week2/mergeCHM.R)
* Make table of biomass and CHM with [alignData.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week3/alignData.R)
* Fit a biomass model [calibrateBiomass.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week3/calibrateBiomass.R)
* Apply biomass model to CHM and write geotiff [mapBiomass.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week3/mapBiomass.R)
* Validate, after pre-processing the validation data, with [validate.R](https://github.com/edinburgh-university-OOSA/env_geog/blob/main/week3/validate.R)



## Week 1
This contains code for potential answers for the first week of this part of the course (teaching week 7).


## Week 2
This contains code for potential answers for the second week of this part of the course (teaching week 8).

## Week 3
This contains code for potential answers for the second week of this part of the course (teaching week 11).



## prep\_data
This contains code to generate the data used in the course.



## Author

Steven Hancock: sthancock
steven.hancock@ed.ac.uk

## Licensing

Gnu Public License

