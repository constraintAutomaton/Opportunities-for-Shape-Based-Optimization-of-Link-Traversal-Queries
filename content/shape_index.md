## Shape index and query shape containment
{:#shapeIndex}

We define a SI as a set of mapping between RDF shapes and sets of resources.
Additionally, the SI has an associated domain of action
and a flag indicating if each resource in the domain is bound by a shape. 
We refer to a SI with this flag as a complete shape index.
In a SI when a shape is in relation with a set of RDF resources then the shape must validate those documents
and every set of triples respecting the shape must be inside one document of the set.
Additionally, if the shape has an RDF class constraint
than every set of triples associated with that class must respect the shape.

An RDF shape describes the predicates an RDF subject must have with associated information about
their cardinality and a constraint binding the RDF objects.
RDF shapes can be transformed into a SPARQL query, but
in this short paper we are not going to provide proof for this proposition, however,
Delva et al. [](cite:cites Delva2021) provide an intuition by demonstrating how to extract 
a subgraph from an RDF graph using RDF shape as a query language.
Considering a query $$Q_p$$ a subquery of the query provided by the user $$Q$$
where $$Q_p$$ is created from a star pattern and its dependencies inside $$Q$$
,and $$Q_s$$ formed by the transformation of a shape inside of the SI
into a query then if  $$Q_p$$ is contained inside $$Q_s$$ the associated 
set of documents can contribute to the query result.
Often $$Q_p$$ is contained inside multiple $$Q_s$$ due to the reuse of vocabulary terms,
in those instances, we consider every document associated with those shapes
as potential sources of solutions, unless $$Q_p$$ and $$Q_s$$ are bound by the same RDF class then we only consider $$Q_s$$.
We use this heuristic because we consider that if the user specifies a class it indicates their intention for a specific object,
one could consider that it is not a needed heuristic because shapes without that class would not be "containers" of the query,
but it is false due to potential optional predicates inside of RDF shapes.
If every $$Q_p \in Q$$ are contained by a shape of the SI then we know before the request of the whole domain
where potential solution can be gotten, so we can safely adapt the lookup policy to prune links from the rest of the domain.
Above is the best-case scenario but other propositions are necessary to completly solve the problem.
If one of the shapes is open then it will always be necessary to visit the set of the documents associated
with it. If the SI is complete and some $$Q_p$$ are not contained inside a $$Q_s$$ then the engine has to visit
every set of documents where $$Q_p$$ has a partial binding with an associated $$Q_s$$.
In a similar case where the SI is not complete then it is necessary to visit every document in the domain minus those
where the $$Q_p$$ have no partial binding with the $$Q_s$$.
Lastly, if the dereferencing of the triples from $$Q_p$$ that have no binding with $$Q_s$$
leads to resources outside of the domain of the SI then we consider that $$Q_p  \sqsubseteq Q_s$$.
This last proposition is the only dynamic part of our approach , indeed until this
proposition it was possible without any dereferencing to determine potential more restrictive search spaces.
This implies that to benefit from this proposition the derefencing of those URI has to be executed
before the dereferencing of URIs that the we know are inside the domain of the SI.