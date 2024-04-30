## Introduction
{:#introduction}

{:.comment data-author="RT"}
I would reverse the flow of the next paragraph: first motivate Solid, and then explain how Solid works (RDF, ...). But this second part can perhaps be shortened a bit.

The web contains a lot of information that can be used and reused for different kinds of applications.
Data on the web can be modeled and published as linked data using the RDF standard.
RDF is a standard with multiple serializations to describe, publish, and exchange graph data.
RDF data are expressed in the form of triples (subject, predicate, object) where each term can be an IRIs, literal, or a blank node.
IRIs can be dereferenced via an HTTP request to access more context or information about a term.
This form of data publication gives the possibility to diminish data silos [](cite:cites Verstraete2022, Sambra2016SolidA )
hence empowering more freedom to create innovative applications or new forms of application ownership [](cite:cites Mechant2021).

Link Traversal Query Processing (LTQP)[](cite:cites Hartig2012) is a query paradigm that exploits 
the descriptive potential of IRIs dereferencing during SPARQL querying.
LTQP starts with a few URIs called seed URIs and recursively dereferencing URIs from an internal data source following a lookup policy.
While LTQP enables live exploration of environments without prior indexing, it leads to some difficulties.
One of them is the pseudo-infinite search domain derived from the size of the World Wide Web (WWW) [](cite:cites Hartig2014)
Additionally, HTTP requests can be very slow and unpredictable making their execution the bottleneck of the method [](cite:cites hartig2016walking).
Reachability criteria [](cite:cites Hartig2012) are a partial answer to this problem by defining completeness on the traversal of URIs
contained in the internal data source instead of on the acquisition of all the results or the traversal of the whole web.
Those criteria can also be used as a lookup policy for dereferencing external data sources.
Another difficulty is the lack of a priori information about the sources rendering query planning arduous.
To alleviate this problem, the current state of the art is to use carefully crafted heuristics [](cite:cites Hartig2011, Hartig2014) <span class="comment" data-author="RT">Heuristics to do what?</span>.
Those heuristics provide non-optimal fairly performant query plans.
Their heuristic limitations usually are of little importance because the main bottleneck of the approach is the high number of HTTP requests.
In response to this, current research focuses on providing fast results to the user by ordering adequately the dereferencing operations of IRIs [](cite:cites hartig2016walking, Ladwig2010).

{:.comment data-author="RT"}
In the following, make the link back to Solid!

A recent new alternative approach is to exploit structural assumptions in the publication of Linked Data [](cite:cites Taelman2023).
Those structural assumptions act as contracts between the data provider and 
the query engines stipulating that in a certain subdomain of the web, some information respecting a constraint can be found.
Those assumptions can be declared in the form of hypermedia description [](cite:cites Fielding) or the path structure of URIs.
It has been shown that by making query engines exploit that information it is possible to greatly reduce the query execution time to the point where the bottleneck 
is not the execution of HTTP requests but the suboptimal heuristic-based query plan [](cite:cites Taelman2023).
<span class="comment" data-author="RT">A main limitation to performance is still the high number of links...</span>

{:.comment data-author="RT"}
I would rephrase the following as follows:
Solid pods (or at least the LDP interface) still have a lot of structure that is not captured yet by LDP.
For example, people may structure their pods in a specific way (e.g. organize pictures by location).
If we can communicate this structure to the query engine, the query engine can exploit it!
But we must be careful, because this structure can differ for different people!
So query engines must not make assumptions, but the publisher should communicate the structure to the engine.
This is where shapes come in! They provide an excellent way to describe structures (citations...).
One thing missing is the link to how it maps to a Web API, which is exactly what we introduce here!
This can give us a lot of benefits: discovery, pruning, prioritization, planning, ...

In this article, we proposed to use RDF shapes, mostly employed for data validation [](cite:cites Gayo2018a), but also used 
for federated query optimization [](cite:cites kashif2021) as the main mechanism for a structural assumption in the form of a shape index.
We intend to use it for data source discovery, URIs dereferencing discrimination and ordering, and query planning. 
This short paper will focus on data discovery and URIs dereferencing discrimination that we are going to refer to as link pruning,
the rest is delegated to future works.
