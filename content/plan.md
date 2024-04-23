We only have 4 pages and the requirement are as follow.
It doesn't specify if the abstract and reference count so I guess we ought to consider that they count.


https://amw2024.github.io/call/

Short papers (up to 4 pages) containing original ongoing research or recently published results.


Submissions should be written in English and formatted according to the CEURART style (see official CEUR Overleaf template).

Submissions must be uploaded in PDF format using the following link:
https://easychair.org/conferences/?conf=amw2024

Both extended abstracts and short papers will be published in the CEUR Workshop Proceedings.


Let's divide the paper we consider that we have one page for the abstract and references.
We have one page for the introduction with the related work included in it.
We have one page for the explanation of the method, we have one page for the results

Abtract: 0.5 page
Introduction-related work: 0.75 page
Explanation of the method: 0.5 page
Result-discussion: 1 page
Conclusion:0.5 page
Reference: 0.5 page

# Plan

## Abstrat
...

## Introduction-related work
We position ourselves as the continuation of 
"Evaluation of Link Traversal Query Execution over Decentralized Environments with Structural Assumptions," 
but we put the emphasis on the notion of the domain of the structural assumption. 
Our engine when it dereference a link always enters in
an environment with structural assumptions, when it is in the open web the assumption is that the data is in WWW (by the structure of HTTP and we can navigate by the IRI), 
but sometimes we can find a document with hypermedia description that provides more restrictive assumptions.
We clarify that assumption !== guaranty because we cannot control what is published in the web (a particular structured environment is always a subset of the WWW environment)
, we don't have native trust policies (I can define any triple anywhere) and a simple republication *can* change the result because of the bag semantic.

We present a bit of the classic of LTQP (very short, seed URL, recursion and the whole story),
we present a bit of shape how it is used for validation and queries (very short, mostly validation,
so examples of query optimization and rewriting, mostly citations to show that we know it exists).

## Explanation of the method
We present the shape index, how it binds a shape to a set of resources and how it can be complete or incomplete 
(describe all the resources of the domain or not) and it has a domain of action.
(The domain is a regex representing the set of all the possible (existing or not) url attached to the assumption;
out of scope by why having a domain when the index is incomplete?
I guess we can do it for more extensibility,
let's say we have another structural assumption with the same or overlapping domain we could more easily analyze together).
We present a turtle serialization of it.

We talk about how we can push down the query (at the level of the source selection) and evaluate its containment with the shapes.
We divide the query into multiple subqueries targeting each star patterns (we maintain the link between star patterns by creating extra subqueries containing the linked star patterns)
(we are going to omit the question of how we handle the filter expression, in the future we can explain how the definition of the shape simplify the problem)
and check the containment with the shape converted into a query.
We present the different way to interpret the containement based on the open or close shape, the complement of a shape (create another query), in the completness of the shape index.


## Result-discussion

We present 3 queries, one of the complexes, the discoveries and the short (we also compare it with a single endpoint solution to see the completeness of result mainly).
We show the difference with the full algorithm (best-case closed shapes, complete shape index and consider the complement shapes)
CtypeIndex and CTypeIndexWithLDP. We present the result and explained to them with the containment algorithm.
We modify the query to be the more descriptive and we show briefly that we can improve performance. 

## Conclusion

We say that the web of linked data already have implicit schema and the addition of shape can explicit it and help with the data quality.
It can also help for the efficient discovery of data sources relative to their strictness. 
The user should also be the most descriptive possible to benefit the most from pruning of sources, particularly in large environment.