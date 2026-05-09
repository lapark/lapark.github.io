---
layout: page
title: "Improving the quality of Web information retrieval using multi-resolution link analysis"
featured_image: "image002.jpg"
---

The World Wide Web is the most important information source in modern
society. The information within the Web is accessed through Web search
engines such as Google and Yahoo. These search engines use a global
popularity rank during the computation of their results, based on
links from all of the pages on the Web. This global popularity rank
used by Google is known as PageRank. Using these global popularity
ranks biases the search results towards the globally popular Web
pages. Our aim is to investigate the effect of a peer popularity rank
where popularity is measured only through sites of a similar
nature. We perform this task by observing the interaction between Web
pages at a finer resolution (as shown in Fig. 1). We expect that using
the peer popularity rank will allow search engines to locate Web pages
that are more specific to the user needs rather than pages of general
popularity. This will improve the quality of information that is
delivered by Web search engines and provide organisation amongst the
billions of existing Web pages.

We can illustrate our argument with this simple example. If we were to
ask a group of people where to buy a toaster, they would direct us to
one of the big stores like Myer; this is a popular shop but it is not
a specialist in any area. On the other hand if we were to ask a group
of people who know a lot about toasters, they would direct us to a
specialist shop like "Joe's toaster emporium" where we would get
specialist advice as to which toaster to choose. Please note that the
Web was searched for a specialist toaster shop, but all that was
returned was Amazon.com (the most popular general store on the
Web). This result in itself shows that our research is essential.

To date, our research has lead us to analyse the effect of using
Symmetric Non-negative Matrix Factorisation (SNMF) to discover
multi-resolution Web communities. We have shown that by using this
method, we could potentially provide a 50% increase in the precision
of the retrieval results over Google's PageRank. Further research
using SNMF must be performed to examine the relationships between the
community ranks and the users' queries.

{{< figure src="image002.jpg" title="A Web graph showing one community partition at the lowest resolution, two community partitions found at the medium resolution, and four community partitions found at a high resolution." >}}


