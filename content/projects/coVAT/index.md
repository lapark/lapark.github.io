---
layout: page
title: "Approximate clustering of very large scale data"
featured_image: "VAT_Dc.gif"
---

Many machine learning, data mining and statistical analysis tasks are
used to identify properties of data, or to build models of sampled
data. Unfortunately, these analytical methods are computationally
expensive; their computational resource use being a function of the
dimensionality and sample count of the data being analysed. Recent
advances is data acquisition (such as genetic sequencing) have allowed
us to capture very large amounts of data (of the order of terabytes)
for analysis and modelling. The complexity of current machine learning
and data mining methods makes them infeasible to be directly applied
to such large scale data.

In this project, we will examine methods of computing approximate
clusterings of very large scale data in an efficient and scalable
manner. By obtaining approximate clusters, we will be able to
partition large data sets into smaller, more manageable, independent
sets in which we can easily apply machine learning and data mining
analysis.

To date, we have developed a scalable version of coVAT (Visual
Assessment of Co-Cluster Tendency) that provides a graphical mapping
of the co-clusters within a data set. Using this mapping, the user is
able to identify the number of co-clusters within the data set and
where to partition the data to obtain approximate independent
partitions.

{{< figure src="VAT_Dc.gif" title="A coVAT image showing the co-clusters inherent in a very large scale data set." >}}

