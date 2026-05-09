---
layout: page
title: "Efficient and effective use of Language Models for Information Retrieval"
featured_image: "image008.jpg"
---

Language models for text based information retrieval have become a de
facto standard due to their simplicity and effectiveness. Recently,
several language modelling techniques have been developed that assume
a hidden distribution of topics within the set of documents. Such
methods include Probabilistic Latent Semantic Analysis (PLSA) and
Latent Dirichlet Allocation (LDA), where the former uses a multinomial
distribution of topics, while the latter uses a Dirichlet prior. By
using this notion of hidden topics, we are able to compute
relationships from term to topic and hence term to
term. Unfortunately, these language modelling methods produces large
amounts of data and require lengthy periods of time to perform
document retrieval.

For our project, we aim to investigate the data that these language
modelling methods produce and hence develop methods of efficiently
storing the data that is needed in order to maintain the high
precision obtained by these systems. By reducing the data storage, we
will also be able to speed up query times and hence provide a more
useable topic based language model.

To date, we have shown that we can reduce the storage required by PLSA
to 0.15% of its original storage while providing a statistically
insignificant change in precision.

{{< figure src="image008.jpg" title="PLSA large storage requirements when using an index can be drastically reduced by using a thesaurus and term frequency index in its place." >}}

