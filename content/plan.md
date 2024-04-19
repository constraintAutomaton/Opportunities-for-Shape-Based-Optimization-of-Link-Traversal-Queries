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
"Evaluation of Link Traversal Query Execution over Decentralized Environments with Structural Assumptions", 
but we define the concept of Linked Data Structured Environment (LDSE) which are linked data environment
with an explicit domain with structural assumptions (yes it is pretty much the same with an acronym, but we put the emphasis on the domain
so the WWW of linked data is a pseudo-infinite domain with no structure assumption and it contains multiple LDSE).
We present a bit of the classic of LTQP (very short, seed URL, recursion and the whole story),
we present a bit of shape how it is used for validation and queries (very short, mostly validation,
so examples of query optimization and rewriting, mostly citations to show that we know it exists).

## Explanation of the method
We present the shape index, how it binds a shape to a set of resources and how it can be complete or incomplete 
(describe all the resources of the domain or not) and that that it has a domain of action 
(an expression describing the zone of action of the domain;
out of scope by why having a domain when the index is incomplete?
I guess we can do it for more extensibility,
let's say we have another structural assumption with the same or overlapping domain we could more easily analyze together).
We present a turtle serialization of it.

We talk about how we can push down the query and evaluate its containment the shape.
We divide the query into multiple subqueries targeting each star patterns (we somehow link between the star patterns)
and check the containment/alignment with the shape converted as a query.
We talk about how to interpret the results of those containment/alignment 
based on if the which shape is aligned or not and if the index is complete or not.
(we can leave out when part of the bgp is out of the environement)

## Result-discussion

We present 3 queries, one of the complex, discovery and short.
We show the difference with the full algorithm (best-case closed shapes, complete shape index and consider the complement shapes)
CtypeIndex and CTypeIndexWithLDP. We present the result and explained to them with the containment algorithm.
We modify the query to be the more descriptive and we show briefly that we can improve performance. 

## Conclusion

