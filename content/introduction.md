## Introduction
{:#introduction}

The large scale publication of linked data empower more freedom in the realm of creation and usage of web applications.
It manifests in the diminution of data silos [](cite:cites Verstraete2022, Sambra2016SolidA)
and in potential new forms of application ownership [](cite:cites Mechant2021).
Existing popular examples of projects utilizing this emancipatory potential is the [Solid](https://solidproject.org/TR/protocol),
[Mastodon](https://docs.joinmastodon.org/) and the [AT (used by Bluesky)](https://atproto.com/) protocols.
Linked data is mostly modeled and published using the graph data formalization [RDF](https://www.w3.org/TR/rdf12-concepts/) and its serialization.
RDF Terms can be expressed using IRIs, Blank Nodes and Litterals.
The usage of IRIs provide more reusability of data and explicitize in a machine interpretable way the links between
information from multiple remote datasets.
More information about an IRI term can be found by dereferencing it using the HTTP protocol.

Link Traversal Query Processing (LTQP)[](cite:cites Hartig2012) is a query paradigm that exploits 
the informative potential of IRIs dereferencing during SPARQL querying.
LTQP starts with a few URIs called seed URIs and recursively dereference URIs from an internal data source following a lookup policy.
While LTQP enables live exploration of environments without prior indexing, it leads to some difficulties.
One of them is its pseudo-infinite search domain derived from the size of the World Wide Web (WWW) [](cite:cites Hartig2014)
Additionally, HTTP requests can be very slow and unpredictable making their execution the bottleneck of the method [](cite:cites hartig2016walking).
Reachability criteria [](cite:cites Hartig2012) are a partial answer to this problem by defining completeness on the traversal of URIs
contained in the internal data source instead of on the acquisition of all the results or the traversal of the whole web.
Those criteria can also be used as a lookup policy for dereferencing of external data sources.
Another difficulty is the lack of a priori information about the sources rendering query planning arduous.
To alleviate this problem, the current state of the art is to use carefully crafted heuristics for joins ordering [](cite:cites Hartig2011, Hartig2014).
Those heuristics provide non-optimal fairly performant query plans.
The limitation of the current heuristic usually are of little importance because the main bottleneck of the approach is the high number of HTTP requests.
In response to this, current research focuses on providing fast results to the user by ordering adequately the dereferencing operations of IRIs [](cite:cites hartig2016walking, Ladwig2010).

Linked data is not only used in the open web but also in environment following protocols that we refer to as Linked Data Structured environement (LDSE).
In LDSE it is possible to exploit structural assumptions in the publication of Linked Data to dimunish query execution to a significant extend [](cite:cites Taelman2023).
Those structural assumptions act as contracts between the data provider and 
the query engines stipulating that in a certain subdomain of the web, some information respecting a constraint can be found.
Those assumptions can be declared in the form of hypermedia description [](cite:cites Fielding) or the path structure of URIs.
It has been shown that with this method the reduction of the query execution is to an extend that for some realistic queries
the bottleneck is not the execution of HTTP requests but the suboptimal heuristic-based query plan [](cite:cites eschauzier_quweda_2023, Taelman2023).
Yet for multiple queries the bottleneck remains the high number of HTTP requests [](cite:cites eschauzier_quweda_2023).
It is reasonable to hypothesize that a significative portition of the those HTTP request lead to the dereferencing of
documents containing data that don't contribute to the result of the query.
Hence investigation more descriptive structual assumption is a relevant research endeavor.
Structural assumption based on the path structure of URIs are not a viable solution.
Indeed, those types of assumption either don't describe enough the data, need to be too exhaustive or they are not compatible with the specific data publication strategy
of agent, combined with the fact they are not easily described in a machine interpretable ways they don't make a potentially general solution
for this problem.

In this article, we proposed to use RDF shapes as the main mechanism for a structural assumption in the form of a Shape Index (SI).
RDF shapes are mostly used in data validation [](cite:cites Gayo2018a) hence they provide an excellent mean to discribe data, they also have been used
in the context of federated query optimization has a not expensive means for the data provider to optimize queries [](cite:cites kashif2021).
We indend to use the SI in the context of queries for data source discovery, URIs dereferencing discrimination and ordering, and query planning.
This short paper will focus on data discovery and URIs dereferencing discrimination that we are going to refer to as link pruning,
the rest is delegated to future works.
