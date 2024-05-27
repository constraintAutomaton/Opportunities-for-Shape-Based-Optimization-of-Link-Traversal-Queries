# Opportunities for Shape-based Optimization of Traversal Queries over Decentralized Environments

Short paper submitted for the ["Alberto Mendelzon International Workshop on Foundations of Data Management"](https://amw2024.github.io/).

## Abstract
Linked Data on the Web can be considered as one very large Decentralized Knowledge Graph (DKG). Querying
this DKG in a link traversal-based manner is difficult due to the pseudo-infinite size of the Web, its unstructured
nature, and the lack of a priori information for query planning. In practice, queries target small subsets of the
Web. Most of those subsets are structured either implicitly or explicitly. Explicit structure can be described via the
path structure of the URL or with hypermedia descriptions. Using those structural information query engines can
improve their performances. Our goal is to explore the opportunities for using shape-based structural metadata
within decentralized environments to improve discovery and query planning for traversal-based queries. In
this article, we discuss these opportunities, present preliminary results, and discuss potential future work. Our
initial experiments show that with little maintenance and work from the server, our method can more selectively
discover data, leading to significant reductions in query execution time compared to the current state of the
art. In future work, we are going to formalize our method, perform more extensive experiments, and design
algorithms for query planning that take into account this shape metadata.

## Conclusion 

Our approach for shape-based optimization for LTQP over decentralized environments consists of
exploiting the structure provided by annotated data sources with RDF shape metadata. We propose the
usage of a shape index as a metadata descriptor. This shape index maps subdomain of the web with an
RDF shape validating its content. We propose to solve a query shape containment problem analogous
to the classic query containment problem for dynamic source selection using an adaptative lookup
policy. Our early experiment shows that this approach can significantly reduce the query execution
time and the number of HTTP requests. In future work, we will propose a featureful implementation of
our containment algorithm and provide a more detailed explanation of the approach and the analysis
of the performance of the method. Furthermore, we intend to explore the usage of RDF shape in the
context of LTQP for query planning and IRI dereferencing prioritization.