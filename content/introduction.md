## Introduction
{:#introduction}

The web contains a lot of information that can be used and reused for different kinds of applications.
Data on the web can be modeled and published as linked data using the RDF standard.
RDF is a standard with multiple serializations to describe, publish and exchange graph data.
RDF data are express in the form of triples (subject, predicate, object) where each term can be IRIs, literal or a blank node.
Iris can be dereference via an HTTP request to access more context or information about a term.
This form data publication give the posibility to diminush data silo [](cite:cites Verstraete2022, Sambra2016SolidA )
hence empowering more freedom to create inovative application or to empower new forms of application ownership [](cite:cites Mechant2021).

Link Traversal Query Processing (LTQP)[](cite:cites Hartig2012) is a query paradigm the explo power of iri dereferencing during SPARQL querying.
LTQP queries consist of starting with a few uris called seed uris and deferencing recursively uris from an internal data source following a lookup policy.
The LTQP method have some difficulties.
The first one is that the World Wide Web (WWW) can be model has a pseudo infinte graph creating an impossible search domain to fully naviage [](cite:cites Hartig2014),
plus HTTP request can be very slow and inpredictable rending it the bottleneck of the method [](cite:cites hartig2016walking).
Reachability criteria [](cite:cites Hartig2012) is a partial answer to this problem by defining completeness based on the traversal of iri
which can also be used as a lookup policy.
The second one is the lack of a priori information rendering query planning difficult.
The current state of the art is to use heuristic for the join ordering [](cite:cites Hartig2011, Hartig2014).
Those heuristic provide faily performant query plan and given that the bottlenecl is the hight number of HTTP request, 
current research focus on providing fast to the user by ordering the dereferencing of iris [](cite:cites hartig2016walking, Ladwig2010).

Another alternative is to exploit structural assumptions in the publication of linked data [](cite:cites Taelman2023).
Those structural assumption guarenty by the data provider than in a certain subdomain of the web some information
can be found at specifics locations.
Those assumptions can be in the form of hypermedia description [](cite:cites Fielding) like in the [type index specification](https://solid.github.io/type-indexes/){:.mandatory}
or in the path structure of servers like in the [LDP specification](https://www.w3.org/TR/ldp/){:.mandatory}.
With those assumption it is possible  to greatly reduce the query execution to the point that the bottleneck is not the http request anymore,
but the query plan [](cite:cites Taelman2023).

In this work we proposed to use RDF shapes which are useally used for data validation [](cite:cites Gayo2018a), but also 
for federated query optimization [](cite:cites kashif2021) as a structural assumptions in the form of a shape index,
for link prunning, link queue ordering and join ordering. 
But this current work will focus on link prunning. 
