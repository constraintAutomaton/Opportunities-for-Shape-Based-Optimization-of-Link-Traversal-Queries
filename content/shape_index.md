## Shape index and query shape containment
{:#shapeIndex}

We define a SI as a set of mapping between RDF shape and a set of resources.
The SI also has an associated domain and a flag indicating if each resources of the domain is bind by a shape. 
We refer a SI with this flag as a complete shape index.

In a SI when a shape is in relation with an RDF documents then the shape must validate those documents
and every set of triples respecting the shape must be inside one document of the set.
Additionally if the shape has an RDF class constraint
than every set of triple associated with that class must respect the shape.
Listing [](#example-shape-index) present a turtle serialization of a shape index. 

An RDF shape describes the predicate from an RDF subject with associated information about
their cardinalities and a constraint to their RDF objects.
RDF shapes can be transform into a SPARQL query, but
in this short paper we are not going to provide the proof for this proposition but Delva et al. [](cite:cites Delva2021) provide
an intuition by demonstrating how to extract a subgraph from an RDF graph using RDF shape as a query language.
If we consider a query $$Q_p$$ a subquery of the query provided by the user $$Q$$
where $$Q_p$$ is created from a star patern and its dependancies inside $$Q$$
and $$Q_s$$ formed by the transformation of a shape inside of the SI and we find that $$Q_p$$ is contained inside $$Q_s$$
then we know that in the context of the domain of the SI every result of $$Q_s$$ will be find inside the set of document
mapped with this shape.
In some cases $$Q_p$$ is contained inside multiple $$Q_s$$, in those instances we consider every documents of those sets
as potential source of solutions, unless $$Q_p$$ and $$Q_s$$ are bind by the same RDF class then we only consider $$Q_s$$.
If every $$Q_p \in Q$$ are contained by a shape of the SI then we know before the request of the whole domain
where potential solution can be gotten, so we can safely adapt the lookup policy to prune links
that are part of that domain.
This is the best case scenerario but other are also possible.
For instance if one of the shape is open then it will always be necessary to visit the set of the documents associated
with it.
If it the SI is complete and some $$Q_pi$$ are not contained inside a $$Q_s$$ then the engine have to visit
every set of documents where $$Q_p$$ have a share predicate with an associated $$Q_s$$ considering the filter expressions.
In a similar case where the SI is not complete than it is necessary to visit every document in the domain minus those
where $$Q$$ have no shared properties with the associated $$Q_s$$.


<figure id="example-shape-index" class="listing">
````/codes/shape_index.ttl````
<figcaption markdown="block">
Example of shape index with a turtle serialization
</figcaption>
</figure>
