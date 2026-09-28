<!-- README.md is generated from README.Rmd. Please edit that file -->

    ## Loading required package: markdown

    ## 
    ## Output created: README.html

    ## [1] "README.html"

# Drygate Brewery Color Palettes

<!-- ![](rushmore.jpg) -->

This is an R color palette of one of my favorite breweries: Drygate
Brewing Co. from Glasgow, Scotland: <https://www.drygate.com>. Excellent
in taste *and* labels.

Credits go to Karthik Ram and his [Wes Anderson color palette
package](https://github.com/karthik/wesanderson) for inspiration and
code.

## Installation

``` r
install.packages("")
```

**The development version**

``` r
devtools::install_github("MAClaassen/drygatebrewer")
```

## Usage

``` r
library("drygatebrewer")
# See all palettes
names(drygate_palettes)
#>  [1] "SevenPeaks"         "GladEyeIPA"         "KelvinPilsner"     
#>  [4] "BearfaceLager"      "DiscoForkliftTruck" "TakeMeTotheRiver"  
#>  [7] "CrossingtheRubicon" "Drygate"            "CloudCity"         
#> [10] "Shred"              "Voller"
```

## Palettes

### Basic

#### Drygate Bewery

``` r
drygate_palette("Drygate")
```

![](figure/fig_drygate-1.png)<!-- -->

#### Seven Peaks

``` r
drygate_palette("SevenPeaks")
```

![](figure/fig_sevenpeaks-1.png)<!-- -->

#### GladEye IPA

``` r
drygate_palette("GladEyeIPA")
```

![](figure/fig_gladeye_ipa-1.png)<!-- -->

#### Kelvin Pilsner

``` r
drygate_palette("KelvinPilsner")
```

![](figure/fig_kelvinpilsner-1.png)<!-- -->

#### Bearface Lager

``` r
drygate_palette("BearfaceLager")
```

![](figure/fig_bearfacelager-1.png)<!-- -->

### Fun

#### Disco Forklift Truck

``` r
drygate_palette("DiscoForkliftTruck")
```

![](figure/fig_discoforklifttruck-1.png)<!-- -->

#### Take Me To the River

``` r
drygate_palette("TakeMeTotheRiver")
```

![](figure/fig_takemetotheriver-1.png)<!-- -->

#### Crossing the Rubicon

``` r
drygate_palette("CrossingtheRubicon")
```

![](figure/fig_crossingtherubicon-1.png)<!-- -->

``` r
drygate_palette("CloudCity")
```

![](figure/fig_cloudcity-1.png)<!-- -->

``` r
drygate_palette("Shred")
```

![](figure/fig_shred-1.png)<!-- -->

``` r
drygate_palette("Voller")
```

![](figure/fig_voller-1.png)<!-- -->

### Example uses

``` r
library("ggplot2")
ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar() +
  scale_fill_manual(values = drygate_palette("CloudCity")) +
  labs(x = "Cut", y = "Count", fill = "Cut")
```

![](figure/fig_ex_disco-1.png)<!-- -->

``` r

# pick specific colors
mpg$drivetrain <- factor(mpg$drv, levels = c("f", "r", "4"),
                          labels = c("Front-wheel", "Rear-wheel", "4-wheel"))
pal <- drygate_palette("Drygate")[c(1, 4, 6)]
ggplot(mpg, aes(drivetrain, fill = drivetrain)) +
  geom_bar() +
  scale_fill_manual(values = pal) +
  labs(x = "Drivetrain", y = "Count", fill = "Drivetrain")
```

![](figure/fig_ex_disco-2.png)<!-- -->

``` r
pal <- drygate_palette("TakeMeTotheRiver", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/fig_ex_river-1.png)<!-- -->
