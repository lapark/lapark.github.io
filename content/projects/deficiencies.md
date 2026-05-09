---
layout: page
title: "Discovering document model deficiencies for information retrieval"
featured_image: "/images/image004.jpg"
---

Text based information retrieval systems are built using document
models. To analyse the retrieval precision of a model, a set of
queries are provided to the model and the results are compared to the
desired results. This type of analysis allows us to compare the
precision of different retrieval models, but it does not provide us
with any feedback on where the models could be improved. Currently
there are no methods of analysis of text retrieval systems that are
able to show where deficiencies lie within the document model. We aim
to investigate methods of retrieval analysis that is able to reveal
where specific document model deficiencies occur, using a given query
and document set. Our analysis will allow information retrieval
experiments to be more thorough and show why certain document models
achieve a certain precision, thus allowing the document models to be
adjusted and improved.

To date, we have developed a document model based entirely on a set of
queries and the associated set of relevant documents. This model
provides perfect precision for each of the known queries. We hope to
use this relevance based model by comparing it to a given document
model in order to identify differences (shown in Fig. 2). The
differences will show where the deficiencies lie in the given document
model. We have also shown that by combining this relevance based model
with a standard document model, we are able to boost the precision of
known queries while not loosing any precision for unknown queries.

{{< figure src="/images/image004.jpg" title="The document model deficiencies are found by comparing the document model to the oracle model." >}}

