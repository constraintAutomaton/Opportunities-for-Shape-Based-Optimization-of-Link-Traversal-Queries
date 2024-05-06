## Introduction
{:#introduction}

The large-scale publication of linked data empowers more freedom in the creation and usage of web applications.
More concretely linked data can diminish data silos [](cite:cites Verstraete2022, Sambra2016SolidA)
and could drive potential new forms of application ownership [](cite:cites Mechant2021).
Existing popular projects utilizing this emancipatory potential are the [Solid](https://solidproject.org/TR/protocol),
[Mastodon](https://docs.joinmastodon.org/) ,and [AT (used by Bluesky)](https://atproto.com/) protocols.
Linked data is mostly modeled and published using the graph data formalization [RDF](https://www.w3.org/TR/rdf12-concepts/) and its serializations.
RDF Terms can be expressed using IRIs, Blank Nodes ,and Litterals.
The usage of IRIs provides more reusability of data and explicitizes in a machine-interpretable way the relations between
information from multiple remote or local subgraphs.
More information about an IRI term can be found by dereferencing them using the HTTP protocol.

Link Traversal Query Processing (LTQP)[](cite:cites Hartig2012) is a query paradigm that exploits
the informative potential of IRIs dereferencing during SPARQL queries.
LTQP starts with a few URIs called seed URIs and recursively dereferences them from an internal data source following a lookup policy.
While LTQP enables live exploration of environments without prior indexing, it leads to some difficulties.
One of them is the pseudo-infinite search domain derived from the size of the World Wide Web (WWW) [](cite:cites Hartig2014).
Additionally, HTTP requests can be very slow and unpredictable making their execution the bottleneck of the method [](cite:cites hartig2016walking).
Reachability criteria [](cite:cites Hartig2012) are a partial answer to this problem by defining completeness on the traversal of URIs
contained in the internal data source instead of on the acquisition of all the results or the traversal of the whole web.
Those criteria can also be used as a lookup policy for dereferencing of external data sources.
Another difficulty is the lack of a priori information about the sources rendering query planning arduous.
To alleviate this problem, the current state of the art is to use carefully crafted heuristics for joins ordering [](cite:cites Hartig2011, Hartig2014).
Those heuristics provide non-optimal fairly performant query plans.
The limitations of this approach are usually of little importance because the main bottleneck is the high number of HTTP requests.
In response to this, current research focuses on providing fast results to the user by ordering adequately the dereferencing operations of IRIs [](cite:cites hartig2016walking, Ladwig2010).

Current LTQP research considers that resources are served by HTTP servers.
However, some subsets of the web is expose by web servers implementing protocols above the application layer of the TCP/IP stack.
Those protocols organize the location of the information published in an HTTP server.
Examples of them are Solid and the other protocols presented earlier.
We refer to those subsets of the web as Link Data Structured Environments (LDSE).
An important aspect of LDSE is the explicit structural assumptions.
Structural assumptions act as contracts between the data provider and 
the query engines stipulating that in a certain subdomain of the web, some information respecting a constraint can be found.
Those assumptions can be declared in the form of hypermedia description [](cite:cites Fielding) or in the path structure of URIs.
It has been shown that by making query engines exploit those assumptions it is possible to reduce the query execution time
of realistic queries to the extent where the bottleneck is not the execution of 
HTTP requests but the suboptimal heuristic-based query plan [](cite:cites eschauzier_quweda_2023, Taelman2023).
Yet for multiple queries, the bottleneck remains the high number of HTTP requests [](cite:cites eschauzier_quweda_2023).
It is reasonable to hypothesize that a significant portion of those HTTP requests lead to the dereferencing of
documents containing data that don't contribute to the result of the query.
Hence investigating more descriptive structural assumptions is a relevant research endeavor.
Structural assumptions based on the path structure of URIs are not a viable solution.
Indeed, those types of assumptions either don't describe enough the data, or are too exhaustive to be effective and practical.
Furthermore, the semantic of the URI of the path structure is not easily machine-interpretable, hence
making this approach not suitable for a generalizable solution.

In this article, we proposed to use RDF shapes as the main mechanism for a structural assumption in the form of a Shape Index (SI).
RDF shapes are mostly used in data validation [](cite:cites Gayo2018a) hence they provide an excellent means to describe data.
They are also used to a lesser extent in the context of federated query optimization [](cite:cites kashif2021).
RDF shapes don't require significative power to be maintained because they only need to be changed 
when the data model is modified and not on regular operation over the data source.
The low cost of maintenance combined with the mostly passive contribution of 
the server when using RDF shape for query optimization makes it a promising potential approach. 
We intend to use the SI in the context of queries for data source discovery, URIs dereferencing discrimination and ordering, and query planning.
This short paper focuses on data discovery and URIs dereferencing discrimination that we are going to refer to as link pruning,
the rest is delegated to future works.
